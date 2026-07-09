package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class OrderDAO extends DAO {
    
    public List<OrderBean> all() throws Exception {
    	List<OrderBean> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement("select * from ordering");
        
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderBean order = new OrderBean();

            order.setStudent_no(rs.getString("student_no"));
            order.setStudent_name(rs.getString("student_name"));
            order.setEnt_year(rs.getInt("ent_year"));
            order.setClass_num(rs.getString("class_num"));
            order.setIs_attend(rs.getBoolean("is_attend"));
            order.setSchool_id(rs.getString("school_id"));

            list.add(order);
        }

        st.close();
        con.close();

        return list;
    }
    
    public int insert(OrderBean order, List<OrderDetailBean> details) throws Exception {
        
        int line = 0; // 登録に成功したトータルの件数

        // 1. 共通クラス(DAO)の機能でDB接続を取得
        Connection con = getConnection();

        // オートコミットをオフにしてトランザクションを開始（エラー時に巻き戻せるようにする）
        con.setAutoCommit(false);

        // SQL文の準備
        String insertOrderSql = "insert into ordering VALUES (?, ?, ?, ?, ?, ?)";
        String insertDetailSql = "insert into order_detail VALUES (?, ?, ?, ?, ?)";

        // try-catch を使って、途中でエラーが起きたらロールバックできるように囲む
        try {
            long orderId = 0;

            // 2. 注文テーブルへのインサート（自動採番されたIDを返す設定「Statement.RETURN_GENERATED_KEYS」をつける）
            try (PreparedStatement stOrder = con.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS)) {
                stOrder.setInt(1, order.getOrderId());
                stOrder.setBigDecimal(2, order.getPayAmount());
                stOrder.setInt(3, order.getPayWayId());
                stOrder.setObject(4, java.time.LocalDateTime.now()); // 現在日時
                stOrder.setBoolean(5, order.getIsTakeOut());
                stOrder.setBigDecimal(6, order.getTotalExclTax());
                
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
            try (PreparedStatement stDetail = con.prepareStatement(insertDetailSql)) {
                for (OrderDetailBean detail : details) {
                	detail.setOrderId((int) orderId);
                	
                    stDetail.setInt(1, detail.getOrderDetailId());
                    stDetail.setInt(2, detail.getProductId());
                    stDetail.setInt(3, detail.getOrderId()); 
                    stDetail.setInt(4, detail.getNum());
                    stDetail.setBigDecimal(5, detail.getSubtotal());
                    
                    line += stDetail.executeUpdate(); // 詳細の登録（1件ごとに+1）
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
