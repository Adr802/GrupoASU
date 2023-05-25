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
	Actividad mp = new Actividad();
	String nombre = request.getParameter("txtNombre");
	String desc = request.getParameter("txtDesc");
	String img = request.getParameter("foto");
	
	if(mp.agregarActividad(nombre, desc, img)){
		%>
			<jsp:forward page="gestionAct.jsp" >
<jsp:param name="resultNewActividad" value="Nueva Actividad Agregada" />
		</jsp:forward>

		<%
	}else{
		%>
			<jsp:forward page="agregarAct.jsp" >
			<jsp:param name="resultNewActividad" value= "Error Al ingresar la nueva actividad" />
					</jsp:forward>
			
		<%
	}
%>

</body>
</html>