<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página de error</title>
</head>
<body>
	<div class="error-container">
        <h1>Oops, algo salió mal</h1>
        <p class="error-code">Error ${pageContext.errorData.statusCode}</p>
        <p class="error-message">${pageContext.errorData.throwable.message}</p>
        <p>Por favor, intenta nuevamente más tarde.</p>
        <a href="/" class="back-link">Volver a la página principal</a>
    </div>
</body>
</html>