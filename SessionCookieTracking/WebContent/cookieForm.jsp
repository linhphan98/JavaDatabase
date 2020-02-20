<html>
	<head><title>Confirmation</title></head>
	
	<%
		// Read form data
		String favLang = request.getParameter("favoriteLanguage");
	
		// Create the cookie
		Cookie thecookie = new Cookie("anyName",favLang);
		
		// set the life span for the cookie in seconds
		thecookie.setMaxAge(60*60*24*365); 
				
		// send cookie to the browser
		response.addCookie(thecookie);
	%>
	<body>
		Thanks! We set your favorite language to: ${param.favoriteLanguage}<br/>
		
		<a href="cookieHomePage.jsp">Return to homepage.</a>
	</body>
</html>