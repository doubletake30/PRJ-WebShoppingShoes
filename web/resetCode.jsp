<%-- 
    Document   : resetCode
    Created on : Jul 9, 2024, 11:36:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Code</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/forgotPassword.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 form">
                    <form action="MainController" method="POST">
                        <h2 class="text-center">Code Verification</h2>
                        <div class="alert alert-success text-center" style="padding: 0.4rem 0.4rem">
                            We've sent a password reset otp to your email - ${sessionScope.MAIL_CODE}
                        </div>
                        <div class="text-danger text-center">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" name="code" placeholder="Enter code" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary w-100 fs-6" name="action" value="ResetCode">Continute</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
