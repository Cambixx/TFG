<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar producto</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Editar producto</h1>
		</div>
	
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>				
			<form action="/editar-producto/${producto.idProductos }" method="post">
				<div class="form-floating mb-3">
					<input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" value="${producto.nombre}">
					<label class="small mb-1" for="nombre">Nombre</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="descripcion" name="descripcion" type="text" placeholder="Descripción" value="${producto.descripcion}">
					<label class="small mb-1" for="descripcion">Descripción</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="precio" name="precio" type="text" placeholder="Precio" value="${producto.precio}">
					<label class="small mb-1" for="precio">Precio</label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="stock" name="stock" type="text" placeholder="Stock" value="${producto.stock}">
					<label class="small mb-1" for="stock">Número de unidades disponibles</label>
				</div>
				
				<div class="form-floating mb-3">
					<input class="form-control" id="imagen" name="imagen" type="text" placeholder="/imagen.jpg" value="${producto.imagen}">
					<label class="small mb-1" for="imagen">Imagen</label>
				</div>
				
				<label for="tamano">Tamaño:</label><br>
				<select class="form-select mb-3" name="tamano" required>
					<c:forEach var="ele" items="${listaFamilias }">
						<option value="${ele.idTamanos}">${ele.nombre}</option>
					</c:forEach>
				</select>
				<br>
				
				<div class="text-end mt-5">
					<a class="btn btn-outline-primary me-3" href="/lista-productos">Volver</a>
					<input class="btn btn-primary" type="submit" value="Guardar">
				</div>                       
			</form>		
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>