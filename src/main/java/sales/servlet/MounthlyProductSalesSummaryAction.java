package sales.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;
import sales.bean.ProductSalesSummary;
import sales.DAO.ProductSalesSummaryDAO;

public class MounthlyProductSalesSummaryAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		try {
			ProductSalesSummary pss = new ProductSalesSummary(); 
		}
		
		return "/sales/product_sales_summary.jsp";
	}

}
