<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestionar actividades</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

</head>
<body>
	<p>AGREGAR ACTIVIDAD</p>
	<a href="agregarAct.jsp">
  	<button>Agregar</button>
	</a>
	<%
	Actividad ac = new Actividad();
	out.print(ac.mostrarEditarActividades());
	

		String error = request.getParameter("resultNewActividad");
		if (error != null && !error.isEmpty()) {
		%>
		<div class="alert alert-success" role="alert">
			<%=error%>
		</div>
		<%
		}
		%>
</body>
</html>