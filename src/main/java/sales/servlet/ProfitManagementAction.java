package sales.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sales.DAO.ProfitManagementDAO;
import sales.bean.ProfitManagement;
import tool.Action;


public class ProfitManagementAction extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		try {
            // DAO で投稿一覧取得
            ProfitManagementDAO pmdao = new ProfitManagementDAO();
            List<ProfitManagement> profitlist = pmdao.search();
            
            // リクエストに保存
            request.setAttribute("profitlist", profitlist);

        } catch (Exception e) {
            e.printStackTrace();
            return "/sales/error.jsp";
        }
		
		return "/sales/profit_management.jsp";
	}
}
