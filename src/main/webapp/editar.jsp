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
	String nombre = request.getParameter("editarnom");
	String descrp = request.getParameter("editardesc");
	HttpSession sesion = request.getSession();
	int cod = (int)sesion.getAttribute("id_act");
	
	Actividad mp = new Actividad(cod,nombre,descrp);

	String result = "";
	if(mp.updateActividad(mp)){
		response.sendRedirect("gestionAct.jsp");
	}else{
		out.println("Algo salio mal");
	}
%>
</body>
</html>