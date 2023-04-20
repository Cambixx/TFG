<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Direcciones</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Lista de Direcciones</h1>
		</div>
	
		<main class="my-5 container">
		<div class="container">${mensaje }</div>
			<div class="mb-5">
				<a href="/alta-direccion/${usuario.idUsuario }" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Nueva dirección</a>
			</div>
			
			<table class="table table-striped table-sm " >
				<th class="text-center text-uppercase">ID</th>
				<th class="text-center text-uppercase">Descripcion</th>
				<th class="text-uppercase">Calle</th>
				<th class="text-center text-uppercase">Número</th>
				<th class="text-center text-uppercase">Piso</th>
				<th class="text-center text-uppercase">Letra</th>
				<th class="text-center text-uppercase">CP</th>
				<th class="text-center text-uppercase">Localidad</th>
				<th class="text-center text-uppercase">Opciones</th>
				
				<c:forEach var="ele" items="${direccionesUsuario }" >
					<tr>
						<td class="align-middle text-center">${ele.idDireccion }</td>
						<td class="align-middle text-center">${ele.descripcion }</td>
						<td class="align-middle">${ele.calle }</td>
						<td class="align-middle text-center">${ele.numero }</td>
						<td class="align-middle text-center">${ele.piso }</td>
						<td class="align-middle text-center">${ele.letra }</td>
						<td class="align-middle text-center">${ele.codigoPostal }</td>
						<td class="align-middle text-center">${ele.localidad }</td>
						<td class="align-middle text-center">
							<a href="/editar-direccion/${ele.idDireccion }" class="btn btn-outline-primary me-3">Editar</a>
							<a href="/borrar-direccion/${ele.idDireccion }" class="btn btn-primary me-3"><i class="bi bi-trash3"></i></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>