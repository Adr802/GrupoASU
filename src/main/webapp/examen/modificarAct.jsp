<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modificar</title>
</head>
<body>
	<%
	int cod = Integer.parseInt(request.getParameter("cod"));
	Actividad mp = new Actividad();
	mp.consulEditarActividad(cod);
	HttpSession sesion = request.getSession();
	sesion.setAttribute("id_act", cod);
%>
	<form action="editar.jsp" method="post">
		<table>


			<tr>
				<td>Nombre: </td>
				<td><input type="text" name="editarnom" value="<%=mp.getNombre()%>"/></td>

			</tr>
			<tr>
				<td>Descripcion</td>
				<td><input type="text" name="editardesc" value="<%=mp.getDescripcion() %>" /></td>
			</tr>

		
		</table>
		<br /> <br /> <input type="submit" name="Actualizar" />
	</form>

</body>
</html>