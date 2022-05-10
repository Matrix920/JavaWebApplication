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
public class Role {
    public int role_id;
    public int role_name;
    
    public static final String ROLE_NAME="role_name";
    public static final String ROLE_ID="role_id";

    public Role(int role_id, int role_name) {
        this.role_id = role_id;
        this.role_name = role_name;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getRole_name() {
        return role_name;
    }

    public void setRole_name(int role_name) {
        this.role_name = role_name;
    }
    
    
}
