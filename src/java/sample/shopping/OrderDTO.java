/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {
    private String orderID;
    private String userID;
    private double total;
    private Date date;
    
    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, double total, Date date) {
        this.orderID = orderID;
        this.userID = userID;
        this.total = total;
        this.date = date;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderID=" + orderID + ", userID=" + userID + ", total=" + total + ", date=" + date + '}';
    }

}
