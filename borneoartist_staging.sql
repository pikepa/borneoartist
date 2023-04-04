-- -------------------------------------------------------------
-- TablePlus 5.2.2(478)
--
-- https://tableplus.com/
--
-- Database: borneoartist_staging
-- Generation Time: 2023-01-29 15:51:27.0640
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `category_id` int unsigned NOT NULL,
  `Product_id` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int unsigned NOT NULL DEFAULT '0',
  `owner_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `paras`;
CREATE TABLE `paras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `para_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `featured_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int unsigned NOT NULL,
  `discount` int unsigned NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_at` timestamp NULL DEFAULT NULL,
  `owner_id` int unsigned NOT NULL,
  `likes` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `medium` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `category`, `type`, `active`, `created_at`, `updated_at`) VALUES
(1, 'The Sea', NULL, 1, NULL, '2022-05-08 14:55:07'),
(2, 'Abstract', NULL, 1, NULL, '2022-05-08 14:54:56'),
(3, 'Asian Tigers', NULL, 1, NULL, '2022-05-08 14:55:03'),
(4, 'Wildlife', 'SBJ', 1, '2022-05-05 22:08:43', '2022-05-08 14:55:13'),
(6, 'Transportation', 'SBJ', 1, '2022-05-14 15:00:46', '2022-05-14 15:00:54'),
(7, 'Elephants', 'SBJ', 1, '2022-05-14 15:04:55', '2022-05-14 15:05:22'),
(8, 'Jungle', 'SBJ', 1, '2022-05-14 15:22:30', '2022-05-14 15:22:30'),
(9, 'Landscape', 'SBJ', 1, '2022-05-14 15:23:55', '2022-05-14 15:23:55'),
(10, 'Birds', 'SBJ', 1, '2022-05-14 15:32:07', '2022-05-14 15:32:07'),
(11, 'People', 'SBJ', 1, '2022-05-14 15:39:37', '2022-05-14 15:39:37');

INSERT INTO `category_product` (`category_id`, `Product_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 7),
(3, 8),
(4, 9),
(4, 6),
(4, 7),
(4, 8),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(3, 6),
(4, 14),
(4, 15),
(6, 15),
(4, 16),
(7, 16),
(7, 17),
(4, 17),
(4, 18),
(7, 19),
(4, 19),
(4, 20),
(4, 21),
(6, 22),
(6, 23),
(8, 24),
(9, 25),
(9, 26),
(9, 27),
(4, 27),
(8, 28),
(10, 28),
(9, 29),
(11, 31),
(9, 32),
(11, 32),
(1, 33),
(6, 33),
(10, 34),
(1, 34),
(9, 34),
(1, 35),
(1, 36);

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\Product', 1, '8212bddf-8f22-4118-a1aa-3eddbcfdb29d', 'photos', 'waterloo.png', 'BpBYjXRiQ9ldUU0aVMPd58qjLhDGHn-metad2F0ZXJsb28ucG5n-.png', 'image/png', 's3', 's3', 1066543, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 5, '2022-05-05 21:08:10', '2022-05-05 21:08:11'),
(6, 'App\\Models\\Product', 2, 'd1525cd4-e513-4014-a731-77c971f46fe3', 'photos', 'victory.png', 'FoTuUhHEJvQZpMqx2lEDGppmkxvdjH-metadmljdG9yeS5wbmc=-.png', 'image/png', 's3', 's3', 1945984, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 6, '2022-05-05 21:10:03', '2022-05-05 21:10:04'),
(7, 'App\\Models\\Product', 3, '286b3d63-e99f-4726-b915-27968d03d5d7', 'photos', 'fishermen.jpeg', 'DW8yt8tqKhVSkTl4d4Or4yKIa659is-metaZmlzaGVybWVuLmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 56020, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 7, '2022-05-05 21:10:57', '2022-05-05 21:10:58'),
(11, 'App\\Models\\Product', 6, '8844567d-e345-4e97-af6c-b738d0d02a21', 'photos', 'KingOfTheJungle2005-900x675.jpeg', 'UTuwGjqJlkxaFcviaWgPoBmbvsmlVf-metaS2luZ09mVGhlSnVuZ2xlMjAwNS05MDB4Njc1LmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 159589, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 10, '2022-05-05 21:46:18', '2022-05-05 21:46:19'),
(12, 'App\\Models\\Product', 5, '63928fc7-cdf3-4270-9a97-a2f9d2f6a8e0', 'photos', 'The-red-cuboard.jpeg', 'FCI8NuKLVqMiJcWyq5LxWN0WDWjPeA-metaVGhlLXJlZC1jdWJvYXJkLmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 71204, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 11, '2022-05-05 21:47:18', '2022-05-05 21:47:18'),
(13, 'App\\Models\\Product', 4, '3072a370-2852-45de-823e-6e402a40843a', 'photos', 'BuddahInSunrise.png', 'iUtu9yBYtlbaTHkSOZxIWYIA0GRhte-metaQnVkZGFoSW5TdW5yaXNlLnBuZw==-.png', 'image/png', 's3', 's3', 1974593, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 12, '2022-05-05 21:47:56', '2022-05-05 21:47:57'),
(14, 'App\\Models\\Product', 7, '240b08d2-d317-4820-acdc-3b5094d77f9a', 'photos', 'EyeoftheTiger_2005.jpeg', 'gIhY0VkalUBZ9v0m2kvpfzdDAMYIGI-metaRXllb2Z0aGVUaWdlcl8yMDA1LmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 90566, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 13, '2022-05-05 22:01:09', '2022-05-05 22:01:10'),
(15, 'App\\Models\\Product', 8, '1faeff6c-5536-4f90-950e-f7496bfc603e', 'photos', 'FamilyTiger-900x675.jpeg', 'zpHPStLh00IyK8aCb4EkqdSeyeo9tA-metaRmFtaWx5VGlnZXItOTAweDY3NS5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 158335, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 14, '2022-05-05 22:05:15', '2022-05-05 22:05:16'),
(16, 'App\\Models\\Product', 9, 'd8a0a94e-f549-44d3-95ba-a63beaa87412', 'photos', 'ElephantBushMaster.jpeg', 'H6GO4UOebGXgYLKzWHHc0qjevstXz8-metaRWxlcGhhbnRCdXNoTWFzdGVyLmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 64207, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 15, '2022-05-05 22:08:16', '2022-05-05 22:08:16'),
(18, 'App\\Models\\Product', 10, 'd8dbc4b7-dcb8-4194-9a9d-6cf0364eb0f5', 'photos', 'Screen Shot 2022-05-06 at 9.28.57 pm.png', 'tQIIczXIEpmpHWOffMCnX5QYPWiTFR-metaU2NyZWVuIFNob3QgMjAyMi0wNS0wNiBhdCA5LjI4LjU3IHBtLnBuZw==-.png', 'image/png', 's3', 's3', 2069521, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-07 06:31:27', '2022-05-07 06:31:29'),
(19, 'App\\Models\\Product', 11, '279cb22c-aa98-4e16-af8b-3171af510d87', 'photos', 'MustardGrass.jpeg', '6E7zrceq5eksi91hJFh1N0Ipqs2x6E-metaTXVzdGFyZEdyYXNzLmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 149168, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-07 06:34:09', '2022-05-07 06:34:10'),
(20, 'App\\Models\\Product', 12, '228e6bad-e5ba-44e2-bc4c-791087ea6200', 'photos', 'Parrots.png', 'dRfxzbgFEvTGjHDE10LhkJr48Zhfps-metaUGFycm90cy5wbmc=-.png', 'image/png', 's3', 's3', 1292850, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-07 06:38:32', '2022-05-07 06:38:33'),
(21, 'App\\Models\\Product', 13, '7ce65179-8916-4ff9-9d63-e11adcea5427', 'photos', 'BruneiMosqueAfterRain.jpeg', 'QC3FkLlx9ETd4twPoLJvPOAijYbyUs-metaQnJ1bmVpTW9zcXVlQWZ0ZXJSYWluLmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 92313, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-07 06:41:14', '2022-05-07 06:41:15'),
(22, 'App\\Models\\Product', 14, 'c685926a-3cc5-468f-a933-54296dc45fac', 'photos', 'AfricanLeopard.png', 'FFgtUXKEAYGAG6J4sLHI8O6JzKDJYs-metaQWZyaWNhbkxlb3BhcmQucG5n-.png', 'image/png', 's3', 's3', 1643583, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 14:51:04', '2022-05-14 14:51:06'),
(23, 'App\\Models\\Product', 15, 'b7c5e924-fbff-485d-b8d5-e42f8023b6fa', 'photos', 'BorneoHighway.png', 'lO1efnssI8fPSrj91kETT8ZU5UPdt9-metaQm9ybmVvSGlnaHdheS5wbmc=-.png', 'image/png', 's3', 's3', 1894582, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:00:05', '2022-05-14 15:00:06'),
(24, 'App\\Models\\Product', 16, 'ab23c3c3-5e49-484f-b74f-1f7b68cefff8', 'photos', 'elephants-1-768x576.jpeg', '36BDfMCwew4dsoSiWtuh7cLAGXM3X0-metaZWxlcGhhbnRzLTEtNzY4eDU3Ni5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 40279, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:04:20', '2022-05-14 15:04:20'),
(25, 'App\\Models\\Product', 17, 'e140416d-8c2d-48be-962a-88fcad287e6f', 'photos', 'elephants-Kinabatangan.jpeg', 'J9QVAHwD9LJHtNBvp5LVNZYEyI0Ggo-metaZWxlcGhhbnRzLUtpbmFiYXRhbmdhbi5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 142576, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:07:43', '2022-05-14 15:07:43'),
(26, 'App\\Models\\Product', 18, '179b0f90-667f-4b43-89c2-25dc07c73c40', 'photos', 'Rhino.jpeg', 'KjqBWCohFxbpVcBqcomIhJC0s0KPTt-metaUmhpbm8uanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 128686, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:10:01', '2022-05-14 15:10:02'),
(27, 'App\\Models\\Product', 19, '3c3a5346-ddd3-47f4-b24c-c9f3e62a625f', 'photos', 'Sunrise.jpeg', 'WzvMUI9B31ce13zrcjIgKXJp8UShYo-metaU3VucmlzZS5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 54300, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:12:33', '2022-05-14 15:12:34'),
(28, 'App\\Models\\Product', 20, '6db01b3a-e886-414c-a014-97b438cf0d8b', 'photos', 'TheEdgeOfMankind.jpeg', 'DYCeMDGQNgY2dvEWh7PInS6ucJJ4dg-metaVGhlRWRnZU9mTWFua2luZC5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 107429, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:14:14', '2022-05-14 15:14:14'),
(29, 'App\\Models\\Product', 21, 'dfe50615-6939-42d5-878d-2af8fca4af3f', 'photos', 'SnowLeopard.jpeg', '1BZaflp4v2Gyc6dSxYRtctzT1sXc2Z-metaU25vd0xlb3BhcmQuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 89132, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:16:32', '2022-05-14 15:16:33'),
(30, 'App\\Models\\Product', 22, 'c2df8b12-83cd-4588-98a1-bcd158fd18d1', 'photos', 'River-Crossing.jpeg', 'AZ1ejdV2TOriGWXJzXiFzvkr6VRA9E-metaUml2ZXItQ3Jvc3NpbmcuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 60791, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:18:29', '2022-05-14 15:18:30'),
(31, 'App\\Models\\Product', 23, 'fbe28f30-3128-487d-9ca9-ebe9455cfbdb', 'photos', 'Rafting-on-the-Kiulu.jpeg', '9WDYvaonsb2u39vIo5NZVlniopWaNf-metaUmFmdGluZy1vbi10aGUtS2l1bHUuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 61620, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:20:26', '2022-05-14 15:20:27'),
(32, 'App\\Models\\Product', 24, '870d12e8-1062-47c0-a686-a9d37b16dd9a', 'photos', 'crocker-range.jpeg', 'kUBWdq8Xrwx3K5pSCKLr9c5pYBHHFC-metaY3JvY2tlci1yYW5nZS5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 67884, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:23:19', '2022-05-14 15:23:20'),
(33, 'App\\Models\\Product', 25, '44d6fa6f-044a-42cb-a79f-481a69ddb21e', 'photos', 'Mosque-Likas-Bay.jpeg', '77NHcG6675I4mOP1yz3zL8CgeexE8g-metaTW9zcXVlLUxpa2FzLUJheS5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 87559, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:25:59', '2022-05-14 15:26:00'),
(34, 'App\\Models\\Product', 26, 'b672f65e-2c1c-47ff-bf29-7baac877a206', 'photos', 'Hornbills-over-the-Limbang-River.jpeg', 'uY8KPA7AkezJmxJOj8V1Ri9TZ9OI6L-metaSG9ybmJpbGxzLW92ZXItdGhlLUxpbWJhbmctUml2ZXIuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 123955, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:27:43', '2022-05-14 15:27:44'),
(35, 'App\\Models\\Product', 27, 'f70b09d0-7d21-4940-9729-92562d203b26', 'photos', 'EaglesOverCrocker.jpeg', 'BCbCprEeiIkG3gIohmS0a5BsymdOh5-metaRWFnbGVzT3ZlckNyb2NrZXIuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 111260, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:30:19', '2022-05-14 15:30:19'),
(36, 'App\\Models\\Product', 28, '14cd5648-1618-4fca-bd79-1fafd0802d25', 'photos', 'Brahmany-Kites-in-Kudat.jpeg', 'oKl7IPCroRQAjoQTDYG2KIr9XbQJ0v-metaQnJhaG1hbnktS2l0ZXMtaW4tS3VkYXQuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 71451, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:32:29', '2022-05-14 15:32:30'),
(37, 'App\\Models\\Product', 29, '8b539dbb-2ffa-47c2-ac3c-26393d09bd0b', 'photos', 'KampongKukut.jpeg', 's2mCwDXWB2l0kiTBza9HnEsDUl8yHl-metaS2FtcG9uZ0t1a3V0LmpwZWc=-.jpg', 'image/jpeg', 's3', 's3', 42167, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:34:35', '2022-05-14 15:34:36'),
(38, 'App\\Models\\Product', 30, 'fa0a197c-b578-4fc2-ad05-e95889ae63d3', 'photos', 'The EdgeOfTheJungle.png', 'LvyDGwDkS8jbLMR0Xwz1gCrepetMXz-metaVGhlIEVkZ2VPZlRoZUp1bmdsZS5wbmc=-.png', 'image/png', 's3', 's3', 925804, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:37:57', '2022-05-14 15:37:58'),
(39, 'App\\Models\\Product', 31, 'f5cf255a-001b-477e-9f98-889db2b52ff0', 'photos', 'Borneo-Artist.jpeg', 'QAvVUMl6P8AMTxacM9Lnyil7SS6nnk-metaQm9ybmVvLUFydGlzdC5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 128387, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:40:30', '2022-05-14 15:40:31'),
(40, 'App\\Models\\Product', 32, 'aa48125d-6c2b-4173-a0ec-628ab51dd21b', 'photos', 'gathering-the-rice-crop-L-Balud.jpeg', 'EYoG4QyleGWT8hbNnAdtA8Z32IlhwY-metaZ2F0aGVyaW5nLXRoZS1yaWNlLWNyb3AtTC1CYWx1ZC5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 101637, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:41:56', '2022-05-14 15:41:57'),
(41, 'App\\Models\\Product', 33, '41ceaadf-f12f-4283-8a6b-976746c54142', 'photos', 'LondonDock.jpeg', 'BBGdcgRdHdfNEcAchYouJV7pJpVptC-metaTG9uZG9uRG9jay5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 86762, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:44:30', '2022-05-14 15:44:31'),
(42, 'App\\Models\\Product', 34, '82d2e778-55f2-4ce8-ad5d-f1851d70c270', 'photos', 'Fish-eagles-Kudat.jpeg', 'P5m48gWzi2Vn0hTBtHXdaCJcHP0yyp-metaRmlzaC1lYWdsZXMtS3VkYXQuanBlZw==-.jpg', 'image/jpeg', 's3', 's3', 75414, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:46:09', '2022-05-14 15:46:10'),
(43, 'App\\Models\\Product', 35, '416f636f-df40-41b5-b06e-1b403e0e30b3', 'photos', 'KudatTrawlerMencominghome.jpeg', 'SNXLih8Cv1h3DskOMDZuNFHqba4q8X-metaS3VkYXRUcmF3bGVyTWVuY29taW5naG9tZS5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 189865, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 15:47:46', '2022-05-14 15:47:46'),
(44, 'App\\Models\\Product', 36, 'ff7b6f1c-4b49-4028-bd81-b5252d6c6341', 'photos', 'Trawlermen.jpeg', 'ETj6GkeWofxgSqkIhhKDKlOzTnN4Or-metaVHJhd2xlcm1lbi5qcGVn-.jpg', 'image/jpeg', 's3', 's3', 100458, '[]', '[]', '{\"full\": true, \"thumb\": true}', '[]', 1, '2022-05-14 16:19:23', '2022-05-14 16:19:24');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_15_003012_create__products_table', 1),
(4, '2019_05_27_032754_create_new_category_file', 1),
(5, '2019_05_27_085955_make_new_category_product_pivot_table', 1),
(6, '2019_06_04_004355_create_messages_table', 1),
(7, '2019_06_09_015718_alter_table__categories', 1),
(8, '2019_07_05_045731_alter_product_table', 1),
(9, '2020_04_12_101420_add_is_admin_field_to__users', 1),
(10, '2020_04_21_140837_create_pages_table', 1),
(11, '2020_05_12_100148_create_paragraph_table', 1),
(12, '2020_05_25_131918_add_slug_to_product_table', 1),
(13, '2020_06_17_094936_add_likes_to_products', 1),
(14, '2021_01_04_112222_create_media_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(16, '2022_05_06_153410_add_medium_and_size_to_product', 3);

INSERT INTO `pages` (`id`, `name`, `slug`, `featured_img`, `title`, `active`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'About Me', 'about-me-ray-winfield', NULL, 'Ray Winfield', 1, 1, NULL, '2022-05-05 06:34:38'),
(2, 'At Work', 'at-work-at-work', 'BorneoArtistAtWork.jpg', 'At Work', 1, 1, NULL, '2022-05-05 15:13:49');

INSERT INTO `paras` (`id`, `para_content`, `page_id`, `created_at`, `updated_at`) VALUES
(1, 'I have been working in Oils on large canvas for over 40 years, having lived and worked most of my life in various countries, in fact 14 of them, as wide ranging as Canada, USA, Asia, Africa, the Middle east and the South Pacific, and travelled to many more, where I have tried to capture where possible pictures of local cultural and wild life.', 1, '2022-05-05 06:35:08', '2022-05-05 06:35:08'),
(2, 'Having spent many years in asia, 12 of which have been spent in north Borneo where I now call home. I paint most of my work from my studio at my house on the beach in Sabah.', 1, '2022-05-05 06:35:20', '2022-05-05 06:35:20'),
(3, 'I want my work to be unique in the fact that I have always tried to capture in contemporary style subjects and surround them with added passion and vigor to give greater depth to the final work.', 1, '2022-05-05 06:35:32', '2022-05-05 06:35:32'),
(4, 'With a broad use of the palette knife I hope to create in each of my works depth of color and tone that exemplifies an added dimension and passion to reality, an example being Kudat Trawler men, painted from a 2 day experience out in the South China Sea, the painting was conceived at the end of a storm at sea, You will never hear me complain again about the price of fish, as I know what Malaysian Fishermen go through to put food on our table .', 1, '2022-05-05 06:35:46', '2022-05-05 06:35:46'),
(5, 'I am a passionate conservationist and actively involved with WWF and the Sabah based Kudat Turtle conservation society (KTCS), 5% of my sale proceeds go to WWF, KTCS and or PDK ( mentally disabled children in Kudat).', 1, '2022-05-05 06:35:59', '2022-05-05 06:35:59'),
(6, 'Working with large 3×4, 4×4, 4X6 feet Canvases, the use of the pallet knife is essential, some Pictures can take 3-12 months to complete! This picture is about 30% complete, the details and final coloring and light distribution are being added.', 2, '2022-05-05 15:14:07', '2022-05-05 15:14:07');

INSERT INTO `products` (`id`, `featured_img`, `title`, `slug`, `description`, `price`, `discount`, `status`, `publish_at`, `owner_id`, `likes`, `created_at`, `updated_at`, `medium`, `size`) VALUES
(1, '5', 'Two British Frigates off Penang', NULL, 'Two British Frigates off Penang', 0, 0, 'Not For Sale', '2022-05-05 00:00:00', 1, 2, '2022-05-05 05:43:47', '2022-05-15 22:39:41', 'Oil on Canvas', '4′ x 4′'),
(2, '6', 'HMS Victory at the Battle of Trafalgar', NULL, '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', 0, 0, 'Not For Sale', '2022-05-05 00:00:00', 1, 0, '2022-05-05 05:47:05', '2022-05-15 22:39:33', 'Oils on Canvas', '4′ x 4′'),
(3, '7', 'Kudat Fishermen in the China Sea', NULL, 'The local Sabahan fishermen will spend all night fishing out to sea and return the next day with the nights catch. They sail west into the sun on the outgoing tide with the tip of Borneo Lighthouse to the left. Started 2005 and completed 2010.', 0, 0, 'Not For Sale', '2022-05-05 00:00:00', 1, 0, '2022-05-05 05:51:13', '2022-05-15 22:38:21', 'Oil on Canvas', '4′ x 3′'),
(4, '13', 'Buddah in the Early Morning Sunrise', NULL, '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', 1000000, 0, 'For Sale', '2010-05-01 00:00:00', 1, 0, '2022-05-05 21:20:51', '2022-05-15 22:36:55', 'Oil on Canvas', '4′ x 4′'),
(5, '12', 'Gradma’s old red Kitchen Cupboard', NULL, 'The cupboard started life in Sarawak in the 50″s and finished up fully restored in an executive home in Sabah. A family heirloom- the cupboard saw 7 children grow up.\r\nOil on Canvas 24X24 inches', 0, 0, 'Not For Sale', '2010-12-03 00:00:00', 1, 0, '2022-05-05 21:28:39', '2022-05-15 22:39:22', 'Oil on Canvas', '2\' x 2\''),
(6, '11', 'King of the Jungle', NULL, 'Painted in 2005 whilst in Kuala Lumpur. The picture was to be a gift from a Canadian via the Canadian High commission for the Prime Minister of Malaysia, unfortunately an alternative gift was provided.', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-05 21:31:40', '2022-05-15 22:37:27', 'Oil on Canvas', '6\' x 4\' - Framed'),
(7, '14', 'Eye of the TIGER', NULL, 'Painted in 2005 whilst in Kuala Lumpur. I have attempted to illustrate the cunning of the tiger a creature of stealth.', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-05 22:00:57', '2022-05-15 22:39:06', 'Oil on Canvas', '3\' x 3\' - Framed'),
(8, '15', 'Tiger Family', NULL, 'Part of the Kuala Lumpur collection painted in 2005. I was hoping to have my first exhibition in KL but moved on to India.', 0, 0, 'Not For Sale', '2010-10-01 00:00:00', 1, 0, '2022-05-05 22:05:02', '2022-05-15 22:37:15', 'Oil on Canvas', '6\' x 4\' - Framed'),
(9, '16', 'The African Elephant - Bush Master', NULL, 'Painted whilst on contract in Zambia 1973, portrays the strength and agility of the bush elephant, painted whilst on vacation in the Luangwa Game Park. I never had time to finish the bush grass.  Painted while in Kenya.', 0, 0, 'Not For Sale', '2010-05-01 00:00:00', 1, 0, '2022-05-05 22:07:54', '2022-05-15 22:37:07', 'Oil on Canvas', '3\' x 2.5\' - Framed'),
(10, '18', 'The Great Chinese Warrior', NULL, '“The great Chinese warrior”… silk screen over oil painted Canvas. . Black, with gold trim denote good karma.', 0, 0, 'Not For Sale', '2010-12-03 00:00:00', 1, 0, '2022-05-07 06:31:09', '2022-05-15 22:39:15', 'Oils on Canvas', '2\' x 2\''),
(11, '19', 'California Mustard grass in the Spring', NULL, 'The side roads in certain parts of California are covered with a bright yellow mustard grass, the bloom last for about a week. Painted while working in the USA.', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-07 06:33:38', '2022-05-15 22:38:38', 'Oil on Canvas', '3.5\' x 3\' - Gold Framed'),
(12, '20', '\"Parrots are Green”, Impressionism', NULL, 'Painted in Kudat 2010, inspired by a flight of green parrots over my beach front land and jungle. The brilliant green flash flew past me never to return… I can only assume they left their nesting grounds due to nearby forest clearance.', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-07 06:37:11', '2022-05-15 22:38:29', 'Oil on Canvas', '4′ x 4′'),
(13, '21', '“Brunei Mosque after the rain”', NULL, 'A contemporary Impression conceived whilst in Brunei 1997-1986 whilst on a jungle run on the high ridge opposite Bandar Seri Begawan, the light pieced a hole in the dark heavy tropical rainy sky down onto the gold dome of the mosque, making an electrifying picture of color and contrast, the scene lasted only a few seconds, then the almost black rainy sky closed over again . Painted whilst living in Malaysia in 2005. This painting has accompanied me on my many of my travels while invoking peace and strength on my journeys.', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-07 06:40:12', '2022-05-15 22:38:49', 'Oil on Canvas', '5\' x 5\''),
(14, '22', 'The African Leopard', NULL, 'A study of this fine animal, Painted in 2005 from a sketch I did in Kenya in 1976, where there are numerous game parks. Framed Oil on Canvas. Size X', 0, 0, 'Not For Sale', '2010-12-01 00:00:00', 1, 0, '2022-05-14 14:11:55', '2022-05-15 22:38:58', 'Oil on Canvas', 'Framed'),
(15, '23', 'Borneo Highway in the early days', NULL, 'Ipsum Lrem', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 14:55:45', '2022-05-15 22:38:11', 'Oil on Canvas', '4′ x 4′'),
(16, '24', 'Elephants on the Kinabatangan River at Dawn', NULL, 'IpSum Lorem', 0, 0, 'For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:03:24', '2022-05-15 22:40:00', 'Oil on Canvas', '4′ x 4′'),
(17, '25', 'Family of Pigmy Elephants', NULL, 'A family of Pigmy Elephants taking a mid morning stroll along the shores of the Kinabatangan river-the lush green grass on the river sides is a huge draw. Rumor has it that herds of 40 or more Elephants can be seen at times along the river.', 0, 0, 'For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:07:14', '2022-05-15 22:39:53', 'Oil on Canvas', '4′ x 4′'),
(18, '26', 'A study of the Borneo Rhino', NULL, 'Taken from a Photo graph from the KK zoo, the jungle added later-to see this shy animal is extremely rare. I have added a lot more light to the painting than would be possible deep into primary jungle. Painted in 2010.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:09:16', '2022-05-15 22:38:04', 'Oil on Canvas', '2\' x 2\' Framed'),
(19, '27', 'Morning sun rise through the mist, Kinabatangan Elephants', NULL, 'Whilst on Vacation in the Kinabatangan River system 2006, there are now thanks to the Malaysian Governments conservation efforts, huge herds of 20 –to 60 Pigmy elephants. The high jungle back drop in the early morning mist is a sight to behold. Only the males have tusks.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:11:49', '2022-05-15 22:36:33', 'Oil on Canvas', '4′ x 3′ Framed'),
(20, '28', 'At the Edge of Mankind', NULL, 'Portraying the snow leopards habitat that is diminishing. Thanks to the Malaysia government, great efforts are in place to protect these species of cat by the continued development of forest reserves throughout North Borneo.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:13:51', '2022-05-15 22:31:12', 'Oil on Canvas', '2\' x 2\' Framed'),
(21, '29', 'The Borneo Snow Leopard', NULL, 'An extremely shy animal and difficult to spot in the Borneo jungle, Painted 2010, in Sabah, researched from the Kota Kinabalu Zoo.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:16:05', '2022-05-15 22:35:17', 'Oil on Canvas', '2\' x 2\''),
(22, '30', '“Jungle Bridge Crossing', NULL, 'These incredible structures made of wire and wood, are stretched high up and across the many rivers in Borneo are the only way of crossing a fast flowing river-they are essential to local trade and for the local Borneo tribes to carry goods from the jungle to home or to market. 70 feet high water crossings are not un common, the scene is taken from a rafting expedition I did on the Kiulu river in Sabah during 2010.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:17:57', '2022-05-15 22:35:29', 'Oil on Canvas', '4′ x 4′ Framed'),
(23, '31', 'Local Kiulu River rafter in the early Morning Mist”', NULL, 'The long bamboo rafts are used on the Kiulu river to transport rubber and people across the fast flowing river. A prime example of pure Borneo conservation.', 200000, 0, 'For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:20:03', '2022-06-18 12:00:23', 'Oil on Canvas', '4′ x 4′'),
(24, '32', 'The Crocker Range from Sinurambi”', NULL, 'My good friend Terry and Rose Mills live adjacent to the Crocker mountain range National park, 1,000 meters above sea level, the steep jungle is a never ending kaleidoscope of color and light , where one can see birds of all descriptions glide across the forest canopy looking for prey, beneath the forest canopy are clear streams and riverlets full of fish and fresh water crustacean, deer, large pythons and a multitude of snakes and reptiles-food in plenty for canopy Bird life. Painted 2010.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:23:01', '2022-05-15 22:35:49', 'Oil on Canvas', '4′ x 4′ Framed'),
(25, '33', 'Likas Bay, Sabah with a storm coming on.', NULL, 'Likas Bay is in Kota Kinabalu Sabah Malaysia, behind the bay are the Mountains, and mount Kinabalu the highest mountain in SE Asia, the beautiful Mosque holds solid and steadfast in the face of the storm. Painted 2010. Oil on canvas. Size 3 feet X 4 feet.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:25:34', '2022-05-15 22:35:59', 'Oil on Canvas', '3\' x 4\' Framed'),
(26, '34', 'Hornbills flying down the Limbang River -Sarawak Borneo', NULL, 'Conceived from a sketch whilst on a Limbang river expedition whilst working in Brunei 1979 -1986. Trees 150 feet tall crowd the river banks, struggling for moisture. Hornbills are plentiful in Sarawak North Borneo.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:27:35', '2022-05-15 22:36:11', 'Oil on Canvas', '3.5\' x 3\' - Framed'),
(27, '35', 'Eagles over the Crocker Range', NULL, 'Inspired from the Crocker mountain range, a short distance from KK, where one can see eagles of all descriptions float across the forest canopy looking for prey, deep below the canopy. Mist after the rain and In the morning creates amazing light effects amongst the tall trees. Painted 2010.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:30:10', '2022-05-15 22:36:22', 'Oil on Canvas', '3.5\' x 3.5\' Framed'),
(28, '36', 'Brahmany Kites over the jungle in Kudat.', NULL, 'The high ridges of the Tip of Borneo hold a multitude of bird life, the fish eagles and kites being the most popular. Painted 2006 and finished 2010, Framed, Oil on Canvas. Size 5 feet X 4 feet.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:32:21', '2022-05-16 05:35:03', 'Oil on Canvas', '5′ x 4′ Framed'),
(29, '37', 'Kampong Kukut SABAH after the Hunt.', NULL, 'Ipsum Lorem', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:34:25', '2022-05-15 22:36:43', 'Oil on Canvas', '4′ x 4′'),
(30, '38', 'The Edge of the Jungle.', NULL, 'From a jungle walk near Kota Marudu where an old Rungus couple are coming out of the misty morning jungle, walking along a fallen jungle tree trunk laden with jungle produce and food, bamboo (used for local building) and a long grass weave. The early morning sunlight streams through the jungle mist. The hunting dogs ( mongrels) in the painting are common in Borneo, their job is sniffing out what may lie ahead on the jungle path or in this case the fallen tree.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:37:23', '2022-05-15 22:37:38', 'Oil on Canvas', '4′ x 4′'),
(31, '39', 'The Artist at Work.', NULL, 'Working with large 3×4, 4×4, 4x6 feet Canvases, the use of the pallet knife is essential, some Pictures can take 3-12 months to complete! This picture is about 30% complete, the details and final colouring and light distribution are being added.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:39:49', '2022-05-15 22:37:47', 'Oil on Canvas', '4′ x 4′'),
(32, '40', 'Gathering the rice crop in Kota Belud', NULL, 'The local Kadazan ladies gather the rice crop, always with a smile.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:41:46', '2022-05-15 22:40:31', 'Oil on Canvas', '2\' x 2\' Framed'),
(33, '41', 'London Dock 1900’s', NULL, 'Painted from a photo in 1998. I wanted to capture the old port of London sea trade that in those days supported an empire.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:44:21', '2022-05-15 22:40:41', 'Oil on Canvas', '4′ x 4′'),
(34, '42', 'The Kudat Off Shore islands.', NULL, 'Started in 2006 and finished when I returned from Canada to Malaysian 2010, the beautiful offshore islands (28 of them) and the ever changing blue seas off my house are something to behold. Most afternoons a pair of fish eagles will ride the on shore breeze looking for fish and food washed up on the beach, we also have migrating frigate birds pass in their droves in the spring. Oil on canvas. Size 4 feet X 4 feet.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:45:50', '2022-05-15 22:37:57', 'Oil on Canvas', '4′ x 4′ Framed'),
(35, '43', 'Kudat Trawlers coming home in a North Easterly Gail', NULL, 'Kudat Trawlers coming home in a North Easterly Gail, passing the lighthouse at Palau (Island ) Kalumpian ( Tip of Borneo) ”. Oil on Canvas. size 3ft x2Ft 6”', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 15:47:37', '2022-05-15 22:40:09', 'Oil on Canvas', '3\' x 2.5\' - Framed'),
(36, '44', 'Kudat Trawler Men', NULL, 'Conceived whilst out in the China sea fishing in 2006 on a stormy night. The message is… don’t ever criticize the cost of Malaysian fish, given what it takes to catch them. In Seas of 3-4 meters these brave fishermen will continue to fish risking their lives for the catch.', 0, 0, 'Not For Sale', '2022-05-14 00:00:00', 1, 0, '2022-05-14 16:19:13', '2022-05-15 22:40:19', 'Oil on Canvas', '5\' x 4\'');

INSERT INTO `users` (`id`, `name`, `about`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Peter', NULL, 'pikepeter@gmail.com', NULL, '$2y$10$nbo4N2jePIvViiO2U9d5Xe2FGsT6OgqM59CjdelqZS9MLT4b2FDya', 'default', NULL, '2022-05-04 16:20:25', '2022-05-04 16:20:25'),
(3, 'Ray Winfield', NULL, 'raywin@hotmail.com', NULL, '$2y$10$R7E8/Box0wrBDlIPdPhDb.b/OVbp5Bf20wW251jM.gi.q7ZA8Xrzy', 'default', NULL, '2022-07-11 13:37:57', '2022-07-11 13:37:57');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;