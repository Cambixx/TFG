<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página de error</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="error-container">
		<img src="/images/error1.png" alt="Imagen perros tristes">
        <h1>Oops, algo salió mal</h1>
        <p class="error-code">Error ${pageContext.errorData.statusCode}</p>
        <p class="error-message">${pageContext.errorData.throwable.message}</p>
        <p>Por favor, intenta nuevamente más tarde.</p>
        <a href="/" class="btn btn-outline-primary me-3">Volver a la página principal</a>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>