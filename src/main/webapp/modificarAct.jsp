<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modificar</title>
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
				<li><a href="inicioSesion.jsp" class="presionado">Menu de
						usuario</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> <img alt=""
				src="img/logo_ups.png" id="lups">
		</div>
	</header>
	<%
	int cod = Integer.parseInt(request.getParameter("cod"));
	Actividad mp = new Actividad();
	mp.consulEditarActividad(cod);
	HttpSession sesion = request.getSession();
	sesion.setAttribute("id_act", cod);
	%>
	<div class="div-Ingreso">
		<h1>Modificar actividad</h1>
		<div class="card">
			<form action="editar.jsp" method="post">
				<table>
					<tr>
						<td>Nombre:</td>
						<td><input type="text" name="editarnom"
							value="<%=mp.getNombre()%>" /></td>
					</tr>
					<tr>
						<td>Descripcion:</td>
						<td><textarea name="editardesc" class="inDesc"><%=mp.getDescripcion()%></textarea></td>

					</tr>
				</table>
				<br> <br> <input type="submit" name="Actualizar"
					value="Actualizar">
			</form>
		</div>
	</div>

</body>
</html>