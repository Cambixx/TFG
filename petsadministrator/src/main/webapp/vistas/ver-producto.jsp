<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${ele.nombre }</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">${producto.nombre }</h1>
		</div>
		
		<main class="mt-5 container">
			<div class="container">${mensaje }</div>
			<div class="row">
				<div class="col-lg-6 col-12">
					<div class="text-center">
						<img class="img-portada" src="/images/portadas/${producto.imagen }">
					</div>
				</div>
				
				<div class="col-lg-6 col-12">
					<div class="text-end mb-3"><span class="tag">${producto.familia.nombre}</span></div>
						<h2 class="mb-5">${producto.nombre }</h2>
	
						<p class="mb-5">${producto.descripcion }</p>
						
						<h4 class="text-end">${producto.precio } €</h4>
						<h5 class="text-end">Stock disponible: ${producto.stock } unidades.</h5>
					<div class="text-end mt-5">
					
					<form action="/cesta/addCesta/${producto.idProducto}" method="post">
						<div class="row">
							<div class="form-floating col-6">
								<input type="number" min="1" max="20" class="form-control" id="cantidad" name="cantidad" placeholder="Cantidad" required>
								<label for="cantidad">Cantidad</label> 
							</div>
							<div class="col-6">
								<input class="btn btn-primary" type="submit" value="Añadir">
							</div> 
						</div>
					</form>
					
					</div>
					
				</div>
			</div>
		
	
		</main>
			
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	