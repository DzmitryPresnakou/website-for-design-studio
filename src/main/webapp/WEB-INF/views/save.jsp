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
<title>Save page</title>
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
							href="${pageContext.request.contextPath}/#portfolio">Портфолио</a></li>
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
	<section>
		<div class="container m-4 m-auto">
			<div class="row p-3 mb-5 mt-5 bg-body rounded saveForm">
				<div class="col-xl-6 col-md-6 col-sm-12">
					<form:form action="/portfolio" method="post" modelAttribute="photo"
						enctype="multipart/form-data">

						<form:input type="hidden" class="form-control textfield"
							id="photoFileName" path="fileName" value="${photo.fileName}" />

						<form:input type="hidden" class="form-control textfield"
							id="photoId" path="id" value="${photo.id}" />

						<label for="photoTitle" class="form-label mt-2 mb-1">
							Заголовок фото</label>
						<form:errors path="title" class="form-label mt-2 mb-1"
							cssStyle="color:red" />
						<form:input class="form-control textfield" id="photoTitle"
							value="${photo.title}" path="title" />

						<input class="form-control btn btn1 mt-3 btn-outline-dark"
							type="file" id="formFile" name="file" onchange="preview()">
						<form:errors path="fileName" class="form-label"
							cssStyle="color:red" />

						<input type="submit" name="save"
							class="form-control mt-3 btn btn1 btn-outline-dark"
							value="Сохранить">

						<div class="text-center">
							<a href="${pageContext.request.contextPath}/portfolio"
								class="form-control mt-3 btn btn1 btn-outline-dark">
								<h6 class="text-center text-uppercase m-2">Показать все
									фото</h6>
							</a>
						</div>
						<div class="text-center text-uppercase mt-3 msg">
							<h6 id="msg">${message}</h6>
						</div>
					</form:form>
				</div>
				<div class="col-xl-6 col-md-6 col-sm-12">
					<div class="card shadow p-3 mt-2 mb-2 bg-body rounded w-100">
						<img id="frame" src="img/${photo.fileName}" alt="Not Found"
							onerror="this.src='img/logo2.png';" class="img-fluid" />
					</div>
				</div>
			</div>
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
	<script src="js/preview.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>