package sales.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.SalesSummaryDAO;
import sales.bean.SalesSummary;
import tool.Action;


public class MonthlySalesSummaryAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		try {
            // DAO で投稿一覧取得
            SalesSummaryDAO dsdao = new SalesSummaryDAO();
            List<SalesSummary> salessummarys = dsdao.searchmonthly();
            
            // リクエストに保存
            request.setAttribute("salessummarys", salessummarys);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/error.jsp";
        }
		return "/sales/daily_sales_summary.jsp";
	}

}
