package sales.bean;
import java.math.BigDecimal;

public class ProductSalesSummary implements java.io.Serializable {
	
	private int product_id;
	private String product_name;
	private String genre_name;
	private int total_quantity;
	private BigDecimal total_amount;
	
	
	public int getProduct_id() {
        return product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public String getGenre_name() {
        return genre_name;
    }
    
    public int getTotal_quantity() {
    	return total_quantity;
    }
    
    public BigDecimal getTotal_amount() {
    	return total_amount;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    
    public void setGenre_name(String genre_name) {
    	this.genre_name = genre_name;
    }
    
    public void setTotal_quantity(int total_quantity) {
    	this.total_quantity = total_quantity;
    }
    
    public void setTotal_amount(BigDecimal total_amount) {
    	this.total_amount = total_amount;
    }
}