<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gracias</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Página de gracias</h1>
		</div>
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>
			<div class="mx-5 text-center">
				<h2 class="container">Gracias por registrarte ${nombre }</h2>
				<h3>Por favor, <a href="/index" class="btn btn-outline-primary me-3">iniciar sesión</a> en tu cuenta para continuar.</h3>
			</div>
		</main>
	
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	