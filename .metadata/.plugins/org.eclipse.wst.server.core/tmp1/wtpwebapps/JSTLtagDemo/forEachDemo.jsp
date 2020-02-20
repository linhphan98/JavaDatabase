<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
	// just some data ... normally provided by MVC
	String[] cities = {"Mumbai", "Singapore", "Indiana"}; 
	
	pageContext.setAttribute("myCities", cities); 
%>

<html>
	<body>
		<c:forEach var = "tempCity" items="${myCities}">  
			${tempCity} <br/>
		</c:forEach>
	</body>
</html>