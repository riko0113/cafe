package product.bean;
public class Genre implements java.io.Serializable {
	
    private String genre_id;
    private String genre_name;
    private int price;
   
    public String getGenreId() {
        return genre_id;
    }
    public String getGenreName() {
        return genre_name;
    }
    public int getPrice() {
        return price;
    }
    
    public void setGenreId(String genre_id) {
        this.genre_id = genre_id;
    }
    public void setGenreName(String genre_name) {
        this.genre_name = genre_name;
    }
    public void setPrice(int price) {
        this.price = price;
    }
}