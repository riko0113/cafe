package sales.servlet;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.DailySalesDAO;
import sales.bean.DailySales;
import tool.Action;


public class DailySalesRegisterAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		
		try {
            // DAO で投稿一覧取得
            DailySalesDAO dsdao = new DailySalesDAO();
            LocalDate parsedDate = LocalDate.parse(request.getParameter("culcdate"));
            List<DailySales> dailysales = dsdao.searchdaily(parsedDate);
            String culcdate = request.getParameter("culcdate");
            
            // リクエストに保存
            request.setAttribute("culcdate", culcdate);
            request.setAttribute("dailysales", dailysales);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/error.jsp";
        }
		
		return "/sales/daily_sales_register.jsp";
	}

}
