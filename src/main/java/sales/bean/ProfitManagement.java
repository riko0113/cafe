package sales.bean;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProfitManagement implements Serializable {

    private String targetMonth;

    private BigDecimal salesAmount;

    private BigDecimal purchaseAmount;

    private BigDecimal grossMarginRate;

    public String getTargetMonth() {
        return targetMonth;
    }

    public void setTargetMonth(String targetMonth) {
        this.targetMonth = targetMonth;
    }

    public BigDecimal getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(BigDecimal salesAmount) {
        this.salesAmount = salesAmount;
    }

    public BigDecimal getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(BigDecimal purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    public BigDecimal getGrossMarginRate() {
        return grossMarginRate;
    }

    public void setGrossMarginRate(BigDecimal grossMarginRate) {
        this.grossMarginRate = grossMarginRate;
    }
}