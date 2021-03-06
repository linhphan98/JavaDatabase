package com.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServ
 */
@WebServlet("/StudentControllerServ")
public class StudentControllerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDBUtil studentDBUtil; 
	
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource; 
	
	// will be called by the TomCat server when it is first initialized
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util and pass in the connection pool/datasource
		try {
			studentDBUtil = new StudentDBUtil(dataSource); 
		}catch (Exception e) {
			throw new ServletException(e); 
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		try {
			// read the command parameter 
			String theCommand = request.getParameter("command");
			
			// if the command is missing, then default to listing students
			if(theCommand == null) {
				theCommand = "LIST"; 
			}
			
			// route to the appropriate method
			switch(theCommand) {
			
			case "LIST": 
				listStudents(request,response); 
				break; 
			case "ADD": 
				addStudents(request,response);
				break; 
			default: 
				listStudents(request,response);
			}
			
			// List the students in MVC fashion
			listStudents(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		} 
	}

	private void addStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// read student info from form data 
		String firstName = request.getParameter("firstname"); 
		String lastName = request.getParameter("lastname"); 
		String email = request.getParameter("Email"); 
		
		// create a new student object 
		Student theStudent = new Student(firstName, lastName, email); 
		
		// add the student to the database
		StudentDBUtil.addStudent(theStudent); 
		
		// send back to main page (the student list)
		listStudents(request, response); 
		
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) 
		throws Exception{
		
		// get students from db util 
		List<Student> students = studentDBUtil.getStudent(); 
		
		// add students to the request object 
		request.setAttribute("studentsList", students);
		
		// send to JSP page (view page)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-student-view.jsp"); 
		dispatcher.forward(request, response);
		
	}
}
