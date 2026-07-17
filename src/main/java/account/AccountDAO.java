package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

public class AccountDAO extends DAO {
    public AccountBean search(String account_id, String password) throws Exception {

        // 戻り値用（最初は見つかっていないのでnull）
        AccountBean account = null;

        // DB接続を取得
        Connection con = getConnection();

        // SQLを準備（?で値を後からセットする＝SQLインジェクション対策）
        PreparedStatement st = con.prepareStatement(
            "select * from account where account_id=? and password=? and is_deleted=false"
        );

        st.setString(1, account_id);

        st.setString(2, password);

        // SQLを実行（SELECTなのでexecuteQuery）
        ResultSet rs = st.executeQuery();

        // 検索結果を1件ずつ取り出す
        while (rs.next()) {

            // データが見つかったらオブジェクトを作成
            account = new AccountBean();

            // カラム名を指定して値を取得 → Beanにセット
            account.setAccountId(rs.getString("account_id"));
            account.setPassword(rs.getString("password"));
            account.setUserName(rs.getString("user_name"));
        }

        // リソースを解放（必ず閉じる）
        st.close();
        con.close();

        return account;
    }
    
    public int insert(String account_id, String user_name, String password) throws Exception{
    	
    	int line = 0;
    	
    	Connection con = getConnection();
    	
    	PreparedStatement st=con.prepareStatement("insert into account values(?,?,?)");
    	
		st.setString(1, account_id);
		st.setString(2, user_name);
		st.setString(3, password);
		
		line = st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return line;
    }
    
    public int update(String account_id, String user_name, String password) throws Exception{
    	
    	int line = 0;
    	
    	Connection con = getConnection();
    	
    	PreparedStatement st=con.prepareStatement("update account set "
    			+ "user_name = ?, password = ? where account_id = ?");
    	
    	st.setString(1, user_name);
		st.setString(2, password);
		st.setString(3, account_id);
		
		line = st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return line;
    }
    
    public int delete(String account_id) throws Exception{
    	
    	int line = 0;
    	
    	Connection con = getConnection();
    	
    	PreparedStatement st=con.prepareStatement("update account set is_deleted = true where account_id = ?");

		st.setString(1, account_id);
		
		line = st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return line;
    }
}