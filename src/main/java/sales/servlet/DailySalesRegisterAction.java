package sales.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class DailySalesRegisterAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		return "/sales/daily_sales_register.jsp";
	}

}
