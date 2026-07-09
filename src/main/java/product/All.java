package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// JNDI
import javax.naming.InitialContext;
// JDBC関連
import javax.sql.DataSource;

// Servlet関連
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet(urlPatterns={"/product/all"})
public class All extends HttpServlet {

    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        
        Page.header(out);
        try {

            InitialContext ic = new InitialContext();

            DataSource ds = (DataSource) ic.lookup(
                "java:/comp/env/jdbc/cafe");

            Connection con = ds.getConnection();

            PreparedStatement st = con.prepareStatement(
                "SELECT * from product ");

            ResultSet rs = st.executeQuery();
            
            out.println("<table border='1' style='border-collapse: collapse; width: 100%; text-align: center; margin-top: 20px;'>" );
            out.println("<tr style='background-color: #e3f2fd;'>");
            out.println("    <th style='padding: 10px;'>商品ID</th>");
            out.println("    <th style='padding: 10px;'>商品名</th>");
            out.println("    <th style='padding: 10px;'>ジャンルID</th>");
            out.println("    <th style='padding: 10px;'>価格</th>");
            out.println("    <th style='padding: 10px;'>削除フラグ</th>");
            out.println("</tr>");

            while (rs.next()) {
            	
            	int productId = rs.getInt("product_id");
            	int price = rs.getInt("price");

                out.println("<tr>");
                out.println("    <td style='padding: 8px;'>" + rs.getInt("product_id") + "</td>");
                out.println("    <td style='padding: 8px;'>" + rs.getString("product_name") + "</td>");
                out.println("    <td style='padding: 8px;'>" + rs.getInt("genre_id") + "</td>");
                out.println("    <td style='padding: 8px;'>" + rs.getInt("price") + "</td>");
                out.println("    <td style='padding: 8px;'>" + rs.getBoolean("is_deleted") + "</td>");
                
                out.println("    <td style='padding: 8px;'>");
                out.println("    <form action='DeleteServlet' method='post' style='margin:0;'>");
                out.println("    <input type='hidden' name='student_no' value='" + productId + "'>");
                out.println("    <input type='hidden' name='no' value='" + price + "'>");
                out.println("    <input type='submit' value='削除' onclick='return confirm(\"本当に削除しますか?\");'>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");

            st.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace(out);
        }

        Page.footer(out);
    }
}