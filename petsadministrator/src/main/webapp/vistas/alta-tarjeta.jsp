<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alta tarjeta</title>
	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Alta tarjeta</h1>
		</div>
	
		<main class="mt-5 container">
		<div class="container">${mensaje }</div>
			<form action="/alta-tarjeta/${usuario.idUsuario}" method="post">
			
				<div class="form-floating mb-3">
					<input class="form-control" id="numero" name="numero" type="number" placeholder="Numero" required>
					<label class="small mb-1" for="numero">Numero</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="nombreTitular"  name="nombreTitular" type="text" placeholder="Nombre Titular" required>
					<label class="small mb-1" for="nombreTitular">Nombre Titular</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="cvv" name="cvv" type="text" placeholder="CVV" required>
					<label class="small mb-1" for="cvv">CVV</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="fechaCaducidad" type="date" name="fechaCaducidad" placeholder="Fecha de Caducidad" required>
		            <label class="small mb-1" for="fechaCaducidad">Fecha de Caducidad</label>
				</div>
				
				<div class="text-end mt-5">
					<input class="btn btn-primary" type="submit" value="Guardar">
				</div>                       
			</form>
		
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>