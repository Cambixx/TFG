<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar rol</title>
	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Editar rol</h1>
		</div>
	
		<main class="mt-5 container">
			<form action="/editar-rol/${rolElegido.idRol}" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" name="nombre" id="nombre" type="text" placeholder="Rol">
					<label class="small mb-1" for="nombre">Rol</label>
				</div>
				
				<div class="text-end mt-5">
					<a class="btn btn-outline-primary me-3" href="javascript:history.back()">Volver</a>
					<input class="btn btn-primary" type="submit" value="Guardar">
				</div>                       
			</form>
		
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>