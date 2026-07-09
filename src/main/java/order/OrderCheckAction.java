package order;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class OrderCheckAction extends Action {
	private static final long serialVersionUID = 1L;

	// executeメソッド：FrontControllerから呼ばれるメイン処理
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	 ) throws Exception {

	    // セッションを取得（なければ新しく作成）
	    HttpSession session = request.getSession();

	    String cartDataJson = request.getParameter("cartData");
	    
	    if (cartDataJson != null && !cartDataJson.isEmpty()) {
	    	session.setAttribute("cartJson", cartDataJson);
	    }
	    
	    return "/order/pay.jsp";
	}
}