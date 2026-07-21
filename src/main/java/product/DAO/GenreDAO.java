package product.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import product.bean.Genre;
import tool.DAO;

public class GenreDAO extends DAO{
	public List<product.bean.Genre> searchAll() throws Exception {
		List<product.bean.Genre> list = new ArrayList<>();
		
		String sql = "SELECT * FROM genre";
		
		try (
			Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql)
	    ) {
			try (ResultSet rs = st.executeQuery()) {
	                while (rs.next()) {
	                	product.bean.Genre g = new product.bean.Genre();
	                    g.setGenreId(rs.getString("genre_id"));
	                    g.setGenreName(rs.getString("genre_name"));
	                    list.add(g);
	                }
	        }
	    }
	    return list;
	    }
	
	  public int insert(Genre genre) throws Exception {
    	
    	String sql = "INSERT INTO genre(genre_id, genre_name, is_deleted) values(?, ?, false) ON CONFLICT (genre_id) DO NOTHING";
    	int line = 0;
    	
    	try (
            Connection con = getConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            st.setString(1, genre.getGenreId());
            st.setString(2, genre.getGenreName());

        // SQL実行
            line = st.executeUpdate();
    	}
    	return line;
    }
}
