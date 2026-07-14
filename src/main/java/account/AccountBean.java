package account;


public class AccountBean implements java.io.Serializable {

    private String accountId;
    private String userName;
    private String password;

    public String getAccountId() {
        return accountId;
    }

    public String getUseName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }
    
    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }   
}
