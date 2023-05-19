<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="com.negocio.*"%>
<!DOCTYPE  html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Grupo Misionero Salesiano</title>
<!--Enlace css-->
<link rel="stylesheet" href="css/styleMenu.css">

</head>

<body background="img/bosco.jpg" style="background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        background-attachment: fixed;">
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
			String menu = pag.mostrarMenu(perfil);
			out.print("<div id=\"cuerpo-menu\"><div id=\"contenedor-menu\"><div id=\"hpagina\"><p class=\"puser\">Bienvenido "+usuario+"</h3>"+menu+"</div>" +
					  "<img src=\"img/misionero1.png\" id=\"img-menu\"></div>"
					  +"<div id=\"menu-img\"><img alt=\"\" src=\"img/logo_salesiano.png\" id=\"lsal\">" 
					  +	"<img alt=\"\" src=\"img/logo_ups.png\" id=\"lups\"></div></div>");
		}
		%>
	</main>
</body>
</html>
