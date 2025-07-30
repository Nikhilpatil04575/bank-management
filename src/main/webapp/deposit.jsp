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
    <title>Deposit Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f0f2f5, #d6e4f0);
            padding-top: 50px;
        }
        .card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <h3 class="text-center">Deposit Money</h3>
        <form action="deposit" method="post">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" class="form-control" name="account" value="<%= user.getAccountNumber() %>" readonly>
            </div>
            <div class="mb-3">
                <label class="form-label">Amount (₹)</label>
                <input type="number" step="0.01" class="form-control" name="amount" required placeholder="Enter amount to deposit">
            </div>
            <button type="submit" class="btn btn-success w-100">Deposit</button>
        </form>
    </div>
</div>

</body>
</html>
