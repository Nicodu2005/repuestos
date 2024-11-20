-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2024 a las 05:54:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `repuestos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `password`) VALUES
(1, 'nicolas', 'nicolaspoveda000@gmail.com', '3157006404', 'kra 5b este # 25h-46', 12345),
(7, 'mariana', 'eduinduran2@gmail.com', '1234', 'kr 3 #22-32', 122345678),
(8, 'camilo', 'andresfelope10@gmail.com', '214324', 'Carrera 5b este #25h-45', 12344353),
(9, 'karla', 'adasd@dad.edu.co', '10284029', 'asdlakjdalkj', 1231231),
(10, 'alba', 'eduinduran@hotmail.com', '123131', 'Carrera 5b este #25h-45', 12345678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL,
  `total` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `status`, `total`) VALUES
(3, 1, '2024-11-18 06:11:06', 'pendiente', 160000),
(4, 1, '2024-11-18 06:12:17', 'pendiente', 115000),
(5, 10, '2024-11-20 07:35:03', 'pendiente', 65000),
(6, 1, '2024-11-20 09:30:30', 'pendiente', 95000),
(7, 1, '2024-11-20 09:35:48', 'pendiente', 105000),
(8, 1, '2024-11-20 09:49:17', 'pendiente', 15000),
(9, 1, '2024-11-20 09:51:22', 'pendiente', 80000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 3, 18, 2, 80000.00),
(2, 4, 19, 1, 15000.00),
(3, 4, 17, 1, 20000.00),
(4, 4, 18, 1, 80000.00),
(5, 5, 16, 1, 30000.00),
(6, 5, 12, 1, 35000.00),
(7, 6, 0, 1, 40000.00),
(8, 6, 1, 1, 25000.00),
(9, 6, 16, 1, 30000.00),
(10, 7, 0, 2, 40000.00),
(11, 7, 1, 1, 25000.00),
(12, 8, 19, 1, 15000.00),
(13, 9, 18, 1, 80000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `categories` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image`, `categories`) VALUES
(0, 'Filtro de aceite', 'El filtro de aceite elimina impurezas del aceite del motor, garantizando un lubricado eficiente y prolongando la vida útil del motor. Mantiene el rendimiento óptimo y reduce el desgaste interno.', 40000.00, 98, 'filtro_de_aceite.png', 'Mantenimiento y Repuestos'),
(1, 'Bujia', 'La bujía enciende la mezcla de aire y combustible con una chispa eléctrica, permitiendo que el motor arranque correctamente. Una bujía en buen estado mejora el rendimiento y reduce el consumo de combustible.,', 25000.00, 99, 'bujia-encendido.png', 'Mantenimiento y Repuestos'),
(2, 'pastillas de freno', 'Las pastillas de freno son esenciales para detener la moto, proporcionando la fricción necesaria. Invertir en pastillas de calidad asegura un mejor rendimiento y seguridad en la conducción ', 90000.00, 100, 'pastilla-de-freno.png', 'Mantenimiento y Repuestos'),
(3, 'Cadena de trasmision', 'La cadena de transmisión transfiere la potencia del motor a la rueda trasera. Un mantenimiento adecuado mejora la aceleración y la respuesta de la moto, garantizando una conducción más eficiente.', 150000.00, 100, 'cadena-trasmision.jpg', 'Transmisión y Suspensión'),
(4, 'kit de arrastre.', 'El kit de arrastre incluye la cadena, piñón y corona, fundamentales para la transmisión de potencia. Un kit en buen estado asegura un rendimiento óptimo, mejora la aceleración y prolonga la vida útil del sistema de transmisión. Ideal para mantener la eficiencia y la seguridad de la moto.', 200000.00, 100, 'kitarrastre.png', 'Transmisión y Suspensión'),
(5, 'Amortiguador trasero', 'El amortiguador trasero absorbe impactos, proporcionando estabilidad y comodidad al conductor. Mejora la tracción y el control, haciendo la conducción más placentera y segura.', 50000.00, 100, 'Amortiguador-Trasero.png', 'Transmisión y Suspensión'),
(6, 'Faro delantero', 'El faro delantero ilumina el camino y aumenta la visibilidad durante la conducción nocturna, mejorando la seguridad en la carretera', 120000.00, 100, 'faro.png', 'Iluminación y Visibilidad'),
(7, 'Retrovisores', 'Los retrovisores ofrecen visibilidad trasera, permitiendo al conductor monitorear el tráfico y aumentar la seguridad al cambiar de carril.', 300000.00, 100, 'retrovisor.png', 'Iluminación y Visibilidad'),
(8, 'Manillar', 'El manillar permite controlar la dirección de la moto, asegurando un manejo preciso y cómodo en diversas condiciones de conducción.', 90000.00, 100, 'manillar.png', 'Componentes de la moto'),
(9, 'Guarda barros delantero', 'El guardabarros delantero protege al conductor de la suciedad y el agua del camino, manteniendo la moto más limpia y mejorando la visibilidad.', 50000.00, 100, 'guardabarros.png', 'Componentes de la moto'),
(10, 'Tapa de gasolina', 'La tapa de gasolina cierra el tanque de combustible, previniendo derrames y asegurando que la moto funcione correctamente.', 25000.00, 100, 'tapatanque.jpg', 'Componentes de la moto'),
(11, 'Luna de punto ciego', 'La luna de punto ciego aumenta la seguridad al proporcionar visibilidad lateral adicional, ayudando al conductor a evitar accidentes.', 50000.00, 100, 'luna.jpg', 'Iluminación y Visibilidad'),
(12, 'Filtro de aire', 'El filtro de aire filtra el aire que ingresa al motor, asegurando una mezcla adecuada para una combustión eficiente y un mejor rendimiento.', 35000.00, 100, 'filtroaire.png', 'Mantenimiento y Repuestos'),
(13, 'Batería', 'La batería suministra energía eléctrica a la moto, permitiendo el arranque y el funcionamiento de componentes eléctricos esenciales.', 150000.00, 100, 'bateria.png', 'Mantenimiento y Repuestos'),
(14, 'Neumático trasero', 'El neumático trasero proporciona tracción y estabilidad, crucial para el rendimiento y la seguridad durante la conducción.', 250000.00, 100, 'neumaticotarsero.png', 'Transmisión y Suspensión'),
(15, 'Neumático delantero', 'El neumático delantero garantiza control y seguridad en la parte delantera, mejorando la maniobrabilidad y la respuesta al frenar.', 230000.00, 100, 'neumaticodelantero.png', 'Componentes de la moto'),
(16, 'Tomas de corriente', 'Las tomas de corriente permiten cargar dispositivos electrónicos, ofreciendo comodidad durante los viajes largos.', 30000.00, 100, 'toma.png', 'Componentes Eléctricos y Accesorios'),
(17, 'Soporte de matrícula', 'El soporte de matrícula monta la placa de la moto, asegurando que cumpla con las regulaciones y añadiendo un toque estético.', 20000.00, 100, 'portaplaca.png', 'Accesorios adicionales'),
(18, 'Cubierta de asiento', 'La cubierta de asiento proporciona comodidad y protección, mejorando la experiencia de conducción y preservando el estado del asiento.', 80000.00, 99, 'cubierta.png', 'Accesorios adicionales'),
(19, 'Juego de tornillos', 'Un conjunto de tornillos para ensamblaje de piezas, esencial para el mantenimiento y reparación de la moto.', 15000.00, 99, 'tornillos.png', 'Accesorios adicionales');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
