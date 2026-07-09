package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tool.DAO;

public class OrderDAO extends DAO {
	public OrderBean search(String student_no) throws Exception {
	    
	    // 戻り値用（最初は見つかっていないのでnull）
	    Student student = null;

	    // DB接続を取得
	    Connection con = getConnection();

	    // SQLを準備
	    PreparedStatement st = con.prepareStatement(
	        "select * from student where student_no = ?"
	    );

	    st.setString(1, student_no);

	    // SQLを実行
	    ResultSet rs = st.executeQuery();

	    if (rs.next()) {

	        // データが見つかったらStudentオブジェクトを作成
	        student = new Student();

	        // カラム名を指定して値を取得 → Beanにセット
	        student.setStudent_no(rs.getString("student_no"));
	        student.setStudent_name(rs.getString("student_name"));
	        student.setEnt_year(rs.getInt("ent_year"));
	        student.setClass_num(rs.getString("class_num"));
	        student.setIs_attend(rs.getBoolean("is_attend"));
	        student.setSchool_id(rs.getString("school_id"));
	    }

	    // リソースを解放（必ず閉じる）
	    st.close();
	    con.close();

	    return student;
	}
    
    public List<OrderBean> all() throws Exception {
    	List<OrderBean> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement("select * from ordering");
        
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Student student = new Student();

            student.setStudent_no(rs.getString("student_no"));
            student.setStudent_name(rs.getString("student_name"));
            student.setEnt_year(rs.getInt("ent_year"));
            student.setClass_num(rs.getString("class_num"));
            student.setIs_attend(rs.getBoolean("is_attend"));
            student.setSchool_id(rs.getString("school_id"));

            list.add(student);
        }

        st.close();
        con.close();

        return list;
    }

}
