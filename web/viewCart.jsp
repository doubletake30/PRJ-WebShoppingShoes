<%-- 
    Document   : viewCart
    Created on : Jun 15, 2024, 4:30:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/viewCart.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>Your selected product here !</h1>
        <c:if test="${sessionScope.CART != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Image</th>
                        <th>Remove</th>
                        <th>Edit</th>                   
                    </tr>
                </thead>
                <tbody>
                    <c:set var="total" value="0"/>
                    <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                        <c:set var="itemTotal" value="${product.getPrice() * product.getQuantity()}"/>
                        <c:set var="total" value="${total + itemTotal}"/>
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${product.getId()}</td>
                            <td>${product.getName()}</td>
                            <td>
                                <input type="number" name="quantity" value="${product.getQuantity()}" class="form-control" required="" min="1"/>
                            </td>
                            <td>${product.getPrice()}$</td>
                            <td>${product.getPrice() * product.getQuantity()}$</td>
                            <td><img src="assets/shoes.jpg" alt="Product Image" width="100" height="100"></td>
                            <td>
                                <a href="MainController?action=Remove&id=${product.getId()}">Remove</a>
                            </td>
                            <td>
                                <input type="hidden" name="id" value="${product.getId()}"/>
                                <button type="submit" name="action" value="Edit">
                                    Edit
                                </button>                        
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
        <h2> Total: ${total}$ </h2>
    </c:if>

    <a href="MainController?action=Shopping_Page" class="btn btn-success" >Add more</a>
    <a href="MainController?action=Checkout" class="btn btn-success" >Check out</a>

</body>
</html>
