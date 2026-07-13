package order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class OrderConfirmAction extends Action{
		public String execute(
			HttpServletRequest request, HttpServletResponse response
		 ) throws Exception {

		    // セッションを取得（なければ新しく作成）
		    HttpSession session = request.getSession();
		    String cartJson = (String) session.getAttribute("cartJson");

		    // DAOを使ってDB
		    OrderDAO dao = new OrderDAO();
		    
		    OrderBean order = new OrderBean();
		    
		    String payAmountStr = request.getParameter("totalIncludingTax"); // 税込金額
		    String paymentMethod = request.getParameter("paymentMethod");     // 支払い方法
		    String isTakeOutStr = request.getParameter("isTakeOut");         // テイクアウトフラグ（「true」または「false」）
		    String totalExclTaxStr = request.getParameter("totalExcludingTax"); // 税抜金額

		    if (payAmountStr != null) {
		        order.setPayAmount(new BigDecimal(payAmountStr));
		    }
		    if (totalExclTaxStr != null) {
		        order.setTotalExclTax(new BigDecimal(totalExclTaxStr));
		    }

		    if (isTakeOutStr != null) {
		        order.setIsTakeOut(Boolean.valueOf(isTakeOutStr));
		    }

		    if ("現金".equals(paymentMethod)) {
	            order.setPayWayId(1); 
	        } else if ("クレジットカード".equals(paymentMethod)) {
	            order.setPayWayId(2);
	        } else if ("電子マネー".equals(paymentMethod)) { // 💡 pay.jspに合わせて電子マネーを追加
	            order.setPayWayId(3);
	        } else if ("QRコード決済".equals(paymentMethod)) {
	            order.setPayWayId(4);
	        }
		    
		    List<OrderDetailBean> details = new ArrayList<>();

	        if (cartJson != null && !cartJson.isEmpty()) {
	            /* 
	             * 💡 外部ライブラリ（JacksonやGson）を使わず、Java標準の正規表現（Regex）を使って
	             * JSON文字列から「商品ID」「価格」「数量」を安全に抽出するロジックです。
	             * 送られてくるJSONの形: "商品ID":{"name":"商品名","price":金額,"quantity":個数}
	             */
	            Pattern pattern = Pattern.compile("\"(\\d+)\":\\{[^\\}]*\"price\":(\\d+)[^\\}]*\"quantity\":(\\d+)");
	            Matcher matcher = pattern.matcher(cartJson);

	            while (matcher.find()) {
	                int productId = Integer.parseInt(matcher.group(1)); // マッチした1番目：商品ID
	                int price = Integer.parseInt(matcher.group(2));     // マッチした2番目：単価
	                int quantity = Integer.parseInt(matcher.group(3));  // マッチした3番目：数量

	                // 小計を計算（税抜単価 × 数量）
	                BigDecimal subTotal = BigDecimal.valueOf((long) price * quantity);

	                // 内訳Beanを作成してデータをセット
	                OrderDetailBean detail = new OrderDetailBean();
	                detail.setProductId(productId);
	                detail.setNum(quantity);
	                detail.setSubtotal(subTotal);

	                // リストに追加
	                details.add(detail);
	            }
	        }

	        // カートが完全に空の場合は注文画面へ押し戻す（安全対策）
	        if (details.isEmpty()) {
	            return "/order/ordering.jsp"; 
	        }

	        // 4. DAOを使ってデータベースへ一括登録（注文＋詳細リスト）
	        int line = dao.insert(order, details);
	        
	        // 5. 登録が成功したらセッションを綺麗にして完了画面へ
	        if (line > 0) {
	        	request.setAttribute("order", order);
	            request.setAttribute("details", details);
	            
	            String chargeStr = request.getParameter("cashAmount"); 
	            
	            if (order.getPayWayId() == 1 && chargeStr != null && !chargeStr.isEmpty()) {
	                BigDecimal charge = new BigDecimal(chargeStr); // お預かり金
	                BigDecimal change = charge.subtract(order.getPayAmount()); // お釣り = お預かり金 - 税込合計
	                
	                request.setAttribute("charge", charge); // JSPへお預かり金を渡す
	                request.setAttribute("change", change); // JSPへお釣りを渡す
	            }
	            
	            session.removeAttribute("cartJson"); // カートの中身をクリア
	            return "/order/success.jsp";
	        } else {
	            throw new Exception("データベースへの登録に失敗しました。");
	        }
		}
}
