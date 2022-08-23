<?php
//Incluimos el fichero de conexion
//require("../Modelo/Conexion.php");

//Incluimos la libreria PDF
require('Vista/fpdf/fpdf.php');

class PDF extends FPDF {
    // Page header
    function Header() {
        // Add logo to page
        //$this->Image('Vista/img/3.png',15,7.5,15);

        // Set font family to Arial bold 
        $this->SetFont('Arial','B',13);

        // Move to the right
        $this->Cell(80);

        // Header
        $this->Cell(95,10,'Comprobante de cita',1,0,'C');

        // Line break
        $this->Ln(20);
    }

    // Page footer
    function Footer() {

        // Position at 1.5 cm from bottom
        $this->SetY(-15);

        // Arial italic 8
        $this->SetFont('Arial','I',8);

        // Page number
        $this->Cell(0,10,'Pag. ' . 
            $this->PageNo() . '/{nb}',0,0,'C');
    }
}

// Instantiation of FPDF class
$pdf = new PDF('L','mm','A4');

// Define alias for number of pages
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',14);
////////////////////////////////////////////////////////////////////////////////

// // Declaramos el ancho de las columnas
// //$pdf->SetLeftMargin(55);
$w = array(38, 45, 35);
// //          N   A  D    E   G   E  P  LGN  ESC
$pdf->Text(20,35,"DATOS DE LA CITA",1);
$pdf->Ln();
$pdf->Text(20,45,"Cita:",1);
$pdf->Ln();
$pdf->Text(20,52,"Fecha:",1);
$pdf->Ln();
$pdf->Text(20,60,"Hora:",1);
$pdf->Ln();
$pdf->Text(20,68,"Consultorio:",1);
$pdf->Ln();
$pdf->Text(20,75,"Estado:",1);
$pdf->Ln();
$pdf->Text(20,95,"DATOS DEL MEDICO",1);
$pdf->Ln();
$pdf->Text(20,105,"Documento:",1);
$pdf->Ln();
$pdf->Text(20,112,"Nombre:",1);
$pdf->Ln();
$pdf->Text(20,129,"DATOS DEL PACIENTE",1);
$pdf->Ln();
$pdf->Text(20,137,"Documnento:",1);
$pdf->Ln();
$pdf->Text(20,145,"Nombre:",1);
$pdf->Ln();

// Mostrar contenido Tabla
foreach($result as $row) {
    $pdf->Text(47,45,$row['citnumero']);
    $pdf->Ln();
    $pdf->Text(47,52,$row['citfecha']);
    $pdf->Ln();
    $pdf->Text(47,60,$row['cithora']);
    $pdf->Ln();
    $pdf->Text(47,68,$row['citconsultorio']);
    $pdf->Ln();
    $pdf->Text(47,75,$row['citestado']);
    $pdf->Ln();
    $pdf->Text(47,105,$row['citmedico']);
    $pdf->Ln();
    $pdf->Text(47,113,$row['mednombres']);
    $pdf->Ln();
    $pdf->Text(47,137,$row['citpaciente']);
    $pdf->Ln();
    $pdf->Text(47,145,$row['pacnombres']);
    $pdf->Ln();
    }

//$pdf -> output();
?>