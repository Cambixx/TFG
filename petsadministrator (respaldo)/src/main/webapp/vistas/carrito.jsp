<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Carrito</title>
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="page-header">
			<h1 class="container">Carrito</h1>
		</div>
	
		<main class="my-5 container">
		<div class="container">${mensaje }</div>
			<form action="/cesta/comprar" method="post">

				<table class="table table-striped table-sm " >
					<th class="text-center text-uppercase">ID Producto</th>
					<th class="text-center text-uppercase">Cantidad</th>
					<th class="text-center text-uppercase">Precio</th>
					
					<c:forEach var="ele" items="${cesta }" >
						<tr>
							<td class="text-center align-center">${ele.idProducto }</td>
							<td class="text-center align-center">${ele.cantidad }</td>
							<td class="text-center align-center text-center">${ele.precioVenta } €</td>
						</tr>
					</c:forEach>
				</table>
				<div class="mb-5">
					<label class="my-3" for="direccion">Dirección de envío:</label><br>
		            <c:forEach items="${DireccionesUsuario}" var="ele">
		              <div class="form-check">
		                <input class="form-check-input" type="radio" name="direccion" id="opcion${ele.idDireccion}" value="${ele.idDireccion}" required>
		                <label class="form-check-label" for="opcion${ele.idDireccion}">${ele.descripcion}, Calle ${ele.calle}, Nº ${ele.numero}, Localidad ${ele.localidad}, CP: ${ele.codigoPostal}</label>
		
		              </div>
		            </c:forEach>
		
		            <label class="my-3" for="tarjeta">Tarjeta de pago:</label><br>
		            <c:forEach items="${TarjetasUsuario}" var="ele">
		              <div class="form-check">
		                <input class="form-check-input" type="radio" name="tarjeta" id="opcion${ele.idTarjeta}" value="${ele.idTarjeta}" required>
		                <label class="form-check-label" for="opcion${ele.idTarjeta}">${ele.nombreTitular}: Número ${ele.numero}, caducidad ${ele.fechaCaducidad}</label>
		
		              </div>
		            </c:forEach>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">Comprar</button>
				</div>
			
			</form>
			
		</main>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
</html>