/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import DBCommands.UserHelper;
import java.io.IOException;
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
public class RegisterUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String file = "/Index.jsp";
        
        String name = request.getParameter("userName");
        String password = request.getParameter("userPassword");

        if (name != null && !name.isEmpty() && password != null && !password.isEmpty()) {

            try {
                UserAssist userSt = new UserAssist();
                boolean userRegistered = userSt.register(name, password);
                if (userRegistered) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", userRegistered);
                    
                    response.sendRedirect("login.html");
                    
                } else {
                    response.sendRedirect("index.jsp");
                }
            } catch (NoSuchAlgorithmException | InvalidKeySpecException | IOException ex) {
                Logger.getLogger(RegisterUserCommand.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return file;
    }
}
