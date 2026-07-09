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

@WebServlet("/product/insert")
public class insert extends HttpServlet {
	
	public void doPost (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup("java:comp/env/jdbc/cafe");
			Connection con=ds.getConnection();
			
			String genre_id=request.getParameter(("genre_id"));
			String genre_name=request.getParameter("genre_name");
			
			PreparedStatement st=con.prepareStatement(
				"insert into genre(genre_id, genre_name, is_deleted) values(?, ?, ?)");
			st.setString(1, genre_id);
			st.setString(2, genre_name);
			st.setBoolean(3, false);
			int line=st.executeUpdate();
			
			con.commit();
			
			if (line>0) {
				out.println("追加しました");
			}
			
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
		request.getRequestDispatcher("../product/success.jsp").forward(request, response);
	}
}