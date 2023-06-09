<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Inicio</title>
		
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class="main">
			<section>
				<div id="contenedor_titulo_hero" class="titulo_hero">
			    	PETS-ADMINISTRATOR
			  	</div>
				<div class="hero_img">
					<img src="/images/petsHero.jpg" alt="">
				</div>
				<div class="mt-5 mb-5 container">
					<div class="row no-gutters">
						<c:forEach var="ele" items="${listaFamilias }" >
							<div class="col-sm-6 col-lg-4 mb-2 interior">
								<div class="portfolio-wrapper">
									<a class="popimg ml-0" href="/lista-productos/${ele.nombre }">	
										<div class="portfolio-image text-center">
											<img src="/images/tamanos/${ele.imagen }" alt="${ele.nombre }" />
										</div>
										<div class="portfolio-overlay">
										
											<div class="portfolio-content">
												
												<i class="ti-zoom-in display-24 display-md-23 display-lg-22 display-xl-20"></i>
												
												<h2>${ele.nombre }</h2>
											</div>
									
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</main>
	
		<jsp:include page="footer.jsp"></jsp:include>
			
		<script type="text/javascript">
			const separar = id => {
			  const element = document.getElementById(id),
			        text = element.innerText.split("");

			  element.innerText = "";

			  text.forEach(letra => {
			    const span = document.createElement("span");
			    span.className = "letra";
			    span.innerText = letra;
			    element.appendChild(span);
			  })
			}

			separar("contenedor_titulo_hero")
		</script>
	</body>
	
</html>
	