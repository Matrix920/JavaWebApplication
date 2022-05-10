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
import java.sql.*;


public class DBConnection {
   
    private static Statement statement;
    
    public static Statement getConnection(){
        if(statement==null){
            try{
                Connection conn= DriverManager.getConnection(Config.db_host);
                
                statement=conn.createStatement();
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
        }
        
        return statement;
    }
    
}
