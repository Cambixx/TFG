<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Crear nuevo producto</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Crear nuevo producto</h1>
		</div>
	
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>				
			<form action="/alta-producto" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" required>
					<label class="small mb-1" for="nombre">Nombre</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="descripcion" name="descripcion" type="text" placeholder="Descripción" required>
					<label class="small mb-1" for="descripcion">Descripción</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="precio" name="precio" type="text" placeholder="Precio" required>
					<label class="small mb-1" for="precio">Precio</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="stock" name="stock" type="text" placeholder="Stock" required>
					<label class="small mb-1" for="stock">Número de unidades disponibles</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="imagen" name="imagen" type="text" placeholder="/imagen.jpg">
					<label class="small mb-1" for="imagen">Imagen</label>
				</div>
				
				<label for="familia">Consola:</label><br>
				<select class="form-select mb-3" name="familia" required>
					<option selected>Selecciona una consola</option>
					<c:forEach var="ele" items="${listaFamilias }">
						<option value="${ele.idFamilias}">${ele.nombre}</option>
					</c:forEach>
				</select>
				
				<div class="text-end mt-5">
					<input class="btn btn-primary" type="submit" value="Guardar">
				</div>                       
			</form>		

		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>