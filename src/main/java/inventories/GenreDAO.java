package inventories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class GenreDAO extends DAO {

    public List<GenreBean> all() throws Exception {
        List<GenreBean> list = new ArrayList<GenreBean>();
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "select item_genre_id, genre_name " +
            "from item_genres " +
            "where delete_flag=false " +
            "order by item_genre_id"
        );
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            GenreBean genre = new GenreBean();
            genre.setItemGenreId(rs.getInt("item_genre_id"));
            genre.setGenreName(rs.getString("genre_name"));
            list.add(genre);
        }

        rs.close();
        st.close();
        con.close();
        return list;
    }

    public int insert(String genreName) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "insert into item_genres (genre_name, delete_flag) values (?, false)"
        );
        st.setString(1, genreName);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }

    public int update(int itemGenreId, String genreName) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "update item_genres set genre_name=? " +
            "where item_genre_id=? and delete_flag=false"
        );
        st.setString(1, genreName);
        st.setInt(2, itemGenreId);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }

    public int delete(int itemGenreId) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
            "update item_genres set delete_flag=true where item_genre_id=?"
        );
        st.setInt(1, itemGenreId);
        int line = st.executeUpdate();
        st.close();
        con.close();
        return line;
    }
}
