package sales.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sales.bean.ProductSalesSummary;
//import model.User;
import tool.DAO;


public class ProductSalesSummaryDAO extends DAO {
	
	
	// 学生情報の一覧を取得
	public List<ProductSalesSummary> searchdaily() throws Exception {
		List<Student> students = new ArrayList<>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement("select * from student where std_is_attend = true");
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			Student std = new Student();
			std.setNo(rs.getString("no"));
			std.setName(rs.getString("name"));
			std.setEnt_year(rs.getInt("ent_year"));
			std.setClass_num(rs.getString("class_num"));
			std.setStd_is_attend(rs.getBoolean("std_is_attend"));
			std.setSchool_cd(rs.getString("school_cd"));
			students.add(std);
			
//			p.setUser_name(rs.getString("user_name"));
//			p.setTitle(rs.getString("title"));
//			p.setLike_count(rs.getInt("like_count"));
//			p.setComment(rs.getString("comment"));			
		}
		
		st.close();
		con.close();
		return students;
	}
	
	// 変更用全件取得
	public List<Student> searchAll() throws Exception {
		List<Student> students = new ArrayList<>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement("select * from student");
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			Student std = new Student();
			std.setNo(rs.getString("no"));
			std.setName(rs.getString("name"));
			std.setEnt_year(rs.getInt("ent_year"));
			std.setClass_num(rs.getString("class_num"));
			std.setStd_is_attend(rs.getBoolean("std_is_attend"));
			std.setSchool_cd(rs.getString("school_cd"));
			students.add(std);
			
//			p.setUser_name(rs.getString("user_name"));
//			p.setTitle(rs.getString("title"));
//			p.setLike_count(rs.getInt("like_count"));
//			p.setComment(rs.getString("comment"));			
		}
		
		st.close();
		con.close();
		return students;
	}
	
	// 主キーで1件取得
	public Student findByNo(String no) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM student WHERE no = ?"
				);
		st.setString(1, no);

		ResultSet rs = st.executeQuery();

		Student std = null;

		if (rs.next()) {
			std = new Student();
			std.setNo(rs.getString("no"));
			std.setName(rs.getString("name"));
			std.setEnt_year(rs.getInt("ent_year"));
			std.setClass_num(rs.getString("class_num"));
			std.setSchool_cd(rs.getString("school_cd"));
			}

		st.close();
		con.close();

		return std;
	}
	// 変更
	public void update(Student student) throws Exception {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(
				"UPDATE STUDENT SET NAME = ?, ENT_YEAR = ?, CLASS_NUM = ?, SCHOOL_CD = ? WHERE NO = ?"
				);
		st.setString(1, student.getName());
		st.setInt(2, student.getEnt_year());
		st.setString(3, student.getClass_num());
		st.setString(4, student.getSchool_cd());
		st.setString(5, student.getNo());
		st.executeUpdate();
		
		st.close();
	    con.close();
	}
	
	// 削除(在籍フラグ変更)
	public void delete(String no) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"UPDATE STUDENT SET STD_IS_ATTEND = FALSE WHERE NO = ?"
				);
		st.setString(1, no);

		int result = st.executeUpdate();
		System.out.println("削除(論理)件数：" + result);

		
		st.close();
		con.close();
	}
	
	// 新規学生登録
	public void insert(Student student) throws Exception {
	    Connection con = getConnection();
	    
	    PreparedStatement st = con.prepareStatement(
	        "INSERT INTO STUDENT VALUES(?, ?, ?, ?, true, ?)"
	    );
	    st.setString(1, student.getNo());
	    st.setString(2, student.getName());
	    st.setInt(3, student.getEnt_year());
	    st.setString(4, student.getClass_num());
	    st.setString(5, student.getSchool_cd());
	    st.executeUpdate();

	    st.close();
	    con.close();
	}
}