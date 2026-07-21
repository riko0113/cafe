package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inventory-delete")
public class InventoryDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            InventoryDAO dao = new InventoryDAO();
            dao.delete(itemId);
            response.sendRedirect(request.getContextPath() + "/inventory");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
