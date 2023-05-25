<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Postular</title>
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
				<li><a href="inicioSesion.jsp" class="presionado">Menu de usuario</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="Logo de la Del grupo misionero salesiano" src="img/logo_salesiano.png" id="lsal"> 
			<img alt="Logo de la Universidad Politecnica Salesiana" src="img/logo_ups.png" id="lups">
		</div>
	</header>
	<main>
		<%
		String usuario = "";
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("usuario") == null) {
		%>
		<jsp:forward page="inicioSesion.jsp">
			<jsp:param name="error" value="Debe registrarse en el sistema." />
		</jsp:forward>
		<%
		} else {
		usuario = (String) sesion.getAttribute("usuario");
		int perfil = (Integer) sesion.getAttribute("perfil");
		sesion.setAttribute("correo", sesion.getAttribute("correo"));
		Pagina pag = new Pagina();
		
		Usuario us = new Usuario();
		sesion = request.getSession();
		String respuesta="";
		String tipoDiv="";
		
		String exito = request.getParameter("exito");
		if (exito != null && !exito.isEmpty()) {
			respuesta = exito;
			tipoDiv = "class=\"alert alert-success\"  role=\"alert\"";
		}
		String error = request.getParameter("error");
		if (error != null && !error.isEmpty()) {	
			respuesta = error;
			tipoDiv = "class=\"alert alert-danger\" role=\"alert\"";
		}
		
		
		
		String menu = pag.mostrarMenu(perfil);
		out.print("<div id=\"cuerpo-menu\"><div id=\"contenedor-menu\"><div id=\"hpagina\"><p class=\"puser\">Bienvenido "
				+ usuario + "</h3>" + menu + "</div>"
				+ "<div id =\"div-post\"><h3>Registro de postulacion</h3>"
				+"<p>Los datos sera tomados automaticamente de su cuenta</p>"
				+"<form method=\"post\" action=\"respuestaPostular.jsp\">"
				+ "<p>Hoja de vida</p>"
				+ "<input type=\"file\"> <br> <input type=\"submit\">"
				+ "</form>"
				+ "<div>" + us.getEstado((String)sesion.getAttribute("correo"))
				+ "</div>"
				+ "<div " + tipoDiv + ">"
				+ respuesta
				+"</div></div>"
				+"</div>");
		}
	%>
	</main>


</body>
</html>