<?php
session_start();

// Verificar si los parámetros están presentes en la URL
if (!isset($_GET['numiha']) || !isset($_GET['nomc'])) {
    die("Parámetros faltantes");
}

// Recuperar parámetros de la URL
$numeroHabitacion = $_GET['numiha'];
$nombreCliente = $_GET['nomc'];

// Realizar la consulta SQL
$consulta = "SELECT
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
              JOIN habitaciones ON reservar.idhab = habitaciones.idhab
              WHERE
                habitaciones.numiha = $numeroHabitacion
                AND clientes.nomc = '$nombreCliente'";

// Conectar a la base de datos (ajusta según tu configuración)
$conexion = new mysqli('localhost', 'root', '', 'sistemahotel');

// Verificar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

// Ejecutar la consulta
$resultado = $conexion->query($consulta);

// Verificar si la consulta fue exitosa
if (!$resultado) {
    die("Error en la consulta: " . $conexion->error);
}

// Obtener el primer resultado
$d = $resultado->fetch_object();

// Cerrar la conexión a la base de datos
$conexion->close();

// Crear una instancia de FPDF
require '../../backend/fpdf/fpdf.php';
$pdf = new FPDF('L');
$pdf->AddPage();

// Encabezado del PDF
$pdf->SetFont('Arial', 'B', 8);
$pdf->SetFillColor(200, 220, 220); // Color de fondo
$pdf->Cell(0, 20, utf8_decode('Recibo Hotel el Libertador'), 0, 1, 'C', true); // Con fondo


// Contenido del PDF
$pdf->Cell(40, 10, utf8_decode('Cliente'), 1, 0, 'C', true);
$pdf->Cell(25, 10, utf8_decode('Habitación'), 1, 0, 'C', true);
$pdf->Cell(90, 10, utf8_decode('Detalle'), 1, 0, 'C', true);
$pdf->Cell(30, 10, utf8_decode('Precio'), 1, 0, 'C', true);
$pdf->Cell(30, 10, utf8_decode('Fecha Reserva'), 1, 0, 'C', true);
$pdf->Cell(30, 10, utf8_decode('Fecha Ingreso'), 1, 0, 'C', true);
$pdf->Cell(30, 10, utf8_decode('Fecha Salida'), 1, 1, 'C', true);


$pdf->Cell(40, 10, utf8_decode($d->nomc), 1);
$pdf->Cell(25, 10, utf8_decode($d->numiha), 1);
$pdf->Cell(90, 10, utf8_decode($d->detaha), 1);
$pdf->Cell(30, 10, utf8_decode('S/.' . $d->precha), 1);
$pdf->Cell(30, 10, utf8_decode($d->fecha_ingreso), 1);
$pdf->Cell(30, 10, utf8_decode($d->feentra), 1);
$pdf->Cell(30, 10, utf8_decode($d->fesal), 1);

$pdf->Cell(0, 10, '', 0, 1);

// Total y Monto
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(40, 10, utf8_decode('Total'), 0, 0);
$pdf->Cell(40, 10, utf8_decode('Monto'), 0, 1);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(40, 10, utf8_decode(''), 0, 0); // Celda vacía para Total
$pdf->Cell(40, 10, utf8_decode(''), 0, 1); // Celda vacía para Monto


// Nombre del archivo PDF
$nombreArchivo = 'Recibo_Habitacion_' . $d->numiha . '.pdf';

// Salida del PDF al navegador
$pdf->Output($nombreArchivo, 'D');
