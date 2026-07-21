package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class OrderDAO extends DAO {
    
	public List<OrderBean> findByDate(String targetDate) throws Exception {
	    List<OrderBean> orderList = new ArrayList<>();
	    Connection con = getConnection();

	    // 1. 指定された日付の「注文（親）」を取得する
	    String orderSql = "select o.*, w.payway_name from ordering as o "
	                     + "join payway as w on o.payway_id = w.payway_id "
	                     + "where o.datetime::date = ?::date "
	                     + "order by o.datetime desc";
	    
	    // 2. その注文に紐づく「詳細（子）」と商品名・支払方法名を取得するSQL
	    String detailSql = "select d.*, p.product_name from order_detail as d "
	                     + "join product as p on d.product_id = p.product_id "
	                     + "where d.order_id = ?";

	    try (PreparedStatement stOrder = con.prepareStatement(orderSql)) {
	        stOrder.setString(1, targetDate);
	        
	        try (ResultSet rsOrder = stOrder.executeQuery()) {
	            while (rsOrder.next()) {
	                OrderBean order = new OrderBean();
	                order.setOrderId(rsOrder.getInt("order_id"));
	                order.setDatetime(rsOrder.getObject("datetime", LocalDateTime.class));
	                order.setPayAmount(rsOrder.getBigDecimal("pay_amount"));
	                order.setPayWayId(rsOrder.getInt("payway_id"));
	                order.setPayWayName(rsOrder.getString("payway_name"));
	                
	                List<OrderDetailBean> detailList = new ArrayList<>();
	                
	                try (PreparedStatement stDetail = con.prepareStatement(detailSql)) {
	                    stDetail.setInt(1, order.getOrderId());
	                    
	                    try (ResultSet rsDetail = stDetail.executeQuery()) {
	                        while (rsDetail.next()) {
	                            OrderDetailBean detail = new OrderDetailBean();
	                            detail.setOrderDetailId(rsDetail.getInt("orderdetail_id"));
	                            detail.setProductId(rsDetail.getInt("product_id"));
	                            detail.setOrderId(rsDetail.getInt("order_id"));
	                            detail.setNum(rsDetail.getInt("num"));
	                            detail.setSubtotal(rsDetail.getBigDecimal("subtotal"));
	                            detail.setProductName(rsDetail.getString("product_name")); 
	                            detailList.add(detail);
	                        }
	                    }
	                }

	                order.setDetails(detailList);
	                orderList.add(order);
	            }
	        }
	    } finally {
	        con.close();
	    }

	    return orderList;
	}
    
    public int insert(OrderBean order, List<OrderDetailBean> details) throws Exception {
        
        int line = 0; // 登録に成功したトータルの件数

        // 1. 共通クラス(DAO)の機能でDB接続を取得
        Connection con = getConnection();

        // オートコミットをオフにしてトランザクションを開始（エラー時に巻き戻せるようにする）
        con.setAutoCommit(false);

        // SQL文の準備
        String insertOrderSql = "insert into ordering (pay_amount, payway_id, datetime, is_takeout, total_excl_tax) values (?, ?, ?, ?, ?)";
        String insertDetailSql = "insert into order_detail (product_id, order_id, num, subtotal) values (?, ?, ?, ?)";

        // try-catch を使って、途中でエラーが起きたらロールバックできるように囲む
        try {
            long orderId = 0;

            // 2. 注文テーブルへのインサート（自動採番されたIDを返す設定「Statement.RETURN_GENERATED_KEYS」をつける）
            try (PreparedStatement stOrder = con.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS)) {
            	stOrder.setBigDecimal(1, order.getPayAmount());
                stOrder.setInt(2, order.getPayWayId());
                stOrder.setObject(3, java.time.LocalDateTime.now()); // 現在日時
                stOrder.setBoolean(4, order.getIsTakeOut());
                stOrder.setBigDecimal(5, order.getTotalExclTax());
                
                line += stOrder.executeUpdate(); // 注文の登録（成功したら+1）

                // ★データベースが自動で割り振った「注文ID」をResultSet（型）で回収する
                try (ResultSet generatedKeys = stOrder.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getLong(1); // 1番目の列（注文ID）を取得
                        order.setOrderId((int) orderId);
                    } else {
                        throw new SQLException("注文IDの自動採番に失敗しました。");
                    }
                }
            }

            // 3. 注文詳細テーブルへのインサート（リストに入っている分だけループで回す）
            try (PreparedStatement stDetail = con.prepareStatement(insertDetailSql, Statement.RETURN_GENERATED_KEYS)) {
                for (OrderDetailBean detail : details) {
                	detail.setOrderId((int) orderId);
                	
                	stDetail.setInt(1, detail.getProductId());
                    stDetail.setInt(2, detail.getOrderId()); 
                    stDetail.setInt(3, detail.getNum());
                    stDetail.setBigDecimal(4, detail.getSubtotal());
                    
                    line += stDetail.executeUpdate(); // 詳細の登録（1件ごとに+1）
                    
                    try (ResultSet generatedDetailKeys = stDetail.getGeneratedKeys()) {
                        if (generatedDetailKeys.next()) {
                            long detailId = generatedDetailKeys.getLong(1);
                            detail.setOrderDetailId((int) detailId); 
                        } else {
                            throw new SQLException("注文詳細IDの自動採番に失敗しました。");
                        }
                    }
                }
            }

            // 4. すべての登録が成功したら、ここで一気に確定（コミット）！
            con.commit();

        } catch (Exception e) {
            // 5. もし途中で1回でもエラー（SQLエラーや、個数不足など）が起きたら...
            System.err.println("エラーが発生したため、処理を取り消します（ロールバック）");
            con.rollback(); // 注文インサートもなかったこと（最初から）にする
            
            throw e; // サーブレット側にエラーを投げ直す
            
        } finally {
            // 6. 成功しても失敗しても、最後に必ず接続を閉じる
            con.setAutoCommit(true); // 接続を閉じる前にオートコミットを元の状態(true)に戻す
            con.close();
        }

        return line; // 登録した合計件数を返す
    }
}
