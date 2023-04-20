<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar Datos personales</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Editar Datos personales</h1>
		</div>
	
		<main class="mt-5 container">
		<div class="container">${mensaje }</div>
		    <div class="row">
		        <div class="col-xl-4">
		            <div class="card mb-4 mb-xl-0">
		                <div class="card-header">${datosUsuario.rol.nombre}</div>
		                <div class="card-body text-center">
		                    <div class="avatar"><i class="bi bi-person-circle"></i></div>
		                </div>
		                <div class="text-center fs-3 pb-4">${datosUsuario.nombre} ${datosUsuario.apellido1} ${datosUsuario.apellido2}</div>
		            </div>
		        </div>
		        <div class="col-xl-8">
		            <div class="card mb-4">
		                <div class="card-header">Detalles</div>
		                <div class="card-body">
		                    <form action="/editar-perfil/${datosUsuario.idUsuario}" method="post">

		                       <div class="row gx-3 mb-3">
			                        <div class="form-floating mb-3 col-md-6">
			                        	<input class="form-control" id="username" name="username" type="text" placeholder="Username" value="${datosUsuario.username}">
			                            <label class="small mb-1" for="username">Username</label>
			                        </div>
		                            <div class="form-floating mb-3 col-md-6">
		                            	<input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" value="${datosUsuario.nombre}">
		                                <label class="small mb-1" for="nombre">Nombre</label>
		                            </div>
		                            <div class="form-floating mb-3 col-md-6">
		                            	<input class="form-control" id="apellido1" name="apellido1" type="text" placeholder="Apellido 1" value="${datosUsuario.apellido1}">
		                                <label class="small mb-1" for="apellido1">Apellido 1</label>
		                            </div>
		                            <div class="form-floating mb-3 col-md-6">
		                            	<input class="form-control" id="apellido2" name="apellido2" type="text" placeholder="Apellido 2" value="${datosUsuario.apellido2}">
		                                <label class="small mb-1" for="apellido2">Apellido 2</label>
		                            </div>
		                        </div>
		                        <div class="row gx-3 mb-3">
					                <div class="form-floating mb-3 col-md-6">
					                	<input class="form-control" id="email" name="email" type="email" placeholder="Email" value="${datosUsuario.email}">
					                	<label class="small mb-1" for="email">Email</label>
					                </div>
				                    <div class="form-floating mb-3 col-md-6">
					                	<input class="form-control" id="password" name="password" type="text" placeholder="Contraseña" value="${datosUsuario.password}">
					                	<label class="small mb-1" for="password">Contraseña</label>
				                    </div>
		                        </div>
		                        
		                         <div class="row gx-3 mb-3">
			                         <div class="form-floating mb-3 col-md-6">
			                         	<input class="form-control" id="fechaNacimiento" type="date" name="fechaNacimiento" placeholder="Fecha de nacimiento" value="${datosUsuario.fechaNacimiento}">
		                                <label class="small mb-1" for="fechaNacimiento">Fecha de Nacimiento</label>
		                             </div>
		                             <div class="form-floating mb-3 col-md-6">
			                         	<input class="form-control" id="fechaRegistro" type="date" name="fechaRegistro" placeholder="Fecha de Registro" value="${datosUsuario.fechaRegistro}" disabled>
		                                <label class="small mb-1" for="fechaRegistro">Fecha de Registro</label>
		                             </div>
	                             </div>
	                            <div class="text-end mt-5">
	                            	<a class="btn btn-outline-primary me-3" href="/datos-personales/${datosUsuario.idUsuario }">Volver</a>
	                            	<input class="btn btn-primary" type="submit" value="Guardar">
	                            </div>
		                        
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>

			
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>