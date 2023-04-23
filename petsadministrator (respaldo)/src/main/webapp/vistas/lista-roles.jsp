<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Roles</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Lista de roles</h1>
		</div>
	
		<main class="my-5 container">
			<div class="container">${mensaje }</div>
			
			<div class="mb-5">
				<a href="/alta-roles" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Nuevo rol</a>
			</div>
			
			<table class="table table-striped table-sm " >
				<th class="text-uppercase">Id</th>
				<th class="text-uppercase">Nombre</th>
				<th class="text-center"></th>
				
				<c:forEach var="ele" items="${listaRoles }" >
					<tr>
						<td class="align-middle">${ele.idRol }</td>
						<td class="align-middle">${ele.nombre }</td>
						<td class="align-middle text-center">
							<a href="/editar-rol/${ele.idRol }" class="btn btn-outline-primary me-3">Editar</a>
							<a href="/borrar-rol/${ele.idRol }" class="btn btn-danger me-3">Borrar</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>