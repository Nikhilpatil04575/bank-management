<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - MyBank</title>

    <!-- ✅ Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >

    <!-- ✅ Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #d7e1ec, #f8f9fa);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 450px;
            background-color: white;
        }

        h2 {
            font-weight: bold;
            margin-bottom: 25px;
            color: #343a40;
        }

        .form-control {
            height: 50px;
            font-size: 1rem;
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            font-weight: 600;
        }

        .note {
            font-size: 0.9rem;
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="card">
    <h2 class="text-center">Create Account</h2>
    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <input type="text" name="name" placeholder="Full Name" required class="form-control">
        </div>
        <div class="mb-3">
            <input type="email" name="email" placeholder="Email Address" required class="form-control">
        </div>
        <div class="mb-3">
            <input type="password" name="password" placeholder="Password" required class="form-control">
        </div>
        <div class="mb-3">
            
            <small class="note">Account Number will be auto-generated</small>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
