<%-- 
    Document   : user
    Created on : May 29, 2024, 4:52:05 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <style>
        body {
            padding-top: 20px;
        }
        .container {
            max-width: 600px;
        }
        .user-info {
            margin-bottom: 20px;
        }
        .action-btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
        <c:redirect url="login.html"></c:redirect>
    </c:if>
    
    <div class="user-info">
        <h2>User Details</h2>
        <ul class="list-group">
            <li class="list-group-item">UserID: ${sessionScope.LOGIN_USER.userID}</li>
            <li class="list-group-item">FullName: ${sessionScope.LOGIN_USER.fullName}</li>
            <li class="list-group-item">Email: ${sessionScope.LOGIN_USER.email}</li>
            <li class="list-group-item">RoleID: ${sessionScope.LOGIN_USER.roleID}</li>
            <li class="list-group-item">Password: ${sessionScope.LOGIN_USER.password}</li>
        </ul>
    </div>
    
    <form action="MainController" method="POST">
        <button type="submit" class="btn btn-primary action-btn" name="action" value="View">View</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

