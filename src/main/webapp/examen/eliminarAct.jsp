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
	int cod = Integer.parseInt(request.getParameter("cod"));
	Actividad mp = new Actividad();
	
	if(mp.eliminarActividad(cod)){
		%>
		<jsp:forward page="gestionAct.jsp">
		<jsp:param name="eliminarActividad"
			value="Actividad eliminada del registro" />
		</jsp:forward>
		<%
	}
%>

</body>
</html>