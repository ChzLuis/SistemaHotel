-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2023 a las 01:25:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemahotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `idv` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `idprd` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcat` int(11) NOT NULL,
  `nomcat` varchar(100) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcat`, `nomcat`, `fere`) VALUES
(4, 'Bebidas', '2023-11-09 05:00:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `iddn` int(11) NOT NULL,
  `dnic` varchar(35) NOT NULL,
  `numc` char(14) NOT NULL,
  `nomc` varchar(35) NOT NULL,
  `apec` varchar(35) NOT NULL,
  `corrc` varchar(35) NOT NULL,
  `estac` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`iddn`, `dnic`, `numc`, `nomc`, `apec`, `corrc`, `estac`, `fere`) VALUES
(1, 'DNI', '78987656', 'Manuel Efrain', 'Flores Rosales', '', '1', '2022-10-06 19:34:23'),
(2, 'DNI', '76567654', 'Ruby', 'Rquena', '', '1', '2022-10-06 23:45:56'),
(3, 'DNI', '76543323', 'Luis ', 'Sosa', '', '1', '2022-10-06 23:50:06'),
(4, 'DNI', '73243234', 'Osvaldo Milo', 'Morales Lozada', '', '1', '2022-10-07 00:06:04'),
(5, 'DNI', '76543654', 'Jimena Barbara', 'Yovera Morales', 'jjmor@gmail.com', '1', '2022-10-07 04:47:47'),
(6, 'DNI', '76687653', 'Anderson', 'Murillo Salas', '', '1', '2022-10-07 04:52:09'),
(8, 'DNI', '75713007', 'Luis', 'Chavez', 'luis@gmail.com', '1', '2023-10-26 05:26:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `idhab` int(11) NOT NULL,
  `numiha` char(3) NOT NULL,
  `detaha` text NOT NULL,
  `precha` decimal(10,2) NOT NULL,
  `idps` int(11) NOT NULL,
  `idhc` int(11) NOT NULL,
  `estadha` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`idhab`, `numiha`, `detaha`, `precha`, `idps`, `idhc`, `estadha`, `fere`) VALUES
(13, '101', 'TV -   CAMA SIMPLE  . BAÑO', 30.00, 7, 7, '1', '2023-11-17 23:56:58'),
(14, '102', 'TV - CAMA SIMPLE - BAÑO', 30.00, 7, 7, '1', '2023-11-17 23:47:36'),
(15, '103', 'TV - CAMA SIMPLE - BAÑO', 30.00, 7, 7, '1', '2023-11-17 23:47:45'),
(16, '201', 'TV - 2 CAMAS - BAÑO ', 50.00, 8, 8, '1', '2023-11-17 23:48:18'),
(17, '202', 'TV - 2 CAMAS - BAÑO', 50.00, 8, 8, '1', '2023-11-17 23:48:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hcate`
--

CREATE TABLE `hcate` (
  `idhc` int(11) NOT NULL,
  `nomhc` varchar(35) NOT NULL,
  `estahc` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `hcate`
--

INSERT INTO `hcate` (`idhc`, `nomhc`, `estahc`, `fere`) VALUES
(7, 'Simple', '1', '2023-10-21 01:01:54'),
(8, 'Doble', '1', '2023-10-21 01:02:33'),
(9, 'Triple', '1', '2023-10-21 01:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `idord` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_cli` int(11) NOT NULL,
  `method` varchar(50) NOT NULL,
  `total_products` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_status` varchar(20) NOT NULL,
  `tipc` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`idord`, `user_id`, `user_cli`, `method`, `total_products`, `total_price`, `placed_on`, `updated_at`, `payment_status`, `tipc`) VALUES
(20, 1, 8, 'Efectivo', ', Coca Cola ( 1 )', 3.00, '18-Nov-2023', '2023-11-17 23:30:04', 'Aceptado', 'Boleta'),
(21, 1, 3, 'PLin', ', Agua Mineral ( 1 )', 3.00, '18-Nov-2023', '2023-11-17 23:31:56', 'Aceptado', 'Boleta'),
(22, 1, 4, 'Efectivo', ', Coca Cola ( 1 )', 3.00, '18-Nov-2023', '2023-11-17 23:34:44', 'Aceptado', 'Ticket');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pisos`
--

CREATE TABLE `pisos` (
  `idps` int(11) NOT NULL,
  `nompis` varchar(30) NOT NULL,
  `estp` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pisos`
--

INSERT INTO `pisos` (`idps`, `nompis`, `estp`, `fere`) VALUES
(7, 'Piso 1', '1', '2023-10-21 00:53:46'),
(8, 'Piso 2', '1', '2023-10-21 00:53:55'),
(9, 'Piso 3', '1', '2023-10-21 00:54:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idprd` int(11) NOT NULL,
  `nomprd` varchar(150) NOT NULL,
  `numprd` char(14) NOT NULL,
  `detprd` text NOT NULL,
  `preprd` decimal(10,2) NOT NULL,
  `stckprd` char(3) NOT NULL,
  `staprd` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idcat` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idprd`, `nomprd`, `numprd`, `detprd`, `preprd`, `stckprd`, `staprd`, `fere`, `idcat`, `foto`) VALUES
(5, 'Coca Cola', 'C001', '', 3.00, '20', '1', '2023-11-16 03:40:22', 4, '250031.'),
(6, 'Agua Mineral', 'AG001', '', 3.00, '100', '1', '2023-11-17 22:46:58', 4, '674915.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservar`
--

CREATE TABLE `reservar` (
  `idrese` int(11) NOT NULL,
  `idhab` int(11) NOT NULL,
  `iddn` int(11) NOT NULL,
  `feentra` date NOT NULL,
  `fesal` date NOT NULL,
  `adel` decimal(10,2) NOT NULL,
  `state` char(1) NOT NULL,
  `observac` text NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `duracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reservar`
--

INSERT INTO `reservar` (`idrese`, `idhab`, `iddn`, `feentra`, `fesal`, `adel`, `state`, `observac`, `fecha_ingreso`, `user_id`, `duracion`) VALUES
(28, 13, 6, '2023-11-18', '2023-11-21', 0.00, '1', '', '2023-11-17 23:56:48', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_history`
--

CREATE TABLE `rs_history` (
  `idrsh` int(11) NOT NULL,
  `idhab` int(11) NOT NULL,
  `idrese` int(11) NOT NULL,
  `iddn` int(11) NOT NULL,
  `nomc` varchar(35) NOT NULL,
  `numiha` char(14) NOT NULL,
  `detaha` text NOT NULL,
  `precha` decimal(10,2) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rs_history`
--

INSERT INTO `rs_history` (`idrsh`, `idhab`, `idrese`, `iddn`, `nomc`, `numiha`, `detaha`, `precha`, `fere`) VALUES
(4, 9, 5, 6, 'Anderson', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-10-21 01:33:22'),
(5, 9, 7, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-10-21 01:36:53'),
(6, 10, 6, 5, 'Jimena Barbara', '101', 'Cuenta con televisor, DVD y aire acondicionado.', 80.00, '2023-10-21 02:20:09'),
(7, 12, 8, 8, 'Luis', '202', '2 CAMAS', 40.00, '2023-10-26 05:28:35'),
(8, 9, 9, 5, 'Jimena Barbara', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-09 05:02:49'),
(9, 12, 10, 8, 'Luis', '202', '2 CAMAS', 40.00, '2023-11-16 01:20:32'),
(10, 9, 11, 5, 'Jimena Barbara', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 01:21:22'),
(11, 10, 12, 4, 'Osvaldo Milo', '101', 'Cuenta con televisor, DVD y aire acondicionado.', 80.00, '2023-11-16 01:21:27'),
(12, 9, 13, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:10:37'),
(13, 9, 13, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:10:38'),
(14, 9, 13, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:10:39'),
(15, 9, 13, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:10:40'),
(16, 9, 13, 1, 'Manuel Efrain', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:10:43'),
(17, 9, 14, 4, 'Osvaldo Milo', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:11:16'),
(18, 9, 14, 4, 'Osvaldo Milo', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:11:41'),
(19, 9, 14, 4, 'Osvaldo Milo', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:33:32'),
(20, 9, 14, 4, 'Osvaldo Milo', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 02:35:45'),
(21, 10, 18, 8, 'Luis', '101', 'Cuenta con televisor, DVD y aire acondicionado.', 80.00, '2023-11-16 03:52:26'),
(22, 11, 19, 1, 'Manuel Efrain', '102', 'Aire acondicionado, DVD, Televisor y Frío Bar', 100.00, '2023-11-16 03:53:53'),
(23, 9, 14, 4, 'Osvaldo Milo', '100', 'Cuenta con aire acondicionado y televisión', 50.00, '2023-11-16 04:42:54'),
(24, 13, 28, 6, 'Anderson', '101', 'TV -   CAMA SIMPLE  . BAÑO', 30.00, '2023-11-17 23:56:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `contra` varchar(255) NOT NULL,
  `rol` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `usuario`, `contra`, `rol`, `fere`) VALUES
(1, 'Luis Chavez', 'admin@gmail.com', 'admin01', '202cb962ac59075b964b07152d234b70', '1', '2023-11-17 23:21:48'),
(5, 'Jean Paul', 'jp27@gmail.com', 'JP27', '202cb962ac59075b964b07152d234b70', '1', '2023-10-21 00:55:35'),
(6, 'Julio Chavez', 'julio23@gmail.com', 'JcChZ', '21232f297a57a5a743894a0e4a801fc3', '1', '2023-10-21 02:34:47'),
(7, 'Diego', 'diego21@gmail.com', 'DiegoC', '21232f297a57a5a743894a0e4a801fc3', '1', '2023-10-21 02:38:14'),
(8, 'cajero', 'caja@gmail.com', 'cajero', '936400f151ba2146a86cfcc342279f57', '3', '2023-11-09 05:24:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idv`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idprd` (`idprd`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcat`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`iddn`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`idhab`),
  ADD KEY `idps` (`idps`),
  ADD KEY `idhc` (`idhc`);

--
-- Indices de la tabla `hcate`
--
ALTER TABLE `hcate`
  ADD PRIMARY KEY (`idhc`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idord`),
  ADD KEY `user_cli` (`user_cli`);

--
-- Indices de la tabla `pisos`
--
ALTER TABLE `pisos`
  ADD PRIMARY KEY (`idps`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idprd`),
  ADD KEY `idcat` (`idcat`);

--
-- Indices de la tabla `reservar`
--
ALTER TABLE `reservar`
  ADD PRIMARY KEY (`idrese`),
  ADD KEY `idhab` (`idhab`),
  ADD KEY `iddn` (`iddn`),
  ADD KEY `reservar_ibfk_3` (`user_id`);

--
-- Indices de la tabla `rs_history`
--
ALTER TABLE `rs_history`
  ADD PRIMARY KEY (`idrsh`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `idv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `iddn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `idhab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `hcate`
--
ALTER TABLE `hcate`
  MODIFY `idhc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `idord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `pisos`
--
ALTER TABLE `pisos`
  MODIFY `idps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idprd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reservar`
--
ALTER TABLE `reservar`
  MODIFY `idrese` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `rs_history`
--
ALTER TABLE `rs_history`
  MODIFY `idrsh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`idprd`) REFERENCES `productos` (`idprd`);

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`idps`) REFERENCES `pisos` (`idps`),
  ADD CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`idhc`) REFERENCES `hcate` (`idhc`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_cli`) REFERENCES `clientes` (`iddn`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categorias` (`idcat`);

--
-- Filtros para la tabla `reservar`
--
ALTER TABLE `reservar`
  ADD CONSTRAINT `reservar_ibfk_1` FOREIGN KEY (`idhab`) REFERENCES `habitaciones` (`idhab`),
  ADD CONSTRAINT `reservar_ibfk_2` FOREIGN KEY (`iddn`) REFERENCES `clientes` (`iddn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
