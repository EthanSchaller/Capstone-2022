-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 04, 2022 at 08:51 PM
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
(7, 'Delete Button tester', '2022-01-21 06:45:56', '2022-01-21 06:45:56', NULL);

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
(1, 'Pikmin 2', '<p>Pikmin 2 is a 2004 puzzle strategy video game developed and published by Nintendo for the GameCube home video game console.</p>', 1, '19.99', 50, 200412892, '1645066765.png', '2021-12-10 19:21:33', '2022-02-17 06:59:25', NULL),
(2, 'Call of Duty Black Ops', '<p>Call of Duty Black Ops is a 2010 first-person shooter game developed by Treyarch and published by Activision.</p>', 1, '43.99', 115, 991159359, '1645059778.png', '2021-12-10 19:45:28', '2022-02-17 05:02:59', NULL),
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `item_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 21, '2022-03-04 19:19:35', '2022-03-04 19:21:21', NULL),
(2, 21, 1, '2022-03-04 19:25:03', NULL, NULL);

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
(3, 'Ethan Schaller', 'ethanschaller99@gmail.com', NULL, '$2y$10$l7toNrD93dalPXzMLFBuh.OElqasN.7EWzXJxOfU4HEMmJynYKUYm', 'ambrImpJywO2uUzFJ3eS0m63141OK6d7swdBuRGd1AZE2VY657MrVCKA3Yuj', '2022-01-27 06:01:23', '2022-01-27 06:01:23');

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
