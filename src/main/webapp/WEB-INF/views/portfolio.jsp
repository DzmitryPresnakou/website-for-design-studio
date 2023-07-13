<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Portfolio</title>
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
							href="${pageContext.request.contextPath}/#steps">Порядок
								работы</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/#service">Пакеты
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

	<div id="portfolio"></div>
	<section class="portfolio">
		<div class="container-fluid">
			<div class="container-fluid mb-3 mt-3">
				<div class="row color1">
					<div class="col-12">
						<h2 class="text-center text-uppercase color1 m-4">Портфолио</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="photo" items="${photos}">
					<div class="col-xl-4 col-md-6 col-sm-12 mb-3">
						<div class="card mb-3 h-100 shadow">
							<img src="img/${photo.fileName}"
								class="card-img-top gallery-item" alt="...">
							<div class="card-body">
								<p class="card-text">${photo.title}</p>

								<sec:authorize access="hasRole('ADMIN')">
									<!--добавление кнопок "Править" и "Удалить"-->
									<div class="text-center">
										<a href="${pageContext.request.contextPath}/${photo.id}"
											class="btn btn-secondary">Править</a> <a
											href="${pageContext.request.contextPath}/portfolio/delete/${photo.id}"
											class="btn btn-danger">Удалить</a>
									</div>
								</sec:authorize>
							</div>
						</div>
					</div>
					<div class="modal fade" id="gallery-modal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body w-100">
									<img src="img/${photo.fileName}" class="modal-img"
										alt="modal img">
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container mb-3 mt-3">
			<div class="row">

				<sec:authorize access="hasRole('ADMIN')">
					<div class="col-12 text-center mb-2">
						<a href="${pageContext.request.contextPath}/save"
							class="btn btn1 btn-outline-dark d-grid gap-2"> <span
							class="text-center fw-bold text-uppercase m-2">Добавить
								фото</span>
						</a>
					</div>
					<div class="container mb-3 mt-2">
						<div class="row">
							<div class="col-12 text-center mb-5">
								<a href="${pageContext.request.contextPath}/logout"
									class="btn btn1 btn-outline-dark d-grid gap-2"> <span
									class="text-center fw-bold text-uppercase m-2">Выйти</span>
								</a>
							</div>
						</div>
					</div>
				</sec:authorize>

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
							href="${pageContext.request.contextPath}/#steps"
							class="link-secondary">Планировочное решение</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#steps"
							class="link-secondary">Концепция будущего интерьера</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#steps"
							class="link-secondary">3D-визуализация</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#steps"
							class="link-secondary">Разработка чертежей</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#steps"
							class="link-secondary">Авторский надзор</a></li>
					</ul>
				</div>
				<div class="col-xl-3 col-md-6 col-sm-12">
					<h5>Пакеты услуг</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#service"
							class="link-secondary">Планировочное решение</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#service"
							class="link-secondary">Дизайн-концепция</a></li>
						<li class="mb-2 foot_info"><a
							href="${pageContext.request.contextPath}/#service"
							class="link-secondary">Полный дизайн-проект</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/modalImage.js"></script>

</body>

</html>