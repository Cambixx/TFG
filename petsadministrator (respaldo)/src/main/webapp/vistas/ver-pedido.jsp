<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ver pedido</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Ver pedido número ${pedido.idPedido }</h1>
		</div>
		
		<main class="mt-5 container">

			<table class="table table-striped table-sm " >
			
				<th class="text-uppercase text-center">Id</th>
				<th class="text-uppercase text-center">Usuario</th>
				<th class="text-uppercase text-center">Estado</th>
				<th class="text-uppercase text-center">Fecha</th>
				<th class="text-uppercase text-center">Dirección</th>
				<th class="text-uppercase text-center"></th>
				
				<tr>
					<td class="align-middle text-center">${pedido.idPedido }</td>
					<td class="align-middle text-center">${pedido.usuario.nombre } ${pedido.usuario.apellido1 } ${pedido.usuario.apellido2 }</td>
					<td class="align-middle text-center">${pedido.estado }</td>
					<td class="align-middle text-center">${pedido.fechaRealizacion }</td>
					<td class="align-middle text-center">${pedido.direccion.calle }, ${pedido.direccion.letra }, ${pedido.direccion.numero }</td>
				</tr>
					
			</table>
			
			<a href="/lista-pedidos/${usuario.idUsuario}" class="btn btn-primary me-3">Volver</a></td>
		
	
		</main>
			
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	