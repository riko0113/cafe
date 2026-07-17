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

        AccountDAO dao = new AccountDAO();
        int line = dao.delete(account_id);

        if (line > 0) {
        	session.removeAttribute("account");
            return "/account/manage/delete-success.jsp";
            
        } else {
            // データベースの更新が0件だった（何らかの理由で更新に失敗）
            return "/account/manage/delete-error.jsp"; 
        }
    }
}