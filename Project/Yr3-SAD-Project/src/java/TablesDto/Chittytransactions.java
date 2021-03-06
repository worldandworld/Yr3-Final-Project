package TablesDto;
// Generated 10-Feb-2016 14:44:17 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Chittytransactions generated by hbm2java
 */
public class Chittytransactions  implements java.io.Serializable {


     private Integer chittyTransactionId;
     private Users users;
     private int chittyNo;
     private Integer chtyTermNo;
     private Date date;
     private Double amount;
     private String description;
     private String transRefence;
     private Integer transStatus;
     private Date clearanceDate;
     private Integer paymentMethod;

    public Chittytransactions() {
    }

	
    public Chittytransactions(int chittyNo) {
        this.chittyNo = chittyNo;
    }
    public Chittytransactions(Users users, int chittyNo, Integer chtyTermNo, Date date, Double amount, String description, String transRefence, Integer transStatus, Date clearanceDate, Integer paymentMethod) {
       this.users = users;
       this.chittyNo = chittyNo;
       this.chtyTermNo = chtyTermNo;
       this.date = date;
       this.amount = amount;
       this.description = description;
       this.transRefence = transRefence;
       this.transStatus = transStatus;
       this.clearanceDate = clearanceDate;
       this.paymentMethod = paymentMethod;
    }
   
    public Integer getChittyTransactionId() {
        return this.chittyTransactionId;
    }
    
    public void setChittyTransactionId(Integer chittyTransactionId) {
        this.chittyTransactionId = chittyTransactionId;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public int getChittyNo() {
        return this.chittyNo;
    }
    
    public void setChittyNo(int chittyNo) {
        this.chittyNo = chittyNo;
    }
    public Integer getChtyTermNo() {
        return this.chtyTermNo;
    }
    
    public void setChtyTermNo(Integer chtyTermNo) {
        this.chtyTermNo = chtyTermNo;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Double getAmount() {
        return this.amount;
    }
    
    public void setAmount(Double amount) {
        this.amount = amount;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getTransRefence() {
        return this.transRefence;
    }
    
    public void setTransRefence(String transRefence) {
        this.transRefence = transRefence;
    }
    public Integer getTransStatus() {
        return this.transStatus;
    }
    
    public void setTransStatus(Integer transStatus) {
        this.transStatus = transStatus;
    }
    public Date getClearanceDate() {
        return this.clearanceDate;
    }
    
    public void setClearanceDate(Date clearanceDate) {
        this.clearanceDate = clearanceDate;
    }
    public Integer getPaymentMethod() {
        return this.paymentMethod;
    }
    
    public void setPaymentMethod(Integer paymentMethod) {
        this.paymentMethod = paymentMethod;
    }




}


