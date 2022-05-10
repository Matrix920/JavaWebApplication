/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wjd_package;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Hananao.Tech
 */
public class DateRepo {
    public static String date;
    
    public static String  getDate(int day,int month,int year){
        return year+"-"+month+"-"+day;
    }
    
    public static  String getDate(Date date){
        return date.getYear()+"-"+date.getMonth()+"-"+date.getDate();
    }
}
