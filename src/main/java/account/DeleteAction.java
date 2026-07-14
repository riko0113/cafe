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

        // セッションにアカウントがあるか確認する
        if (session.getAttribute("account") == null) {
            // セッションにないので、すでにログアウト済み
            return "/account/logout/logout-error.jsp";
        }

        AccountDAO dao = new AccountDAO();
        int line = dao.update();

        if (line > 0) {
            // データベースの更新も成功
        	session.removeAttribute("account");
            return "/account/logout/success.jsp";
            
        } else {
            // データベースの更新が0件だった（何らかの理由で更新に失敗）
            return "/account/logout/logout-error2.jsp"; 
        }
    }
}