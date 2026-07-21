package inventories;

public class InventoryBean {
    private int itemId;
    private String itemName;
    private int itemGenreId;
    private String genreName;
    private int quantity;
    private int standardStock;
    private String supplierName;

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getItemGenreId() {
        return itemGenreId;
    }

    public void setItemGenreId(int itemGenreId) {
        this.itemGenreId = itemGenreId;
    }

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStandardStock() {
        return standardStock;
    }

    public void setStandardStock(int standardStock) {
        this.standardStock = standardStock;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }
}
