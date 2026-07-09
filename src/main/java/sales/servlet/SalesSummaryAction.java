package sales.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;


public class SalesSummaryAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		return "/sales/sales_summary.jsp";
	}

}
