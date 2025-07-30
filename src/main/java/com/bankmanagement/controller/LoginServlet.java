package com.bankmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.bankmanagement.dao.UserDao;
import com.bankmanagement.model.User;

@WebServlet({ "/LoginServlet", "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		System.out.println(email + " " + password + " [from login servlet]");

		UserDao dao = new UserDao();
		User user = dao.checkUser(email, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println(user + " [Login successful]");

			// redirect to dashboard
			response.sendRedirect("dashboard.jsp");

		} else {
			System.out.println("❌ Login failed: Invalid credentials");

			response.getWriter().println("<h3 style='color:red; text-align:center;'>Invalid email or password</h3>");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
	}
}
