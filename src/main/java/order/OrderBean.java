package order;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class OrderBean implements java.io.Serializable {

    private Integer orderId;
    private BigDecimal payAmount;
    private Integer payWayId;
    private String payWayName;
    private LocalDateTime datetime;
    private Boolean isTakeOut;
    private BigDecimal totalExclTax;
    private List<OrderDetailBean> details;

    public Integer getOrderId() {
        return orderId;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public Integer getPayWayId() {
        return payWayId;
    }
    
    public String getPayWayName() {
        return payWayName;
    }
    
    public LocalDateTime getDatetime() {
        return datetime;
    }

    public Boolean getIsTakeOut() {
        return isTakeOut;
    }
    
    public BigDecimal getTotalExclTax() {
        return totalExclTax;
    }
    
    public List<OrderDetailBean> getDetails() {
        return details;
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
    
    public void setPayWayName(String payWayName) {
        this.payWayName = payWayName;
    }
    
    public void setDatetime(LocalDateTime datetime) {
        this.datetime = datetime;
    }
    
    public void setIsTakeOut(Boolean isTakeOut) {
        this.isTakeOut = isTakeOut;
    }
    
    public void setTotalExclTax(BigDecimal totalExclTax) {
        this.totalExclTax = totalExclTax;
    }
    
    public void setDetails(List<OrderDetailBean> details) {
        this.details = details;
    }
}
