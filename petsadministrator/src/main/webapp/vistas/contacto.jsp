<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Contacto</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Contacta con nosotros</h1>
		</div>
		
		<!-- Wrapper container -->
		<div class="container py-4">
		
		  <!-- Bootstrap 5 starter form -->
		  <form id="contactForm">
		
		    <!-- Name input -->
		    <div class="mb-3">
		      <label class="form-label" for="name">Nombre</label>
		      <input class="form-control" id="name" type="text" placeholder="Nombre" />
		    </div>
		
		    <!-- Email address input -->
		    <div class="mb-3">
		      <label class="form-label" for="emailAddress">Email</label>
		      <input class="form-control" id="emailAddress" type="email" placeholder="Email" />
		    </div>
		
		    <!-- Message input -->
		    <div class="mb-3">
		      <label class="form-label" for="message">Mensaje</label>
		      <textarea class="form-control" id="message" type="text" placeholder="Mensaje" style="height: 10rem;"></textarea>
		    </div>
		
		    <!-- Form submit button -->
		    <div class="d-grid">
		      <button class="btn btn-primary btn-lg" type="submit">Enviar</button>
		    </div>
		
		  </form>
		
		</div>
	
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	