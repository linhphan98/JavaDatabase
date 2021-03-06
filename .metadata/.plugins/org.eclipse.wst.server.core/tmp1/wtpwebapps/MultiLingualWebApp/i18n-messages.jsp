<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:set var="theLocale" 
value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
scope="session"
/>

<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="jsp.i18n.resources.mylabels"/>


<html>
	<body>
	
		<a href="i18n-messages.jsp?theLocale=en_US">English (US)</a>|
		<a href="i18n-messages.jsp?theLocale=es_ES">Spanish (ES)</a>|
		<a href="i18n-messages.jsp?theLocale=de_DE">German (DE)</a>
		
		<hr>
		
		<fmt:message key="label.greeting"/> <br/><br/>
		
		<fmt:message key="label.firstName"/> <i>John</i><br/><br/>
		
		<fmt:message key="label.lastName"/> <i>Doe</i> <br/><br/>
				
		<fmt:message key="label.welcome"/><br/>
		
		<hr>
		Selected Locale: ${theLocale}
	</body>
</html>