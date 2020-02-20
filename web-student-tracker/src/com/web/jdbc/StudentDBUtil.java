package com.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDBUtil {
	
	private static DataSource dataSource; 
	
	public StudentDBUtil(DataSource theDataSource) {
		dataSource = theDataSource; 
	}
	
	public List<Student> getStudent() throws Exception{
		List<Student> students = new ArrayList<>(); 
		
		Connection myConn = null; 
		Statement myState = null; 
		ResultSet myResult = null; 
		
		try {
		// Get a connection 
			myConn = dataSource.getConnection(); 
			
		// Create SQL statement 
			String sql = "select * from student order by last_name"; 
			
		// Execute query 
			myState = myConn.createStatement(); 
			
		// Process result set 
			myResult = myState.executeQuery(sql); 
			
			while(myResult.next()) {
				
				// Retrieve data from result set row 
				int id = myResult.getInt("id"); 
				String firstName = myResult.getString("first_name"); 
				String lastName = myResult.getString("last_name");
				String email = myResult.getString("email"); 
				
				// Create new student object for every time it loops through 
				Student temp = new Student(id, firstName, lastName, email);
				
				// add it to the list of students 
				students.add(temp);
				
			}
			
			return students; 		
		}
		finally{
			// close JDBC objects
			close(myConn, myState, myResult); 
		}
		
	}

	private static void close(Connection myConn, Statement myState, ResultSet myResult) {
		try {
			if(myResult != null) {
				myResult.close();
			}
			if(myState != null) {
				myState.close();
			}
			if(myConn != null) {
				myConn.close();
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public static void addStudent(Student theStudent) throws SQLException {
		
		Connection myConnection = null; 
		PreparedStatement myStatement = null; 
		
		try {
			myConnection = dataSource.getConnection(); 
			
			// create sql for insert
			String sql = "insert into student " 
						+ "(first_name, last_name, email) "
						+ "values (?, ?, ?)"; 
			
			myStatement = myConnection.prepareStatement(sql);
			
			// set the param values for the student
			myStatement.setString(1, theStudent.getFirstName());
			myStatement.setString(2, theStudent.getLastName());
			myStatement.setString(3, theStudent.getEmail());
			
			// execute sql insert
			myStatement.execute();		
		}
		finally {
			// clean up JDBC object
			close(myConnection, myStatement, null);
		}
	}
}
