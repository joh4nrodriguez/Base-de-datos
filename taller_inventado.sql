-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 13:20:09
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
-- Base de datos: `taller_inventado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `propietario_cod_pro` varchar(20) NOT NULL,
  `muelle_cod_mue` varchar(20) NOT NULL,
  `fec_alq` date NOT NULL,
  `lug_alq` varchar(25) NOT NULL,
  `cod_alq` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`propietario_cod_pro`, `muelle_cod_mue`, `fec_alq`, `lug_alq`, `cod_alq`) VALUES
('67832', '267181', '2022-03-30', '1', '672'),
('76549', '227692', '2022-03-31', '2', '326'),
('76549', '227692', '2022-03-31', '1', '672');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barco`
--

CREATE TABLE `barco` (
  `cod_bar` varchar(20) NOT NULL,
  `propietario_cod_pro` varchar(20) NOT NULL,
  `nom_bar` varchar(20) NOT NULL,
  `col_bar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `barco`
--

INSERT INTO `barco` (`cod_bar`, `propietario_cod_pro`, `nom_bar`, `col_bar`) VALUES
('56773', '76549', 'Esperanza', 'Rojo'),
('6738', '67832', 'Tolima', 'Blanco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muelle`
--

CREATE TABLE `muelle` (
  `nom_mue` varchar(25) NOT NULL,
  `cod_mue` varchar(20) NOT NULL,
  `lug_mue` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `muelle`
--

INSERT INTO `muelle` (`nom_mue`, `cod_mue`, `lug_mue`) VALUES
('Cerrepesca', '227692', 'Ibagué-Colombia'),
('mesirve', '267181', 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `cod_pro` varchar(20) NOT NULL,
  `nom_pro` varchar(20) NOT NULL,
  `nro_pro` varchar(15) NOT NULL,
  `dir_pro` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`cod_pro`, `nom_pro`, `nro_pro`, `dir_pro`) VALUES
('67832', 'Juan Avila', '3103163223', 'Salado'),
('76549', 'Johan Rodriguez', '3223128416', 'Espinal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`propietario_cod_pro`,`muelle_cod_mue`,`cod_alq`),
  ADD KEY `fk_propietario_has_muelle_muelle1_idx` (`muelle_cod_mue`),
  ADD KEY `fk_propietario_has_muelle_propietario1_idx` (`propietario_cod_pro`);

--
-- Indices de la tabla `barco`
--
ALTER TABLE `barco`
  ADD PRIMARY KEY (`cod_bar`,`propietario_cod_pro`),
  ADD KEY `fk_barco_propietario1_idx` (`propietario_cod_pro`);

--
-- Indices de la tabla `muelle`
--
ALTER TABLE `muelle`
  ADD PRIMARY KEY (`cod_mue`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`cod_pro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_propietario_has_muelle_muelle1` FOREIGN KEY (`muelle_cod_mue`) REFERENCES `muelle` (`cod_mue`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_propietario_has_muelle_propietario1` FOREIGN KEY (`propietario_cod_pro`) REFERENCES `propietario` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `barco`
--
ALTER TABLE `barco`
  ADD CONSTRAINT `fk_barco_propietario1` FOREIGN KEY (`propietario_cod_pro`) REFERENCES `propietario` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
