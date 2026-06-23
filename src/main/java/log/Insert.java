package log;

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

@WebServlet(urlPatterns= {"/log/insert"})
public class Insert extends HttpServlet {
	public void doPost(
		HttpServletRequest request,HttpServletResponse response
	) throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup(
					"java:/comp/env/jdbc/system");
			Connection con=ds.getConnection();
			
			String teacher_id =request.getParameter("teacher_id");
			String password=request.getParameter("password");
			String teacher_name =request.getParameter("teacher_name");
			String school_id =request.getParameter("school_id");
			
			PreparedStatement st=con.prepareStatement(
					"insert into teacher(teacher_id,password,teacher_name,school_id) values(?,?,?,?)");
			st.setString(1, teacher_id);
			st.setString(2, password);
			st.setString(3, teacher_name);
			st.setString(4, school_id);
			int line=st.executeUpdate();
			
			if (line>0) {
				request.getRequestDispatcher("/login/success.jsp")
					.forward(request, response);
			}else {
				request.getRequestDispatcher("/login/insert-error.jsp")
					.forward(request, response);
			}
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
			request.getRequestDispatcher("/login/insert-error.jsp")
				.forward(request, response);
    	}
	
	}
}