<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html> 
	<body>
		<c:set var="stuff" value="<%= new java.util.Date() %>"/>
		
		Time on this server is ${stuff}
	</body>
</html>