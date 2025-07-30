<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Bank Management System</title>

    <!-- ✅ Bootstrap 5.3 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    
    <!-- ✅ Optional: Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .card {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        .btn {
            width: 160px;
            font-weight: 600;
        }

        h1 {
            font-weight: 700;
            color: #343a40;
        }

        .lead {
            font-size: 1.1rem;
            color: #555;
        }

        .emoji {
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1 class="mb-3">Welcome to <span class="text-primary">MyBank</span></h1>
        <p class="lead mb-4">Your personal banking made <strong>simple</strong> and <strong>secure</strong>.</p>

        <div class="d-flex justify-content-center gap-3">
            <a href="login.jsp" class="btn btn-primary btn-lg">Login</a>
            <br>
            <a href="register.jsp" class="btn btn-success btn-lg">Register</a>
        </div>
    </div>

    <!-- ✅ Bootstrap Bundle JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>
