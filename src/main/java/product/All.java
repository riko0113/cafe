package product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/product/all"})
public class All extends HttpServlet {
   public void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       // データを格納するリストを用意
       List<Map<String, Object>> productList = new ArrayList<>();
       try {
           InitialContext ic = new InitialContext();
           DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/cafe");
           Connection con = ds.getConnection();
           PreparedStatement st = con.prepareStatement("SELECT * FROM product");
           ResultSet rs = st.executeQuery();
           while (rs.next()) {
               Map<String, Object> product = new HashMap<>();
               product.put("id", rs.getInt("product_id"));
               product.put("name", rs.getString("product_name"));
               product.put("genreId", rs.getInt("genre_id"));
               product.put("price", rs.getInt("price"));
               productList.add(product);
           }
           st.close();
           con.close();
           // ★ ここが最大のポイント！
           // 取得したリストを「products」という名前でリクエストに保存する
           request.setAttribute("products", productList);
           // ★ all.jsp へ画面表示を丸投げ（フォワード）する
           request.getRequestDispatcher("/all.jsp").forward(request, response);
       } catch (Exception e) {
           e.printStackTrace();
       }
   }
}