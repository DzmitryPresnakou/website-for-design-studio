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
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h3 class="text-center text-dark mt-5">Введите логин и пароль</h3>
				<div class="card my-5">
					<form:form action="/login" method="POST"
						class="card-body cardbody-color p-lg-5">
						<div class="text-center">
							<img src="img/logo2.png"
								class="img-fluid profile-image-pic img-thumbnail mb-4"
								width="200px" alt="profile">
						</div>
						<div class="mb-3">
							<input type="text" class="form-control textfield" id="Username"
								name="name" placeholder="логин">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control textfield"
								id="password" name="password" placeholder="пароль">
						</div>

						<c:if test="${param.error != null}">
							<p style="font-size: 20; color: #FF1C19;">Логин или пароль
								введены неправильно, пожалуйста проверьте</p>
						</c:if>

						<div class="text-center">
							<button type="submit" name="Submit"
								class="btn btn1 btn-outline-dark px-5 mb-2 w-100">Войти</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>

</html>