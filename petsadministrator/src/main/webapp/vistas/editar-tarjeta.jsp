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
			<h1 class="container">Editar tarjeta</h1>
		</div>
		
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>				
			<form action="/editar-tarjeta/${tarjetaElegida.idTarjeta }" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" id="idTarjeta" name="idTarjeta" type="text" placeholder="idTarjeta" value="${tarjetaElegida.idTarjeta }" readonly>
					<label class="small mb-1" for="idTarjeta">idTarjeta</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="nombreTitular" name="nombreTitular" type="text" placeholder="Nombre Titular" value="${tarjetaElegida.nombreTitular}">
					<label class="small mb-1" for="nombreTitular">Nombre Titular</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="numero" name="numero" type="number" placeholder="Número de la tarjeta" value="${tarjetaElegida.numero}">
					<label class="small mb-1" for="numero">Número</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="cvv" name="cvv" type="number" placeholder="cvv" value="${tarjetaElegida.cvv}">
					<label class="small mb-1" for="cvv">CVV</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="fechaCaducidad" type="date" name="fechaCaducidad" placeholder="FechaCaducidad" value="${tarjetaElegida.fechaCaducidad}">
		            <label class="small mb-1" for="fechaCaducidad">Fecha de Caducidad</label>
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