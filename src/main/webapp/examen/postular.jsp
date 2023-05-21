<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Postular</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<h3>Registro de postulacion</h3>
	<p>Los datos sera tomados automaticamente de su cuenta</p>
	<form method="post" action="respuestaPostular.jsp">
		<%
			Usuario us = new Usuario();
			HttpSession sesion = request.getSession();
		%>
		<p>Hoja de vida</p>
		<input type="file">
		<br>
		<input type="submit">
	</form>
	<%
		String exito = request.getParameter("exito");
		if (exito != null && !exito.isEmpty()) {
		%>
		<div class="alert alert-success" role="alert">
			<%=exito%>
		</div>
		<%
		}
		%>
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
</body>
</html>