<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - MyBank</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #cfd9df, #e2ebf0);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            background-color: white;
        }

        h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 25px;
        }

        .form-control {
            height: 48px;
            font-size: 1rem;
        }

        .btn {
            font-size: 1.1rem;
            font-weight: 600;
            padding: 12px;
        }

        .link {
            font-size: 0.9rem;
            text-align: center;
            margin-top: 10px;
        }

        .link a {
            text-decoration: none;
            color: #0d6efd;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="card">
    <h2 class="text-center">Login to MyBank</h2>

    <form action="login" method="post">
        <div class="mb-3">
            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
        </div>
        <div class="mb-4">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <div class="link">
        Don't have an account? <a href="register.jsp">Register here</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
