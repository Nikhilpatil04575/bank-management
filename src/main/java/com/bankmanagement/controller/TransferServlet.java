package com.bankmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bankmanagement.db.DB;
import com.bankmanagement.model.User;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User sender = (User) session.getAttribute("user");

        String fromAcc = sender.getAccountNumber();
        String toAcc = request.getParameter("toAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Connection conn = DB.getDb().getConnection();

            // 1. Check receiver exists
            PreparedStatement checkReceiver = conn.prepareStatement("SELECT * FROM users WHERE account_number = ?");
            checkReceiver.setString(1, toAcc);
            ResultSet rsReceiver = checkReceiver.executeQuery();

            if (!rsReceiver.next()) {
                response.getWriter().println("<h3 style='color:red;'>❌ Receiver account not found</h3>");
                return;
            }

            // 2. Check sender balance
            if (sender.getBalance() < amount) {
                response.getWriter().println("<h3 style='color:red;'>❌ Insufficient balance</h3>");
                return;
            }

            conn.setAutoCommit(false); // Start transaction

            // 3. Deduct from sender
            PreparedStatement deduct = conn.prepareStatement(
                "UPDATE users SET balance = balance - ? WHERE account_number = ?");
            deduct.setDouble(1, amount);
            deduct.setString(2, fromAcc);
            deduct.executeUpdate();

            // 4. Add to receiver
            PreparedStatement credit = conn.prepareStatement(
                "UPDATE users SET balance = balance + ? WHERE account_number = ?");
            credit.setDouble(1, amount);
            credit.setString(2, toAcc);
            credit.executeUpdate();

            conn.commit();

            // 5. Update sender session balance
            sender.setBalance(sender.getBalance() - amount);
            session.setAttribute("user", sender);

            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>❌ Something went wrong during transfer</h3>");
        }
    }
}
