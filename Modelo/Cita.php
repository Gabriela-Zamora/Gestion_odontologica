<?php 

	class Cita {

		private $Citnumero;
		private $Citfecha;
		private $Cithora;
		private $Citpaciente;
		private $Citmedico;
		private $Citconsultorio;
		private $Citestado;

		public function __construct($num,$fec,$hor,$pac,$med,$con,$est){

			$this->Citnumero = $num;
			$this->Citfecha = $fec;
			$this->Cithora = $hor;
			$this->Citpaciente = $pac;
			$this->Citmedico = $med;
			$this->Citconsultorio = $con;
			$this->Citestado = $est;

		}

		public function obtenerNumero(){
			return $this->Citnumero;
		}

		public function obtenerFecha(){
			return $this->Citfecha;
		}

		public function obtenerHora(){
			return $this->Cithora;
		}

		public function obtenerPaciente(){
			return $this->Citpaciente;
		}

		public function obtenerMedico(){
			return $this->Citmedico;
		}

		public function obtenerConsultorio(){
			return $this->Citconsultorio;
		}

		public function obtenerEstado(){
			return $this->Citestado;
		}

	}

?>