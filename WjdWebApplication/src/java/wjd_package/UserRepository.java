package wjd_package;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebFilter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class UserRepository {
    
    private static Statement db=DBConnection.getConnection();
    
    
    public static  void addUser(User user) throws SQLException{
        String s="insert into users"
                + "(full_name,role_id,address,phone,identity_number,nationality_number)"
                + "values('"+user.full_name+"',"+user.role_id+",'"+user.address+"',"+user.phone+","+user.identity_number+","+user.nationality_number+")";
        
        db.execute(s);
    }
    
    public static ExecuteMessage deleteUser(int user_id) throws SQLException{
        //check if user is an operator and linked to center
        if(CenterRepository.isLinkedToCenter(user_id)){
            return new ExecuteMessage(false, "هذا المشغل يدير أحد المراكز");
        }
        
        //check if user is a customer and has orders
        if(OrderRepository.getOldOrdersByCst(user_id).size()>0 || OrderRepository.getOrdersByCst(user_id).size()>1){
            return new ExecuteMessage(false, "هذا المستخدم لديه طلبات لا يمكن حذفه");
        }
        
        String sql="delete from users where user_id="+user_id;
        db.execute(sql);
        
        return new ExecuteMessage(true, "تم الحذف بنجاح");
    }
    public static  ExecuteMessage updateUser(User user) throws SQLException{
        //if user is an operator and linked to a center
        if(CenterRepository.isLinkedToCenter(user.user_id) && user.role_id!=2)
            return new ExecuteMessage(false,"this operator operates a center");
        
        //else update and return good message
        String sql="update users set "
                + "full_name='"+user.full_name
                + "',address='"+user.address
                + "',phone="+user.phone
                + ",role_id="+user.role_id
                + ",identity_number="+user.identity_number
                + ",nationality_number="+user.nationality_number
                + " where user_id="+user.user_id;
        
        db.execute(sql);
        
        return new ExecuteMessage(true, "updated successfully");
    }
    
    public static  List<User> getUsers() throws SQLException{
        String sql="select * from users inner join roles on users.role_id=roles.role_id";
        
        ResultSet res=db.executeQuery(sql);
        
        List<User>users=new ArrayList<User>();
        
        while(res.next()){
            User u=new User(res.getInt("user_id"), res.getString("full_name"),  res.getLong("identity_number"), res.getLong("nationality_number"), res.getString("address"),res.getLong("phone") ,res.getString("role_name"));
            users.add(u);      
        }
        return users;
    }
    
    public static User getUser(int user_id) throws SQLException{
        String sql="select * from users where user_id="+user_id;
        
        ResultSet res=db.executeQuery(sql);
        
        while(res.next()){
            User user=new User(res.getInt("role_id"), res.getInt("user_id"),  res.getLong("identity_number"), res.getLong("nationality_number"), res.getString("address"),res.getLong("phone"), res.getString("full_name"));
            return user;      
        }
        return null;
    }
    
    public static Login doLogin(long identity_number,long nationality_number) throws SQLException{
        String sql="select * from users where identity_number="+identity_number+"and nationality_number="+nationality_number;
        
        ResultSet res=db.executeQuery(sql);
        
        if(res.next()){
            User u=new User(res.getInt("user_id"), res.getInt("role_id"), res.getLong("identity_number"), res.getLong("nationality_number"), res.getString("address"),res.getLong("phone") , res.getString("full_name"));
            return new Login(u, true);
        }else{
            return new Login(null, false);
        }
    }
    
    public static List<User>getOperators() throws SQLException{
        String sql="select * from users where role_id=2";
        
        ResultSet res=db.executeQuery(sql);
        
        List<User>users=new ArrayList<User>();
        
        while(res.next()){
            User u=new User(res.getInt("user_id"), res.getString("full_name"),  res.getLong("identity_number"), res.getLong("nationality_number"), res.getString("address"),res.getLong("phone") ,null);
            users.add(u);      
        }
        return users;
    }
    
    
}
