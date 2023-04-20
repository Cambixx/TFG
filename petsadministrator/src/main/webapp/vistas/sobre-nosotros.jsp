<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sobre nosotros</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Sobre nosotros</h1>
		</div>
		
		<main>
			
			<section class="container">
			<p class="my-3">Somos el Grupo 14 de la asignatura de Desarrollo de Aplicaciones Web en Entorno Servidor</p>
		        <article class="nosotros">
		            <img src="/images/ldiaz.png" class="nosotros-img">
		            <h3 class="mt-5">Lidia Díaz</h3>
		        </article>
		        <article class="nosotros">
		            <img src="/images/crabago.jpg" class="nosotros-img">
		            <h3 class="mt-5">Carlos Rábago</h3>
		        </article>
		        <article class="nosotros">
		            <img src="/images/smartinez.jpg" class="nosotros-img">
		            <h3 class="mt-5">Sergio Martínez</h3>
		        </article>
		        <article class="nosotros">
		            <img src="/images/lperez.jpg" class="nosotros-img">
		            <h3 class="mt-5">Lucía Pérez</h3>
		        </article>
		    </section>
	    </main>
	
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	