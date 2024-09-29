/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {
    
    private static final String GET = "SELECT productID, name, price, quantity FROM products";
    private static final String GET_QUANTITY = "SELECT quantity FROM products WHERE productID = ?";
    private static final String UPDATE_QUANTITY = "UPDATE products SET quantity = ? WHERE productID = ?";

    public List<Product> getListProduct() throws SQLException, ClassNotFoundException, NamingException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    
                    list.add(new Product(productID, name, price, quantity));
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }

    public boolean checkQuantity(String id, int quantity) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int quantityFromDB = rs.getInt("quantity");
                    if (quantityFromDB >= quantity) {
                        check = true;
                    }
                }
            }   
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public boolean updateQuantity(String productID, int quantity) throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // Step 1: Get the current quantity from the database
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                int currentQuantity = 0;
                if (rs.next()) {
                    currentQuantity = rs.getInt("quantity");
                }

                // Step 2: Calculate the new quantity
                int newQuantity = currentQuantity - quantity;

                // Step 3: Update the quantity in the database
                ptm.close();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, productID);
                check = ptm.executeUpdate() > 0;
            }   
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    
}
