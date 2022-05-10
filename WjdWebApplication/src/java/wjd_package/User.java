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
public class User {
    public int user_id;
    public int role_id;
    public String full_name;
    public long identity_number;
    public long nationality_number;
    public String address;
    public long phone;
    
    public static final String ROLE_ID="role_id";
    public static final String USER_ID="user_id";
    public static final String FULL_NAME="full_name";
    public static final String IDENTITY_NUMBER="identity_number";
    public static final String NAITONALITY_NUMBER="nationality_number";
    public static final String ADDRESS="address";
    public static final String PHONE="phone";
    
    
    public String role_name;

    public User(int user_id, String full_name, long identity_number, long nationality_number, String address, long phone, String role_name) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.identity_number = identity_number;
        this.nationality_number = nationality_number;
        this.address = address;
        this.phone = phone;
        this.role_name = role_name;
    }

    public User(int user_id, int role_id, long identity_number, long nationality_number, String address, long phone,String full_name) {
        this.user_id = user_id;
        this.role_id = role_id;
        this.identity_number = identity_number;
        this.nationality_number = nationality_number;
        this.address = address;
        this.phone = phone;
        this.full_name=full_name;
    }
    
    public User(int role_id, long identity_number, long nationality_number, String address, long phone,String full_name) {
        this.role_id = role_id;
        this.identity_number = identity_number;
        this.nationality_number = nationality_number;
        this.address = address;
        this.phone = phone;
        this.full_name=full_name;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public long getIdentity_number() {
        return identity_number;
    }

    public void setIdentity_number(long identity_number) {
        this.identity_number = identity_number;
    }

    public long getNationality_number() {
        return nationality_number;
    }

    public void setNationality_number(long nationality_number) {
        this.nationality_number = nationality_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }
    
    
}
