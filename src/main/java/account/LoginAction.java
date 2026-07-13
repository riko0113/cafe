package account;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {

    // executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得（なければ新しく作成）
        HttpSession session = request.getSession();

        // フォームから送られてきたログイン名とパスワードを取得
        String account_id = request.getParameter("account_id");
        String password = request.getParameter("password");

        // DAOを使ってDBからユーザー検索（認証処理）
        AccountDAO dao = new AccountDAO();
        AccountBean account = dao.search(account_id, password);

        // ユーザーが見つかった場合（ログイン成功）
        if (account != null) {

            // セッションにユーザー情報を保存（ログイン状態を保持）
            session.setAttribute("account", account);

            // ログイン成功ページへ遷移
            return "/index.jsp";
        }

        // ユーザーが見つからなかった場合（ログイン失敗）
        return "/account/login/login-error.jsp";
    }
}