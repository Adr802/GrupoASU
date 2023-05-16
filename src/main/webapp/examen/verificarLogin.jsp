<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="com.negocio.*"
	import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VERIFICAR</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession(); //Se crea la variable de sesión
	Usuario usuario = new Usuario();
	String nlogin = request.getParameter("username");
	String nclave = request.getParameter("password");
	boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
	if (respuesta) {
		sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
		sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
		response.sendRedirect("menu.jsp"); //Se redirecciona a una página específica
	} else {
	%>
	<jsp:forward page="inicioSesion.jsp">
		<jsp:param name="error"
			value="Usuario o contrasena incorrectos<br>Vuelva a intentarlo" />
	</jsp:forward>
	<%
	}
	%>
</body>
</html>