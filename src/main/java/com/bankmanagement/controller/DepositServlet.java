package com.bankmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bankmanagement.db.DB;
import com.bankmanagement.model.User;

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accNo = user.getAccountNumber();
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Connection conn = DB.getDb().getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE users SET balance = balance + ? WHERE account_number = ?"
            );
            ps.setDouble(1, amount);
            ps.setString(2, accNo);
            int updated = ps.executeUpdate();

            if (updated > 0) {
                user.setBalance(user.getBalance() + amount);
                session.setAttribute("user", user);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("<h3 style='color:red;'>❌ Account not found.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>❌ Something went wrong during deposit.</h3>");
        }
    }
}
