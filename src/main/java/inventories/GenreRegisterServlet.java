package inventories;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/genre-register")
public class GenreRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String genreName = request.getParameter("genreName");
            GenreDAO dao = new GenreDAO();
            dao.insert(genreName);
            response.sendRedirect(request.getContextPath() + "/genre-edit");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
