<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Presnakova Interior Home Design</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<header class="sticky-top menu border-bottom">
		<nav class="navbar navbar-expand-lg navbar-light color1">
			<div class="container color1">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
					id="logo" src="img/logo.png" alt="Presnakova Design"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${pageContext.request.contextPath}#portfolio">Портфолио</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}#steps">Порядок
								работы</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}#service">Пакеты
								услуг</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/about">Обо мне</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}#contacts">Контакты</a></li>
					</ul>
					<div>
						<a href="tel:+375291261203" class="link-secondary"> <img
							class="icons me-2" src="img/a1.png" alt="A1:"> +375 29 126
							12 03
						</a>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<section class="main_carousel">
		<div class="container-fluid">
			<div id="carouselExampleInterval" class="carousel carousel-fade"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="7200">
						<img src="img/image1.png" class="d-block w-100 slide" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="7200">
						<img src="img/image2.png" class="d-block w-100 slide" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="7200">
						<img src="img/image3.png" class="d-block w-100 slide" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="7200">
						<img src="img/image4.png" class="d-block w-100 slide" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>

	<div id="portfolio"></div>
	<section class="portfolio gallery">
		<div class="container-fluid">
			<div class="container-fluid mb-3 mt-3">
				<div class="row color1">
					<div class="col-12">
						<h2 class="text-center text-uppercase color1 m-4">Портфолио</h2>
					</div>
				</div>
			</div>
		</div>

		<!-- show photo on page -->

		<div class="container">
			<div class="row">
				<c:set var="title" value="null" />
				<c:forEach var="photo" items="${photos}">
					<c:if test="${!title.equals(photo.title)}">
						<div class="photocard col-xl-4 col-md-6 col-sm-12 mb-3 shadow">
							<div class="cardItem w-100 shadow">

								<a data-bs-toggle="modal" data-bs-target="#exampleModal"> <img
									src="img/${photo.fileName}" class="card-img-top gallery-item"
									alt="${photo.title}">
								</a>

							</div>
							<div class="card-body">
								<p class="card-text title">${photo.title}</p>
							</div>
						</div>
						<c:set var="title" value="${photo.title}" />
					</c:if>
				</c:forEach>

				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl modal-dialog-centered">
						<div class="modal-content">

							<!-- 							<div class="modal-header">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div> -->

							<!-- carousel starts -->

							<script>
	
								document.addEventListener("click", function(e) {
									if (e.target.classList
											.contains("gallery-item")) {
										var groupTitle = e.target
												.getAttribute("alt");
										var arrayOfPhotos = new Array();
										
										let inner = document.getElementById('carouselInner');
										inner.innerHTML = '';
										
									}
																		
									<c:forEach items="${photos}" var="item">
									
									if (groupTitle == "${item.title}") {
										var photo = {
												id : "${item.id}",
												title : "${item.title}",
												fileName : "${item.fileName}"
											};
										
											arrayOfPhotos.push(photo);
									}
				
									</c:forEach>
									
									if (arrayOfPhotos) {
										var passed = 'false';
										arrayOfPhotos.forEach((element) => {
											
											var fileName = 'img/' + element.fileName;
											/* var groupTitle = element.title; */
								
											let inner = document.getElementById('carouselInner');
											let carouselDiv = document.createElement('div');
											
											var image = document.createElement('img');
											image.setAttribute('src', fileName);
											
/* 											var cardBody = document.createElement('div');
											
		
											var title = document.createElement('p');
											title.textContent = groupTitle; */
											
											carouselDiv.setAttribute('data-bs-interval', 'false');
/* 											cardBody.classList.add('card-body');
											title.classList.add('card-text');
											title.classList.add('title'); */
											image.classList.add('modal-img');
											image.setAttribute('alt', '...');
		
										if (passed === 'false') {
											carouselDiv.classList.add('carousel-item', 'active', 'min-opacity');
										
										}
										
										if (passed === 'true') {
											carouselDiv.classList.add('carousel-item', 'min-opacity');
										
										}
										/* cardBody.appendChild(title); */
										carouselDiv.appendChild(image);
										/* carouselDiv.appendChild(cardBody); */
										inner.appendChild(carouselDiv);
										passed = 'true';
										  
										});
								}					
								})	

									</script>

							<div class="modal-body w-100">
								<div id="carouselExampleControls"
									class="carousel slide carousel-fade min-opacity"
									data-bs-ride="carousel">
									<div class="carousel-inner" id="carouselInner"></div>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControls" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

							<!-- carousel ends -->

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container mb-3 mt-3">
			<div class="row">
				<div class="col-12 text-center mb-5">
					<a href="${pageContext.request.contextPath}/portfolio"
						class="btn btn1 btn-outline-dark d-grid gap-2"> <span
						class="text-center fw-bold text-uppercase m-2">Посмотреть
							все работы</span>
					</a>
				</div>
			</div>
		</div>
	</section>
	<div id="steps"></div>
	<section class="steps">
		<div class="container-fluid">
			<div class="container-fluid mb-3 mt-3">
				<div class="row color1">
					<div class="col-12">
						<h2 class="text-center text-uppercase color1 m-4">Порядок
							работы</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="stage" items="${stages}">
					<div class="col-xl-4 col-md-6 col-sm-12 mb-3">
						<h4 class="text-center fw-bold mb-3 mt-3">${stage.name}</h4>
						<ul>
							<c:forEach var="tasks" items="${stage.tasks}">
								<li>${tasks}</li>
							</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<div id="service"></div>
	<section class="service">
		<div class="container-fluid">
			<div class="container-fluid mb-3 mt-3">
				<div class="row color1">
					<div class="col-12">
						<h2 class="text-center text-uppercase color1 m-4">Пакеты
							услуг</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="packageOfServices" items="${packages}">
					<div class="col-xl-4 col-md-6 col-sm-12 mb-3">
						<h4 class="text-center fw-bold mb-3 mt-3">
							${packageOfServices.name}</h4>
						<div class="price ">
							<h4 class="text-center fw-bold mb-2 mt-2">
								<span>${packageOfServices.price}</span>$ за м<sup>2</sup>
							</h4>
						</div>
						<ul>
							<c:forEach var="services" items="${packageOfServices.services}">
								<li>${services}</li>
							</c:forEach>
						</ul>
						<div class="price_comment">
							<p>${packageOfServices.description}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>



	<footer class="bd-footer mt-5 color1">
		<div id="contacts"></div>
		<div class="container py-4 py-md-5 px-4 px-md-3 text-body-secondary">
			<div class="row">
				<div class="col-xl-3 col-md-6 col-sm-12">
					<h5>Контакты:</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-2 foot_info"><a href="tel:+375291261203"
							class="link-secondary"> <img class="icons me-2"
								src="img/a1.png" alt="A1:"> +375 29 126 12 03
						</a></li>
						<li class="mb-2 foot_info"><a
							href="https://www.instagram.com/presnakova_home_design/"
							class="link-secondary"> <img class="icons me-2"
								src="img/instagram.png" alt=""> instagram
						</a></li>
						<li class="mb-2 foot_info"><a
							href="https://t.me/presnakova_home_design" class="link-secondary">
								<img class="icons me-2" src="img/telegram.png" alt="">
								telegram
						</a></li>
						<li class="mb-2 foot_info"><a
							href="viber://add?number=375291261203" class="link-secondary">
								<img class="icons me-2" src="img/viber_icon.png" alt="">
								viber
						</a></li>
					</ul>
				</div>
				<div class="col-xl-3 col-md-6 col-sm-12">
					<h5>Портфолио</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/portfolio"
							class="link-secondary">Посмотреть все работы</a></li>
					</ul>
				</div>
				<div class="col-xl-3 col-md-6 col-sm-12">
					<h5>Порядок работы</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#steps"
							class="link-secondary">Планировочное решение</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#steps"
							class="link-secondary">Концепция будущего интерьера</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#steps"
							class="link-secondary">3D-визуализация</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#steps"
							class="link-secondary">Разработка чертежей</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#steps"
							class="link-secondary">Авторский надзор</a></li>
					</ul>
				</div>
				<div class="col-xl-3 col-md-6 col-sm-12">
					<h5>Пакеты услуг</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#service"
							class="link-secondary">Планировочное решение</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#service"
							class="link-secondary">Дизайн-концепция</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}#service"
							class="link-secondary">Полный дизайн-проект</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/modalCarousel.js"></script>
	<!-- 	<script src="js/modalImage.js"></script> -->

</body>

</html>