-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2022 a las 18:58:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `citnumero` int(11) NOT NULL,
  `citfecha` date NOT NULL,
  `cithora` varchar(10) NOT NULL,
  `citpaciente` char(10) NOT NULL,
  `citmedico` char(10) NOT NULL,
  `citconsultorio` int(3) NOT NULL,
  `citestado` enum('Asignada','Cumplida','Solicitada','Cancelada') NOT NULL DEFAULT 'Asignada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`citnumero`, `citfecha`, `cithora`, `citpaciente`, `citmedico`, `citconsultorio`, `citestado`) VALUES
(101, '2022-08-15', '17:40', '1005755181', '12345', 1, 'Asignada'),
(102, '2022-08-31', '08:40:00', '1005755181', '12345', 2, 'Solicitada'),
(103, '2022-08-30', '08:20:00', '1005755181', '67890', 2, 'Solicitada'),
(104, '2022-08-01', '08:00:00', '1005755181', '12345', 2, 'Solicitada'),
(105, '2022-08-01', '08:00:00', '1005755181', '12345', 2, 'Solicitada'),
(106, '2022-08-28', '09:00:00', '1005755181', '67890', 1, 'Solicitada'),
(107, '2022-08-28', '09:00:00', '1005755181', '67890', 1, 'Solicitada'),
(108, '2022-08-28', '09:00:00', '1005755181', '67890', 1, 'Solicitada'),
(109, '2022-08-22', '08:00:00', '1005755181', '12345', 1, 'Solicitada'),
(110, '2022-08-23', '09:00:00', '1005755181', '12345', 2, 'Solicitada'),
(111, '2022-08-23', '09:00:00', '1005755181', '12345', 2, 'Solicitada'),
(112, '2022-09-02', '08:20:00', '1005755181', '12345', 2, 'Cancelada'),
(113, '2022-09-02', '08:20:00', '1005755181', '12345', 2, 'Cancelada'),
(114, '2022-08-04', '08:20:00', '1005755181', '12345', 2, 'Cancelada'),
(119, '2022-08-23', '08:20:00', '1005755181', '12345', 1, 'Cancelada'),
(120, '2022-08-10', '08:20:00', '1000707719', '12345', 1, 'Cancelada'),
(121, '2022-08-10', '08:20:00', '1000707719', '12345', 1, 'Solicitada'),
(122, '2022-08-17', '08:20:00', '1000707719', '12345', 2, 'Solicitada'),
(123, '2022-08-16', '08:00:00', '1000707719', '12345', 2, 'Solicitada'),
(124, '2022-08-09', '08:20:00', '1000707719', '12345', 1, 'Solicitada'),
(125, '2022-08-17', '08:40:00', '1000707719', '12345', 2, 'Solicitada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `connumero` int(3) NOT NULL,
  `connombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`connumero`, `connombre`) VALUES
(1, 'Consultas 1'),
(2, 'Tratamientos 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `medidentificacion` char(10) NOT NULL,
  `mednombres` varchar(50) NOT NULL,
  `medapellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`medidentificacion`, `mednombres`, `medapellidos`) VALUES
('12345', 'Pepito', 'Pérez'),
('67890', 'Pepita', 'Mendieta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `pacidentificacion` char(10) NOT NULL,
  `pacnombres` varchar(50) NOT NULL,
  `pacapellidos` varchar(50) DEFAULT NULL,
  `paccechanacimiento` date NOT NULL,
  `pacsexo` enum('M','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`pacidentificacion`, `pacnombres`, `pacapellidos`, `paccechanacimiento`, `pacsexo`) VALUES
('1000707719', 'Andres', 'Bohorquez', '2002-05-02', 'M'),
('1005755181', 'Miguel', 'Oviedo', '2001-04-04', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `TraNumero` int(11) NOT NULL,
  `TraFechaAsignada` date NOT NULL,
  `TraDescripcion` text NOT NULL,
  `TraFechaInicio` date NOT NULL,
  `TraFechaFin` date NOT NULL,
  `TraObservaciones` text NOT NULL,
  `TraPaciente` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`citnumero`),
  ADD KEY `CitPaciente` (`citpaciente`),
  ADD KEY `CitMedico` (`citmedico`),
  ADD KEY `CitConsultorio` (`citconsultorio`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`connumero`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`medidentificacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`pacidentificacion`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`TraNumero`),
  ADD KEY `TraPaciente` (`TraPaciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `citnumero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `TraNumero` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`citpaciente`) REFERENCES `pacientes` (`pacidentificacion`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`citmedico`) REFERENCES `medicos` (`medidentificacion`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`citconsultorio`) REFERENCES `consultorios` (`connumero`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`TraPaciente`) REFERENCES `pacientes` (`pacidentificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
