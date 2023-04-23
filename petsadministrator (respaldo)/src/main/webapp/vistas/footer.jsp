<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Footer</title>
	</head>
	<body>
	<footer class="pt-5 px-3 bg-dark text-light">
	
		<div class="container">
	      <div class="row px-5">
	        <div class="col-md-5 mb-3">
	            <a class="navbar-brand" href="#"><img class="logo-img" src="/images/logo-game-store-white.png"></a>
	            <p class="mt-3">
	              Somos el Grupo 14 de la asignatura de Desarrollo Web en Entorno Servidor
	            </p>
	        </div>
	        <div class="col-6 col-md-2 mb-3">
	          <h6 class="text-uppercase fw-bold mb-4">Páginas</h6>
	          <ul class="nav flex-column">
	            <li class="nav-item mb-2"><a href="/sobre-nosotros" class="nav-link p-0 text-muted">Sobre Nosotros</a></li>
	            <li class="nav-item mb-2"><a href="/lista-productos" class="nav-link p-0 text-muted">Productos</a></li>
	            <li class="nav-item mb-2"><a href="/" class="nav-link p-0 text-muted">Contacto</a></li>
	            <li class="nav-item mb-2"><a href="/" class="nav-link p-0 text-muted"></a></li>
	            <li class="nav-item mb-2"><a href="/" class="nav-link p-0 text-muted"></a></li>
	          </ul>
	        </div>
	  
	        <div class="col-6 col-md-2 mb-3">
	          <h6 class="text-uppercase fw-bold mb-4">Catálogo</h6>
	          <ul class="nav flex-column">
	          	<c:forEach var="ele" items="${listaFamilias }" >
	          		<li class="nav-item mb-2"><a href="/lista-productos/${ele.nombre }" class="nav-link p-0 text-muted">${ele.nombre }</a></li>
				</c:forEach>
	          </ul>
	        </div>
	  
	        <div class="col-6 col-md-2 mb-3">
	        <sec:authorize access="isAuthenticated()">
	          <h6 class="text-uppercase fw-bold mb-4">Mi cuenta</h6>
	          <ul class="nav flex-column">
	            <li class="nav-item mb-2"><a href="/datos-personales/${usuario.idUsuario }" class="nav-link p-0 text-muted">Mi Perfil</a></li>
	            <li class="nav-item mb-2"><a href="/lista-direcciones/${usuario.idUsuario }" class="nav-link p-0 text-muted">Mis Direcciones</a></li>
	            <li class="nav-item mb-2"><a href="/lista-pedidos/${usuario.idUsuario }" class="nav-link p-0 text-muted">Mis Pedidos</a></li>
	            <li class="nav-item mb-2"><a href="/lista-tarjetas/${usuario.idUsuario }" class="nav-link p-0 text-muted">Mis Tarjetas</a></li>
	            <li class="nav-item mb-2"><a href="/" class="nav-link p-0 text-muted"></a></li>
	          </ul>
	        </sec:authorize>
	        </div>
	  
	      </div>
	  
	      <div class="d-flex flex-column flex-sm-row justify-content-between px-5 pt-4 mt-4 border-top">
	        <p>© 2023 GameStore, Inc. All rights reserved.</p>
	        <ul class="list-unstyled d-flex">
	          <li class="me-3"><a class="link-dark" href="#"><i class="bi bi-facebook"></i></a></li>
	          <li class="me-3"><a class="link-dark" href="#"><i class="bi bi-twitter"></i></a></li>
	          <li class="me-3"><a class="link-dark" href="#"><i class="bi bi-instagram"></i></a></li>
	          <li class="me-3"><a class="link-dark" href="#"><i class="bi bi-linkedin"></i></a></li>
	          <li class="me-3"><a class="link-dark" href="#"><i class="bi bi-github"></i></a></li>
	        </ul>
	      </div>
	    </div>
		
	</footer>
</body>
</html>