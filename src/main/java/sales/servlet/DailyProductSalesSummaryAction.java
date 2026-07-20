package sales.servlet;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.ProductSalesSummaryDAO;
import sales.bean.ProductSalesSummary;
import tool.Action;

public class DailyProductSalesSummaryAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String targetDateStr = request.getParameter("targetDate");

		if (targetDateStr == null || targetDateStr.isEmpty()) {
		    targetDateStr = "2026-07-01";
		}
		
		try {
            // DAO で投稿一覧取得
            ProductSalesSummaryDAO pdsdao = new ProductSalesSummaryDAO();
            LocalDate parsedDate = LocalDate.parse(targetDateStr);
            List<ProductSalesSummary> dailysales = pdsdao.searchdaily(parsedDate);
            String targetDate = request.getParameter("targetDate");
            
            // リクエストに保存
            request.setAttribute("targetDate", targetDate);
            request.setAttribute("dailysales", dailysales);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/error.jsp";
        }
		
		return "/sales/daily_product_sales_summary.jsp";
	}

}


	
