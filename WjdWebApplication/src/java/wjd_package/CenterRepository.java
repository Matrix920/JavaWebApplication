package wjd_package;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class CenterRepository {
    private static Statement db=DBConnection.getConnection();
    
    public static void addCenter(Center center) throws SQLException{
      
        String sql="insert into centers("
                + "center_name,"
                + "center_address,"
                + "phone1,"
                + "phone2,"
                + "user_id)values("
                + "'"+center.center_name+"'," +
                "'"+ center.center_address+"',"+
                center.phone1+"," +
                center.phone2+"," +
                +center.user_id+")";
        
        db.execute(sql);
    }
    
    public  static ExecuteMessage deleteCenter(int centerID) throws SQLException{
        //check if this center has orders
        if(hasOrders(centerID))
            return new ExecuteMessage(false, "يملك هذا المركز طلبات متعلقة به");
        
        String sql="delete from centers where center_id="+centerID;
        db.execute(sql);
        
        return new ExecuteMessage(true, "تم الحذف بنجاح");
    }
    
    public static boolean hasOrders(int center_id) throws SQLException{
        String sql="select * from orders where center_id="+center_id;
        
        ResultSet res=db.executeQuery(sql);
        if(res.next())
            return true;
        return false;
    }
    public  static void updateCenter(Center center) throws SQLException{
        String sql="update centers set "
                + "center_name='"+center.center_name+"',"
                + "center_address='"+center.center_address+"',"
                + "phone1="+center.phone1+","
                + "phone2="+center.phone2+","
                + "user_id="+center.user_id+""
                + "where center_id="+center.center_id;
        
        db.execute(sql);
    }
    
    public  static Center getCenterByOperator(int user_id) throws SQLException{
        String sql=String.format("select * from centers where user_id=%d", user_id);
        
        ResultSet res=db.executeQuery(sql);
        
        if(res.next()){
            Center c=new Center(res.getInt(1), res.getInt(6), res.getString(2), res.getString(3),  res.getInt(4),  res.getInt(5));
            return c;
        }
        return null;
    }
    
    public  static List<Center>getCenters() throws SQLException{
        String sql="select * from centers";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Center>centers=new ArrayList<Center>();
        
        while(res.next()){
            Center c=new Center(res.getInt(1), res.getInt(6), res.getString(2), res.getString(3),  res.getInt(4),  res.getInt(5));
            centers.add(c);
            
        }
        return centers;
    }
    
    //admin
    public static boolean isLinkedToCenter(int user_id) throws SQLException{
        return getCenterByOperator(user_id)!=null; 
    }
    
    public static Center getCenter(int center_id) throws SQLException{
        String sql="select * from centers where center_id="+center_id;
        
        ResultSet res=db.executeQuery(sql);
        
        if(res.next()){
            Center c=new Center(res.getInt(1), res.getInt(6), res.getString(2), res.getString(3),  res.getInt(4),  res.getInt(5));
            return c;
        }
        return null;
    }
    
    public static List<Report> getReport(int center_id,int year) throws SQLException{
        String sql="select sum(o.quantity) as q,month(o.order_date) as m  from centers as c inner join orders as o on o.center_id=c.center_id where o.center_id="+center_id+" and year(o.order_date)="+year+" and  o.dont_date is not null group by month(o.order_date)";
        
        
        ResultSet res=db.executeQuery(sql);
        
        List<Report>report=new ArrayList<>();
        while(res.next()){
            Report r=new Report(res.getInt("m"),res.getInt("q"));
            report.add(r); 
        }
        
        return report;
    }
}
