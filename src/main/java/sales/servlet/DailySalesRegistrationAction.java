package sales.servlet;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.DailySalesDAO;
import sales.bean.DailySales;
import tool.Action;


public class DailySalesRegistrationAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		try {
            // DAO で投稿一覧取得
            DailySalesDAO dsdao = new DailySalesDAO();
            LocalDate parsedDate = LocalDate.parse(request.getParameter("calcdate"));
            List<DailySales> dailysales = dsdao.searchdaily(parsedDate);
            dsdao.save(parsedDate, dailysales);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/sales_registration_error.jsp";
        }
		
		return "/sales/sales_registration_success.jsp";
	}
}
