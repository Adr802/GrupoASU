<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="css/styleMenu.css">

<title>Solicitudes</title>
</head>
<body>


<header>
		<nav>
			<ul>
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp" class="presionado">Menu de usuario</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> <img alt=""
				src="img/logo_ups.png" id="lups">
		</div>
	</header>

<%
	Postulacion p  = new Postulacion();
	String error = request.getParameter("resultAceptarActividad");
	
	String respuesta="";
	String tipoDiv="";
	
	
	
	if (error != null && !error.isEmpty() && error.equals("Usuario Aceptado")) {
		respuesta = error;
		tipoDiv = "class=\"alert alert-success\" role=\"alert\"";
	
	}else if(error != null && !error.isEmpty() && error.equals("Usuario rechazado")){
		respuesta = error;
		tipoDiv = "class=\"alert alert-danger\" role=\"alert\"";
	}
	%>
	<%
	out.print("<div class=\"div-espacio\"><h1>Gestion de postulaciones</h1><div "+ tipoDiv + ">" + respuesta +"</div><div class=\"tablasPost\"><p>Tabla de postulaciones pendientes</p>" + p.tablaPostulacionPendiente()+"</div>");
	out.print("<div class=\"tablasPost\"><p>Tabla de postulaciones rechazadas</p>" + p.tablaPostulacionRechazada()+"</div>");
	out.print("<div class=\"tablasPost\"><p>Tabla de postulaciones aceptadas</p>" + p.tablaPostulacionAceptada()+"</div></div>");
%>

</body>
</html>