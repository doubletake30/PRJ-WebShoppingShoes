<%-- 
    Document   : admin
    Created on : May 29, 2024, 4:52:09 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <h1 class="text-center">Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
        <div class="text-right">
            <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
            <a href="${logoutLink}" class="btn btn-danger">Logout</a>
        </div>

        <form action="MainController" method="POST" class="form-inline">
            <div class="form-group">
                <label for="search">Search:</label>
                <input type="text" id="search" name="search" class="form-control" value="${param.search}">
            </div>
            <button type="submit" name="action" value="Search" class="btn btn-primary">Search</button>
        </form>

        <c:if test="${requestScope.LIST_USER != null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <input type="text" name="userID" class="form-control" value="${user.userID}" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="fullName" class="form-control" value="${user.fullName}" required>
                                    </td>
                                     <td>
                                        <input type="text" name="email" class="form-control" value="${user.email}" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="roleID" class="form-control" value="${user.roleID}" required>
                                    </td>
                                    <td>${user.password}</td>
                                    <td>
                                        <button type="submit" name="action" value="Update" class="btn btn-warning">Update</button>
                                        <input type="hidden" name="search" value="${param.search}">
                                    </td>
                                    <td>
                                        <c:url var="deleteLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <a href="${deleteLink}" class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>
                </table>
                <span class="error-message">${requestScope.DELETE_ERROR}</span>
            </c:if>
        </c:if>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>

