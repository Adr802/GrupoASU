<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Postular</title>
</head>
<body>
	<h3>Registro de postulacion</h3>
	<p>Los datos sera tomados automaticamente de su cuenta</p>
	<form method="post" action="respuestaPostular.jsp">
		<%
			Usuario us = new Usuario();
			out.print(us.getNombre());
			HttpSession sesion = request.getSession();
			out.print(sesion.getAttribute("correo"));
		%>
		<label>Hoja de vida</label>
		<input type="file">
		<input type="submit">
	</form>
</body>
</html>