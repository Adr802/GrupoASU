<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
</head>
<body>
	<form action="respuesta.jsp" method="post" id="registro-form">
		<div>
			Nombre: <input type="text" name="txtNombre" />
		</div>
		<div>
			Cédula: <input type="text" name="txtCedula" maxlength="10" />
		</div>

		<div>
			Correo: <input type="text" name="txtCorreo" />
		</div>
		<div>
			Celular: <input type="text" name="txtCelular" />
		</div>
		<div>
		 	Carrera:<input type="text" name="txtCarrera" />
		</div>
		<div>
			Contraseña: <input type="password" name="txtPass" />
		</div>
		<div>
			<input type="submit" value="Registrarse" /> <input type="reset" />
		</div>
	</form>
</body>
</html>