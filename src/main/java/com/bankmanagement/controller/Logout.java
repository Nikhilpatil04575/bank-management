package com.bankmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Destroy session
        HttpSession session = request.getSession(false); // false: don't create new session
        if (session != null) {
            session.invalidate(); // logout
        }

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
