package product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import product.DAO.ProductDAO;
import tool.Action;

public class Insert2Action extends Action {
	
	public String execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
		String genreId = request.getParameter("genre_id");
		String productName = request.getParameter("product_name");
		int price = Integer.parseInt(request.getParameter("price"));
		
		product.bean.Product p = new product.bean.Product();
		p.setProductId(productId);
		p.setGenreId(genreId);
		p.setProductName(productName);
		p.setPrice(price);
		
		ProductDAO dao =  new ProductDAO();
		
		try (java.sql.Connection con = dao.getConnection();
			 java.sql.PreparedStatement st = con.prepareStatement("ALTER TABLE product DROP CONSTRAINT IF EXISTS product_genre_id_key")) {
			st.executeUpdate();
		}
		
		dao.insert(p);
		
		return "/product/success2.jsp";
	}
}