<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Tarjeta</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Lista de Tarjeta</h1>
		</div>
	
		<main class="my-5 container">
			<div class="container">${mensaje }</div>
			<div class="mb-5">
				<a href="/alta-tarjeta/${usuario.idUsuario }" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Nueva tarjeta</a>
			</div>
			
			<table class="table table-striped table-sm " >
				<th class="text-center text-uppercase">ID</th>
				<th class="text-uppercase">Nombre Titular</th>
				<th class="text-center text-uppercase">Número</th>
				<th class="text-center text-uppercase">CVV</th>
				<th class="text-center text-uppercase">Fecha caducidad</th>
				<th class="text-center text-uppercase">Opciones</th>
				
				<c:forEach var="ele" items="${tarjetasUsuario }" >
					<tr>
						<td class="align-middle text-center">${ele.idTarjeta }</td>
						<td class="align-middle">${ele.nombreTitular }</td>
						<td class="align-middle text-center">${ele.numero }</td>
						<td class="align-middle text-center">${ele.cvv }</td>
						<td class="align-middle text-center">${ele.fechaCaducidad }</td>
						<td class="align-middle text-center">
							<a href="/editar-tarjeta/${ele.idTarjeta }" class="btn btn-outline-primary me-3">Editar</a>
							<a href="/borrar-tarjeta/${ele.idTarjeta }" class="btn btn-primary me-3"><i class="bi bi-trash3"></i></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>