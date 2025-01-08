-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 08, 2025 at 12:38 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `url_shortner`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_tokens`
--

DROP TABLE IF EXISTS `access_tokens`;
CREATE TABLE IF NOT EXISTS `access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_tokens_token_unique` (`token`),
  KEY `access_tokens_client_id_foreign` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `access_tokens`
--

INSERT INTO `access_tokens` (`id`, `client_id`, `token`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 1, '357427ea0e268193f0185735045d9e97478c99268e22b5d18ff425b887b0a165', '[\"generate_url\", \"delete_url\"]', '2025-01-08 06:52:22', '2025-01-08 06:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. Caleigh Tillman II', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(2, 'Darrion Hand', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(3, 'Glenna Connelly', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(4, 'Baylee Johns', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(5, 'Verna Renner', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(6, 'Mr. Jaylon Pollich', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(7, 'Prof. Kaden Romaguera', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(8, 'Beryl Ondricka', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(9, 'Elmer Mueller', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(10, 'Fred Gislason', '2025-01-06 10:20:43', '2025-01-06 10:20:43'),
(11, 'george', '2025-01-07 02:06:44', '2025-01-07 02:06:44'),
(12, 'Don', '2025-01-07 03:18:24', '2025-01-07 03:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invite_customers`
--

DROP TABLE IF EXISTS `invite_customers`;
CREATE TABLE IF NOT EXISTS `invite_customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `invite_token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `signed_up` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invite_customers_email_unique` (`email`),
  UNIQUE KEY `invite_customers_invite_token_unique` (`invite_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb3_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_05_150551_create_personal_access_tokens_table', 1),
(5, '2025_01_06_072034_create_clients_table', 2),
(6, '2025_01_06_072328_create_short_urls_table', 2),
(7, '2025_01_06_072741_create_access_token_table', 2),
(8, '2025_01_06_075900_create_clients_table', 3),
(9, '2025_01_06_080833_add_column_client_id_in_user_table', 4),
(10, '2025_01_06_100315_create_short_urls_table', 5),
(11, '2025_01_06_101237_create_access_tokens_table', 5),
(12, '2025_01_07_043051_add_creatd_by_to_short_urls_table', 6),
(13, '2025_01_07_053643_modify_column_role_in_users_table', 7),
(14, '2025_01_07_060947_create_invite_customers_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', '434fce3569f796a0f46ab409bf63fd0be56e7a8d4278d9ab4b3ebc919993ab10', '[\"*\"]', '2025-01-08 06:56:28', NULL, '2025-01-08 06:06:51', '2025-01-08 06:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb3_unicode_ci,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6IrW1rLmQCSf3KPjOgOGwCcznvXIWoPe8AUttSbM', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia1R5NFpkZGpUeEFCSUVSb3REUHBYbGtzblZvdnlLbENGS2FtOVQ4NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335184),
('ZwUwhGKzPGKvv6kgaUzVbw7WcfH3aK6r3Lg8g55M', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV1RjOXNMU280bmlYVWxyRjU3OUwwZUlES3kwOXN3Y2tNQ0Q2QzA3ZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335241),
('cn2vaucCo2QAbrvgOMwbirKi4g5i6uKlq3vnbxoD', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidGNwVEVNNVNacFFMZ1g3WTU1bzZMWHJKWWE1bHRqM0VGN05FczdqeSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzYxNTc7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336158),
('2MfclxOy9BE5lKsxjgRIFCAs5phGQdlwn4Qwd8nd', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTTNjcU1SRHZBU2FFOFZUeVo5MmhxOTlDWTk5V254a2NoTlpFTTJBeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334744),
('Tqe8yNRIgyEL1483WSLVtZCOvrJ0qGNYo4nmBGgp', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid2dSSTlxMHBBSHdlSGcyb1U5NjR2ZTBmemYxOG16RFF6TzNnZDhwaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334929),
('JzIQTotSRiTyKqbsaTbeZcpjxPJdY6EsojFHotqQ', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaHZXZTRYTFI4Rk5PTGR6U0xzNWtod29uR3Fxb3Y5dmtUaVkwemxhbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334679),
('igsmYBlLTcc76G2Hgzzs0OYQLS0pooHqaW6PUq1M', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYWJLUWRjZmpMSXhINXdJb0tmQlJnRFJKd3FVaHFwOFlZTURwS3BTNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335003),
('C8rAL8TQHy6yXp0EAllm8IwMQw8qgZbdptMOJJTT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN2hkN2U0MGgwUDJoS1RtYnRGZmtHVGcyNnIyeDVCN2c5cmNjeVI2byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTczNjMyOTE1ODt9fQ==', 1736339738),
('peiNUhXrjcANE47YCPCp7tOozuqZkrkHzA6rEW8M', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSEt3OE1KQm5JTk1EalVHc2ZVN0tobEJqMXkxOEdmcGttMjNvN0xoaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334937),
('tG6pPgmgvxg8EqRD5H6kTHu3xeRmuoeLrL0Be3qp', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmZaYzI0YW5Ndkg3RkRBSnk0UnptN2VTUnNnNDNyd2pYSUNORTBaZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334966),
('AvY12ALEPm3Wn7P8DyCiNc1UDTziD7wswhmrBq8B', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWGxXaGlnTU1mUWRPYW9UaXZWS0Q0c251N0g5UzFyMmNtejNFQkxuayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736334633),
('IY4AcdehM8hsP8JDsTXM6lwacVepTGMxX8YHdCoy', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicGxtWEZzTmJsMjlaNzBVWU9tcnpKWnd2T3J6TXVzbTdYdGg0cE44ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335347),
('dcmix9d3CetJeGSKT98hSLIJBUvRBwSjdrkM3K2L', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibjVCdkg2Zm1TcGZOMlZHbXV4SWs1Y1RjcDNoT1VjUjVtQlk5ckh6MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335476),
('XjuPoXr3mAxt4RtcmeYNCDCVNFBhFD4Q4a5qAh9A', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTWw2N1ptc2J1Q05reWsxNWFGNXVmYkU5V0c2UVhkamtpTzg5Wm40YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335485),
('1Eyo4KIpdOcyBpNu5pxPHUNO6vvQVthK1rpeUdyB', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ2VhRVdpZ3lScTZlSlhXSWxTYzBxSEJRVGNsd0paQkxOeU9QT1g2bSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzU1ODg7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335588),
('KN5UuyFT3aQ8z7CveV7ujapmBoZ9KLHuZWTArHtw', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiazF1dkx0YTFUN2llNDJUbGM0OHc3MGZSRWpmd1dSV1FveWpSREdTMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736335589),
('0ZXfIo1R1BoJkgLfRtlBI7l1j44F3F6N4er7TScw', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2xOcTNVa3BlRE5hRWl0bVBBa1B3ZG92dGdFVWxIVzNXZnpRTkVvZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335589),
('VlKggaAA2pUaVISpkxvWJlX2ToiNxYJMs4Y06Tui', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMHVCUjdaazhhTFRDbkJBVTJ6NWJjRDJ2RUNEbjhmbk13WXpLT0ZvTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335632),
('nWvY8xDDs3OOrshG8gOeljeF04An8n11tmu0VRhN', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOWVJbFR4SnBCWnlNbWhDcFN2MUs1V0NSQmtwWm5JU080S0VobWd6eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736335642),
('CVHBSQxGXTM04dmtiMAGhpK9WwG8B9dOSrB7OG1l', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQUJwVXk4M2RKamRUbEhzQjlSSFdhRHBQc0tzSHlZa29DdTRiUjFSRyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzU2NTA7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335650),
('euKA0zx4Teq9MoyrjlaUY6ckZFifiMUCWwhmzGty', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieTR1ZnNCbzlNTHJKQUFJY2g1bjNmZmZmWkcyQzZLRjRVOVNlMHgwbCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736335650),
('Dr4zqAdoSdZWV7LjuzmcgRugq5rkcvp65NqAYvIn', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVhUb3hWODhqTjBTWlR6WXNVd1hoblNpWU1EYTZVc1RZMG11NldmeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335650),
('p7c88uQ4k3eRTJQldM7jsAu2NoCeI63y1ufxrguN', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNDkxaEFZdFMyWUdhZmpGNk9sN0N0d0Y2dEVYZ3VrSlR3alRKTXJGaiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzU2Njc7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335667),
('tpZCWSVwviZC86BKSzna0ByA89dUQ6ccRLG1IqP1', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmZIM1UwdTdITEs4ZGhxRVpLSVA4SllXMzlsMGZjQnVQTzBDODE2QyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736335668),
('WnLqowUDJg1pBweIynOudVba9xJXANSGufs0J0Uh', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjlqc3pwUUlHMmVxd0M4bnRhcUtPNmdOSmZNZWJZZXlIMkEwc0JScCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736335668),
('XWZdyrbXq2Mv5dpmJ5Hnyf8gPQuJDpQDgRRxoxl8', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMTNob3BuTHloSnVtS2dHSGF6MW1tOW1YbXp6cEptVDRCOW1wbm55dSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzYwNTE7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336051),
('xtPmChbR901eZEcTD7B4Cxhc2gFMvE0OVwa8Yiaa', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzNIRXBzRkw4Sno4aGlIalQ1WkJRZlpOaW4wZ3RJT3MxVWhWNEVLcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736336051),
('3u2DFn2FwTF9pnoOa1YZIsqaar1K3efWBABWOB8U', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW9tQzh2aEN6UDdZbmoyd1FnaWs2aWVLNnpVdlJNVXFvY1YybWtubSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336052),
('Z5X8KEFKyMvdeELMXKd3f3IrUYpACzgV3J54e9TZ', 1, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNDZJT256alJQbG5WMGRpZGs3TTB3M2Z3ZHJUeUY2M0VLYzRKc1l1bSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzYzMzYwNzU7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336075),
('9vyhd8KBGMa2Sq05qYp8CWWTRbGOyhp99vEdAFtG', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVGNTQUxxR1M2RU9qdUFQbUR1M0xlNjRiVnFoSlV2WWdQSVUwUW93VCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736336075),
('q7jLPFxIIPm1VtupUbNd8LJhYgwYe9eUs6gMjk9r', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3pyT09jOWRYTjVUWTluRmZtQ0JwMllXZER2WkVwT25RSE4yRVVFUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336075),
('rG4LNOU403X2u3oYnv1bWOYGaGkPM5RG8s9yyt8U', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZjUyMnBwUHZaRkhFbWY2RmtXUHlpUTdJblAzWUZPdU90emc0S2VMMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736336158),
('7qd3fjeKBy7HBNd0A2vvNqo5W2ohlcGSTlaLQ6Y6', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXlOb09TNEVFNmRHcUVjS2J4U1lzcVlNaUFSd0JUWjVkdmVuQUVBViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736336159);

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

DROP TABLE IF EXISTS `short_urls`;
CREATE TABLE IF NOT EXISTS `short_urls` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `long_url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_urls_short_url_unique` (`short_url`),
  KEY `short_urls_client_id_foreign` (`client_id`),
  KEY `short_urls_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `created_by`, `client_id`, `user_id`, `long_url`, `short_url`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'https://www.google.com/', 'FL5z3i', '2025-01-06 23:44:33', '2025-01-06 23:44:33'),
(2, 1, 1, 1, 'https://www.google.com/', 'jRfW3m', '2025-01-06 23:54:43', '2025-01-06 23:54:43'),
(3, 1, 1, 1, 'https://www.google.com/', 'eAbzQm', '2025-01-08 04:48:05', '2025-01-08 04:48:05'),
(4, 1, 1, 1, 'https://identity.getpostman.com/browser-auth/success?redirect_uri=postman%3A%2F%2Fauth%2Fcallback&code=311113d2d0e2d482b88e9320b8196051efbb9b9eab208ee91725131646a8546c', 'gzTjs2', '2025-01-08 06:56:28', '2025-01-08 06:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `role` enum('admin','member','superadmin') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'member',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_client_id_foreign` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `client_id`, `role`) VALUES
(1, 'Fred Gislason', 'fred@outlook.com', NULL, '$2y$12$0saGJboyDla/gdohnW3eUOWLKK0thQarHCcBZHYlPuUYTEnvLTm52', NULL, '2025-01-06 10:31:33', '2025-01-06 10:31:33', 1, 'admin'),
(3, 'Super Admin', 'superadmin@outlook.com', NULL, '$2y$12$vVN9K1hvwCEe10SAjEnZD.KViZvASKiZGbbHaQ3CNUNb7r0zGwOES', NULL, '2025-01-07 00:36:38', '2025-01-07 00:36:38', 2, 'superadmin'),
(26, 'frank', 'mycurriersf@gmail.com', NULL, '$2y$12$.dFV9XkhoBUIs3KZcNJx0uyxJjfYl7adUbqcDhXF37ZEuS5hImPI.', NULL, '2025-01-08 04:05:11', '2025-01-08 04:05:11', 1, 'member'),
(25, 'Don', 'vasuvlv.858@gmail.com', NULL, '$2y$12$Ml0zRZNQ7P0yDNREMFeoi.aucAJOeJzfIfymN57gO4Mlbk/06R62q', NULL, '2025-01-07 04:40:58', '2025-01-07 04:40:58', 12, 'member');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
