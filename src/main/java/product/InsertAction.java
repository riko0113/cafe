package product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import product.DAO.GenreDAO;
import product.bean.Genre;
import tool.Action;

public class InsertAction extends Action {
	
	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {
			
			String genre_id=request.getParameter(("genre_id"));
			String genre_name=request.getParameter("genre_name");
			
			Genre g = new Genre();
			g.setGenreId(genre_id);
			g.setGenreName(genre_name);
			
			GenreDAO dao = new GenreDAO();
			dao.insert(g);
			
			return "/product/success.jsp";
	}
}