<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- CAPTURAR DATOS DEL REQUEST -->
				<%
				
				String nombre = request.getParameter("txtNombre");
				String cedula = request.getParameter("txtCedula");
				String correo = request.getParameter("txtCorreo");
				String carrera = request.getParameter("txtCarrera");
				String contra = request.getParameter("txtPass");
				String celular = request.getParameter("txtCelular");
				Usuario user = new Usuario();
				boolean verificar = user.verificarExistencia(cedula);
				if(verificar){
					user.insertarUsuario(nombre, cedula, correo, carrera, contra, celular);
					%>
						
						<jsp:forward page="inicioSesion.jsp"/>
						
					<%
				}else{
					%>
					<h3>NO PUEDE INSCRBIRSE</h3>
					<%
				}
				%>
</body>
</html>