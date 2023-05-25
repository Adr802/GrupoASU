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
	Postulacion mp = new Postulacion();
	int cod = Integer.parseInt(request.getParameter("cod"));
	if(mp.modificarEstado(cod, "2")){
		%>
			<jsp:forward page="solicitudes.jsp" >
<jsp:param name="resultAceptarActividad" value="Usuario rechazado" />
		</jsp:forward>
<%
	}
%>
</body>
</html>