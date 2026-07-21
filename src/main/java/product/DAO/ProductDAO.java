package product.DAO;

// SQL関連
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

// DAOクラス（DB操作を担当するクラス）
public class ProductDAO extends DAO {

    // 商品検索
	 public List<product.bean.Product> search(String keyword) throws Exception {
	        // 商品を保存するリスト
	        List<product.bean.Product> list = new ArrayList<>();
	        
	        String sql = "SELECT * FROM product WHERE product_name LIKE ?";

	        try (
	            Connection con = getConnection();
	            PreparedStatement st = con.prepareStatement(sql)
	        ) {
	            st.setString(1, "%" + keyword + "%");
	            try (ResultSet rs = st.executeQuery()) {
	                while (rs.next()) {
	                	product.bean.Product p = new product.bean.Product();

	                    p.setProductId(rs.getInt("product_id"));
	                    p.setProductName(rs.getString("product_name"));
	                    p.setGenreId(rs.getString("genre_id"));
	                    p.setPrice(rs.getInt("price"));
	                    
	                    list.add(p);
	                }
	            }
	          }

	          return list;
	    }
	 
	 public List<product.bean.Product> searchByGenreId(String genreId) throws Exception {
		   // 商品を保存するリスト
		   List<product.bean.Product> list = new ArrayList<>();
		   // SQL文：genre_idが完全に一致（=）するものを検索
		   String sql = "SELECT * FROM product WHERE genre_id = ?";
		   try (
		       Connection con = getConnection();
		       PreparedStatement st = con.prepareStatement(sql)
		   ) {
		       // ? に引数のジャンルIDをセット
		       st.setString(1, genreId);
		       try (ResultSet rs = st.executeQuery()) {
		           while (rs.next()) {
		               product.bean.Product p = new product.bean.Product();
		               p.setProductId(rs.getInt("product_id"));
		               p.setProductName(rs.getString("product_name"));
		               p.setGenreId(rs.getString("genre_id"));
		               p.setPrice(rs.getInt("price"));
		               list.add(p);
		           }
		       }
		   }
		   return list;
		}

	    // 商品追加
	    public int insert(product.bean.Product product) throws Exception {
	    	
	    	String sql = "INSERT INTO product(product_id, product_name, genre_id,price) values(?, ?, ?, ?)";
	    	
	    	try (
	            Connection con = getConnection();
	            PreparedStatement st = con.prepareStatement(sql)
	        ) {
	    		st.setInt(1,  product.getProductId());
	            st.setString(2, product.getProductName());
	            st.setString(3, product.getGenreId());
	            st.setInt(4, product.getPrice());

	        // SQL実行
	            int line = st.executeUpdate();
	            return line;
	    	}
	    }

public int delete(int productId) throws Exception {
    String sql = "DELETE FROM product WHERE product_id = ?";
    int line = 0;
    try (
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(sql)
    ) {
        st.setInt(1, productId);
        line = st.executeUpdate();
    }
    return line;
}
}