<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<html>

	<head>
		<title>Student Tracker App</title>
		
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>My University</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
			
				<!-- put a new button: Add Student -->
				<input type="button" value="Add Student"
					onclick="window.location.href='add-student-form.jsp'; return false;"
					class="add-student-button"
				/>
				
				<table>
					
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					
					<c:forEach var="temp" items="${studentsList}">
						
						<!-- Set up a link for each student -->
						<c:url var="tempLink" value="StudentControllerServ">
							<c:param name="command" value="LOAD"/>
							<c:param name="studentID" value="${temp.id}"/>
						</c:url>
						
						<tr>
							<td> ${temp.firstName}  </td>
							<td> ${temp.lastName} 	</td>
							<td> ${temp.email}  </td>
							<td><a href="${tempLink}">Update</a></td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
	</body>
</html>