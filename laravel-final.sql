-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 16, 2022 at 08:44 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-final`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Video Games', '2021-12-10 10:40:20', '2021-12-10 10:40:20', NULL),
(2, 'Plush Toys', '2021-12-10 10:44:28', '2021-12-10 10:44:28', NULL),
(3, 'Character Figures', '2021-12-10 10:49:04', '2021-12-10 10:49:04', NULL),
(4, 'Deletion tester', '2022-01-20 05:06:11', '2022-01-20 22:45:54', '2022-01-20 22:45:54'),
(5, 'Deletion tester 2', '2022-01-20 22:51:12', '2022-01-20 23:34:39', '2022-01-20 23:34:39'),
(6, 'Video Games 21', '2022-01-20 23:10:52', '2022-01-20 23:12:05', '2022-01-20 23:12:05'),
(7, 'Delete Button tester', '2022-01-21 06:45:56', '2022-03-28 05:08:48', '2022-03-28 05:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `category_id`, `price`, `quantity`, `sku`, `picture`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pikmin 2', '<p>Pikmin 2 is a 2004 puzzle strategy video game developed and published by Nintendo for the GameCube home video game console.</p>', 1, '19.99', 50, 200412892, '1645066765.png', '2021-12-10 19:21:33', '2022-03-18 05:38:00', NULL),
(2, 'Call of Duty Black Ops', '<p>Call of Duty Black Ops is a 2010 first-person shooter game developed by Treyarch and published by Activision.</p>', 1, '43.99', 115, 991159359, '1645059778.png', '2021-12-10 19:45:28', '2022-03-18 05:38:16', NULL),
(3, 'Bean Bag Plush Pac-Man', '<p>Bean bag plush Pac-Man made by Knickerbocker. Comes with one of the following phrases printing on it; \"Eat You Up\", \"Score With Me\", or \"Hungry For You\".</p>', 2, '19.99', 21, 946177417, '1645059752.png', '2021-12-10 20:10:41', '2022-02-17 05:02:32', NULL),
(4, 'Plush Funky Kong(B2809)', '<p>Plush Funky Kong from 1995. This is a Japanese product so all labeling is in Japanese.</p>', 2, '193.00', 69, 828094517, '1645066773.png', '2021-12-10 20:49:01', '2022-02-17 06:59:33', NULL),
(5, 'King K Rool Figure', '<p>This product is a toy figure of the Donkey Kong character King K Rool. This little figure was made by Nintendo in 1997 in collaboration with Kellogg\'s.</p>', 3, '137.98', 97, 997711271, '1645066754.jpg', '2021-12-10 21:12:28', '2022-02-17 06:59:14', NULL),
(6, 'Joe Gardner Figure', '<p>You may ask \"Who\'s Joe?\", Joe \'Buddy\' Gardner is a character from the hit Disney movie Soul. This Figure comes with a removeable hat and a ghost to be displayed with.</p>', 3, '24.94', 3, 713210107, '1645059869.jpg', '2021-12-10 21:23:50', '2022-02-17 05:04:30', NULL),
(9, 'Homie the Clown', '\"Homie the Clown\" is the fifteenth episode of the sixth season of the American animated television series The Simpsons. It originally aired on the Fox network in the United States on February 12, 1995. In the episode, Homer becomes a Krusty the Clown impersonator, but is mistaken for the real Krusty by the Springfield Mafia. Joe Mantegna returned as Fat Tony, while Dick Cavett and Johnny Unitas guest starred as themselves.', 4, '0.99', 34, 212945139, '1642647808.png', '2022-01-20 07:03:28', '2022-01-20 07:22:44', '2022-01-20 07:22:44'),
(10, 'Giuseppe Kombat', '<p>This the hit new fighting game that everyone is raving about. Slice the others down, Smoke the competition, and finally, enjoy a hot slice of pizza pie. Play as such characters as \'Ghost\' from Call of Duty Modern Warfare, \'Grey Fox\' from the Metal Gear Series, \'Ryu\' from Ninja Gaiden, \'Doom Slayer\' from Doom, \'Vigil\' from Rainbow Six: Siege, and many more.</p>\r\n<p>*Special Edition*:</p>\r\n<p>&nbsp; &nbsp;- 2 new character (\'Dante\' from the Devil May Cry Series, \'Funky\' from the Donkey Kong) Series</p>\r\n<p>&nbsp; &nbsp;- New campaign featuring the new characters</p>\r\n<p>&nbsp; &nbsp;- Ranked game mode</p>', 1, '79.99', 473, 615100821, '1645059829.png', '2022-01-20 07:19:59', '2022-02-17 05:03:49', NULL),
(11, 'test deletion', 'VG21 deletion after item deletion test', 6, '999', 999, 999999999, '1642705907.png', '2022-01-20 23:11:48', '2022-01-20 23:12:01', '2022-01-20 23:12:01'),
(12, 'a', 'a', 5, '1', 1, 1, '1642706128.png', '2022-01-20 23:15:28', '2022-01-20 23:16:19', '2022-01-20 23:16:19'),
(13, 'b', 'b', 5, '2', 2, 2, '1642706205.png', '2022-01-20 23:16:45', '2022-01-20 23:17:37', '2022-01-20 23:17:37'),
(14, 'c', 'c', 5, '3', 3, 3, '1642706280.png', '2022-01-20 23:18:00', '2022-01-20 23:21:02', '2022-01-20 23:21:02'),
(16, 'r', 'c', 5, '4', 1, 0, '1642706515.png', '2022-01-20 23:21:55', '2022-01-20 23:22:34', '2022-01-20 23:22:34'),
(17, 'red', 'der', 5, '321', 123, 213, '1642706597.png', '2022-01-20 23:23:17', '2022-01-20 23:24:20', '2022-01-20 23:24:20'),
(18, 'aa', 'aa', 5, '11', 11, 11, '1642706679.png', '2022-01-20 23:24:40', '2022-01-20 23:24:53', '2022-01-20 23:24:53'),
(19, 'aaa', 'aaa', 5, '111', 111, 111, '1642706721.png', '2022-01-20 23:25:21', '2022-01-20 23:31:00', '2022-01-20 23:31:00'),
(20, 'aaaa', 'aaaa', 5, '1111', 1111, 1111, '1642707083.jpg', '2022-01-20 23:31:23', '2022-01-20 23:34:32', '2022-01-20 23:34:32'),
(21, 'Josh Richardson', '<p>Josh \"Schrodinger\'s Trade Value\" Richardson is a Basketball player that, in NBA Live 2019 specifically, can net you anything from a low 2nd round pick to James Harden and a few 1st rounders. This has led to an inside joke of him being like Schrodinger\'s cat meaning that no-one really knows his trade value and it is considered simultaneously high and low.</p>', 1, '21.12', 1, 800376355, '1645060121.png', '2022-02-16 04:22:51', '2022-02-17 05:08:41', NULL),
(22, 'Captain America Figure (Avengers: Endgame)', '<p>The highly-accurate Captain America collectible figure is expertly crafted based on the appearance of Chris Evans as Captain America/Steve Rogers from <em>Avengers: Endgame</em>. Featuring a newly painted helmeted head sculpt with three interchangeable lower faces capturing Chris Evan&rsquo;s facial expressions and an un-helmeted head sculpt, a muscular body which naturally portrays Captain America&rsquo;s muscularly toned body, a meticulously tailored outfit with a star emblem on the chest, Cap&rsquo;s star-spangled shield, a delicate compass, a signature helmet and a specially designed movie-themed figure stand.</p>', 3, '49.99', 23, 495172619, '1645746113.jpg', '2022-02-25 03:41:53', '2022-02-25 03:59:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_sold`
--

CREATE TABLE `items_sold` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_item` bigint(20) UNSIGNED NOT NULL,
  `id_order` bigint(20) UNSIGNED NOT NULL,
  `ttlPrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items_sold`
--

INSERT INTO `items_sold` (`id`, `id_item`, `id_order`, `ttlPrice`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(377, 21, 160, 21.12, 1, '2022-03-27 06:35:06', '2022-03-27 06:35:06', NULL),
(378, 1, 161, 279.86, 14, '2022-03-27 08:14:54', '2022-03-27 08:14:54', NULL),
(379, 2, 161, 2243.49, 51, '2022-03-27 08:14:54', '2022-03-27 08:14:54', NULL),
(380, 10, 161, 3039.62, 38, '2022-03-27 08:14:54', '2022-03-27 08:14:54', NULL),
(381, 21, 162, 21.12, 1, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(382, 10, 162, 2399.7, 30, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(383, 22, 162, 699.86, 14, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(384, 6, 162, 74.82, 3, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(385, 1, 162, 919.54, 46, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(386, 5, 162, 4967.28, 36, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(387, 3, 162, 179.91, 9, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(388, 4, 162, 386, 2, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(389, 2, 162, 5058.85, 115, '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(390, 1, 163, 99.95, 5, '2022-04-16 20:49:48', '2022-04-16 20:49:48', NULL),
(391, 1, 164, 19.99, 1, '2022-04-16 20:56:15', '2022-04-16 20:56:15', NULL),
(392, 1, 165, 19.99, 1, '2022-04-16 20:57:47', '2022-04-16 20:57:47', NULL),
(393, 1, 166, 19.99, 1, '2022-04-16 21:32:26', '2022-04-16 21:32:26', NULL),
(394, 1, 167, 19.99, 1, '2022-04-16 21:38:18', '2022-04-16 21:38:18', NULL);

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_08_034905_create_categories_table', 1),
(6, '2021_12_08_035354_create_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fName` text NOT NULL,
  `lName` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `ip_address` text NOT NULL,
  `session_id` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_info`
--

INSERT INTO `order_info` (`id`, `fName`, `lName`, `phone`, `email`, `ip_address`, `session_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(160, 'Ethan', 'Schaller', '1-902-578-4570', 'ethanschaller99@gmail.com', '127.0.0.1', 'qYT3tfJKn6J9qZlgT09HGk5QsuI8G5YX9ydYdF4l', '2022-03-27 06:35:06', '2022-03-27 06:35:06', NULL),
(161, 'Albert', 'Allister', '1-111-111-1111', 'alallister@gmail.com', '127.0.0.1', 'PQ4J1fQ2JOykEj45t3HCEASiFMWe9J64JcT7SKLM', '2022-03-27 08:14:53', '2022-03-27 08:14:53', NULL),
(162, 'Ethan', 'Schaller', '1-902-578-4570', 'ethanschaller99@gmail.com', '127.0.0.1', 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '2022-03-28 05:28:16', '2022-03-28 05:28:16', NULL),
(163, 'Test', 'Order', '1234567890', 'tester@example.com', '127.0.0.1', 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '2022-04-16 20:49:48', '2022-04-16 20:49:48', NULL),
(164, 'Test', 'Order2', '1234567890', 'tester@example.com', '127.0.0.1', 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '2022-04-16 20:56:14', '2022-04-16 20:56:14', NULL),
(165, 'Test', 'Order3', '1234567890', 'tester@example.com', '127.0.0.1', 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '2022-04-16 20:57:46', '2022-04-16 20:57:46', NULL),
(166, 'Test', 'Order4', '1234567890', 'tester@example.com', '127.0.0.1', 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '2022-04-16 21:32:26', '2022-04-16 21:32:26', NULL),
(167, 'test', 'Order5', '1234567890', 'tester@example.com', '127.0.0.1', 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '2022-04-16 21:38:18', '2022-04-16 21:38:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ethanschaller99@gmail.com', '$2y$10$g.U4hOSsT9vS/ymwHycLE.S5g2FWtJcXXg0on/fKDe1b3DiSnpz52', '2022-01-27 05:56:15');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `session` text NOT NULL,
  `ip` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `item_id`, `quantity`, `session`, `ip`, `created_at`, `updated_at`, `deleted_at`) VALUES
(35, 21, 1, 'qYT3tfJKn6J9qZlgT09HGk5QsuI8G5YX9ydYdF4l', '127.0.0.1', '2022-03-27 06:34:52', '2022-03-27 06:34:52', NULL),
(36, 1, 14, 'PQ4J1fQ2JOykEj45t3HCEASiFMWe9J64JcT7SKLM', '127.0.0.1', '2022-03-27 08:13:03', '2022-03-27 08:13:24', NULL),
(37, 2, 51, 'PQ4J1fQ2JOykEj45t3HCEASiFMWe9J64JcT7SKLM', '127.0.0.1', '2022-03-27 08:13:07', '2022-03-27 08:13:19', NULL),
(38, 10, 38, 'PQ4J1fQ2JOykEj45t3HCEASiFMWe9J64JcT7SKLM', '127.0.0.1', '2022-03-27 08:13:11', '2022-03-27 08:13:27', NULL),
(39, 21, 1, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:25:43', '2022-03-28 05:25:43', NULL),
(40, 10, 30, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:25:47', '2022-03-28 05:27:25', NULL),
(41, 22, 14, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:25:52', '2022-03-28 05:27:29', NULL),
(42, 6, 3, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:25:57', '2022-03-28 05:27:33', NULL),
(43, 1, 46, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:26:02', '2022-03-28 05:27:37', NULL),
(44, 5, 36, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:26:08', '2022-03-28 05:27:40', NULL),
(45, 3, 9, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:26:17', '2022-03-28 05:27:45', NULL),
(46, 4, 2, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:26:21', '2022-03-28 05:27:48', NULL),
(47, 2, 115, 'DbMVgHwSK1fjPPSaGCW6dMxNPUBPpVrdauuWiKa0', '127.0.0.1', '2022-03-28 05:27:18', '2022-03-28 05:27:52', NULL),
(48, 1, 5, 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '127.0.0.1', '2022-04-16 20:49:21', '2022-04-16 20:53:21', '2022-04-16 20:53:21'),
(49, 1, 1, 'snOr0e4l0pVFIyjv7TCMHcp6B9e4kyzkFgIyjQuz', '127.0.0.1', '2022-04-16 20:54:26', '2022-04-16 20:54:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Ethan Schaller', 'ethanschaller99@gmail.com', NULL, '$2y$10$l7toNrD93dalPXzMLFBuh.OElqasN.7EWzXJxOfU4HEMmJynYKUYm', 'Lchgbxt6l8BI0sBmoandBxfM41IN7v67NjL7nRUKsQ46cGQAtuFeunh9Knhu', '2022-01-27 06:01:23', '2022-01-27 06:01:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_unique` (`category`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_sku_unique` (`sku`),
  ADD KEY `items_title_index` (`title`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sold_item_ids` (`id_item`),
  ADD KEY `sold_order_ids` (`id_order`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_ids` (`item_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `items_sold`
--
ALTER TABLE `items_sold`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_info`
--
ALTER TABLE `order_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD CONSTRAINT `sold_item_ids` FOREIGN KEY (`id_item`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `sold_order_ids` FOREIGN KEY (`id_order`) REFERENCES `order_info` (`id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `item_ids` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
