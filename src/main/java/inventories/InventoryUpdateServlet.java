package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inventory-update")
public class InventoryUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            String itemName = request.getParameter("itemName");
            int itemGenreId = Integer.parseInt(request.getParameter("itemGenreId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int standardStock = Integer.parseInt(request.getParameter("standardStock"));
            if (quantity < 0) {
                throw new IllegalArgumentException(
                    "在庫数は0以上で入力してください。"
                );
            }
            InventoryDAO dao = new InventoryDAO();
            dao.update(itemId, itemName, itemGenreId, quantity, standardStock);
            response.sendRedirect(request.getContextPath() + "/inventory");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
