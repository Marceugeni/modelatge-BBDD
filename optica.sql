-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-07-2020 a las 14:41:43
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clients`
--

CREATE TABLE `Clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `direccio` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `tel` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `datareg` date NOT NULL DEFAULT current_timestamp(),
  `es_nou` tinyint(1) NOT NULL,
  `recby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Clients`
--

INSERT INTO `Clients` (`id_client`, `nom`, `direccio`, `cp`, `tel`, `email`, `datareg`, `es_nou`, `recby`) VALUES
(1, 'Paquita Ramis', 'Nou de la Rambla 22', 8001, 932233434, 'p.r@gmail.com', '2020-07-06', 1, ''),
(2, 'Hasert Hander', 'C. Ripoll 33', 8002, 345543345, 'hasehan@gmail.com', '2020-07-06', 1, 'manel'),
(3, 'Gargau Garriga', 'C/ Garriga 33', 8002, 983234878, 'gargau.garri@gmail.com', '2020-07-06', 1, ''),
(4, 'Famella Dona', 'C/ de les dones 22', 83992, 787898656, 'famedon@gmail.com', '2020-07-06', 1, 'manel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleats`
--

CREATE TABLE `Empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `cognom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Empleats`
--

INSERT INTO `Empleats` (`id_empleat`, `nom`, `cognom`) VALUES
(1, 'Manel', 'Garcia'),
(2, 'Laia', 'Dominguez'),
(3, 'Fatima', 'Daiola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marques`
--

CREATE TABLE `Marques` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(25) NOT NULL,
  `id_proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Marques`
--

INSERT INTO `Marques` (`id_marca`, `marca`, `id_proveidor`) VALUES
(101, 'Oakley', 3),
(102, 'Electric', 3),
(103, 'Quicksilver', 3),
(104, 'Police', 1),
(105, 'Persol', 1),
(106, 'Ray-ban', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveidor`
--

CREATE TABLE `Proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `num` int(11) NOT NULL,
  `pis` varchar(25) NOT NULL,
  `porta` varchar(25) NOT NULL,
  `city` varchar(50) NOT NULL,
  `cp` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `tel` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Proveidor`
--

INSERT INTO `Proveidor` (`id_proveidor`, `nom`, `carrer`, `num`, `pis`, `porta`, `city`, `cp`, `pais`, `tel`, `fax`, `nif`) VALUES
(1, 'Gafachick, S.L.', 'Fabregadas ', 56, '1', '2', 'Barcelona', 8002, 'espanya', 342343445, 653662773, '34566261-W'),
(3, 'GafaSURF S.A.', 'del Surf, 44', 69, '4', '5', 'Barcelona', 8005, 'España', 8838493, 334345567, '12322234-W');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ulleres`
--

CREATE TABLE `Ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `grad_r` float NOT NULL,
  `grad_l` float NOT NULL,
  `tipus_mont` varchar(25) NOT NULL,
  `col_mont` varchar(25) NOT NULL,
  `cr_color_r` varchar(25) NOT NULL,
  `cr_color_l` varchar(25) NOT NULL,
  `preu` float NOT NULL,
  `id_empleat` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Ulleres`
--

INSERT INTO `Ulleres` (`id_ulleres`, `id_marca`, `grad_r`, `grad_l`, `tipus_mont`, `col_mont`, `cr_color_r`, `cr_color_l`, `preu`, `id_empleat`, `id_client`) VALUES
(602, 104, 23, 32, 'pasta', 'vermell', 'trans', 'trans', 345, 2, 3),
(603, 101, 0, 0, 'pasta', 'negres', 'blau', 'blau', 125, 2, 2),
(604, 102, 0, 0, 'varilla', 'plata', 'trans', 'trans', 450, 1, 4),
(606, 106, 34, 34, 'pasta', 'Marro', 'trans', 'trans', 250, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `Empleats`
--
ALTER TABLE `Empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `Marques`
--
ALTER TABLE `Marques`
  ADD PRIMARY KEY (`id_marca`,`id_proveidor`),
  ADD KEY `id_proveidor` (`id_proveidor`);

--
-- Indices de la tabla `Proveidor`
--
ALTER TABLE `Proveidor`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD PRIMARY KEY (`id_ulleres`,`id_marca`,`id_empleat`,`id_client`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_empleat` (`id_empleat`),
  ADD KEY `id_marca` (`id_marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Proveidor`
--
ALTER TABLE `Proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Marques`
--
ALTER TABLE `Marques`
  ADD CONSTRAINT `Marques_ibfk_1` FOREIGN KEY (`id_proveidor`) REFERENCES `Proveidor` (`id_proveidor`);

--
-- Filtros para la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD CONSTRAINT `Ulleres_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id_client`),
  ADD CONSTRAINT `Ulleres_ibfk_2` FOREIGN KEY (`id_empleat`) REFERENCES `Empleats` (`id_empleat`),
  ADD CONSTRAINT `Ulleres_ibfk_3` FOREIGN KEY (`id_marca`) REFERENCES `Marques` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
