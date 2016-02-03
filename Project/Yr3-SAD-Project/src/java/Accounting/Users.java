package Accounting;
// Generated Feb 2, 2016 1:25:00 AM by Hibernate Tools 4.3.1



/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private Integer userId;
     private String userName;
     private boolean userNameVerified;
     private String userPassword;
     private String firstName;
     private String middleName;
     private String lastName;
     private String address;
     private String town;
     private String state;
     private String country;
     private String postCode;
     private String phone1;
     private String phone2;
     private String idtype;
     private String addressProofType;
     private String idref;
     private String addressRef;
     private Boolean idVirified;
     private int userType;
     private int overDraftLimit;
     private Boolean stayanonymous;
     private String anonymusName;
     private String passwordSalt;

    public Users() {
    }

	
    public Users(String userName, boolean userNameVerified, String userPassword, String firstName, String lastName, String address, String town, String state, String country, int userType, int overDraftLimit, String passwordSalt) {
        this.userName = userName;
        this.userNameVerified = userNameVerified;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.town = town;
        this.state = state;
        this.country = country;
        this.userType = userType;
        this.overDraftLimit = overDraftLimit;
        this.passwordSalt = passwordSalt;
    }
    public Users(String userName, boolean userNameVerified, String userPassword, String firstName, String middleName, String lastName, String address, String town, String state, String country, String postCode, String phone1, String phone2, String idtype, String addressProofType, String idref, String addressRef, Boolean idVirified, int userType, int overDraftLimit, Boolean stayanonymous, String anonymusName, String passwordSalt) {
       this.userName = userName;
       this.userNameVerified = userNameVerified;
       this.userPassword = userPassword;
       this.firstName = firstName;
       this.middleName = middleName;
       this.lastName = lastName;
       this.address = address;
       this.town = town;
       this.state = state;
       this.country = country;
       this.postCode = postCode;
       this.phone1 = phone1;
       this.phone2 = phone2;
       this.idtype = idtype;
       this.addressProofType = addressProofType;
       this.idref = idref;
       this.addressRef = addressRef;
       this.idVirified = idVirified;
       this.userType = userType;
       this.overDraftLimit = overDraftLimit;
       this.stayanonymous = stayanonymous;
       this.anonymusName = anonymusName;
       this.passwordSalt = passwordSalt;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public boolean isUserNameVerified() {
        return this.userNameVerified;
    }
    
    public void setUserNameVerified(boolean userNameVerified) {
        this.userNameVerified = userNameVerified;
    }
    public String getUserPassword() {
        return this.userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getMiddleName() {
        return this.middleName;
    }
    
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getTown() {
        return this.town;
    }
    
    public void setTown(String town) {
        this.town = town;
    }
    public String getState() {
        return this.state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    public String getCountry() {
        return this.country;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    public String getPostCode() {
        return this.postCode;
    }
    
    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }
    public String getPhone1() {
        return this.phone1;
    }
    
    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }
    public String getPhone2() {
        return this.phone2;
    }
    
    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }
    public String getIdtype() {
        return this.idtype;
    }
    
    public void setIdtype(String idtype) {
        this.idtype = idtype;
    }
    public String getAddressProofType() {
        return this.addressProofType;
    }
    
    public void setAddressProofType(String addressProofType) {
        this.addressProofType = addressProofType;
    }
    public String getIdref() {
        return this.idref;
    }
    
    public void setIdref(String idref) {
        this.idref = idref;
    }
    public String getAddressRef() {
        return this.addressRef;
    }
    
    public void setAddressRef(String addressRef) {
        this.addressRef = addressRef;
    }
    public Boolean getIdVirified() {
        return this.idVirified;
    }
    
    public void setIdVirified(Boolean idVirified) {
        this.idVirified = idVirified;
    }
    public int getUserType() {
        return this.userType;
    }
    
    public void setUserType(int userType) {
        this.userType = userType;
    }
    public int getOverDraftLimit() {
        return this.overDraftLimit;
    }
    
    public void setOverDraftLimit(int overDraftLimit) {
        this.overDraftLimit = overDraftLimit;
    }
    public Boolean getStayanonymous() {
        return this.stayanonymous;
    }
    
    public void setStayanonymous(Boolean stayanonymous) {
        this.stayanonymous = stayanonymous;
    }
    public String getAnonymusName() {
        return this.anonymusName;
    }
    
    public void setAnonymusName(String anonymusName) {
        this.anonymusName = anonymusName;
    }
    public String getPasswordSalt() {
        return this.passwordSalt;
    }
    
    public void setPasswordSalt(String passwordSalt) {
        this.passwordSalt = passwordSalt;
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", userName=" + userName + ", userNameVerified=" + userNameVerified + ", userPassword=" + userPassword + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName + ", address=" + address + ", town=" + town + ", state=" + state + ", country=" + country + ", postCode=" + postCode + ", phone1=" + phone1 + ", phone2=" + phone2 + ", idtype=" + idtype + ", addressProofType=" + addressProofType + ", idref=" + idref + ", addressRef=" + addressRef + ", idVirified=" + idVirified + ", userType=" + userType + ", overDraftLimit=" + overDraftLimit + ", stayanonymous=" + stayanonymous + ", anonymusName=" + anonymusName + ", passwordSalt=" + passwordSalt + '}';
    }




}


