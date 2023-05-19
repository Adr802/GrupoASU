<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grupo Misionero Salesiano</title>
<link rel="stylesheet" href="css/styleLogin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body background="img/bosco.jpg" style="background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        background-attachment: fixed;">

	<header>
		<nav>
			<ul>
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp" class="presionado">Iniciar
						Sesion</a></li>
			</ul>
		</nav>
				<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> 
			<img alt="" src="img/logo_ups.png" id="lups">
		</div>
	</header>
	<div id="cuerpo-login">
		<div class="login-box">
			<h2>Iniciar sesión</h2>
			<form method="post" action="verificarLogin.jsp">
				<label for="username">Usuario:</label> <input type="text"
					class="inputText" name="username" placeholder="Ingrese su usuario"
					required> <label for="password">Contraseña:</label> <input
					type="password" class="inputText" name="password"
					placeholder="Ingrese su contraseña" required> <input
					type="submit" value="Iniciar sesión">
				<p>
					<br>¿Aun no tienes cuenta? <br> <br> <a href="registro.jsp"	class="btnRegistro">REGISTRATE!</a>
			</form>
		</div>
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

	<footer> </footer>
</body>
</html>