<?php
session_start();

if (!isset($_SESSION['rol']) || $_SESSION['rol'] != 1) {
	header('location: ../login.php');
}
?>
<!doctype html>
<html lang="es">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Meta -->
	<meta name="description" content="Hotel MI CIELO">
	<meta name="author" content="Hotel">
	<link rel="shortcut icon" href="../../backend/img/ico.png" />

	<!-- Title -->
	<title>Reporte recepción | Hotel "El Libertador"</title>


	<!-- *************
			************ Common Css Files *************
		************ -->
	<!-- Bootstrap css -->
	<link rel="stylesheet" href="../../backend/css/bootstrap.min.css">
	<!-- Icomoon Font Icons css -->
	<link rel="stylesheet" href="../../backend/fonts/style.css">
	<!-- Main css -->
	<link rel="stylesheet" href="../../backend/css/main.css">

	<!-- Data Tables -->
	<link rel="stylesheet" href="../../backend/vendor/datatables/dataTables.bs4.css" />
	<link rel="stylesheet" href="../../backend/vendor/datatables/dataTables.bs4-custom.css" />
	<link href="../../backend/vendor/datatables/buttons.bs.css" rel="stylesheet" />

	<!-- Notify -->
	<link rel="stylesheet" href="../../backend/vendor/notify/notify-flat.css" />

	<!-- EXPORTAR EXCEL -->
	<script src="https://unpkg.com/xlsx@0.16.9/dist/xlsx.full.min.js"></script>
	<script src="https://unpkg.com/file-saverjs@latest/FileSaver.min.js"></script>
	<script src="https://unpkg.com/tableexport@latest/dist/js/tableexport.min.js"></script>

	<!-- EXPORTAR EN PDF -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>


</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Sidebar wrapper start -->
		<nav id="sidebar" class="sidebar-wrapper">

			<!-- Sidebar brand start  -->
			<div class="sidebar-brand">
				<a href="../administrador/escritorio.php" class="logo">
					<img src="../../backend/img/rt.png" alt="Hotel mi cielo" />
				</a>
			</div>
			<!-- Sidebar brand end  -->

			<!-- Sidebar content start -->
			<div class="sidebar-content">

				<!-- sidebar menu start -->
				<div class="sidebar-menu">
					<ul>
						<li class="header-menu">General</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="icon-devices_other"></i>
								<span class="menu-text">Dashboards</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../administrador/escritorio.php">Admin Dashboard</a>
									</li>

								</ul>
							</div>
						</li>

						<li class="sidebar-dropdown">
							<a href="#">
								<i class="icon-briefcase"></i>
								<span class="menu-text">Gestión</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../recepcion/mostrar.php">Recepción</a>
									</li>
									<li>
										<a href="../salida/mostrar.php">Salida</a>
									</li>

								</ul>
							</div>
						</li>


						<li class="sidebar-dropdown">
							<a href="#">
								<i class="icon-archive"></i>
								<span class="menu-text">Tienda</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../venta/mostrar.php">Vender</a>
									</li>
									<li>
										<a href="../productos/mostrar.php">Productos</a>
									</li>
									<li>
										<a href="../categorias/mostrar.php">Categorias</a>
									</li>

								</ul>
							</div>
						</li>

						<li class="sidebar-dropdown">
							<a href="#">
								<i class="icon-settings1"></i>
								<span class="menu-text">Mantenimieto</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../habitacion/mostrar.php">Habitación</a>
									</li>
									<li>
										<a href="../h_categoria/mostrar.php">Categoria</a>
									</li>
									<li>
										<a href="../pisos/mostrar.php">Pisos</a>
									</li>

								</ul>
							</div>
						</li>

						<li class="sidebar-dropdown active">
							<a href="#">
								<i class="icon-bar-chart"></i>
								<span class="menu-text">Reportes</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../r_recepcion/mostrar.php" class="current-page">Recepción</a>
									</li>
									<li>
										<a href="../r_productos/mostrar.php">Productos</a>
									</li>


								</ul>
							</div>
						</li>


						<li class="sidebar-dropdown">
							<a href="#">
								<i class="icon-user1"></i>
								<span class="menu-text">Usuarios</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../usuarios/mostrar.php">Usuarios</a>
									</li>
									<li>
										<a href="../clientes/mostrar.php">Clientes</a>
									</li>


								</ul>
							</div>
						</li>


						<li class="sidebar-dropdown" style="display:none;">
							<a href="#">
								<i class="icon-calendar"></i>
								<span class="menu-text">Reservas</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="../rs_habitacion/mostrar.php">Habitaciones</a>
									</li>

								</ul>
							</div>
						</li>


					</ul>
				</div>
				<!-- sidebar menu end -->

			</div>
			<!-- Sidebar content end -->

		</nav>
		<!-- Sidebar wrapper end -->

		<!-- Page content start  -->
		<div class="page-content">

			<!-- Header start -->
			<header class="header">
				<div class="toggle-btns">
					<a id="toggle-sidebar" href="#">
						<i class="icon-list"></i>
					</a>
					<a id="pin-sidebar" href="#">
						<i class="icon-list"></i>
					</a>
				</div>
				<div class="header-items">
					<!-- Custom search start -->
					<div class="custom-search">
						<input type="text" class="search-query" placeholder="Search here ...">
						<i class="icon-search1"></i>
					</div>
					<!-- Custom search end -->

					<!-- Header actions start -->
					<ul class="header-actions">

						<li class="dropdown">
							<a href="#" id="userSettings" class="user-settings" data-toggle="dropdown" aria-haspopup="true">
								<span class="user-name"><?php echo $_SESSION['nombre']; ?></span>
								<span class="avatar">
									<img src="../../backend/img/user24.png" alt="avatar">
									<span class="status busy"></span>
								</span>
							</a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userSettings">
								<div class="header-profile-actions">
									<div class="header-user-profile">
										<div class="header-user">
											<img src="../../backend/img/user24.png" alt="Admin Template">
										</div>
										<h5>Julie Sweet</h5>
										<p>Admin</p>
									</div>
									<a href="../perfil/mostrar.php"><i class="icon-user1"></i> Mi Perfil</a>
									<a href="../cuenta/mostrar.php"><i class="icon-settings1"></i> Configuración de la cuenta</a>
									<a href="../pages-logout.php"><i class="icon-log-out1"></i> Salir</a>
								</div>
							</div>
						</li>
					</ul>
					<!-- Header actions end -->
				</div>
			</header>
			<!-- Header end -->


			<!-- Page header start -->
			<div class="page-header">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Home</li>
					<li class="breadcrumb-item active">Reportes recepción</li>
				</ol>
			</div>
			<!-- Page header end -->
			<!-- Main container start -->

			<div class="main-container">
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="table-container">
							<div class="t-header">Reporte recepción</div>
							<div class="documents-header">



								<button onclick="descargarPDF()" class="btn btn-success">
									<i class="fas fa-file-pdf"></i> Exportar a PDF
								</button>

								<button id="btnExportarExcel" class="btn btn-success">
									<i class="fas fa-file-excel"></i> Exportar a Excel
								</button>

							</div>
							<div class="table-responsive">

								<?php
								require_once('../../backend/config/Conexion.php');
								$sentencia = $connect->prepare("SELECT
								clientes.iddn,
								clientes.nomc,
								habitaciones.numiha,
								habitaciones.detaha,
								habitaciones.precha,
								reservar.fecha_ingreso,
								reservar.feentra,
								reservar.fesal
							FROM
								reservar
							JOIN clientes ON reservar.iddn = clientes.iddn
							JOIN habitaciones ON reservar.idhab = habitaciones.idhab;
							");
								$sentencia->execute();
								$data =  array();
								if ($sentencia) {
									while ($r = $sentencia->fetchObject()) {
										$data[] = $r;
									}
								}
								?>
								<?php if (count($data) > 0) : ?>

									<table id="tabla" class="table custom-table">
										<thead>
											<tr>
												<th>Cliente</th>
												<th>Número de la habitación</th>
												<th>Detalle de la habitación</th>
												<th>Precio de la habitación</th>
												<th>Fecha de Reserva</th>
												<th>Fecha de Ingreso</th>
												<th>Fecha de Salida</th>
											</tr>
										</thead>

										<tbody>
											<?php foreach ($data as $d) : ?>
												<tr>

													<td><?php echo $d->nomc ?></td>
													<td><?php echo $d->numiha ?></td>
													<td><?php echo $d->detaha ?></td>
													<td>S/.<?php echo $d->precha ?></td>
													<td><?php echo $d->fecha_ingreso ?></td>
													<td><?php echo $d->feentra ?></td>
													<td><?php echo $d->fesal ?></td>
													<td>
														<button onclick="imprimirRecibo(<?php echo $d->numiha ?>, '<?php echo $d->nomc ?>')">Imprimir Recibo</button>
													</td>
												</tr>

											<?php endforeach; ?>
										</tbody>

									</table>
								<?php else : ?>
									<p class="alert alert-warning">No hay registros</p>
								<?php endif; ?>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main container end -->

		</div>
		<!-- Page content end -->

	</div>
	<!-- Page wrapper end -->

	<!-- MODAL-ELIMINAR -->


	<script>
		// Función para imprimir el recibo en PDF
		function imprimirRecibo(numeroHabitacion, nombreCliente) {
			// Redirigir a la página PHP que genera el PDF
			window.location.href = 'generar_pdf.php?numiha=' + numeroHabitacion + '&nomc=' + encodeURIComponent(nombreCliente);
		}
	</script>

	<script>
		const $btnExportarExcel = document.querySelector("#btnExportarExcel");
		const $btnExportarPDF = document.querySelector("#btnExportarPDF");
		const $tabla = document.querySelector("#tabla");

		// Función para exportar a Excel
		$btnExportarExcel.addEventListener("click", function() {
			let tableExport = new TableExport($tabla, {
				exportButtons: false,
				filename: "Reporte Recepción",
				sheetname: "Reporte Recepción",
			});
			let datos = tableExport.getExportData();
			let preferenciasDocumento = datos.tabla.xlsx;
			tableExport.export2file(preferenciasDocumento.data, preferenciasDocumento.mimeType, preferenciasDocumento.filename, preferenciasDocumento.fileExtension, preferenciasDocumento.merges, preferenciasDocumento.RTL, preferenciasDocumento.sheetname);
		});

		// Función para exportar a PDF
		function descargarPDF() {
			var elemento = document.getElementById('tabla');
			var opt = {
				margin: 1,
				filename: 'tabla.pdf',
				image: {
					type: 'jpeg',
					quality: 0.98
				},
				html2canvas: {
					scale: 2
				},
				jsPDF: {
					unit: 'pt',
					format: 'a4',
					orientation: 'portrait'
				}
			};
			html2pdf().from(elemento).set(opt).save();
		}
	</script>


	<!-- Required jQuery first, then Bootstrap Bundle JS -->
	<script src="../../backend/js/jquery.min.js"></script>
	<script src="../../backend/js/bootstrap.bundle.min.js"></script>
	<script src="../../backend/js/moment.js"></script>

	<!-- Data Tables -->
	<script src="../../backend/vendor/datatables/dataTables.min.js"></script>
	<script src="../../backend/vendor/datatables/dataTables.bootstrap.min.js"></script>


	<!-- Custom Data tables -->
	<script src="../../backend/vendor/datatables/custom/custom-datatables.js"></script>
	<script src="../../backend/vendor/datatables/custom/fixedHeader.js"></script>



	<!-- Main JS -->
	<script src="../../backend/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<!-- Notify js -->
	<script src="../../backend/js/jquery.easing.1.3.js"></script>
	<script src="../../backend/vendor/notify/notify.js"></script>
	<script src="../../backend/vendor/notify/notify-custom.js"></script>


</body>

</html>