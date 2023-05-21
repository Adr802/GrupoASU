<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar Actividad</title>
</head>
<style>
	.ingreso-form{
		display: flex;
		flex-direction: column;
	}
</style>

<body>

	<form method="post" action="respuestaActividad.jsp">
	
		<div class="ingreso-form">
			Nombre de la actividad: <input type="text" name="txtNombre" required="required">
		</div>
		<div class="ingreso-form">
			Descripcion: <input type="text" name="txtDesc" required="required">
		</div>
		<div class="ingreso-form">
			Foto: <input type="file">
		</div>

		<div class="ingreso-form">
			<input type="submit" value="Agregar">
		</div>
	</form>
	<%
String error = request.getParameter("resultNewActividad");
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