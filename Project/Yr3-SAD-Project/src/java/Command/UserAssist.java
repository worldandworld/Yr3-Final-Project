/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import DBCommands.UserHelper;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

/**
 *
 * @author Abdul
 */
public class UserAssist {
    
    
    
    public boolean login(String username, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{
        boolean u = false;
        try{
            UserHelper help = new UserHelper();
            u = help.loginUser(username, password);
            if(u){
                return true;
            }
        }catch(NoSuchAlgorithmException | InvalidKeySpecException e){
            System.out.println("Exception Occured in the UserAssist Class in login method");
        }
        return false;
    }
}
