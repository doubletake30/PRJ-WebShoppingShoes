<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tu Tu Store</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .fixed-size-img {
                width: 100%;
                height: 400px;
                object-fit: cover; /* Maintain aspect ratio while filling the container */
            }
        </style>
        <link href="css/shopping.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <h1 class="text-center">Tu Xin Chao Cac Ban</h1>
        <form action="MainController" method="POST" class="row" style="display:flex;justify-content: center">
            <button class="btn btn-primary" type="submit" name="action" value="View">View Cart</button>
        </form>
        <c:if test="${requestScope.LIST_PRODUCT !=null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <div class="container my-5">
                    <div class="row">
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="assets/shoes.jpg" class="card-img-top fixed-size-img" alt="${product.getName()}">
                                    <div class="card-body">
                                        <h5 class="card-title">${product.getName()}</h5>
                                        <p class="card-text">${product.getPrice()} $</p>
                                        <form action="AddController" method="POST" class="row">
                                            <input type="hidden" name="cmbShoes" id="cmbShoes-${product.getId()}" value="${product.getId()}-${product.getName()}-${product.getPrice()}">
                                            <div class="col-8">
                                                <div class="input-group mb-3">
                                                    <input type="number" class="form-control" name="quantity" id="quantity-${product.getId()}" value="1" min="1" max="${product.getQuantity()}" onchange="updateQuantity('${product.getId()}')">
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <button class="btn btn-primary" type="submit" name="action" value="Add">Add to Cart</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </c:if>

        ${requestScope.MESSAGE}
        ${requestScope.ERROR_MESSAGE}
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
            function updateQuantity(productId) {
                var quantity = document.getElementById('quantity-' + productId).value;
                var cmbShoes = document.getElementById('cmbShoes-' + productId);
                var values = cmbShoes.value.split('-');
                values[3] = quantity;
                cmbShoes.value = values.join('-');
            }
        </script>
    </body>
</html>
