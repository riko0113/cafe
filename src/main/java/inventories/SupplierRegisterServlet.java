package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/supplier-register")
public class SupplierRegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/inventories/supplier-register.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String supplierName = request.getParameter("supplierName");
            String supplierAddress = request.getParameter("supplierAddress");
            String supplierPhone = request.getParameter("supplierPhone");
            String supplierEmail = request.getParameter("supplierEmail");

            SupplierDAO dao = new SupplierDAO();
            dao.insert(supplierName, supplierAddress, supplierPhone, supplierEmail);
            response.sendRedirect(request.getContextPath() + "/purchase-register");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
