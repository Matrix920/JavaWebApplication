package wjd_package;


import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class Order {
    public int order_id;
    public int user_id;
    public String sOrder_Date;
    public String sDone_date;

    public Order() {
    }

    public Order(int order_id, int quantity, int car_number, Date order_date, Date done_date, int state_id,int user_id) {
        this.order_id = order_id;
        this.quantity = quantity;
        this.car_number = car_number;
        this.order_date = order_date;
        this.done_date = done_date;
        this.state_id = state_id;
        this.user_id=user_id;
    }
    
    public Order(int quantity, int car_number, Date order_date, Date done_date, int state_id,int user_id,int center_id) {
        this.quantity = quantity;
        this.car_number = car_number;
        this.order_date = order_date;
        this.done_date = done_date;
        this.state_id = state_id;
        this.user_id=user_id;
        this.center_id=center_id;
    }

    public Order(int order_id, int quantity, int car_number, Date order_date, Date done_date, String sState, String full_name, String center_name) {
        this.order_id = order_id;
        this.quantity = quantity;
        this.car_number = car_number;
        this.order_date = order_date;
        this.done_date = done_date;
        this.sState = sState;
        this.full_name = full_name;
        this.center_name = center_name;
    }
    
    
    public int center_id;
    public int quantity;
    public int car_number;
    public Date order_date;
    public Date done_date;
    public int state_id;
    
    public String sState;
    public String full_name;
    public String center_name;
    
    public static final String ORDER_ID="order_id";
    public static final String QUANTITY="quantity";
    public static final String CAR_NUMBER="car_number";
    public static final String ORDER_DATE="order_date";
    public static final String DONE_DATE="done_date";
    public static final String STATE_ID="state_id";
    
    
    
}
