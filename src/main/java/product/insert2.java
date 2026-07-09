package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet("/product/insert2")
public class insert2 extends HttpServlet {
	
	public void doPost (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup("java:comp/env/jdbc/book");
			Connection con=ds.getConnection();
			
		    int product_id=Integer.parseInt("product_id");
			String product_name=request.getParameter("product_name");
			String genre_id=request.getParameter("genre_id");
			int price=Integer.parseInt(request.getParameter("price"));
			
			PreparedStatement st=con.prepareStatement(
				"insert into test(product_id, product_name, genre_id, price) values(?, ?, ?, ?)");
			st.setInt(1, product_id);
			st.setString(2, product_name);
			st.setString(3, genre_id);
			st.setInt(4, price);
			int line=st.executeUpdate();
			
			if (line>0) {
				out.println("追加しました");
			}
			
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
		request.getRequestDispatcher("../product/success2.jsp").forward(request, response);
	}
}