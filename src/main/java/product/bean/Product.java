package product.bean;
public class Product implements java.io.Serializable {
	
    private int  product_id;
    private String product_name;
    private String genre_id;
    private int price;
   
    public int getProductId() {
        return product_id;
    }
    public String getProductName() {
        return product_name;
    }
    public String getGenreId() {
    	return genre_id;
    }
    public int getPrice() {
        return price;
    }
    
    public void setProductId(int product_id) {
        this.product_id = product_id;
    }
    public void setProductName(String product_name) {
        this.product_name = product_name;
    }
    public void setGenreId(String genre_id) {
    	this.genre_id = genre_id;
    }
    public void setPrice(int price) {
        this.price = price;
    }
}