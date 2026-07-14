package order;

public class ProductBean implements java.io.Serializable {

    private Integer productId;
    private String productName;
    private String genreId;
    private String genreName;
    private Integer price;
    private Boolean isDeleted;

    public Integer getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getGenreId() {
        return genreId;
    }
    
    public String getGenreName() {
        return genreName;
    }
    
    public Integer getPrice() {
        return price;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setGenreId(String genreId) {
        this.genreId = genreId;
    }
    
    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
    
    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
}
