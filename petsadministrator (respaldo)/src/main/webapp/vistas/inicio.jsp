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
		
		<main class="mt-5 main">
			<section>
				<div class="container">
					<div class="row no-gutters">
						<c:forEach var="ele" items="${listaFamilias }" >
							<div class="col-sm-6 col-lg-4 mb-2 interior">
								<div class="portfolio-wrapper">
									<a class="popimg ml-0" href="/lista-productos/${ele.nombre }">	
										<div class="portfolio-image text-center">
											<img src="/images/consolas/${ele.imagen }" alt="${ele.nombre }" />
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
			
	</body>
	
</html>
	