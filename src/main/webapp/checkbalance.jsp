<%@ page import="com.bankmanagement.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Balance - MyBank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #d7e1ec, #f8f9fa);
            padding-top: 60px;
        }
        .card {
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card text-center">
        <h2>Account Balance</h2>
        <p><strong>Name:</strong> <%= user.getName() %></p>
        <p><strong>Account Number:</strong> <%= user.getAccountNumber() %></p>
        <p><strong>Available Balance:</strong> Rs  <%= user.getBalance() %></p>

        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
