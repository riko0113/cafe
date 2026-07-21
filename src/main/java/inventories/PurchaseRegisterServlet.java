package inventories;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/purchase-register")
public class PurchaseRegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            InventoryDAO inventoryDAO = new InventoryDAO();
            SupplierDAO supplierDAO = new SupplierDAO();
            request.setAttribute("inventoryList", inventoryDAO.all());
            request.setAttribute("supplierList", supplierDAO.all());
            request.getRequestDispatcher("/inventories/purchase-register.jsp")
                .forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            Date purchaseDate = Date.valueOf(request.getParameter("purchaseDate"));
            int purchaseQuantity = Integer.parseInt(request.getParameter("purchaseQuantity"));
            int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));

            PurchaseDAO dao = new PurchaseDAO();
            dao.insert(itemId, supplierId, purchaseDate, purchaseQuantity, purchasePrice);
            response.sendRedirect(request.getContextPath() + "/inventory");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
