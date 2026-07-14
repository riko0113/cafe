package sales.DAO;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sales.bean.ProfitManagement;
//import model.User;
import tool.DAO;


public class ProfitManagementDAO extends DAO {
	
	public List<ProfitManagement> search() throws Exception{
		List<ProfitManagement> profitList = new ArrayList<>();
		
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement("SELECT "
				+ "month_data.target_month, "
				+ "COALESCE(s.sales_amount, 0) AS sales_amount, "
				+ "COALESCE(p.purchase_amount, 0) AS purchase_amount "
				+ "FROM "
				+ "( "
				+ "SELECT TO_CHAR(datetime, 'YYYY-MM') AS target_month "
				+ "FROM ordering "
				+ "UNION "
				+ "SELECT TO_CHAR(purchase_date, 'YYYY-MM') "
				+ "FROM purchases "
				+ ") month_data "
				+ "LEFT JOIN "
				+ "( "
				+ "SELECT "
				+ "TO_CHAR(datetime, 'YYYY-MM') AS target_month, "
				+ "SUM(total_excl_tax) AS sales_amount "
				+ "FROM ordering "
				+ "GROUP BY TO_CHAR(datetime, 'YYYY-MM') "
				+ ") s "
				+ "ON month_data.target_month = s.target_month "
				+ "LEFT JOIN "
				+ "( "
				+ "SELECT "
				+ "TO_CHAR(purchase_date, 'YYYY-MM') AS target_month, "
				+ "SUM(purchase_amount) AS purchase_amount "
				+ "FROM purchases "
				+ "GROUP BY TO_CHAR(purchase_date, 'YYYY-MM') "
				+ ") p "
				+ "ON month_data.target_month = p.target_month "
				+ "ORDER BY month_data.target_month;"
		);
		
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			ProfitManagement pm = new ProfitManagement();
			pm.setTargetMonth(rs.getString("target_month"));
			pm.setSalesAmount(
				    rs.getBigDecimal("sales_amount") != null
				        ? rs.getBigDecimal("sales_amount")
				        : BigDecimal.ZERO
				);

			pm.setPurchaseAmount(
				    rs.getBigDecimal("purchase_amount") != null
				        ? rs.getBigDecimal("purchase_amount")
				        : BigDecimal.ZERO
				);
			BigDecimal grossMarginRate;

			if (pm.getSalesAmount().compareTo(BigDecimal.ZERO) == 0) {

			    grossMarginRate = BigDecimal.ZERO;

			} else {

			    grossMarginRate =
			        pm.getSalesAmount()
			            .subtract(pm.getPurchaseAmount())
			            .multiply(BigDecimal.valueOf(100))
			            .divide(
			                pm.getSalesAmount(),
			                1,
			                RoundingMode.HALF_UP
			            );
			}
			pm.setGrossMarginRate(grossMarginRate);
			System.out.println(pm.getTargetMonth());
			System.out.println(pm.getSalesAmount());
			System.out.println(pm.getPurchaseAmount());
			System.out.println(pm.getGrossMarginRate());
			profitList.add(pm);
//					
		}
		
		st.close();
		con.close();
		return profitList;
	}

}