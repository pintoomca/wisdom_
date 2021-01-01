-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2021 at 12:04 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisdom`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_12_30_112646_create_permission_tables', 1),
(4, '2020_12_30_112721_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` enum('New','Processing','Delivered','Returned') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `product_id`, `total_price`, `discount`, `user_name`, `user_mobile`, `user_email`, `user_address`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'XXXXXXXX20210101091908', 11, 4545, NULL, 'pintoo', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 1, 4545, 'New', '2021-01-01 03:49:07', '2021-01-01 03:49:07'),
(2, 'XXXXXXX202101010919532', 11, 9090, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 2, 4545, 'New', '2021-01-01 03:49:53', '2021-01-01 03:49:53'),
(3, 'XXXXXXX202101010920273', 11, 13635, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 3, 4545, 'New', '2021-01-01 03:50:27', '2021-01-01 03:50:27'),
(4, 'XXXXXXX202101010921534', 11, 13635, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 3, 4545, 'Processing', '2021-01-01 03:51:53', '2021-01-01 04:17:48'),
(5, 'XXXXXXX202101010922245', 11, 4545, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 1, 4545, 'New', '2021-01-01 03:52:24', '2021-01-01 03:52:24'),
(6, 'XXXXXXX202101010922536', 11, 4545, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 1, 4545, 'New', '2021-01-01 03:52:53', '2021-01-01 03:52:53'),
(7, 'XXXXXXX202101010923417', 11, 4545, NULL, 'admin.awards@gov.in', '8287986687', 'psunandap@gmail.com', 'Talkatora Road, Lucknow', 1, 4545, 'New', '2021-01-01 03:53:41', '2021-01-01 03:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2020-12-30 06:47:39', '2020-12-30 06:47:39'),
(2, 'role-create', 'web', '2020-12-30 06:47:39', '2020-12-30 06:47:39'),
(3, 'role-edit', 'web', '2020-12-30 06:47:39', '2020-12-30 06:47:39'),
(4, 'role-delete', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(5, 'product-list', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(6, 'product-create', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(7, 'product-edit', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(8, 'product-delete', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(9, 'order-list', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(10, 'order-create', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(11, 'order-edit', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40'),
(12, 'order-delete', 'web', '2020-12-30 06:47:40', '2020-12-30 06:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_image` text COLLATE utf8mb4_unicode_ci,
  `price` float DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `quantity`, `product_image`, `price`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Pintoo Gautam', 'dsfsdfdsfd', NULL, NULL, NULL, NULL, '2020-12-31 03:58:52', '2020-12-31 03:58:52'),
(5, 'Pintoo Gautam', 'dfdfdfd', NULL, NULL, NULL, NULL, '2020-12-31 04:01:25', '2020-12-31 04:01:25'),
(6, 'dfdsf', 'rgfdgfdgf', NULL, NULL, NULL, NULL, '2020-12-31 04:02:12', '2020-12-31 04:02:12'),
(7, 'Product5', 'fdgfdg', 1, NULL, 1, 1, '2020-12-31 04:06:06', '2020-12-31 05:42:42'),
(8, 'Product 6', 'gfhfgh', 2, NULL, 2, 1, '2020-12-31 04:06:49', '2020-12-31 05:42:56'),
(9, 'Product4', 'tytytry', 2, NULL, 2, 1, '2020-12-31 04:09:45', '2020-12-31 05:42:24'),
(10, 'Product3', 'fdgfdgfd', 454, NULL, 45435, 1, '2020-12-31 04:15:30', '2020-12-31 05:42:00'),
(11, 'Product2', 'fgdgfd', 435, NULL, 4545, 1, '2020-12-31 04:46:28', '2020-12-31 05:41:52'),
(12, 'Product1', 'vcxvxcvcfgfdgfd', 435, 'product/Tn3MowUeNbC17YgcvL6T2nFUIoslFkMgXBo60DOy.png', 43543, 2, '2020-12-31 04:52:47', '2020-12-31 05:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-12-30 06:48:37', '2020-12-30 06:48:37'),
(2, 'Executive', 'web', '2020-12-30 06:50:06', '2020-12-30 06:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` text COLLATE utf8mb4_unicode_ci,
  `login_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `mobile`, `country`, `state`, `district`, `profile_image`, `login_ip`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pintoo Gautam', 'admin@gmail.com', NULL, '$2y$10$4t3JgYYU8ia38YV6Qq9zuORkRY9hfJVjtZdkXl8qPemiph4E2Kzj2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-30 06:48:37', '2020-12-30 06:48:37'),
(2, 'test', 'admin4@gmail.com', NULL, '$2y$10$b1H7INDPZeN5dY68r.qMmeHkXt8hThm8skTjU5K9tHk8cnZeVYU0q', NULL, '8287986687', 'India', 'UTTAR PRADESH', 'fghfghfg', 'users/WNGnOmV6UFW5W9S0ecKpLhifCB0jHC74b6bfrkfu.png', NULL, 2, '2020-12-31 01:34:53', '2021-01-01 04:56:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
