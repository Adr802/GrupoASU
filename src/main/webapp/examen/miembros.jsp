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
	<div id="miembros-div">
	<p id = "tit-miembros">MIEMBROS DEL GRUPO ASU</p>
		<%
			Usuario ac = new Usuario();
			out.print(ac.mostrarMiembros());
		%>	
	</div>
	<footer>
	</footer>
</body>
</html>