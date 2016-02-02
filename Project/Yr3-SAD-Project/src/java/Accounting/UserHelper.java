/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Accounting;

import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Abdul
 */
public class UserHelper {

    Session session = null;

    public UserHelper() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public void getUserLogin(String userName, boolean userNameVerified, String userPassword, String firstName, String middleName, String lastName, String address, String town, String state, String country, String postCode, String phone1, String phone2, String idtype, String addressProofType, String idref, String addressRef, Boolean idVirified, int userType, int overDraftLimit, Boolean stayanonymous, String anonymusName, String passwordSalt) {
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery("INSERT INTO `Users` (`UserId`, `UserName`, `UserPassword`) VALUES (NULL,?,?)");
            q.setString(1, userName);
    //        q.setBoolean(2, userNameVerified);
            q.setString(2, userPassword);
//            q.setBoolean(2, userNameVerified);            
//            q.setString(4, firstName);
//            q.setString(5, middleName);
//            q.setString(6, lastName);
//            q.setString(7, address);
//            q.setString(8, town);
//            q.setString(9, state);
//            q.setString(10, country);
//            q.setString(11, postCode);
//            q.setString(12, phone1);
//            q.setString(13, phone2);
//            q.setString(14, idtype);
//            q.setString(15, addressProofType);
//            q.setString(16, idref);
//            q.setString(17, addressRef);
//            q.setBoolean(18, idVirified);
//            q.setInteger(19, userType);
//            q.setInteger(20, overDraftLimit);
//            q.setBoolean(21, stayanonymous);
//            q.setString(22, anonymusName);
//            q.setString(23, passwordSalt);
            
            int i = q.executeUpdate();
            if(i > 0){
                System.out.println("Insert sucessfull");
            }
            tx.commit();
             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
