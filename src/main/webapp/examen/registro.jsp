<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
<link rel="stylesheet" href="css/styles.css">
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
				<li><a href="index.jsp" class="presionado">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp">Iniciar Sesion</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> <img alt=""
				src="img/logo_ups.png" id="lups">
		</div>
	</header>
	<div id="contenedor-reg">

		<div id="tar-reg" class="card">
			<div class="card-header">
				<h2>Registro</h2>
			</div>
			<%
			String error = request.getParameter("error");
			if (error != null && !error.isEmpty()) {
			%>
			<div class="alert alert-danger" role="alert">
				<%=error%>
			</div>
			<%
			}
			%>
			<form action="respuesta.jsp" method="post" id="registro-form">
				<table>
					<tr>
						<td>Nombre:</td>
						<td><input type="text" name="txtNombre" required="required" /></td>
					</tr>
					<tr>
						<td>Cédula:</td>
						<td><input type="text"
							title="Ingrese solo valores numéricos, no se permiten letras"
							pattern="[0-9]*" minlength="10" maxlength="10" name="txtCedula"
							required="required" /></td>
					</tr>
					<tr>
						<td>Correo:</td>
						<td><input type="text"
							pattern="[a-zA-Z0-9._%+-]+@(est\.)?ups\.edu\.ec"
							title="Ingrese una dirección de correo válida de la UPS"
							name="txtCorreo" required="required" /></td>
					</tr>
					<tr>
						<td>Celular:</td>
						<td><input type="text"
							title="Ingrese solo valores numéricos, no se permiten letras"
							pattern="[0-9]*" maxlength="10" name="txtCelular"
							required="required" /></td>
					</tr>
					<tr>
						<td>Carrera:</td>
						<td><input type="text" name="txtCarrera" required="required" /></td>
					</tr>
					<tr>
						<td>Contraseña:</td>
						<td><input type="text" name="txtPass" required="required" /></td>
					</tr>
					<tr>
						<td colspan="2"><center><input type="submit" value="Registrarse" id="btnreg"/></center></td>
					</tr>
				</table>
			</form>
		</div>

	</div>

</body>
</html>