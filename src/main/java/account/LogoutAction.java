package account;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

// ログアウト処理を行うクラス
public class LogoutAction extends Action {

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
            
        session.removeAttribute("account");
        return "/account/logout/success.jsp";
            
    }
}