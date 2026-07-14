package sales.bean;

import java.io.Serializable;
import java.math.BigDecimal;

public class SalesSummary implements Serializable {

    private String targetDate;

    private BigDecimal totalExclTax;

    private BigDecimal totalInclTax;

    private BigDecimal totalTax;

    // getter setter
	public String getTargetDate() {
        return targetDate;
    }

    public BigDecimal getTotalExclTax() {
        return totalExclTax;
    }
    
    public BigDecimal getTotalInclTax() {
    	return totalInclTax;
    }
    
    public BigDecimal getTotalTax() {
    	return totalTax;
    }

    public void setTargetDate(String targetDate) {
        this.targetDate = targetDate;
    }

    public void setTotalExclTax(BigDecimal totalExclTax) {
        this.totalExclTax = totalExclTax;
    }
    
    public void setTotalInclTax(BigDecimal totalInclTax) {
    	this.totalInclTax = totalInclTax;
    }
    
    public void setTotalTax(BigDecimal totalTax) {
    	this.totalTax = totalTax;
    }
}