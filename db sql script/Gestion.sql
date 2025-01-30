-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2025 a las 00:15:32
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
-- Base de datos: `sample_app`
--
CREATE DATABASE IF NOT EXISTS `sample_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sample_app`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `img`, `updated_at`, `created_at`) VALUES
(4, 'update name', 'desc upd', '8.99', 'uploads/TBb9Vuap4EDzx3uWpqVibS0PSINpIfYTe92TjFkW.webp', '2025-01-30 10:58:42', '2025-01-30 10:57:04'),
(5, 'Cooler', 'prod desc', '19.99', 'uploads/BRx5Cx5IWBX6zvK0xc1ipOqLsyH4flYHBcsjC713.jpg', '2025-01-31 04:25:33', '2025-01-31 04:25:33'),
(6, 'Laptop Alienware', 'prod desc', '2500', 'uploads/eYKPtz5Fgh8GYY7OLeKUAzs2I5f13LXI2J3jtBgA.jpg', '2025-01-31 04:27:11', '2025-01-31 04:27:11'),
(7, 'Tablet', 'prod desc', '600', 'uploads/qyO5aHAv8ydFuY6akbsVhwE05v0739tLJUjQMWbw.jpg', '2025-01-31 04:27:38', '2025-01-31 04:27:38'),
(8, 'Telescopio', 'prod desc', '600', 'uploads/RCKGD9OQwn6cn16di4uOdVpAtbWS9IBpTEEScjhK.jpg', '2025-01-31 04:28:06', '2025-01-31 04:28:06'),
(9, 'Kit limpieza teclado', 'prod desc', '56', 'uploads/5iNRiPri2I88FoXh9Nt9317TP3dVKiGrbyiZvAiR.jpg', '2025-01-31 04:29:43', '2025-01-31 04:29:43'),
(10, 'Teclado mecánico', 'prod desc', '125', 'uploads/jJWlhOGFlk23BN1it8avqoqfC6tIL6QcT57kJb5G.jpg', '2025-01-31 04:30:12', '2025-01-31 04:30:12'),
(11, 'Telescopio blanco', 'prod desc', '780', 'uploads/7i8e4OvrGpoYPbsQ5lH92dP7lwVE0VPbLPslZmZ7.jpg', '2025-01-31 04:32:30', '2025-01-31 04:32:30'),
(12, 'Auriculares', 'prod desc', '495', 'uploads/MqO7jjYpRGSSdkV4Wr3M2MjcTdpe0Ir4e2O0MfRd.jpg', '2025-01-31 04:33:12', '2025-01-31 04:33:12'),
(13, 'Sorry juego infantil', 'prod desc', '10', 'uploads/nnOopzJtgUvbFKAG3DLspoeWht7XoDMvPnWIBQgN.jpg', '2025-01-31 04:58:25', '2025-01-31 04:58:25'),
(14, 'Tapple juego infantil', 'prod desc', '25', 'uploads/aGPUylKfmEKXuxAlzgkTuwAwqrXawaA5E8dc9EFa.jpg', '2025-01-31 04:58:50', '2025-01-31 04:58:50'),
(15, 'Jenga', 'prod desc', '15.9', 'uploads/zaGtqcgBpucZzVnFsabZJkqdQe0WZJWM9rG7nmdY.jpg', '2025-01-31 04:59:13', '2025-01-31 04:59:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `rating` decimal(2,0) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `username`, `rating`, `comment`, `id_product`, `updated_at`, `created_at`) VALUES
(9, 'admin', 5, 'Excelente producto', 6, '2025-01-31 04:42:43', '2025-01-31 04:42:43'),
(10, 'admin', 4, 'Excelente producto', 6, '2025-01-31 04:42:49', '2025-01-31 04:42:49'),
(11, 'admin', 5, 'Excelente producto', 6, '2025-01-31 04:42:54', '2025-01-31 04:42:54'),
(12, 'admin', 4, 'Excelente producto', 6, '2025-01-31 04:42:58', '2025-01-31 04:42:58'),
(13, 'admin', 4, 'Corre bien', 6, '2025-01-31 04:43:06', '2025-01-31 04:43:06'),
(14, 'admin', 5, 'La mejor compra', 6, '2025-01-31 04:43:21', '2025-01-31 04:43:21'),
(15, 'admin', 3, 'Está bien', 4, '2025-01-31 04:44:59', '2025-01-31 04:44:59'),
(16, 'admin', 2, 'Funciona bien', 4, '2025-01-31 04:45:15', '2025-01-31 04:45:15'),
(17, 'admin', 4, 'Fácil instalación', 5, '2025-01-31 04:45:34', '2025-01-31 04:45:34'),
(18, 'admin', 5, 'Llegó rápido', 5, '2025-01-31 04:45:48', '2025-01-31 04:45:48'),
(19, 'admin', 1, 'Venía dañado', 5, '2025-01-31 04:45:58', '2025-01-31 04:45:58'),
(20, 'admin', 3, 'Bastante bien', 7, '2025-01-31 04:46:15', '2025-01-31 04:46:15'),
(21, 'admin', 4, 'A mi esposa le gustó', 7, '2025-01-31 04:46:35', '2025-01-31 04:46:35'),
(22, 'admin', 5, 'Corre rápido las aplicaciones', 7, '2025-01-31 04:46:53', '2025-01-31 04:46:53'),
(23, 'admin', 5, 'Llegó rápido', 8, '2025-01-31 04:47:10', '2025-01-31 04:47:10'),
(24, 'admin', 5, 'Lo amo!', 8, '2025-01-31 04:47:17', '2025-01-31 04:47:17'),
(25, 'admin', 3, 'no pude enfocar', 8, '2025-01-31 04:47:26', '2025-01-31 04:47:26'),
(26, 'admin', 3, 'Para iniciar está bien', 8, '2025-01-31 04:47:35', '2025-01-31 04:47:35'),
(27, 'admin', 4, 'De maravilla', 9, '2025-01-31 04:47:48', '2025-01-31 04:47:48'),
(28, 'admin', 1, 'Me hizo falta una pieza', 9, '2025-01-31 04:47:58', '2025-01-31 04:47:58'),
(29, 'admin', 2, 'Buen material', 9, '2025-01-31 04:48:14', '2025-01-31 04:48:14'),
(30, 'admin', 3, 'Bien precio producto', 9, '2025-01-31 04:48:37', '2025-01-31 04:48:37'),
(31, 'admin', 1, 'Venía con 2 teclas malas', 10, '2025-01-31 04:48:55', '2025-01-31 04:48:55'),
(32, 'admin', 2, 'Muy duras las teclas', 10, '2025-01-31 04:49:05', '2025-01-31 04:49:05'),
(33, 'admin', 3, 'Se siente de mala calidad', 10, '2025-01-31 04:49:16', '2025-01-31 04:49:16'),
(34, 'admin', 3, 'No pude armarlo, muy difícil', 12, '2025-01-31 04:49:45', '2025-01-31 04:49:45'),
(35, 'admin', 3, 'el blanco se ensucia rápido', 12, '2025-01-31 04:49:54', '2025-01-31 04:49:54'),
(36, 'admin', 2, 'Traía el lente quebrado', 12, '2025-01-31 04:50:07', '2025-01-31 04:50:07'),
(37, 'admin', 3, 'Es muy divertido pero venía dañado', 13, '2025-01-31 04:59:51', '2025-01-31 04:59:51'),
(38, 'admin', 1, 'Nunca me llegó el producto', 13, '2025-01-31 05:00:07', '2025-01-31 05:00:07'),
(39, 'admin', 4, 'Me gustó', 14, '2025-01-31 05:00:27', '2025-01-31 05:00:27'),
(40, 'admin', 2, 'Muy confuso', 14, '2025-01-31 05:00:38', '2025-01-31 05:00:38'),
(41, 'admin', 2, 'Más pequeño que la descripción', 15, '2025-01-31 05:00:54', '2025-01-31 05:00:54'),
(42, 'admin', 2, 'Hacía falta piezas', 15, '2025-01-31 05:01:01', '2025-01-31 05:01:01'),
(43, 'admin', 5, 'Buena calidad', 15, '2025-01-31 05:01:14', '2025-01-31 05:01:14'),
(44, 'admin', 5, 'Buena calidad', 11, '2025-01-31 05:06:37', '2025-01-31 05:06:37'),
(45, 'admin', 1, 'No me gustó', 11, '2025-01-31 05:06:48', '2025-01-31 05:06:48'),
(46, 'admin', 1, 'Enfoca mal', 11, '2025-01-31 05:06:55', '2025-01-31 05:06:55'),
(47, 'admin', 3, 'Muy caro para lo que es', 11, '2025-01-31 05:07:03', '2025-01-31 05:07:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$3zKsvsRB644sbkzOs7QHsO.SRafJOLagym1WGvQJ8zWBvV7uzMzuG', NULL, '2025-01-27 03:35:54', '2025-01-27 03:35:54'),
(2, 'clau', 'clau@gmail.com', NULL, '$2y$12$.xDurQwCOqGtKUY6jm2Gh.p40db.H6WLLoSz9P6yKg4TMpfk5aSEq', NULL, '2025-01-30 04:11:02', '2025-01-30 04:11:02'),
(3, 'nombre', 'nombre@gmail.com', NULL, '$2y$12$05AB84RWHa6MKiA7P2RaLOLmFjMBPmv1Na7RsZ7hK2lUllVXMIXDS', NULL, '2025-01-30 06:34:33', '2025-01-30 06:34:33');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`id_product`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
