package inventories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class InventoryDAO extends DAO {

    public List<InventoryBean> all() throws Exception {
        List<InventoryBean> list = new ArrayList<InventoryBean>();
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "select i.item_id, i.item_name, i.item_genre_id, " +
            "g.genre_name, i.quantity, i.standard_stock, " +
            "coalesce((select s.supplier_name " +
            "from purchase_details pd " +
            "inner join purchases p " +
            "on p.purchase_id=pd.purchase_id " +
            "inner join suppliers s " +
            "on s.supplier_id=p.supplier_id " +
            "where pd.item_id=i.item_id " +
            "order by p.purchase_date desc, " +
            "p.purchase_id desc " +
            "limit 1), '') as supplier_name " +
            "from inventories i " +
            "inner join item_genres g " +
            "on g.item_genre_id=i.item_genre_id " +
            "where i.delete_flag=false " +
            "order by i.item_id"
        );
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            InventoryBean item = new InventoryBean();
            item.setItemId(rs.getInt("item_id"));
            item.setItemName(rs.getString("item_name"));
            item.setItemGenreId(rs.getInt("item_genre_id"));
            item.setGenreName(rs.getString("genre_name"));
            item.setQuantity(rs.getInt("quantity"));
            item.setStandardStock(rs.getInt("standard_stock"));
            item.setSupplierName(rs.getString("supplier_name"));
            list.add(item);
        }

        rs.close();
        st.close();
        con.close();
        return list;
    }

    public int insert(String itemName, int itemGenreId, int standardStock) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "insert into inventories " +
            "(item_name, item_genre_id, quantity, " +
            "standard_stock, delete_flag) " +
            "values (?, ?, 0, ?, false)"
        );
        st.setString(1, itemName);
        st.setInt(2, itemGenreId);
        st.setInt(3, standardStock);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }

    public int update(int itemId, String itemName, int itemGenreId,int quantity, int standardStock) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "update inventories " +
            "set item_name=?, item_genre_id=?, " +
            "quantity=?, standard_stock=? " +
            "where item_id=? and delete_flag=false"
        );
        st.setString(1, itemName);
        st.setInt(2, itemGenreId);
        st.setInt(3, quantity);
        st.setInt(4, standardStock);
        st.setInt(5, itemId);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }

    public int delete(int itemId) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "update inventories set delete_flag=true where item_id=?"
        );
        st.setInt(1, itemId);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }
}
