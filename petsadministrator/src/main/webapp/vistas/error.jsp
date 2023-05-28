<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>P�gina de error</title>
</head>
<body>
	<div class="error-container">
        <h1>Oops, algo sali� mal</h1>
        <p class="error-code">Error ${pageContext.errorData.statusCode}</p>
        <p class="error-message">${pageContext.errorData.throwable.message}</p>
        <p>Por favor, intenta nuevamente m�s tarde.</p>
        <a href="/" class="back-link">Volver a la p�gina principal</a>
    </div>
</body>
</html>