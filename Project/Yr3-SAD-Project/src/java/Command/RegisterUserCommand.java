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
    public int execute(HttpServletRequest request, HttpServletResponse response) {
        String file = "/Index.jsp";

        String name = request.getParameter("userName");
        String password = request.getParameter("userPassword");

        if (name != null && !name.isEmpty() && password != null && !password.isEmpty()) {

            try {
                UserAssist userSt = new UserAssist();
                boolean userRegistered = userSt.register(name, password);
                HttpSession session = request.getSession(true);
                if (userRegistered) {

                    session.setAttribute("user", userRegistered);
                    return 0;

                } else {
                    session.setAttribute("user", userRegistered);
                    return 1;
                }
            } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(RegisterUserCommand.class.getName()).log(Level.SEVERE, null, ex);
                return -1;
            }

        }
        return -2;
    }
}
