<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" import="com.negocio.cargarImagen"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar Actividad</title>
<link rel="stylesheet" href="css/styleMenu.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>

<body>
	<header>
		<nav>
			<ul>
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp" class="presionado">Menu de
						usuario</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> <img alt=""
				src="img/logo_ups.png" id="lups">
		</div>
	</header>

	<div class="div-Ingreso">
		<h1>Ingresar nueva actividad</h1>

		<div class="registration-card">
			<form action="cargarImagen" method="post" enctype="multipart/form-data"  id="tar-act">
				<div class="form-group">
					<label for="inNombre">Nombre de la actividad:</label> <input
						type="text" name="txtNombre" required="required" id="inNombre">
				</div>
				<div class="form-group">
					<label for="inDesc">Descripción:</label> <input type="text"
						name="txtDesc" required="required" class="inDesc">
				</div>
				<div class="form-group">
					<label for="inFoto">Foto:</label> <input type="file" name="foto" accept="image/jpg" id="inFoto">
				</div>
				<div class="form-group">
					<input type="submit" value="Agregar" class="btn-ingresar">
				</div>
			</form>
		</div>
	</div>
	<%
	String error = request.getParameter("resultNewActividad");
	if (error != null && !error.isEmpty()) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=error%>
	</div>
	<%
	}
	%>
</body>
</html>