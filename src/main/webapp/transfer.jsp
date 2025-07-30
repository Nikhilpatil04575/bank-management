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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transfer Money - MyBank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            font-family: Arial, sans-serif;
            padding-top: 50px;
        }
        .container {
            max-width: 500px;
        }
        .card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        h3 {
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <h3>Transfer Money</h3>

        <form action="transfer" method="post">
            <div class="mb-3">
                <label class="form-label">From Account</label>
                <input type="text" name="fromAccount" class="form-control" value="<%= user.getAccountNumber() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">To Account</label>
                <input type="text" name="toAccount" class="form-control" required placeholder="Enter receiver's account number">
            </div>

            <div class="mb-3">
                <label class="form-label">Amount (₹)</label>
                <input type="number" step="0.01" name="amount" class="form-control" required placeholder="Enter amount to transfer">
            </div>

            <button type="submit" class="btn btn-primary w-100">Transfer</button>
        </form>
    </div>
</div>

</body>
</html>
