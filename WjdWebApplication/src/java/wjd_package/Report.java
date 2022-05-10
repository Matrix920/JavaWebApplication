/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wjd_package;

/**
 *
 * @author Hananao.Tech
 */
public class Report {
    public int month;
    public int year;
    public int quantity;
    public String center_name;

    public Report(int month, int quantity) {
        this.month = month;
        this.quantity = quantity;
    }

    public Report(int month, int year, int quantity, String center_name) {
        this.month = month;
        this.year = year;
        this.quantity = quantity;
        this.center_name = center_name;
    }
}
