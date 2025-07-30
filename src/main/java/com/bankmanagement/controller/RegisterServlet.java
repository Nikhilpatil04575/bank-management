package com.bankmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bankmanagement.dao.UserDao;
import com.bankmanagement.model.User;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	User user=new User();
	user.setName(request.getParameter("name"));
	user.setEmail(request.getParameter("email"));
	user.setPassword(request.getParameter("password"));
	
	UserDao dao=new UserDao();
	int result = dao.insertUser(user);

    
    if (result > 0) {
        
        response.sendRedirect("login.jsp");
    } else {
        
        response.getWriter().println("Registration failed. Try again.");
    }
	}

}
