package wjd_package;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class Login {
    public User user;
    public boolean ok;
    public static final String LOGIN="login";

    public Login() {
    }

    
    public Login(User user, boolean ok) {
        this.user = user;
        this.ok = ok;
    }
    
    public boolean isAdmin(){
        return user.role_id==1;
    }
    
    public boolean isOperator(){
        return user.role_id==2;
    }
    
    public boolean isCustomer(){
        return user.role_id==3;
    }
    
   
}
