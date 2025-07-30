package com.bankmanagement.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bankmanagement.db.DB;
import com.bankmanagement.model.User;

public class UserDao {
	DB db = DB.getDb();

	// Insert a new user and generate 10-digit account number
	public int insertUser(User user) {
		int result = 0;

		// Default starting balance
		double initialBalance = user.getBalance();

		String query = "INSERT INTO users (name, email, password, account_number, balance) VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement statement = db.getConnection().prepareStatement(query);
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getAccountNumber());
			statement.setDouble(5, user.getBalance());
			result = db.executeUpdate(statement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// Show all users from database
//	public ResultSet showUser() {
//		ResultSet set = null;
//		String query = "SELECT * FROM users";
//		set = db.executeQuery(query);
//		try {
//			while (set.next()) {
//				User user = new User();
//				user.setId(set.getInt("id"));
//				user.setName(set.getString("name"));
//				user.setEmail(set.getString("email"));
//				user.setPassword(set.getString("password"));
//				user.setAccountNumber(set.getString("account_number"));
//				user.setBalance(set.getDouble("balance"));
//
//				System.out.println(user);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return set;
//	}

	public User checkUser(String email, String password) {
	    User user = null;
	    String query = "SELECT * FROM users WHERE email = ? AND password = ?";

	    try {
	        PreparedStatement statement = db.getConnection().prepareStatement(query);
	        statement.setString(1, email);
	        statement.setString(2, password);
	        ResultSet rs = statement.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setAccountNumber(rs.getString("account_number"));
	            user.setBalance(rs.getDouble("balance"));

	            System.out.println("✅ Login Success: " + user);
	        } else {
	            System.out.println("❌ Login failed: Invalid credentials");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}

}
