<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<title>Solicitudes</title>
</head>
<body>
<%
	Postulacion p  = new Postulacion();
	String error = request.getParameter("resultAceptarActividad");
	if (error != null && !error.isEmpty() && error.equals("Usuario Aceptado")) {
	%>
	<div class="alert alert-success" role="alert">
		<%=error%>
	</div>
	<%
	}else if(error != null && !error.isEmpty() && error.equals("Usuario rechazado")){
		%>
		<div class="alert alert-danger" role="alert">
			<%=error%>
		</div>
		<%
	}
	%>
	<%
	out.print("<div><p>Tabla de postulaciones pendientes</p>" + p.tablaPostulacionPendiente()+"</div>");
	out.print("<div><p>Tabla de postulaciones rechazadas</p>" + p.tablaPostulacionRechazada()+"</div>");
	out.print("<div><p>Tabla de postulaciones aceptadas</p>" + p.tablaPostulacionAceptada()+"</div>");

%>

</body>
</html>