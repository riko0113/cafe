package inventories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class SupplierDAO extends DAO {

    public List<SupplierBean> all() throws Exception {
        List<SupplierBean> list = new ArrayList<SupplierBean>();
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "select supplier_id, supplier_name, supplier_address, " +
            "supplier_phone, supplier_email " +
            "from suppliers order by supplier_id"
        );
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            SupplierBean supplier = new SupplierBean();
            supplier.setSupplierId(rs.getInt("supplier_id"));
            supplier.setSupplierName(rs.getString("supplier_name"));
            supplier.setSupplierAddress(rs.getString("supplier_address"));
            supplier.setSupplierPhone(rs.getString("supplier_phone"));
            supplier.setSupplierEmail(rs.getString("supplier_email"));
            list.add(supplier);
        }

        rs.close();
        st.close();
        con.close();
        return list;
    }

    public int insert(String supplierName, String supplierAddress,
            String supplierPhone, String supplierEmail) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "insert into suppliers " +
            "(supplier_name, supplier_address, supplier_phone, supplier_email) " +
            "values (?, ?, ?, ?)"
        );
        st.setString(1, supplierName);
        st.setString(2, supplierAddress);
        st.setString(3, supplierPhone);
        st.setString(4, supplierEmail);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }
}
