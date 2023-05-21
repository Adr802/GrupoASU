<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			HttpSession sesion = request.getSession();
			Postulacion p = new Postulacion((String)sesion.getAttribute("correo"));
			if(p.newPostulacion()){
				%>
					<jsp:forward page="postular.jsp">
					<jsp:param name="exito" value= "Postulacion registrada correctamente" />
					</jsp:forward>
				<%
			}else{
				%>
					<jsp:forward page="postular.jsp">
					<jsp:param name="error" value= "Este usuario ya tiene una postulacion activa o ya fue aceptado" />
					</jsp:forward>
				<%
			}
		%>				
</body>
</html>