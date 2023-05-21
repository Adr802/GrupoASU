<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grupo Misionero Salesiano</title>
<link rel="stylesheet" href="css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>

	<header>
		<nav>
			<ul>
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp"  class="presionado">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp">Iniciar Sesion</a></li>
			</ul>
		</nav>
				<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> 
			<img alt="" src="img/logo_ups.png" id="lups">
		</div>
	</header>

	<div id="cuerpo">
		<h1>Grupo Misionero Salesiano</h1>
		<center><h2>SOBRE NOSOTROS</h2></center>
		<div class="contenido">
			<img alt="" src="img/misionero1.png" class="imgInicio">
			<div id="contactos">
				<p><b>ANIMADOR</b></p>
				<p>Pablo Mallamas</p>
				<p>Dirección de Pastoral Universitaria - Sede Quito</p>
				<p><strong>Correo Institucional: </strong> pmallamas@ups.edu.ec</p>
				<p><strong>Télefono Institucional: </strong>(+593) 3962 800 / 3262 900 – ext: 2398</p>	
				<br>
				<p><b>COORDINADOR</b></p>
				<p>Luis Valdiviezo</p>
				<p>Estudiante de la Carrera de Ingeniería en Telecomunicaciones</p>
				<p><strong>Correo Institucional: </strong> lvaldiviezom@est.ups.edu.ec</p>
				<p><strong>Télefono Institucional: </strong>(+593)</p>
				<br>
				<p><b>DESARROLLADOR</b></p>
				<p>Jhosue Villacres</p>
				<p><a href="https://github.com/Adr802">Github</a></p>
				<p><a href="https://www.linkedin.com/in/adrian-villacres-153b1722b/">Linkedin</a></p>
				<p><strong>Correo Institucional: </strong> jvillacresp2@est.ups.edu.ec</p>
			</div>
		</div>
		
		<div>
		<a href="miembros.jsp">Ver miembros activos del grupo ASU</a>
		
		</div>
	</div>
	
	<footer>
	</footer>
</body>
</html>