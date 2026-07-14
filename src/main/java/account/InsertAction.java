package account;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class InsertAction extends Action {

    // executeメソッド：FrontControllerから呼ばれるメイン処理
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        // セッションを取得（なければ新しく作成）
        HttpSession session = request.getSession();

        // フォームから送られてきたログイン名とパスワードを取得
        String account_id = request.getParameter("account_id");
        String user_name = request.getParameter("user_name");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        int line = dao.insert(account_id, user_name, password);

        if (line>0) {

            return "/account/login/success.jsp";
        }

        return "/account/login/inser-error.jsp";
    }
}