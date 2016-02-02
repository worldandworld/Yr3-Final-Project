/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Accounting;

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
    
    public void getUserLogin(){
        
    }
}
