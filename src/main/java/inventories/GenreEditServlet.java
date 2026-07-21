package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/genre-edit")
public class GenreEditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            GenreDAO dao = new GenreDAO();
            request.setAttribute("genreList", dao.all());
            request.getRequestDispatcher("/inventories/genre-register.jsp")
                .forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
