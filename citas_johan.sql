-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-04-2022 a las 14:52:38
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas_johan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CitNumero` int(11) NOT NULL,
  `CitFecha` date NOT NULL,
  `CitHora` varchar(10) NOT NULL,
  `CitPaciente` char(10) NOT NULL,
  `CitMedico` char(10) NOT NULL,
  `CitConsultorio` int(3) NOT NULL,
  `CitEstado` enum('Asignada','Cumplida') NOT NULL DEFAULT 'Asignada'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `ConNumero` int(3) NOT NULL,
  `ConNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `MedIdentificacion` char(10) NOT NULL,
  `MedNombres` varchar(50) NOT NULL,
  `MedApellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `PacIdentificacion` char(10) NOT NULL,
  `PacNombres` varchar(50) NOT NULL,
  `PacApellidos` varchar(50) NOT NULL,
  `PacFechaNacimiento` date NOT NULL,
  `PacSexo` enum('M','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`PacIdentificacion`, `PacNombres`, `PacApellidos`, `PacFechaNacimiento`, `PacSexo`) VALUES
('1098343678', 'Juan Antonio', 'Pérez Pereira', '1978-08-09', 'M'),
('29234333', 'Alejandra Marcela', 'Diaz Granados', '1980-03-24', 'F'),
('37456298', 'Diana Marcela', 'Estévez', '1985-09-06', 'F'),
('51890654', 'Adriana Maria', 'Pataquiva', '1990-12-24', 'F'),
('91222333', 'Carlos Jesus', 'Rodriguez Cala', '1970-01-23', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `TraNumero` int(11) NOT NULL,
  `TraFechaAsignado` date NOT NULL,
  `Descripcion` text NOT NULL,
  `TraFechaInicio` date NOT NULL,
  `TraFechaFin` date NOT NULL,
  `TraObservaciones` text NOT NULL,
  `TraPacientes` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`TraNumero`, `TraFechaAsignado`, `Descripcion`, `TraFechaInicio`, `TraFechaFin`, `TraObservaciones`, `TraPacientes`) VALUES
(1, '2017-07-13', 'Tratamiento de conductos', '2017-08-01', '2017-08-03', 'Paciente con hipertensión', '91222333'),
(2, '2017-07-02', 'Profilaxis', '2017-07-02', '2017-07-02', 'Sin novedad', '51890654'),
(3, '2017-06-05', 'Resina', '2017-06-05', '2017-06-05', 'Paciente con sensibilidad', '37456298'),
(4, '2017-05-23', 'Profilaxis', '2017-05-23', '2017-05-23', 'Sin novedad', '29234333');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CitNumero`),
  ADD KEY `CitPaciente` (`CitPaciente`),
  ADD KEY `CitMedico` (`CitMedico`),
  ADD KEY `CitConsultorio` (`CitConsultorio`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`ConNumero`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`MedIdentificacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`PacIdentificacion`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`TraNumero`),
  ADD KEY `TraPacientes` (`TraPacientes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `CitNumero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `TraNumero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`CitPaciente`) REFERENCES `pacientes` (`PacIdentificacion`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`CitMedico`) REFERENCES `medicos` (`MedIdentificacion`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`CitConsultorio`) REFERENCES `consultorios` (`ConNumero`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`TraPacientes`) REFERENCES `pacientes` (`PacIdentificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
