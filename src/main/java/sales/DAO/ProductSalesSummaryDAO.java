package sales.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import sales.bean.ProductSalesSummary;
//import model.User;
import tool.DAO;


public class ProductSalesSummaryDAO extends DAO {
	
	
	// 日付情報から商品別売上合計を取得
	public List<ProductSalesSummary> searchdaily(LocalDate salesDate) throws Exception {
		List<ProductSalesSummary> pdailysales = new ArrayList<>();
		
		Connection con = getConnection();
		LocalDate nextDays = salesDate.plusDays(1); // 1日後

		PreparedStatement st = con.prepareStatement("SELECT "
			  + "p.product_id, "
			  + "p.product_name, "
			  + "g.genre_name, "
			  + "SUM(od.num) AS total_quantity, "
			  + "SUM(od.subtotal) AS total_amount "
			  + "FROM ordering o "
			  + "INNER JOIN order_detail od "
			  +  "ON o.order_id = od.order_id "
			  + "INNER JOIN product p "
			  + "ON od.product_id = p.product_id "
			  + "INNER JOIN genre g "
			  + "ON p.genre_id = g.genre_id "
			  + "WHERE o.datetime >= ? "
			  + "AND o.datetime < ? "
			  + "GROUP BY "
			  + "p.product_id, "
			  + "p.product_name, "
			  + "g.genre_name "
			  + "ORDER BY "
			  + "p.product_id;"
		);

		st.setObject(1, salesDate);
		st.setObject(2, nextDays);
		
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			ProductSalesSummary pds = new ProductSalesSummary();
			pds.setProduct_id(rs.getInt("product_id"));
			pds.setProduct_name(rs.getString("product_name"));
			pds.setGenre_name(rs.getString("genre_name"));
			pds.setTotal_quantity(rs.getInt("quantity"));
			pds.setTotal_amount(rs.getBigDecimal("amount"));
			pdailysales.add(pds);
			
//					
		}
		
		st.close();
		con.close();
		return pdailysales;
	}
}