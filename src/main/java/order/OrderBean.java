package order;

import java.math.BigDecimal;

public class OrderBean implements java.io.Serializable {

    private Integer orderId;
    private BigDecimal payAmount;
    private Integer payWayId;
    private Boolean isTakeOut;
    private BigDecimal totalExclTax;

    public Integer getOrderId() {
        return orderId;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public Integer getPayWayId() {
        return payWayId;
    }

    public Boolean getIsTakeOut() {
        return isTakeOut;
    }
    
    public BigDecimal getTotalExclTax() {
        return totalExclTax;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public void setPayWayId(Integer payWayId) {
        this.payWayId = payWayId;
    }

    public void setIsTakeOut(Boolean isTakeOut) {
        this.isTakeOut = isTakeOut;
    }
    
    public void setTotalExclTax(BigDecimal totalExclTax) {
        this.totalExclTax = totalExclTax;
    }
}
