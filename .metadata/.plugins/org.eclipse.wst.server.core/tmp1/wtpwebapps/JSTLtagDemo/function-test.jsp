<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
	<body>
		<c:set var="data" value="luv2code"/>
		Length of the String <b>${data}</b>: ${fn:length(data)}
		<br/><br/>
		
		Uppercase version of the String <b>${data}</b>: ${fn:toUpperCase(data)}
		<br/><br/>
		
		Does the String <b>${data}</b> starts with <b>luv</b>? ${fn:startsWith(data,"luv")}
	
		<c:set var="cities" value="Singapore, Tokyo, Mumbai, London" />
		
		<h3>Split Demo</h3>
		
		<c:set var="citiesArray" value="${fn:split(cities,',')}"/>
		<c:forEach var="tempCity" items="${citiesArray}">
			${tempCity}<br/>
		</c:forEach>
		
		<h3>Join Demo</h3>
		
		<c:set var="fun" value="${fn:join(citiesArray,'*')}"/>
		Result of join ${fun}
	</body>
</html>