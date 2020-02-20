<html>
	<body>
		<h3>Training Portal</h3>
		
		<!-- Read the favorite programming language cookie -->
		<%
			// The default if there is no cookie is Java
			String favLanguage = "Java"; 
			
			// Get the cookies from the browser request
			Cookie[] cookies = request.getCookies(); 
			
			// Loop through and find fav lang cookie
			if(cookies != null){
				for(Cookie temp : cookies){
					if("anyName".equals(temp.getName())){
						favLanguage = temp.getValue();
						break;
					}
				}
			}
		%>
		
		<!-- now show a personalized page using the favLanguage variable -->
		<h4>New Books for <%= favLanguage %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		
		<h4>Latest News Report for <%= favLanguage %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		
		<h4>Hot Jobs for <%= favLanguage %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		<a href="cookieForm.html">Personalize this page</a>
	</body>
</html>