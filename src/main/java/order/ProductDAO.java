package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class ProductDAO extends DAO {
    
	public List<ProductBean> all() throws Exception {
		
        List<ProductBean> productList = new ArrayList<>();
        
        Connection con = getConnection();

        String sql = "select p.product_id, p.product_name, p.genre_id, p.price, g.genre_name " +
                	  "from product p " +
                	  "inner join genre as g on p.genre_id = g.genre_id " +
                      "where p.is_deleted = false and g.is_deleted = false";

        PreparedStatement st = con.prepareStatement(sql); 
        ResultSet rs = st.executeQuery();
        	
        while (rs.next()) {
            ProductBean product = new ProductBean();
                
            product.setProductId(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setGenreId(rs.getString("genre_id"));
            product.setPrice(rs.getInt("price"));
            product.setGenreName(rs.getString("genre_name"));
                    
            productList.add(product);
        }
    
        st.close();
        con.close();

        return productList;
    }
}
