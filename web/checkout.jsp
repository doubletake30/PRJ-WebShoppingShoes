<%-- 
    Document   : checkout
    Created on : Jun 22, 2024, 8:43:51 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.OrderDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <div class="content-wrapper">
            <div class="row">
                <c:if test="${requestScope.ORDER != null}">
                    <h3>Buyer: ${requestScope.ORDER.getUserID()}</h3>

                    <div class="col-md-12">
                        <table border="1" class="table table-hover table-bordered checkout-content">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderDetail" varStatus="counter" items="${requestScope.LIST_ORDER_DETAIL}">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${orderDetail.getOrderID()}</td>
                                        <td>${orderDetail.getProductID()}</td>
                                        <td>${orderDetail.getPrice()}$</td>
                                        <td>${orderDetail.getQuantity()}</td>
                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-md-6 content-footer">
                        <h3>Checkout date: ${requestScope.ORDER.getDate()}</h3>
                    </div>

                    <div class="col-md-6 content-footer">
                        <h3>Total: ${requestScope.ORDER.getTotal()}$</h3>
                    </div>

                    <div class="row">
                        <form action="MainController" method="POST">
                            <div class="col-md-3">
                                <input class="form-control" type="email" name="emailToSent" placeholder="Email"/>

                            </div>                            

                            <div class="col-md-3 send-mail-btn">
                                <input type="hidden" name="orderToSent" value="Ma dat hang: ${requestScope.ORDER.getOrderID()}, Nguoi mua: ${requestScope.ORDER.getUserID()}, Tong tien: ${requestScope.ORDER.getTotal()}$, Ngay checkout: ${requestScope.ORDER.getDate()}"/>
                            </div>                                
                        </form>                                                                      
                    </div>

                </c:if>   

                <c:if test="${requestScope.SEND_MAIL_SUCCESS == null && requestScope.SEND_MAIL_ERROR == null}">
                    <h1 style="color: red">${requestScope.ERROR_MESSAGE}</h1>
                    <h1 style="color: red">${requestScope.ERROR_CART_MESSAGE}</h1>
                </c:if>
                <h1 style="color: red">${requestScope.SEND_MAIL_SUCCESS}</h1>
                <h1 style="color: red">${requestScope.SEND_MAIL_ERROR}</h1>            

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
