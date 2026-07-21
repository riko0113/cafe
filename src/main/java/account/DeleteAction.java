package account;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

// ログアウト処理を行うクラス
public class DeleteAction extends Action {

    // executeメソッド：FrontControllerから呼ばれる
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得
        HttpSession session = request.getSession();
        
        String account_id = request.getParameter("account_id");
        try {
        AccountDAO dao = new AccountDAO();
        dao.delete(account_id);
        } catch (Exception e) {
        	return "/account/manage/delete-error.jsp"; 
        }
        session.removeAttribute("account");
        return "/account/manage/delete-success.jsp";
        
        
    }
}