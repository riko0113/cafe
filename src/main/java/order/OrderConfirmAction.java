package order;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderConfirmAction {
	// executeメソッド：FrontControllerから呼ばれるメイン処理
		public String execute(
			HttpServletRequest request, HttpServletResponse response
		 ) throws Exception {

		    // セッションを取得（なければ新しく作成）
		    HttpSession session = request.getSession();
		    String cartJson = (String) session.getAttribute("cartJson");

		    // DAOを使ってDB
		    OrderDAO dao = new OrderDAO();
		    
		    OrderBean order = new OrderBean();
		    OrderDetailBean details = new OrderDetailBean();
		    
		    order.setPayAmount(request.getParameter(""));
		    order.setPayWayId(request.getParameter(""));
		    order.setPayAmount(request.getParameter(""));
		    order.setPayAmount(request.getParameter(""));
		    
		   
		    String paymentMethod   = request.getParameter("paymentMethod");   // "現金", "クレジットカード" など
		    String totalExclTaxStr = request.getParameter("totalExcludingTax"); // 税抜合計（文字列）
		    String payAmountStr    = request.getParameter("totalIncludingTax"); // 税込合計（文字列）
		    String isTakeOutStr    = request.getParameter("isTakeOut");
	        
	        int line = dao.insert(order);
	        
	        if (line > 0) {
	        	session.removeAttribute("cartJson");
	        	return "/order/success.jsp";
	        }
		}
}
