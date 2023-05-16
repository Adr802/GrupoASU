<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grupo Misionero Salesiano</title>
<link rel="stylesheet" href="css/styles.css">

</head>
<body>

	<header>
		<nav>
			<ul>
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="eventos.jsp">Eventos</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp"  class="presionado">Iniciar Sesion</a></li>
			</ul>
			<div id="linea">
				<img alt="" src="img/linea2.png" style="padding-top:17px;width: 700px; height: 4px; padding-left: 30px;">
			</div>
		</nav>
	</header>

	<div id="cuerpo">
		<h1>Grupo Misionero Salesiano</h1>
		<div class="login-box">
			<h2>Iniciar sesión</h2>
			<form method="post" action="registro.jsp">
				<label for="username">Usuario:</label>
				<input type="text" class="inputText" name="username" placeholder="Ingrese su usuario" required>
				<label for="password">Contraseña:</label>
				<input type="password" class="inputText" name="password" placeholder="Ingrese su contraseña" required>
				<input type="submit" value="Iniciar sesión">
				<p><br>¿Aun no tienes cuenta? <br><br>
				<a class="btnRegistro">REGISTRATE!</a>
			</form>
		</div>
		
		
	</div>

	<footer>
	</footer>
</body>
</html>