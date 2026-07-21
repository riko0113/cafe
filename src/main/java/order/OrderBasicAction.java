package order;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class OrderBasicAction extends Action {

	// executeメソッド：FrontControllerから呼ばれるメイン処理
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	 ) throws Exception {

	    // セッションを取得（なければ新しく作成）
	    HttpSession session = request.getSession();


	    // DAOを使ってDB
	    ProductDAO dao = new ProductDAO();
	            
	    List<ProductBean> product = dao.all();
	            
	    request.setAttribute("products", product);
	    
	    return "/order/ordering.jsp";
	}
}
