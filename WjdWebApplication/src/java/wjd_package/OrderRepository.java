package wjd_package;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class OrderRepository {
    
    private static Statement db=DBConnection.getConnection();
    
    public static  void addOrder(Order order) throws SQLException{
        int month=order.order_date.getMonth();
        month++;
        int year=order.order_date.getYear();
        int day=order.order_date.getDate();
        
        String sql="insert into orders(order_date,dont_date,car_number,quantity,user_id,center_id,state_id) values('"+year+"-"+ month+"-"+day+"',"+order.done_date+","+order.car_number+","+order.quantity+","+order.user_id+","+order.center_id+","+order.state_id+")";
        
        db.execute(sql);
    }
    
    public  static void updateOrder(Order order) throws SQLException{
        
        int month=order.done_date.getMonth();
        int year=order.done_date.getYear();
        int day=order.done_date.getDate();
        month++;
        //'"+year+"-"+ month+"-"+day+"'
        String sql="update orders set dont_date='"+year+"-"+ month+"-"+day+"',car_number="+order.car_number+",state_id="+order.state_id+" where order_id="+order.order_id;
        //String sql="update orders set dont_date='2019-4-5' ,car_number=999,state_id="+2+" where order_id=1";
        db.execute(sql);
    }
    
     public  static void finishOrder(int order_id) throws SQLException{
        
        String sql="update orders set state_id=3 where order_id="+order_id;
        //String sql="update orders set dont_date='2019-4-5' ,car_number=999,state_id="+2+" where order_id=1";
        db.execute(sql);
    }
    
    /*
    for customer
    */
    public  static List<Order> getOrdersByCst(int user_id) throws SQLException{
        String sql="select * from orders inner join states on states.state_id=orders.state_id inner join centers on orders.center_id=centers.center_id inner join users on users.user_id=orders.user_id where orders.user_id="+user_id+" and orders.state_id<>3";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Order>orders=new ArrayList<>();
        
        while(res.next()){
            Order o=new Order(res.getInt("order_id"), res.getInt("quantity"), res.getInt("car_number"),
                    res.getDate("order_date"), res.getDate("dont_date"), res.getString("state_name"), res.getString("full_name"), res.getString("center_name"));
            
            orders.add(o);
        }
        
        return orders;
    }
    
    public static  List<Order>getOldOrdersByCst(int user_id) throws SQLException{
        String sql="select * from orders inner join states on states.state_id=orders.state_id inner join centers on orders.center_id=centers.center_id inner join users on users.user_id=orders.user_id where orders.user_id="+user_id+" and orders.state_id=3";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Order>orders=new ArrayList<>();
        
        while(res.next()){
            Order o=new Order(res.getInt("order_id"), res.getInt("quantity"), res.getInt("car_number"),
                    res.getDate("order_date"), res.getDate("dont_date"), res.getString("state_name"), res.getString("full_name"), res.getString("center_name"));
            
            orders.add(o);
        }
        
        return orders;
    }
    
    /*
    for operator
    */
    public  static List<Order>getNewOrdersByCenter(int center_id) throws SQLException{
        String sql="select * from orders inner join states on states.state_id=orders.state_id inner join centers on orders.center_id=centers.center_id inner join users on users.user_id=orders.user_id where orders.center_id="+center_id+" and orders.state_id=1";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Order>orders=new ArrayList<>();
        
        while(res.next()){
            Order o=new Order(res.getInt("order_id"), res.getInt("quantity"), res.getInt("car_number"),
                    res.getDate("order_date"), res.getDate("dont_date"), res.getString("state_name"), res.getString("full_name"), res.getString("center_name"));
            
            orders.add(o);
        }
        
        return orders;
    }
    
    public static  List<Order>getDoneOrdersByCenter(int center_id) throws SQLException{
        String sql="select * from orders inner join states on states.state_id=orders.state_id inner join centers on orders.center_id=centers.center_id inner join users on users.user_id=orders.user_id where orders.center_id="+center_id+" and orders.state_id=2";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Order>orders=new ArrayList<>();
        
        while(res.next()){
            Order o=new Order(res.getInt("order_id"), res.getInt("quantity"), res.getInt("car_number"),
                    res.getDate("order_date"), res.getDate("dont_date"), res.getString("state_name"), res.getString("full_name"), res.getString("center_name"));
            
            orders.add(o);
        }
        
        return orders;
    }
    
    public static  Order getOrder(int order_id) throws SQLException{
        String sql="select * from orders inner join states on states.state_id=orders.state_id inner join centers on orders.center_id=centers.center_id inner join users on users.user_id=orders.user_id where orders.order_id="+order_id;
        
        ResultSet res=db.executeQuery(sql);
        
        if(res.next()){
            Order o=new Order(res.getInt("order_id"), res.getInt("quantity"), res.getInt("car_number"),
                    res.getDate("order_date"), res.getDate("dont_date"), res.getString("state_name"), res.getString("full_name"), res.getString("center_name"));
            
            return o;
        }
        
        return null;
    }
}
