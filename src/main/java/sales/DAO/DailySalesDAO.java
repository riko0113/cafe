package sales.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import sales.bean.DailySales;
//import model.User;
import tool.DAO;


public class DailySalesDAO extends DAO {
	
	
	// 日付情報から商品別売上合計を取得
	public List<DailySales> searchdaily(LocalDate salesDate) throws Exception {
		List<DailySales> dailysales = new ArrayList<>();
		
		Connection con = getConnection();
		LocalDate nextDays = salesDate.plusDays(1); // 1日後

		PreparedStatement st = con.prepareStatement(
		    "SELECT p.product_id, p.product_name, " +
		    "SUM(od.num) AS quantity, " +
		    "SUM(od.subtotal) AS amount " +
		    "FROM ordering o " +
		    "INNER JOIN order_detail od ON o.order_id = od.order_id " +
		    "INNER JOIN product p ON od.product_id = p.product_id " +
		    "WHERE o.datetime >= ? " +
		    "AND o.datetime < ? " +
		    "GROUP BY p.product_id, p.product_name " +
		    "ORDER BY p.product_id"
		);

		st.setObject(1, salesDate);
		st.setObject(2, nextDays);
		
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			DailySales ds = new DailySales();
			ds.setProduct_id(rs.getInt("product_id"));
			ds.setProduct_name(rs.getString("product_name"));
			ds.setTotal_quantity(rs.getInt("quantity"));
			ds.setTotal_amount(rs.getBigDecimal("amount"));
			dailysales.add(ds);
			
//			p.setUser_name(rs.getString("user_name"));
//			p.setTitle(rs.getString("title"));
//			p.setLike_count(rs.getInt("like_count"));
//			p.setComment(rs.getString("comment"));			
		}
		
		st.close();
		con.close();
		return dailysales;
	}
	
	public void save(
	        LocalDate salesDate,
	        List<DailySales> list
	        ) throws Exception {

	    Connection con = getConnection();

	    String sql =
	        "INSERT INTO daily_product_sales "
	      + "(sales_date, product_id, total_quantity, total_amount) "
	      + "VALUES (?, ?, ?, ?) "
	      + "ON CONFLICT (sales_date, product_id) "
	      + "DO UPDATE SET "
	      + "total_quantity = EXCLUDED.total_quantity, "
	      + "total_amount = EXCLUDED.total_amount";

	    PreparedStatement st =
	        con.prepareStatement(sql);

	    for (DailySales p : list) {

	        st.setDate(
	            1,
	            java.sql.Date.valueOf(salesDate)
	        );

	        st.setInt(
	            2,
	            p.getProduct_id()
	        );

	        st.setInt(
	            3,
	            p.getTotal_quantity()
	        );

	        st.setBigDecimal(
	            4,
	            p.getTotal_amount()
	        );

	        st.executeUpdate();
	    }

	    st.close();
	    con.close();
	}

}