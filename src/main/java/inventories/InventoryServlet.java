package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inventory")
public class InventoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            InventoryDAO inventoryDAO = new InventoryDAO();
            GenreDAO genreDAO = new GenreDAO();
            request.setAttribute("inventoryList", inventoryDAO.all());
            request.setAttribute("genreList", genreDAO.all());
            request.getRequestDispatcher("/inventories/item-genres.jsp")
                .forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
