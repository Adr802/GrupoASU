<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestionar actividades</title>
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
		Actividad ac = new Actividad();

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
		String menu = pag.mostrarMenu(perfil);
		
		String respuesta="";
		String tipoDiv="";
		
		String error = request.getParameter("resultNewActividad");
		String eliminar = request.getParameter("eliminarActividad");
		if (error != null && !error.isEmpty()) {
			respuesta = error;
			tipoDiv = "class=\"alert alert-success\"  role=\"alert\"";
		}
		if (eliminar != null && !eliminar.isEmpty()) {
			respuesta = eliminar;
			tipoDiv = "class=\"alert alert-danger\"  role=\"alert\"";
		}
		out.print("<div id=\"centrarAct\">"
				+ "<div id = \"divEditarAct\">" 
				+ "<h2>Gestion de actividades</h2>"
				+ "<h3>Actividades dentro de la base de datos</h3>"
				+ ac.mostrarEditarActividades()
				+ "<a href=\"agregarAct.jsp\">"
				+ "<button>Nueva actividad</button>"
				+ "</a>"
				+ "<div " + tipoDiv + "style=\"margin-top: 30px;\">"
				+ respuesta + "</div>"
				+"</div></div>");
		}
		%>
	</main>
	
</body>
</html>