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
				boolean verificar = user.verificarExistencia(cedula,correo);
				if(verificar){
					user.insertarUsuario(nombre, cedula, correo, carrera, contra, celular);
					%>
						
						<jsp:forward page="inicioSesion.jsp">
						<jsp:param name="userRegistrado" value= "Usuario registrado correctamente" />
						</jsp:forward>
						
					<%
				}else{
					%>
					<jsp:forward page="registro.jsp" >
					<jsp:param name="error" value= "El usuario o correo ya existe dentro del sistema" />
					</jsp:forward>
					<%
				}
				%>
</body>
</html>