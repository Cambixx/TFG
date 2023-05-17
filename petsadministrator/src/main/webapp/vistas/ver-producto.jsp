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
					<div class="text-end mb-3"><span class="tag">${producto.tamano.nombre}</span></div>
						<h2 class="mb-5">${producto.nombre }</h2>
	
						<p class="mb-5">${producto.descripcion }</p>
						
						<h4 class="text-end">${producto.precio } €</h4>
						<h5 class="text-end">Stock disponible: ${producto.stock } unidades.</h5>
					<div class="text-end mt-5">
					
					<form action="/cesta/addCesta/${producto.idProductos}" method="post" onsubmit="return validarCantidad()">
						<div class="row">
							<div class="form-floating col-6">
								<input type="number" min="1" max="200" class="form-control" id="cantidad" name="cantidad" placeholder="Cantidad" required>
								<label for="cantidad">Cantidad</label> 
								<p>${pocostock }</p>
								<p id="mensajeStock">${alertastock}</p>
							</div>
							<div class="col-6">
								<input class="btn btn-primary" type="submit" value="Añadir">
							</div> 
						</div>
					</form>
					<script>
    					function validarCantidad() {
       					 var cantidadInput = document.getElementById('cantidad');
       					 var mensajeStock = document.getElementById('mensajeStock');

       					 var cantidad = parseInt(cantidadInput.value);
       					 var stockDisponible = ${producto.stock}; // Reemplaza esto con la variable que contiene el stock disponible

       					 if (cantidad > stockDisponible) {
          				  mensajeStock.textContent = 'No hay suficiente stock disponible.';
       				     return false; // Evita enviar el formulario
     						   } else {
          				  mensajeStock.textContent = ''; // Borra el mensaje de alerta
           				 return true; // Permite enviar el formulario
        					}
    					}
					</script>
					
					</div>
					
				</div>
			</div>
		
	
		</main>
			
		<jsp:include page="footer.jsp"></jsp:include>
			
	</body>
	
</html>
	