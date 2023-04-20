<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alta dirección</title>
	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Alta dirección</h1>
		</div>
	
		<main class="mt-5 container">
		<div class="container">${mensaje }</div>
			<form action="/alta-direccion/${usuario.idUsuario}" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" id="descripcion" name="descripcion" type="text" placeholder="Descripción" required>
					<label class="small mb-1" for="descripcion">Descripción</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="calle" name="calle" type="text" placeholder="Calle" required>
					<label class="small mb-1" for="calle">Calle</label>
				</div>
				<div class="row gx-3 mb-3">
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="numero" name="numero" type="text" placeholder="Numero">
						<label class="small mb-1" for="numero">Numero</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="piso" name="piso" type="text" placeholder="Piso">
						<label class="small mb-1" for="piso">Piso</label>
					</div>
					<div class="form-floating mb-3 col-md-4">
						<input class="form-control" id="letra" name="letra" type="text" placeholder="Letra">
						<label class="small mb-1" for="letra">Letra</label>
					</div>
				</div>
				<div class="row gx-3 mb-3">
					<div class="form-floating mb-3 col-md-6">
						<input class="form-control" id="codigoPostal" name="codigoPostal" type="text" placeholder="CP" required>
						<label class="small mb-1" for="codigoPostal">CP</label>
					</div>
					<div class="form-floating mb-3 col-md-6">
						<input class="form-control" id="localidad" name="localidad" type="text" placeholder="Localidad" required>
						<label class="small mb-1" for="localidad">Localidad</label>
					</div>
				</div>
				<div class="text-end mt-5">
					<input class="btn btn-primary" type="submit" value="Guardar">
				</div>                       
			</form>
		
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>