<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Usuarios</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Lista de usuarios</h1>
		</div>
	
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>
			<div class="mb-5">
					<a href="/registro" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Nuevo usuario</a>
			</div>
			<table class="table table-striped table-sm " >
				<th class="text-uppercase">Id</th>
				<th class="text-uppercase">Nombre</th>
				<th class="text-uppercase">Apellidos</th>
				<th class="text-uppercase">Email</th>
				<th class="text-uppercase"></th>
				<th class="text-uppercase"></th>
				<th class="text-uppercase"></th>
				<th class="text-uppercase"></th>
				
				<c:forEach var="ele" items="${listaUsuarios }" >
					<tr>
						<td class="align-middle">${ele.idUsuario }</td>
						<td class="align-middle">${ele.nombre }</td>
						<td class="align-middle">${ele.apellido1 } ${ele.apellido2 }</td>
						<td class="align-middle">${ele.email }</td>
						<td class="align-middle"><a href="/datos-personales/${ele.idUsuario}" class="btn btn-primary me-3">Detalles</a></td>
						<td class="align-middle"><a href="/lista-direcciones/${ele.idUsuario}" class="btn btn-outline-primary me-3">Direcciones</a></td>
						<td class="align-middle"><a href="/lista-tarjetas/${ele.idUsuario}" class="btn btn-outline-primary me-3">Tarjetas</a></td>
						<td class="align-middle"><a href="/lista-pedidos/${ele.idUsuario}" class="btn btn-outline-primary me-3">Pedidos</a></td>
								
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>