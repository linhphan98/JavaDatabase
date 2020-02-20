<html>
	<body>
		<h3>JSP Built-In Object</h3>
		
		Request user agent (browser, OS user running on): <%= request.getHeader("User-Agent") %>
		<br></br>
		
		Request Language: <%= request.getLocale() %>
		<br></br>
	</body>
</html>