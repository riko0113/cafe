package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/genre-delete")
public class GenreDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int itemGenreId = Integer.parseInt(request.getParameter("itemGenreId"));
            GenreDAO dao = new GenreDAO();
            dao.delete(itemGenreId);
            response.sendRedirect(request.getContextPath() + "/genre-edit");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
