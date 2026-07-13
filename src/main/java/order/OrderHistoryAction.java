package order;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class OrderHistoryAction extends Action {

	// executeメソッド：FrontControllerから呼ばれるメイン処理
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	 ) throws Exception {

	    // セッションを取得（なければ新しく作成）
	    HttpSession session = request.getSession();

	    String dateParam = request.getParameter("orderDate");

        if (dateParam == null || dateParam.isEmpty()) {
            dateParam = LocalDate.now().toString(); 
        }

        // 3. DAOを呼び出して、指定された日付の注文履歴（詳細リスト付き）を取得
        OrderDAO dao = new OrderDAO();
        List<OrderBean> historyList = dao.findByDate(dateParam);

        // 4. JSP（画面）にデータを引き渡すためのセット
        request.setAttribute("historyList", historyList); // 履歴のデータ本体
        request.setAttribute("selectedDate", dateParam);   // 選択された日付（画面のプルダウンに固定する用）

        // 5. 履歴画面のJSPへフォワード
        return "/order/history.jsp";
	}
}
