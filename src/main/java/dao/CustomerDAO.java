package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Customer;

public class CustomerDAO extends DAO {
    public Customer search(String login, String password) throws Exception {

        // 戻り値用（最初は見つかっていないのでnull）
        Customer customer = null;

        // DB接続を取得
        Connection con = getConnection();

        // SQLを準備（?で値を後からセットする＝SQLインジェクション対策）
        PreparedStatement st = con.prepareStatement(
            "select * from customer where login=? and password=?"
        );

        // 1つ目の?にログイン名をセット
        st.setString(1, login);

        // 2つ目の?にパスワードをセット
        st.setString(2, password);

        // SQLを実行（SELECTなのでexecuteQuery）
        ResultSet rs = st.executeQuery();

        // 検索結果を1件ずつ取り出す
        while (rs.next()) {

            // データが見つかったらCustomerオブジェクトを作成
            customer = new Customer();

            // カラム名を指定して値を取得 → Beanにセット
            customer.setId(rs.getInt("id"));
            customer.setLogin(rs.getString("login"));
            customer.setPassword(rs.getString("password"));
        }

        // リソースを解放（必ず閉じる）
        st.close();
        con.close();

        // 見つかればCustomer、なければnullを返す
        return customer;
    }
}