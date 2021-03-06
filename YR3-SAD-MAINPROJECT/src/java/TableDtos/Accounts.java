package TableDtos;
// Generated Feb 10, 2016 3:20:31 PM by Hibernate Tools 4.3.1



/**
 * Accounts generated by hbm2java
 */
public class Accounts  implements java.io.Serializable {


     private Integer accId;
     private String accName;
     private double defaultCreditInterestRate;
     private int creditInterestTerm;
     private Integer defaultCreditInterestCalculationTerm;
     private double defaultDebitInterestRate;
     private Integer defaultDebtInterestTerm;
     private Integer defaultDebtInterestCalculationTerm;

    public Accounts() {
    }

	
    public Accounts(String accName, double defaultCreditInterestRate, int creditInterestTerm, double defaultDebitInterestRate) {
        this.accName = accName;
        this.defaultCreditInterestRate = defaultCreditInterestRate;
        this.creditInterestTerm = creditInterestTerm;
        this.defaultDebitInterestRate = defaultDebitInterestRate;
    }
    public Accounts(String accName, double defaultCreditInterestRate, int creditInterestTerm, Integer defaultCreditInterestCalculationTerm, double defaultDebitInterestRate, Integer defaultDebtInterestTerm, Integer defaultDebtInterestCalculationTerm) {
       this.accName = accName;
       this.defaultCreditInterestRate = defaultCreditInterestRate;
       this.creditInterestTerm = creditInterestTerm;
       this.defaultCreditInterestCalculationTerm = defaultCreditInterestCalculationTerm;
       this.defaultDebitInterestRate = defaultDebitInterestRate;
       this.defaultDebtInterestTerm = defaultDebtInterestTerm;
       this.defaultDebtInterestCalculationTerm = defaultDebtInterestCalculationTerm;
    }
   
    public Integer getAccId() {
        return this.accId;
    }
    
    public void setAccId(Integer accId) {
        this.accId = accId;
    }
    public String getAccName() {
        return this.accName;
    }
    
    public void setAccName(String accName) {
        this.accName = accName;
    }
    public double getDefaultCreditInterestRate() {
        return this.defaultCreditInterestRate;
    }
    
    public void setDefaultCreditInterestRate(double defaultCreditInterestRate) {
        this.defaultCreditInterestRate = defaultCreditInterestRate;
    }
    public int getCreditInterestTerm() {
        return this.creditInterestTerm;
    }
    
    public void setCreditInterestTerm(int creditInterestTerm) {
        this.creditInterestTerm = creditInterestTerm;
    }
    public Integer getDefaultCreditInterestCalculationTerm() {
        return this.defaultCreditInterestCalculationTerm;
    }
    
    public void setDefaultCreditInterestCalculationTerm(Integer defaultCreditInterestCalculationTerm) {
        this.defaultCreditInterestCalculationTerm = defaultCreditInterestCalculationTerm;
    }
    public double getDefaultDebitInterestRate() {
        return this.defaultDebitInterestRate;
    }
    
    public void setDefaultDebitInterestRate(double defaultDebitInterestRate) {
        this.defaultDebitInterestRate = defaultDebitInterestRate;
    }
    public Integer getDefaultDebtInterestTerm() {
        return this.defaultDebtInterestTerm;
    }
    
    public void setDefaultDebtInterestTerm(Integer defaultDebtInterestTerm) {
        this.defaultDebtInterestTerm = defaultDebtInterestTerm;
    }
    public Integer getDefaultDebtInterestCalculationTerm() {
        return this.defaultDebtInterestCalculationTerm;
    }
    
    public void setDefaultDebtInterestCalculationTerm(Integer defaultDebtInterestCalculationTerm) {
        this.defaultDebtInterestCalculationTerm = defaultDebtInterestCalculationTerm;
    }




}


