/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBCommands;

import TablesDto.Users;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Abdul
 */
public class UserHelper implements UserHelperInterface {

    Session session = null;
    Transaction tx = null;

    /**
     * This is the user command class Create HibernateUtil session to gain
     * access to database
     */
    public UserHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession(); // creating session to access the database
    }

    /**
     * User
     *
     * @param userName Username retrieved from user table in DB
     * @param userPassword User password retrieved table in db
     * @return
     * @throws java.security.NoSuchAlgorithmException
     * @throws java.security.spec.InvalidKeySpecException
     */
    @Override
    public boolean registerUser(String userName, String userPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {

        try {
            tx = session.beginTransaction();
            byte[] salt = generateSalt();
            Users user = new Users();
            user.setUserId(null);
            user.setUserName(userName);
            user.setUserPassword(byteArrayToHexString(getEncryptedPassword(userPassword, salt)));
            user.setPasswordSalt(byteArrayToHexString(salt));
            if (session != null) {
                session.save(user);
                tx.commit();
                return true;//
            }
            session.close();
        } catch (NoSuchAlgorithmException | InvalidKeySpecException | HibernateException e) {
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

    @Override
    public boolean loginUser(String username, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        System.out.println("In Login User");
        try {
            //session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            // here get object
            List<Users> list = session.createCriteria(Users.class).list();

            tx.commit();
            for (Iterator iterator
                    = list.iterator(); iterator.hasNext();) {
                Users user = (Users) iterator.next();
                System.out.print("First Name: " + user.getFirstName());
                System.out.print("  Last Name: " + user.getLastName());
                System.out.println("  UserName: " + user.getUserName());
            }

        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            Logger.getLogger("con").info("Exception: " + ex.getMessage());
            ex.printStackTrace(System.err);
        } finally {
            session.close();
        }
        /*String sql = "Select* from Users where UserName =? and UserPassword =?";
        SQLQuery q = session.createSQLQuery(sql);
        q.addEntity(Users.class);
        q.setString("UserName", username);
        q.setString("UserPassword", password);
        //q.setMaxResults(1);
        List<Users> result = (List<Users>) q.list();
        Users u = (Users) result;*/
        return true;
    }

    /**
     * Encrypt the clear-text password using the same salt that was used to
     * encrypt the original password
     *
     * @param attemptedPassword Password entered by user as login
     * @param encryptedPassword Password already hashed and saved in the
     * database
     * @param salt Password salt
     * @return
     * @throws java.security.NoSuchAlgorithmException
     * @throws java.security.spec.InvalidKeySpecException
     */
    public boolean authenticatePassword(String attemptedPassword, byte[] encryptedPassword, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException {

        byte[] encryptedAttemptedPassword = getEncryptedPassword(attemptedPassword, salt);

        return Arrays.equals(encryptedPassword, encryptedAttemptedPassword);
    }

    /**
     *
     * @param password
     * @param salt
     * @return
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeySpecException
     */
    public byte[] getEncryptedPassword(String password, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String algorithm = "PBKDF2WithHmacSHA512";
        // SHA-512 generates 256 bit hashes, so that's what makes sense here
        int derivedKeyLength = 256;
        // Pick an iteration. Usually iteration over 1000
        int iterations = 20000;

        KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, iterations, derivedKeyLength);

        SecretKeyFactory f = SecretKeyFactory.getInstance(algorithm);

        return f.generateSecret(spec).getEncoded();
    }

    /**
     *
     * @return @throws NoSuchAlgorithmException
     */
    public byte[] generateSalt() throws NoSuchAlgorithmException {

        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");

        // Generate a 16 byte (128 bit) salt
        byte[] salt = new byte[16];
        random.nextBytes(salt);

        return salt;

    }

    /**
     *
     * @param byteArray
     * @return
     */
    public String byteArrayToHexString(byte[] byteArray) {
        String returnString = "";
        for (int i = 0; i < byteArray.length; i++) {
            returnString += Integer.toHexString(byteArray[i]);
        }
        return returnString;
        //return new String(byteArray);
    }

    public byte[] hexStringToByteArray(String hexString) {
        return hexString.getBytes();
    }
}

//password reset
//registrator captcha
