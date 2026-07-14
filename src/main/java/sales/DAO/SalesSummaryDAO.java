package sales.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sales.bean.SalesSummary;
//import model.User;
import tool.DAO;


public class SalesSummaryDAO extends DAO {
	
	
	// 日付情報から商品別売上合計を取得
	public List<SalesSummary> searchdaily() throws Exception {
		List<SalesSummary> dsalessummarys = new ArrayList<>();
		
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		    "SELECT "
		    + "DATE(datetime) AS sales_date, "
		    + "SUM(total_excl_tax) AS total_excl_tax, "
		    + "SUM(pay_amount) AS total_incl_tax, "
		    + "SUM(pay_amount - total_excl_tax) AS total_tax "
		    + "FROM ordering "
		    + "GROUP BY DATE(datetime) "
		    + "ORDER BY sales_date;"
		);
		
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			SalesSummary ss = new SalesSummary();

			ss.setTargetDate(
			    rs.getString("sales_date")
			);

			ss.setTotalExclTax(
			    rs.getBigDecimal("total_excl_tax")
			);

			ss.setTotalInclTax(
			    rs.getBigDecimal("total_incl_tax")
			);

			ss.setTotalTax(
			    rs.getBigDecimal("total_tax")
			);
			dsalessummarys.add(ss);
		}
		
		st.close();
		con.close();
		return dsalessummarys;
	}
	
	public List<SalesSummary> searchmonthly() throws Exception {
		List<SalesSummary> msalessummarys = new ArrayList<>();
		
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement("SELECT "
				+ "DATE_TRUNC('month', datetime) AS sales_month, "
				+ "SUM(total_excl_tax) AS total_excl_tax, "
				+ "SUM(pay_amount) AS total_incl_tax, "
				+ "SUM(pay_amount - total_excl_tax) AS total_tax "
				+ "FROM ordering "
				+ "GROUP BY DATE_TRUNC('month', datetime) "
				+ "ORDER BY sales_month;"
		);
		
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			SalesSummary ss = new SalesSummary();

			ss.setTargetDate(
			    rs.getString("sales_month")
			);

			ss.setTotalExclTax(
			    rs.getBigDecimal("total_excl_tax")
			);

			ss.setTotalInclTax(
			    rs.getBigDecimal("total_incl_tax")
			);

			ss.setTotalTax(
			    rs.getBigDecimal("total_tax")
			);
			msalessummarys.add(ss);
			
//					
		}
		
		st.close();
		con.close();
		return msalessummarys;
	}

}