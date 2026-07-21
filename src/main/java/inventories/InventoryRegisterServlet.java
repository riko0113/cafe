package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inventory-register")
public class InventoryRegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            GenreDAO dao = new GenreDAO();
            request.setAttribute("genreList", dao.all());
            request.getRequestDispatcher("/inventories/inventory-register.jsp")
                .forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String itemName = request.getParameter("itemName");
            int itemGenreId = Integer.parseInt(request.getParameter("itemGenreId"));
            int standardStock = Integer.parseInt(request.getParameter("standardStock"));

            InventoryDAO dao = new InventoryDAO();
            dao.insert(itemName, itemGenreId, standardStock);
            response.sendRedirect(request.getContextPath() + "/inventory");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
