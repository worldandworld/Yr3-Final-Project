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
import java.util.List;
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
     * This is the user command class
     */
    public UserHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
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
    public boolean registerUser(String userName, String userPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {

        try {
            tx = session.beginTransaction();
            Query q = session.createSQLQuery("INSERT INTO `Users` (`UserId`, `UserName`, `UserPassword`,`passwordSalt`) VALUES (NULL,?,?,?)");
            byte[] salt = generateSalt();
            q.setParameter(0, userName);
            q.setParameter(1, byteArrayToHexString(getEncryptedPassword(userPassword, salt)));
            q.setParameter(2,byteArrayToHexString(salt));
            //System.out.println("hello" + byteArrayToHexString(generateSalt()));
            int i = q.executeUpdate();

            if (i > 0) {
                System.out.println("Insert sucessfull");
                tx.commit();
                return true;
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

    public boolean loginUser(String username, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        try {
            tx = session.beginTransaction();
            SQLQuery q = session.createSQLQuery("Select UserName, UserPassword from Users where UserName =? and UserPassword =?");
            q.addEntity(Users.class);
            q.setParameter(0, username);
            q.setParameter(1, password);
            List result = q.list();
            Users tmpuser=(Users)result.get(0);
            
            System.out.println("tmpuser" + tmpuser);
            
            
            //System.out.println(tmpuser.getFirstName());

            //System.out.println("yyyyyyyy " + result.get(0));

            //q.setParameter(1, byteArrayToHexString(getEncryptedPassword(password, salt)));
//            byte[] saltByte=hexStringtoByteArry();
//            Users user = (Users) q.
//            String pass = user.getUserPassword();
           // session.close();
        } catch (HibernateException e) {
            e.printStackTrace();
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
    public byte[] hexStringToByteArray(String hexString)
    {
        return hexString.getBytes();
    }
}

//password reset
//registrator captcha
