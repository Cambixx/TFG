<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Header</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">	
  		<link rel="stylesheet" type="text/css" href="/css/styles.css" media="screen"/>
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  		
	</head>
	<body>
		<header class="border-bottom">
			<sec:authorize access="isAuthenticated()">
				<div id="topBar" class="py-1 top-bar bg-dark">
					<span>Bienvenid@: <sec:authentication property="name"/> | Rol: 
					<sec:authorize access="hasAuthority('Cliente')">Cliente</sec:authorize>
					<sec:authorize access="hasAuthority('Admin')">Admin</sec:authorize>
					<sec:authorize access="hasAuthority('Invitado')">Invitado</sec:authorize></span>
				</div>
			</sec:authorize>
			<div class="py-3 container-fluid">
		    	<div class="d-flex flex-wrap align-items-center justify-content-around">
			        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
			            <img class="logo-img" src="/images/logo-game-store.png">
			        </a>
			
			        <form class="col-lg-4 col-12 col-md-auto mb-3 mb-lg-0 me-lg-3" action="/buscador" method="get" >
			          <input type="text" class="form-control form-control-light text-bg-light" name="nombre" placeholder="Buscar..." aria-label="Search" onkeypress="handleKeyPress(event)">
			          <button type="submit" id="submitButton" class="d-none"></button>
			        </form>
			
			        <div class="text-end">
			        	<sec:authorize access="!isAuthenticated()">
			          		<a href="/index" class="btn btn-outline-primary me-3">Iniciar sesión</a>
			          		<a href="/registro" class="btn btn-primary me-3">Registrarse</a>
			         	</sec:authorize>
			          	<sec:authorize access="isAuthenticated()">
			          		<a href="/logout" class="btn btn-outline-primary me-3">Cerrar sesión</a>
			          		<a href="/cesta/comprar/${usuario.idUsuario }" class="btn btn-primary me-3"><i class="bi bi-cart2 me-2"></i> Carrito</a>
			          	</sec:authorize>
			          	<sec:authorize access="!isAuthenticated()">
			          		<a href="/cesta/ver" class="btn btn-primary me-3"><i class="bi bi-cart2 me-2"></i> Carrito</a>
			         	</sec:authorize>
			        </div>
		    	</div>
		    </div>
	    </header>
	    <nav class="border-bottom">
	    	<ul class="nav col-12 col-lg-auto mx-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="/sobre-nosotros" class="nav-link px-2 text-black">Sobre nosotros</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Catálogo</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/lista-productos">Todos</a></li>
						<c:forEach var="ele" items="${listaFamilias }" >
							<li><a class="dropdown-item" href="/lista-productos/${ele.nombre }">${ele.nombre }</a></li>
						</c:forEach>
					</ul>
				</li>
				          
				<sec:authorize access="hasAuthority('Admin')">
					<li><a href="/lista-roles" class="nav-link px-2 text-black">Roles</a></li>
					<li><a href="/lista-usuarios" class="nav-link px-2 text-black">Usuarios</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Mi cuenta</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/datos-personales/${usuario.idUsuario }">Mi Perfil</a></li>
							<li><a class="dropdown-item" href="/lista-direcciones/${usuario.idUsuario }">Mis Direcciones</a></li>
							<li><a class="dropdown-item" href="/lista-pedidos/${usuario.idUsuario }">Mis Pedidos</a></li>
							<li><a class="dropdown-item" href="/lista-tarjetas/${usuario.idUsuario }">Mis Tarjetas</a></li>
						</ul>
					</li>
				</sec:authorize>
				<li><a href="/" class="nav-link px-2 text-black">Contacto</a></li>
			</ul>
	    </nav>
	</body>
</html>