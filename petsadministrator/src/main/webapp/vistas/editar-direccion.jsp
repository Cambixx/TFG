<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		<div class="page-header">
			<h1 class="container">Editar dirección</h1>
		</div>
		
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>				
			<form action="/editar-direccion/${direccionElegida.idDireccion }" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" id="idTarjeta" name="descripcion" type="text" placeholder="descripcion" value="${direccionElegida.descripcion }">
					<label class="small mb-1" for="descripcion">Descripcion</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="calle" name="calle" type="text" placeholder="calle" value="${direccionElegida.calle}">
					<label class="small mb-1" for="calle">Calle</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="numero" name="numero" type="number" placeholder="Número de la tarjeta" value="${direccionElegida.numero}">
					<label class="small mb-1" for="numero">Número</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="piso" name="piso" type="number" placeholder="piso" value="${direccionElegida.piso}">
					<label class="small mb-1" for="piso">Piso</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="letra" name="piso" type="text" placeholder="letra" value="${direccionElegida.letra}">
					<label class="small mb-1" for="letra">Letra</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="codigoPostal" name="codigoPostal" type="text" placeholder="codigoPostal" value="${direccionElegida.codigoPostal}">
					<label class="small mb-1" for="codigoPostal">Codigo Postal</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="localidad" name="localidad" type="text" placeholder="localidad" value="${direccionElegida.localidad}">
					<label class="small mb-1" for="localidad">Localidad</label>
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