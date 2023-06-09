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
			
			<section class="container d-flex justify-content-center contenedor_nosotros">
					        
		        <article class="nosotros">
		        	<a href="https://carlos-rabago.netlify.app/" target="_blank" rel="noopener noreferrer">
			            <img src="/images/crabago.jpg" class="nosotros-img">
			            <h3 class="mt-5">Carlos Rábago</h3>
		            </a>
		        </article>
		        <article class="nosotros">
		        	<a href="https://www.linkedin.com/in/sergio-martinez-rivera/" target="_blank" rel="noopener noreferrer">
			            <img src="/images/smartinez.jpg" class="nosotros-img">
			            <h3 class="mt-5">Sergio Martínez</h3>
		            </a>
		        </article>
		        
		    </section>
	    </main>
	
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	