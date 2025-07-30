<%@ page import="com.bankmanagement.model.User"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Dashboard - MyBank</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #dee2e6, #f8f9fa);
	font-family: Arial, sans-serif;
}

.container {
	margin-top: 80px;
}

.card {
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

h2 {
	font-weight: bold;
	margin-bottom: 20px;
}

.info {
	font-size: 1.1rem;
	margin-bottom: 15px;
}

.logout-btn {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="container d-flex justify-content-center">
		<div class="card w-100" style="max-width: 500px;">
			<h2 class="text-center">
				Welcome,
				<%=user.getName()%>
			</h2>

			<div class="info">
				<strong>Account Number:</strong>
				<%=user.getAccountNumber()%></div>
			<div class="info">
				<strong>Current Balance:</strong> Rs<%=user.getBalance()%></div>

			<!-- Actions -->
			<div class="d-grid gap-2 mt-4">
				<a href="transfer.jsp" class="btn btn-success">Transfer Money</a> <a
					href="deposit.jsp" class="btn btn-info">Deposit</a> <a
					href="checkbalance.jsp" class="btn btn-info">Check Balance</a> <a
					href="logout" class="btn btn-danger logout-btn">Logout</a>
			</div>
		</div>
	</div>

</body>
</html>
