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
public class Center {
    public int center_id;
    public int user_id;
    public String center_name;
    public String center_address;
    public int phone1;
    public int phone2;

    public Center() {
    }
    
    
    
    public static final String CENTER_ID="center_id";
    public static final String CENTER_NAME="center_name";
    public static final String CENTER_ADDRESS="center_address";
    public static final String PHONE1="phone1";
    public static final String PHONE2="phone2";
    
    public String full_name;

    public Center(int center_id, String center_name, String center_address, int phone1, int phone2, String full_name) {
        this.center_id = center_id;
        this.center_name = center_name;
        this.center_address = center_address;
        this.phone1 = phone1;
        this.phone2 = phone2;
        this.full_name = full_name;
    }

    public Center(int center_id, int user_id, String center_name, String center_address, int phone1, int phone2) {
        this.center_id = center_id;
        this.user_id = user_id;
        this.center_name = center_name;
        this.center_address = center_address;
        this.phone1 = phone1;
        this.phone2 = phone2;
    }
    
     public Center(int user_id, String center_name, String center_address, int phone1, int phone2) {
        this.user_id = user_id;
        this.center_name = center_name;
        this.center_address = center_address;
        this.phone1 = phone1;
        this.phone2 = phone2;
    }


    
    
}
