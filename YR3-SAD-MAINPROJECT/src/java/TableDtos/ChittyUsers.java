package TableDtos;
// Generated Feb 10, 2016 3:20:31 PM by Hibernate Tools 4.3.1



/**
 * ChittyUsers generated by hbm2java
 */
public class ChittyUsers  implements java.io.Serializable {


     private ChittyUsersId id;
     private Integer latePaymentFee;

    public ChittyUsers() {
    }

	
    public ChittyUsers(ChittyUsersId id) {
        this.id = id;
    }
    public ChittyUsers(ChittyUsersId id, Integer latePaymentFee) {
       this.id = id;
       this.latePaymentFee = latePaymentFee;
    }
   
    public ChittyUsersId getId() {
        return this.id;
    }
    
    public void setId(ChittyUsersId id) {
        this.id = id;
    }
    public Integer getLatePaymentFee() {
        return this.latePaymentFee;
    }
    
    public void setLatePaymentFee(Integer latePaymentFee) {
        this.latePaymentFee = latePaymentFee;
    }




}


