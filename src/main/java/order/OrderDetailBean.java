package order;

import java.math.BigDecimal;

public class OrderDetailBean implements java.io.Serializable {

    private Integer orderDetailId;
    private Integer productId;
    private Integer orderId;
    private Integer num;
    private BigDecimal subtotal;
    private String productName;

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public Integer getProductId() {
        return productId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public Integer getNum() {
        return num;
    }
    
    public BigDecimal getSubtotal() {
        return subtotal;
    }
    
    public String getProductName() {
        return productName;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
    
    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
}
