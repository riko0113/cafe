package order;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class OrderBean implements java.io.Serializable {

    private Integer orderId;
    private BigDecimal payAmount;
    private Integer payWayId;
    private LocalDateTime dateTime;
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
    
    public LocalDateTime getDateTime() {
        return dateTime;
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
    
    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public void setIsTakeOut(Boolean isTakeOut) {
        this.isTakeOut = isTakeOut;
    }
    
    public void setTotalExclTax(BigDecimal totalExclTax) {
        this.totalExclTax = totalExclTax;
    }
}
