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
		response.sendRedirect("gestionAct.jsp");
	}
%>
</body>
</html>