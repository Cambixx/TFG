<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Productos</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Lista de productos</h1>
		</div>
	
		<main class="my-5 container">
		<div class="container">${mensaje }</div>
			<sec:authorize access="hasAnyAuthority('Admin')">
				<div class="mb-5">
					<a href="/alta-producto" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Nuevo producto</a>
				</div>
			</sec:authorize>

			<nav class="navbar navbar-light bg-light mb-3">
			  <h5><i class="bi bi-funnel"></i> Filtros:</h5>
			  	<a href="/lista-productos" class="btn btn-light"> Todos</a>
				
				<c:forEach var="ele" items="${listaFamilias }">
					<a href="/lista-productos/${ele.nombre}" class="btn btn-light"> ${ele.nombre}</a>
				</c:forEach>
				
			  <form class="form-inline">
			  	<a href="/lista-productos/precioAsc" class="btn btn-light" class="align-right"><i class="bi bi-arrow-up"></i> Precio ascendente</a>
				<a href="/lista-productos/precioDesc" class="btn btn-light" class="align-right"><i class="bi bi-arrow-down"></i> Precio descendente</a>
			  </form>
			</nav>
			
			<table class="table table-striped table-sm " >
				<th class="text-center text-uppercase">Imagen</th>
				<th class="text-uppercase">Nombre</th>
				<th class="text-uppercase">Plataforma</th>
				<th class="text-center text-uppercase">Precio</th>
				<th class="text-center text-uppercase">Opciones</th>
				
				<c:forEach var="ele" items="${listaProductos }" >
					<tr>
						<td class="align-middle text-center"><img class="img-portada-lista" src="/images/portadas/${ele.imagen }"></td>
						<td class="align-middle">${ele.nombre }</td>
						<td class="align-middle">${ele.familia.nombre }</td>
						<td class="align-middle text-center">${ele.precio } €</td>
						<td class="align-middle text-center">
							<a href="/ver-producto/${ele.idProducto}" class="btn btn-outline-primary me-3">Ver</a>
							<sec:authorize access="hasAnyAuthority('Admin')">
								<a href="/editar-producto/${ele.idProducto}" class="btn btn-outline-primary me-3">Editar</a>
								<a href="/borrar-producto/${ele.idProducto}" class="btn btn-primary me-3"><i class="bi bi-trash3"></i></a>
							</sec:authorize>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>