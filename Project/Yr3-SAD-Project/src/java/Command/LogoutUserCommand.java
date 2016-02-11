/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abdul
 */
public class LogoutUserCommand implements Command{
    
    @Override
    public int execute(HttpServletRequest request, HttpServletResponse response) 
    {
        // Get the session object and invalidate it - this removes all data stored up to now 
        // (resets it to blank)
        HttpSession session = request.getSession();
        session.invalidate();
        
        // Send the user back to the login page
        String forwardToJsp = "index.jsp";
        
        return 0;
    }
}
