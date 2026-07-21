package inventories;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tool.DAO;

public class PurchaseDAO extends DAO {

    public int insert(int itemId, int supplierId, Date purchaseDate,
            int purchaseQuantity, int purchasePrice) throws Exception {
        Connection con = getConnection();
        con.setAutoCommit(false);

        try {
            int purchaseAmount = purchasePrice;

            PreparedStatement st1 = con.prepareStatement(
                "insert into purchases " +
                "(purchase_amount, purchase_date, supplier_id) " +
                "values (?, ?, ?) returning purchase_id"
            );
            st1.setInt(1, purchaseAmount);
            st1.setDate(2, purchaseDate);
            st1.setInt(3, supplierId);
            ResultSet rs = st1.executeQuery();
            rs.next();
            int purchaseId = rs.getInt("purchase_id");
            rs.close();
            st1.close();

            PreparedStatement st2 = con.prepareStatement(
                "insert into purchase_details " +
                "(item_id, purchase_id, purchase_quantity, purchase_price) " +
                "values (?, ?, ?, ?)"
            );
            st2.setInt(1, itemId);
            st2.setInt(2, purchaseId);
            st2.setInt(3, purchaseQuantity);
            st2.setInt(4, purchasePrice);
            st2.executeUpdate();
            st2.close();

            PreparedStatement st3 = con.prepareStatement(
                "update inventories set quantity=quantity+? " +
                "where item_id=? and delete_flag=false"
            );
            st3.setInt(1, purchaseQuantity);
            st3.setInt(2, itemId);
            int line = st3.executeUpdate();
            st3.close();

            if (line == 0) {
                throw new SQLException();
            }

            con.commit();
            return line;
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }
}
