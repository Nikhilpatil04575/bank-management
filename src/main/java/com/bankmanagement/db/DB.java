package com.bankmanagement.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {

	private Connection connection;
	private static DB db = new DB();

	private DB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Diver is loaded");
			String url = "jdbc:mysql://127.0.0.1:3306/bankdb";
			String user = "root";
			String password = "nikhil";
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Connection sucess");
		} catch (Exception e) {
			System.out.println("Connection failed");
			e.printStackTrace();
		}

	}

	public int executeUpdate(PreparedStatement statement) {
		int result = 0;

		try {
			result = statement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public ResultSet executeQuery(PreparedStatement statement) {
		ResultSet set = null;
		
		try {
	
			set = statement.executeQuery();
			System.out.println("[from DB] executeQuery invoked");
			System.out.println(set.getString("name"));

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return set;
	}

	public static DB getDb() {
		return db;
	}

	public Connection getConnection() {

		return connection;
	}
}
