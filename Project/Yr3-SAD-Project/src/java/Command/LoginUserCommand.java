/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abdul
 */
public class LoginUserCommand implements Command {

    @Override
    public int execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "login.html";

        //The user wants to log in...
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            try {
                //Use the UserAssist class to login...
                UserAssist userSt = new UserAssist();
                boolean userLoggingIn = userSt.login(username, password);
                
                if (userLoggingIn) {
                    //If login successful, store the session id for this client...
                    HttpSession session = request.getSession();
                    String clientSessionId = session.getId();
                    session.setAttribute("loggedSessionId", clientSessionId);
                    session.setAttribute("user", userLoggingIn);
                    
                    return 0;
                } else {
                    return 1;
                }
            } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(LoginUserCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            forwardToJsp = "login.html";
        }

       return -1;
    }
}
