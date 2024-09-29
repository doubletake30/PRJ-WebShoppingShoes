<%@page import="sample.user.UserErrorDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 40px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .error-message {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Create New User</h2>
        <form action="MainController" method="POST">
            <div class="form-group">
                <label for="userID">User ID</label>
                <input type="text" class="form-control" id="userID" name="userID" required>
                <span class="error-message">${requestScope.REGISTER_ERROR.userIDError}</span>
            </div>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
                <span class="error-message">${requestScope.REGISTER_ERROR.fullNameError}</span>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="roleID">Role ID</label>
                <input type="text" class="form-control" id="roleID" name="roleID" value="US" readonly>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm">Confirm Password</label>
                <input type="password" class="form-control" id="confirm" name="confirm" required>
                <span class="error-message">${requestScope.REGISTER_ERROR.confirmError}</span>
            </div>
            <button type="submit" class="btn btn-primary" name="action" value="Create">Create</button>
            <button type="reset" class="btn btn-secondary ml-2">Reset</button>
            <div class="error-message">${requestScope.REGISTER_ERROR.error}</div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
