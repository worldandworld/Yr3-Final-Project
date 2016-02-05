/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBCommands;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Abdul
 */
public class UserHelper {

    Session session = null;
    Transaction tx = null;

    public UserHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    /**
     * User 
     * @param userName
     * @param userPassword
     * @param salt
     * @return
     */
    public boolean registerUser(String userName, String userPassword) {

        try {
            tx = session.beginTransaction();
            Query q = session.createSQLQuery("INSERT INTO `Users` (`UserId`, `UserName`, `UserPassword`) VALUES (NULL,?,?)");
            q.setParameter(0, userName);
            q.setParameter(1, userPassword);

            int i = q.executeUpdate();
            if (i > 0) {
                System.out.println("Insert sucessfull");
                tx.commit();
                return true;
            }

            session.close();
        } catch (Exception e) {
            try {
                tx.rollback();
            } catch (RuntimeException r) {
                System.out.println("Can't rollback transaction");
                
            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return false;
    }

    /**
     * Encrypt the clear-text password using the same salt that was used to encrypt the original password
     * @param attemptedPassword
     * @param encryptedPassword
     * @param salt
     * @return
     */
    public boolean authenticatePassword(String attemptedPassword, byte[] encryptedPassword, byte[] salt){
        //For now just do this -->
        return false;
    }
}
