<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mis pedidos</title>
</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Mis pedidos</h1>
		</div>
		
		<main class="my-5 container">
		<div class="container">${mensaje }</div>
			
			<table class="table table-striped table-sm " >
				<th class="text-uppercase text-center">Id</th>
				<th class="text-uppercase text-center">Usuario</th>
				<th class="text-uppercase text-center">Estado</th>
				<th class="text-uppercase text-center">Fecha</th>
				<th class="text-uppercase text-center">Dirección</th>
				<th class="text-uppercase text-center">Tarjeta</th>
				<th class="text-uppercase text-center">Total</th>
				<th class="text-uppercase text-center"></th>
				
				<c:forEach var="ele" items="${pedidosUsuario }" >
					<tr>
						<td class="align-middle text-center">${ele.idPedido }</td>
						<td class="align-middle text-center">${ele.usuario.nombre } ${ele.usuario.apellido1 } ${ele.usuario.apellido2 }</td>
						<td class="align-middle text-center">${ele.estado }</td>
						<td class="align-middle text-center">${ele.fechaRealizacion }</td>
						<td class="align-middle text-center">${ele.direccion.calle }, ${ele.direccion.letra }, ${ele.direccion.numero }</td>
						<td class="align-middle text-center">${ele.tarjeta.numero }</td>
						<td class="align-middle text-center"><a href="/ver-pedido/${ele.idPedido}" class="btn btn-primary me-3">Ver pedido</a></td>
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
	
	</body>
</html>