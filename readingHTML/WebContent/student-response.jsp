<html>
	<head><title>Student Confirm Title</title></head>
	The Student is confirmed: ${param.firstName} ${param.lastName}
	<br></br>
	The Student is confirmed: <%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %>
	<br></br>
	The student's country: <%= request.getParameter("country") %>
	<br></br>
	The student's favorite programming language is: <%= request.getParameter("favoriteLanguage") %>
	
	<!-- Displaying the entire list of "favoriteLanguaages" -->
	<br></br>
	<ul>
		<%
			String[] langs = request.getParameterValues("favoriteLanguages");
			
			for(String lang : langs){
				out.println("<li>" + lang + "</li>");
			}
		%>
	</ul>
</html>