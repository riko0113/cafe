package log;

//import bean.Teacher;
//import dao.TeacherDAO;
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
        String teacher_id = request.getParameter("teacher_id");
        String password = request.getParameter("password");

        // DAOを使ってDBからユーザー検索（認証処理）
        //TeacherDAO dao = new TeacherDAO();
        //Teacher teacher = dao.search(teacher_id, password);

        // ユーザーが見つかった場合（ログイン成功）
        if (teacher != null) {

            // セッションにユーザー情報を保存（ログイン状態を保持）
            session.setAttribute("teacher", teacher);

            // ログイン成功ページへ遷移
            return "/top/home.jsp";
        }

        // ユーザーが見つからなかった場合（ログイン失敗）
        return "../login-error.jsp";
    }
}
