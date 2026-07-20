package product;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import product.DAO.ProductDAO;
import tool.Action;
public class DeleteAction extends Action {

   public String execute(
       HttpServletRequest request, HttpServletResponse response
   ) throws Exception {
       // 一覧画面のリンクから送られてきた商品IDを受け取る
       int productId = Integer.parseInt(request.getParameter("product_id"));
       // DAOの削除メソッドを呼び出す
       ProductDAO dao = new ProductDAO();
       dao.delete(productId);
       // 削除が終わったら商品一覧画面のActionへ戻る
       return "/product/All.action"; // ※一覧を表示するActionのURLに合わせてください
   }
}