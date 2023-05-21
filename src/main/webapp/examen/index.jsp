<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grupo Misionero Salesiano</title>
<link rel="stylesheet" href="css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>

	<header>
		<nav>
			<ul>
				<li><a href="index.jsp" class="presionado">Inicio</a></li>
				<li><a href="eventos.jsp">Actividades</a></li>
				<li><a href="nosotros.jsp">Sobre Nosotros</a></li>
				<li><a href="inicioSesion.jsp">Iniciar Sesion</a></li>
			</ul>
		</nav>
		<div id="logos">
			<img alt="" src="img/logo_salesiano.png" id="lsal"> <img alt=""
				src="img/logo_ups.png" id="lups">
		</div>
	</header>

	<div id="cuerpo">
		<center><h1>Grupo Misionero Salesiano</h1></center>
		<div id="carouselExampleIndicators" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/bosco.jpg" class="d-block w-100" alt="..." width="100px" height="620px">
				</div>
				<div class="carousel-item">
					<img src="img/misionero1.png" class="d-block w-100" alt="..." width="100px" height="620px">
				</div>
				<div class="carousel-item">
					<img src="img/misionero1.png" class="d-block w-100" alt="..." width="100px" height="620px">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div class="contenido">
			<img alt="" src="img/misionero1.png" class="imgInicio">
			<div>
				<p>Descripcion
				<p>
				<p>La fe y los valores del Evangelio son un punto de apoyo que
					hacen posible madurar opciones de vida generosa y auténticas al
					servicio de la Iglesia y la sociedad. Desde esta perspectiva, el
					Grupo Misionero Salesiano procura transmitir entre los más
					necesitados el mensaje de amor y fraternidad de Dios a través de
					experiencias de evangelización y de promoción humana.</p>
			</div>

		</div>
		<div class="contenido">
			<div>
				<p>Historia
				<p>
				<p>La fe y los valores del Evangelio son un punto de apoyo que
					hacen posible madurar opciones de vida generosa y auténticas al
					servicio de la Iglesia y la sociedad. Desde esta perspectiva, el
					Grupo Misionero Salesiano procura transmitir entre los más
					necesitados el mensaje de amor y fraternidad de Dios a través de
					experiencias de evangelización y de promoción humana.</p>
			</div>
			<img alt="" src="img/misionero1.png" class="imgInicio">
		</div>
		<div class="contenido">
			<div class="act-box">
				<p>Actividades</p>
				<ul>
					<li>Encuentros Formativos Semanales</li>
					<li>Misiones de Semana Santa (abril)</li>
					<li>Misiones de Verano (agosto)</li>
					<li>Misiones de Navidad (diciembre)</li>
				</ul>
			</div>
			<div class="act-box">
				<p>Horarios</p>
				<ul>
					<li>Sábados. 17:00-18:00</li>

				</ul>
			</div>
		</div>


	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

	<footer>
		<a href="registro.jsp" class="btnRegistro">REGISTRATE!</a>
	</footer>
</body>
</html>