package product;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import product.DAO.ProductDAO;
import tool.Action;


public class AllAction extends Action {
   public String execute(HttpServletRequest request, HttpServletResponse response)
           throws Exception {
	   
	   String genreId = request.getParameter("genre_id");
	   
	   ProductDAO dao = new ProductDAO();
	   List<product.bean.Product> list;
	   
	   if (genreId != null && !genreId.isEmpty()) {
		   list = dao.searchByGenreId(genreId);
	   } else {
		   list = dao.search("");
	   }
	   request.setAttribute("products", list);
  
       return "/product/all.jsp";
   }
}