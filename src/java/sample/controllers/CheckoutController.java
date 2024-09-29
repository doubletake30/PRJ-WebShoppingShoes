/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.OrderDAO;
import sample.shopping.OrderDTO;
import sample.shopping.OrderDetailDAO;
import sample.shopping.OrderDetailDTO;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            // Check session
            Cart cart = (Cart) session.getAttribute("CART");
            OrderDAO orderDao = new OrderDAO();
            // Check cart
            if (cart != null) {
                ProductDAO dao = new ProductDAO();
                double total = 0;
                String orderID = UUID.randomUUID().toString();
                List<OrderDetailDTO> listOrderDetail = new ArrayList<>();
                for (Product product : cart.getCart().values()) {
                    // Check quantity of each product in cart
                    boolean checkQuantity = dao.checkQuantity(product.getId(), product.getQuantity());
                    if (checkQuantity) {
                        listOrderDetail.add(new OrderDetailDTO(orderID, product.getId(), product.getPrice() * product.getQuantity(), product.getQuantity()));
                        total += (product.getQuantity() * product.getPrice());
                    } else {
                        request.setAttribute("ERROR_MESSAGE", "San pham " + product.getName() + " khong du");
                    }
                }
                // Checkout start here
                LocalDate localDate = LocalDate.now();
                Date currentDate = Date.valueOf(localDate);
                OrderDTO order = null;
                if (total > 0) {
                    order = new OrderDTO(orderID, loginUser.getUserID(), total, currentDate);
                }
                boolean checkAddOrder = orderDao.insert(order);
                if (checkAddOrder) {
                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                    for (OrderDetailDTO orderDetail : listOrderDetail) {
                        // Save orderDetail into database
                        boolean checkAddOrderDetail = orderDetailDao.insert(orderDetail);
                        if (checkAddOrderDetail) {
                            // Update quantity of each product in database
                            dao.updateQuantity(orderDetail.getProductID(), orderDetail.getQuantity());
                        }
                    }
                    //  Delete cart
                    session.setAttribute("CART", null);
                    request.setAttribute("ORDER", order);
                    request.setAttribute("LIST_ORDER_DETAIL", listOrderDetail);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_CART_MESSAGE", "Cart may co gi dau");
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            log("Error at CheckOutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}