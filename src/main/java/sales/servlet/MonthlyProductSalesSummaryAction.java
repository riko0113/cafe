package sales.servlet;

import java.time.YearMonth;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.ProductSalesSummaryDAO;
import sales.bean.ProductSalesSummary;
import tool.Action;


public class MonthlyProductSalesSummaryAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String targetMonthStr = request.getParameter("targetMonth");

		if (targetMonthStr == null || targetMonthStr.isEmpty()) {
		    targetMonthStr = "2026-07";
		}
		
		try {
            ProductSalesSummaryDAO pdsdao = new ProductSalesSummaryDAO();
            YearMonth targetMonth = YearMonth.parse(targetMonthStr);
            List<ProductSalesSummary> monthlysales = pdsdao.searchmonthly(targetMonth);
            
            // リクエストに保存
            request.setAttribute("targetMonth", targetMonthStr);
            request.setAttribute("monthlysales", monthlysales);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/error.jsp";
        }
		
		return "/sales/monthly_product_sales_summary.jsp";
	}

}
