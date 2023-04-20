<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registro</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>

		<div class="page-header">
			<h1 class="container">Registro de Usuario</h1>
		</div>
		
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>
			<form action="/registro" method="post">
				<div class="row gx-3 mb-3">
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="username" name="username" type="text" placeholder="Username" required>
						<label class="small mb-1" for="username">Username</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="email" name="email" type="text" placeholder="Email" required>
						<label class="small mb-1" for="email">Email</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="password" name="password" type="text" placeholder="Contraseña" required>
						<label class="small mb-1" for="password">Contraseña</label>
					</div>
				</div>
				<div class="row gx-3 mb-3">
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" required>
						<label class="small mb-1" for="nombre">Nombre</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="apellido1" name="apellido1" type="text" placeholder="Apellido 1" required>
						<label class="small mb-1" for="apellido1">Apellido 1</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="apellido2" name="apellido2" type="text" placeholder="Apellido 2" required>
						<label class="small mb-1" for="apellido2">Apellido 2</label>
					</div>
				</div>
				<div class="row gx-3 mb-3">
					<div class="form-floating mb-3 col-md-6">
						<input class="form-control" id="fechaNacimiento" type="date" name="fechaNacimiento" placeholder="Fecha de Nacimiento" required>
						<label class="small mb-1" for="fechaNacimiento">Fecha de Nacimiento</label>
					</div>
					<sec:authorize access="hasAnyAuthority('Admin')">
					<div class="mb-3 col-md-6">
						<select class="form-select mb-3" name="rol">
							<option selected>Selecciona un rol</option>
							<c:forEach var="ele" items="${listaRoles }">
								<option value="${ele.idRol}">${ele.nombre}</option>
							</c:forEach>
						</select>
					</div>
					</sec:authorize>
				</div>
				<div class="text-end mt-5">
					<input class="btn btn-primary" type="submit" value="Registrar">
				</div>                       
			</form>
		
		</main>

		<jsp:include page="footer.jsp"></jsp:include>	
	</body>
</html>