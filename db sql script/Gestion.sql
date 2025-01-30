-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2025 a las 06:03:29
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

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_26_222547_create_personal_access_tokens_table', 2);

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

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(57, 'App\\Models\\User', 2, 'auth_token', '853cbda683a4de396513496197b7d14ff4ea78989fb2dde2d20af1208df47832', '[\"*\"]', NULL, '2025-01-30 06:11:43', '2025-01-30 04:11:43', '2025-01-30 04:11:43'),
(58, 'App\\Models\\User', 2, 'refresh_token', '33b3ada68f9ea27a5112191cca2e208c05c3cd18fd11e8fd82d50e0b4325acae', '[\"refresh\"]', NULL, '2025-02-06 04:11:43', '2025-01-30 04:11:43', '2025-01-30 04:11:43'),
(59, 'App\\Models\\User', 2, 'auth_token', '426a0693802d3708b6d03486025e455052000788696f8ce3f215a62604113580', '[\"*\"]', NULL, '2025-01-30 06:12:45', '2025-01-30 04:12:45', '2025-01-30 04:12:45'),
(60, 'App\\Models\\User', 2, 'refresh_token', '9d73e8d336c87670d9b8b35cca39d119654f2e820c9415de9d794eaaf70bcc2e', '[\"refresh\"]', NULL, '2025-02-06 04:12:45', '2025-01-30 04:12:45', '2025-01-30 04:12:45'),
(61, 'App\\Models\\User', 2, 'auth_token', '3c6bd7ca3196d5ca711bd6ba2b6c2df9b9bc9b43f1fe41c2beea486709ede053', '[\"*\"]', NULL, '2025-01-30 06:45:14', '2025-01-30 04:45:14', '2025-01-30 04:45:14'),
(62, 'App\\Models\\User', 2, 'refresh_token', '5c8c6ffe978fe974f3403d3f0a412c64612852d6858e11b09b801b6d8ec49203', '[\"refresh\"]', NULL, '2025-02-06 04:45:14', '2025-01-30 04:45:14', '2025-01-30 04:45:14'),
(63, 'App\\Models\\User', 2, 'auth_token', '1451c00e69175635ccdbed338def991cb4eb13da41be1aed900a39767036982f', '[\"*\"]', NULL, '2025-01-30 07:28:26', '2025-01-30 05:28:26', '2025-01-30 05:28:26'),
(64, 'App\\Models\\User', 2, 'refresh_token', 'b71dc4f2e46bae46ae2be0317f3063728198bccf294262aff93eabe135134dd0', '[\"refresh\"]', NULL, '2025-02-06 05:28:26', '2025-01-30 05:28:26', '2025-01-30 05:28:26'),
(67, 'App\\Models\\User', 2, 'auth_token', '0f07163cbf86d22cf140c6b1558a532f15ccb1f259b54540189a3329f1e22a6a', '[\"*\"]', NULL, '2025-01-30 07:35:36', '2025-01-30 05:35:36', '2025-01-30 05:35:36'),
(68, 'App\\Models\\User', 2, 'refresh_token', '246ae1fefcdab7853e72d9db9d806ce9951c67c415b0885bd2b408070c3a58f9', '[\"refresh\"]', NULL, '2025-02-06 05:35:36', '2025-01-30 05:35:36', '2025-01-30 05:35:36'),
(69, 'App\\Models\\User', 2, 'auth_token', '1bcb0b7176023b12546a68ce66a9c381e75d4752311f3c9618590b886da2af6c', '[\"*\"]', NULL, '2025-01-30 07:39:24', '2025-01-30 05:39:24', '2025-01-30 05:39:24'),
(70, 'App\\Models\\User', 2, 'refresh_token', '47f9e388c5740a87df1c1c7929f0504878d672d5061cbbffc884810aa960bf35', '[\"refresh\"]', NULL, '2025-02-06 05:39:24', '2025-01-30 05:39:24', '2025-01-30 05:39:24'),
(71, 'App\\Models\\User', 3, 'auth_token', 'afcb8c386f6b0b51bca37a56b34c44645daea0a0c60ad2ff60b3ae78cbb8028e', '[\"*\"]', NULL, '2025-01-30 08:34:49', '2025-01-30 06:34:49', '2025-01-30 06:34:49'),
(72, 'App\\Models\\User', 3, 'refresh_token', 'cb2bbeef04226b5558cbfa1cc1abaa1ab6442475d1dde841cf36356e167b9204', '[\"refresh\"]', NULL, '2025-02-06 06:34:49', '2025-01-30 06:34:49', '2025-01-30 06:34:49'),
(73, 'App\\Models\\User', 1, 'auth_token', '3b68fcc1551375317deff88d83fb49cc9391041c5fa6492e5b3877c1f660046c', '[\"*\"]', NULL, '2025-01-30 09:59:26', '2025-01-30 07:59:26', '2025-01-30 07:59:26'),
(74, 'App\\Models\\User', 1, 'refresh_token', '073c3e349baa0fa465e7a482ab8fd29455b3f659727a4ad4f4cd69915ae095cc', '[\"refresh\"]', NULL, '2025-02-06 07:59:26', '2025-01-30 07:59:26', '2025-01-30 07:59:26'),
(75, 'App\\Models\\User', 1, 'auth_token', 'b60521904b43fec81eca7ed1e58ed4e10c029801f35368c127e6b895c8c13019', '[\"*\"]', NULL, '2025-01-30 10:59:54', '2025-01-30 08:59:54', '2025-01-30 08:59:54'),
(76, 'App\\Models\\User', 1, 'refresh_token', 'c6e6f5090114bc382151ee92b28ba181c35f5cca36e90245e6aa40b3d9f785a7', '[\"refresh\"]', NULL, '2025-02-06 08:59:54', '2025-01-30 08:59:54', '2025-01-30 08:59:54'),
(77, 'App\\Models\\User', 1, 'auth_token', '753fc5ffa78b3f6cc6f51a9871c2ffbad83004f62781461cbfd4d0ee137d5145', '[\"*\"]', NULL, '2025-01-30 11:01:56', '2025-01-30 09:01:56', '2025-01-30 09:01:56'),
(78, 'App\\Models\\User', 1, 'refresh_token', 'c4e40fb938b623fe6977194a0e489ec066e6f8cd91cf4b6ef58e8edb8857ee21', '[\"refresh\"]', NULL, '2025-02-06 09:01:56', '2025-01-30 09:01:56', '2025-01-30 09:01:56'),
(79, 'App\\Models\\User', 1, 'auth_token', 'c2e6314353de37709e20e96ecdd15cafeaa9b81d7be033cd35f0433dc12ad360', '[\"*\"]', NULL, '2025-01-30 11:04:05', '2025-01-30 09:04:05', '2025-01-30 09:04:05'),
(80, 'App\\Models\\User', 1, 'refresh_token', '5a5c0e138b6e850e598b5e32e3aa08e10e3cdc0166ce2a658a0c0748df0bacc5', '[\"refresh\"]', NULL, '2025-02-06 09:04:05', '2025-01-30 09:04:05', '2025-01-30 09:04:05'),
(81, 'App\\Models\\User', 1, 'auth_token', '942b0a97f579fbb21223d31d780b2a338915c38b321cef84d299bbe43a12d19d', '[\"*\"]', '2025-01-30 09:19:58', '2025-01-30 11:18:10', '2025-01-30 09:18:10', '2025-01-30 09:19:58'),
(82, 'App\\Models\\User', 1, 'refresh_token', 'c3c24a5bc76df90775f706171137c3a916ae4858fdca81a45eb04a20c3f87038', '[\"refresh\"]', NULL, '2025-02-06 09:18:10', '2025-01-30 09:18:10', '2025-01-30 09:18:10'),
(83, 'App\\Models\\User', 1, 'auth_token', '031ef849e9e81b26aed89cc096862d6af6ecead376c8912d92e8eb8011d2f672', '[\"*\"]', NULL, '2025-01-30 11:31:16', '2025-01-30 09:31:16', '2025-01-30 09:31:16'),
(84, 'App\\Models\\User', 1, 'refresh_token', 'caf0ac180966d2c7ce5eb210cd3e214a489ef4d94649ca00acbc5a87b7715a41', '[\"refresh\"]', NULL, '2025-02-06 09:31:16', '2025-01-30 09:31:16', '2025-01-30 09:31:16'),
(85, 'App\\Models\\User', 1, 'auth_token', '3b6e86b5327cb1c92712599077745ac2421a5f8d22dd102f9add3e148213088d', '[\"*\"]', NULL, '2025-01-30 12:12:06', '2025-01-30 10:12:06', '2025-01-30 10:12:06'),
(86, 'App\\Models\\User', 1, 'refresh_token', 'd2ff98bd31f7b05e9c513bb85d0f3b4417fd5bb2baee65f92e41b82b1d43ac59', '[\"refresh\"]', NULL, '2025-02-06 10:12:06', '2025-01-30 10:12:06', '2025-01-30 10:12:06'),
(87, 'App\\Models\\User', 1, 'auth_token', '40ebfe14257217865aa99e4a29168f3705d6e89c2f38e652ed7c2320bc977e4d', '[\"*\"]', NULL, '2025-01-30 12:37:28', '2025-01-30 10:37:28', '2025-01-30 10:37:28'),
(88, 'App\\Models\\User', 1, 'refresh_token', '711708033200f880ccb11f0271d45f9fd6e76d6c80673ad11ac6a89c3822a259', '[\"refresh\"]', NULL, '2025-02-06 10:37:28', '2025-01-30 10:37:28', '2025-01-30 10:37:28'),
(89, 'App\\Models\\User', 1, 'auth_token', '5ea6193704ab31fecdac3daf93ae284ea5c14ebf2c15ab4fe956b7c9b2c541c9', '[\"*\"]', '2025-01-30 10:58:42', '2025-01-30 12:52:02', '2025-01-30 10:52:02', '2025-01-30 10:58:42'),
(90, 'App\\Models\\User', 1, 'refresh_token', 'a5a9e89faac99429295d14925c9da172d7b44650a4f2d15bfd0369d144285f33', '[\"refresh\"]', NULL, '2025-02-06 10:52:02', '2025-01-30 10:52:02', '2025-01-30 10:52:02');

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
(1, 'update name', 'desc upd', '8.99', 'uploads/H46xxL57s4JEbELEA5xqiBtWO4Rm9Ue7Y4VkZRBq.webp', '2025-01-30 10:58:13', NULL),
(4, 'update name', 'desc upd', '8.99', 'uploads/TBb9Vuap4EDzx3uWpqVibS0PSINpIfYTe92TjFkW.webp', '2025-01-30 10:58:42', '2025-01-30 10:57:04');

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
(1, NULL, 4, 'test', 1, NULL, NULL),
(3, NULL, 3, 'test review', 3, '2025-01-27 02:27:15', '2025-01-27 02:27:15'),
(8, 'admin', 5, 'test review', 1, '2025-01-30 10:55:30', '2025-01-30 10:55:30');

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

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ohGf8d2axSAh8BLggcGI4XBnqw4hmVcMb2GjJgbN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGltWVB3VXc3RzM4cHdHeFg1Ymc0MnV6RVdkTmFBbzVva0JlRUpBMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1737913166),
('VIxA2ovTqVAB8GP2Yrj0MPDSehybLd9peV9CxyLl', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWt4a0lUbnNsRUZpRGVWTkxkcjdqMENac0pHbjE2VnhvREc2QXZlMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1737922788),
('Zto0nmsGyTmOta34eFxo4YLtLh9ICFIOehBg7bJm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickxtNVNmR1VPZEZFRWJtWVdVRDlmZUJLM2o0bE1FbU5ieXVWSmMzMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738168884);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
