/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBCommands;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

/**
 *
 * @author Abdul
 */
public interface UserHelperInterface {

    public boolean registerUser(String userName, String userPassword) throws NoSuchAlgorithmException, InvalidKeySpecException;

    public boolean loginUser(String username, String password) throws NoSuchAlgorithmException, InvalidKeySpecException;

}
