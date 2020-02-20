<html>
	<body>
		<%! 
		String makeItLower(String data){
			return data.toLowerCase(); 
		}
		%>
		
		Lower case "Hello World" : <%= makeItLower("HELLO WORLD") %>
	</body>
</html>