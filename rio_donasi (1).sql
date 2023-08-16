-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 15, 2023 at 04:19 PM
-- Server version: 8.0.33-0ubuntu0.20.04.4
-- PHP Version: 8.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rio_donasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_02_234615_create_post_categories_table', 1),
(6, '2022_10_03_013848_create_post_tags_table', 1),
(7, '2022_10_03_121649_create_permission_tables', 1),
(8, '2022_10_03_123534_create_posts_table', 1),
(9, '2022_10_05_095204_create_socmeds_table', 1),
(10, '2022_10_05_103500_create_posts_tags_table', 1),
(11, '2022_10_06_091107_create_settings_table', 1),
(12, '2022_11_06_021223_progams_categories', 1),
(13, '2022_11_06_031740_program', 1),
(14, '2022_11_08_130925_payments', 2),
(15, '2022_11_10_072108_create_program_galleries_table', 3),
(16, '2022_11_11_135610_donatur', 3),
(17, '2022_11_11_221112_rename_donatur_to_transactions_table', 3),
(18, '2022_11_11_221758_add_code_from_transactions_table', 3),
(19, '2022_11_12_101959_create_slider_table', 4),
(20, '2022_11_12_012642_program_budget', 5),
(21, '2022_11_19_153416_add_deleted_from_programs_table', 6),
(22, '2022_11_20_030205_add_admin_fee_from_settings_table', 7),
(23, '2022_11_20_212611_add_soft_delete_from_posts_table', 8),
(24, '2022_11_24_072450_add_soft_delete_from_transactions_table', 8),
(25, '2022_11_25_164424_add_soft_delete_from_users_table', 8),
(26, '2022_11_25_171205_add_user_id_from_transactions_table', 8),
(27, '2022_12_02_041242_add_u_code_from_transactions_table', 9),
(28, '2022_12_12_001930_add_payment_gateway_method', 10),
(29, '2022_12_12_012927_create_transaction_details_table', 10),
(33, '2023_08_08_084733_create_withdrawal_table', 11),
(37, '2023_08_08_110714_add_is_withdrawal_from_programs_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 9),
(5, 'App\\Models\\User', 22),
(5, 'App\\Models\\User', 23),
(5, 'App\\Models\\User', 24),
(5, 'App\\Models\\User', 27),
(5, 'App\\Models\\User', 28),
(5, 'App\\Models\\User', 29),
(5, 'App\\Models\\User', 30),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 34),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mayayoongiya@gmail.com', '$2y$10$J1O97JNR6fdOQdFOld3DZ.GWUPNAS6dww724fsFlehBvr.2tevAx6', '2022-12-12 13:45:20'),
('asdfasd@asdfasdf', '$2y$10$UajPv4PX/SuzCJpx3/d/iOfSfw6C5PDkPjCF6O3kblNce0p8wrY0y', '2023-08-11 07:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` bigint NOT NULL,
  `description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `number`, `description`, `created_at`, `updated_at`) VALUES
(10, 'Bank Cimb Niaga', 121281223, 'Admin', '2022-11-15 08:47:35', '2022-11-15 08:47:35'),
(11, 'Bank Permata', 739847490, 'Admin', '2022-11-15 08:48:03', '2022-11-15 08:48:03'),
(12, 'Bank BRI', 29838244, 'Admin', '2022-11-15 08:49:12', '2022-11-15 08:49:12'),
(13, 'Bank Bukopin', 218938213, 'Admin', '2022-11-15 08:49:38', '2022-11-15 08:49:38'),
(14, 'Bank Sinarmas', 9088786675, 'Admin', '2022-11-15 08:50:08', '2022-11-15 08:50:08'),
(15, 'Bank BCA', 1839218874, 'Admin', '2022-11-15 08:51:08', '2022-11-15 08:51:08'),
(16, 'Bank DKI', 123919243894, 'Admin', '2022-11-15 08:51:34', '2022-11-15 08:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(2, 'Profile View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:18:58'),
(3, 'Change Password View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:18:15'),
(4, 'Post Category View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(5, 'Post Category Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(6, 'Post Category Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(7, 'Post Category Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(8, 'Post Tag View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(9, 'Post Tag Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(10, 'Post Tag Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(11, 'Post Tag Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(12, 'Post View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(13, 'Post Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(14, 'Post Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(15, 'Post Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(16, 'Post Detail', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(17, 'Post Change Status', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(18, 'Program Category View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(19, 'Program Category Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(20, 'Program Category Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(21, 'Program Category Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(22, 'Program View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(23, 'Program Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(24, 'Program Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(25, 'Program Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(26, 'Program Detail', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(27, 'Program Change Status', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(28, 'Payment View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(29, 'Payment Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(30, 'Payment Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(31, 'Payment Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(32, 'Transaction View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(33, 'Transaction Detail', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(34, 'Transaction Print', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(35, 'Transaction Export', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(36, 'Transaction Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(37, 'Trash View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(38, 'Trash Restore', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(39, 'Trash Delete Permanent', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(40, 'Social Media View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(41, 'Social Media Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(42, 'Social Media Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(43, 'Social Media Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(44, 'Slider View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(45, 'Slider Create', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(46, 'Slider Edit', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(47, 'Slider Delete', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(48, 'Slider Detail', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(49, 'Filemanager View', 'web', '2022-11-28 07:12:48', '2022-11-28 07:12:48'),
(50, 'Role View', 'web', '2022-11-28 07:12:49', '2022-11-28 11:10:00'),
(51, 'Role Create', 'web', '2022-11-28 07:12:49', '2022-11-28 11:10:06'),
(52, 'Role Edit', 'web', '2022-11-28 07:12:49', '2022-11-28 11:10:10'),
(53, 'Role Delete', 'web', '2022-11-28 07:12:49', '2022-11-28 11:10:14'),
(54, 'Role Permission', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(55, 'Permission View', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(56, 'Permission Create', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(57, 'Permission Edit', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(58, 'Permission Delete', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(59, 'Setting View', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(60, 'Sitemap View', 'web', '2022-11-28 07:12:49', '2022-11-28 07:12:49'),
(61, 'Transaction Filter', 'web', '2022-11-28 10:42:29', '2022-11-28 10:42:29'),
(62, 'Transaction Change Status', 'web', '2022-11-28 10:44:16', '2022-11-28 10:44:16'),
(63, 'Withdrawal View', 'web', '2023-08-15 06:04:42', '2023-08-15 06:04:42'),
(64, 'Withdrawal Create', 'web', '2023-08-15 06:04:59', '2023-08-15 06:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_category_id` bigint UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `meta_keyword` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor` int NOT NULL DEFAULT '0',
  `image` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `post_category_id`, `description`, `status`, `meta_keyword`, `meta_description`, `visitor`, `image`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Indonesia Ditetapkan Negara Paling Dermawan versi World Giving Index 2022', 'indonesia-ditetapkan-negara-paling-dermawan-versi-world-giving-index-2022', 9, '<p><strong>TEMPO.CO</strong>,&nbsp;<strong>Jakarta</strong>&nbsp;- Charity Aid Foundation (CAF)&nbsp;menerbitkan laporan tahunan tentang negara&nbsp;<a href=\"https://www.tempo.co/tag/dermawan\" rel=\"noopener\" target=\"_blank\">dermawan</a>&nbsp;negara di seluruh penjuru dunia, Indonesia menjadi peringkat pertama berdasarkan World Giving Index (WGI) 2022 dengan jumlah presentase 68 persen pada 21 Oktober 2022.</p>\r\n\r\n<p>&ldquo;Ini menunjukkan kuatnya tradisi menyumbang kita yang diinspirasi oleh ajaran agama dan tradisi lokal yang sudah dipraktikkan puluhan tahun. Kondisi pandemi ternyata tidak berpengaruh pada minat dan antusiasme menyumbang masyarakat Indonesia dan hanya berdampak pada jumlah dan bentuk donasi yang disumbangkan,&rdquo; ujar Ketua Badan Pelaksana Public Interest Research and Advocacy Center Hamid Abidin dalam keterangannya Sabtu 22 Oktober 2022.</p>\r\n\r\n<p>Hamid juga menjelaskan pengaruh ajaran agama yang kuat juga menjadi salah satu kunci keberhasilan para pegiat&nbsp;<a href=\"https://www.tempo.co/tag/filantropi\" rel=\"noopener\" target=\"_blank\">filantropi</a>, khususnya Islam, dalam Lembaga pengelola Zakat, Infaq, Sedekah dan Wakaf (ZISWAF) yang mana mereka mengembangkan trategi penggalangan sumbangan keagamaan secara konvensional dan digital, serta menerapkan standar pengelolaan donasi secara tranparant dan akuntable.</p>\r\n\r\n<p>Berdasarkan index data World Giving Index (WGI) 2022, Indonesia memiliki jumlah presentasi 68 persen, lebih rendah 3 persen dibanding skor di tahun sebelumnya. Pencapaian ini menempatkan Indonesia sebagai negara paling dermawan dalam kurun waktu 5 tahun bertutut-turut.</p>\r\n\r\n<p>Hasil penelitian CAF menunjukkan 84 persen orang Indonesia menyumbang uang pada tahun 2021, jauh lebih tinggi dari skor rata-rata global (35 persen). Persentase warga Indonesia yang berpartisipasi dalam kegiatan kerelawanan juga tinggi (63 persen), hampir 3 (tiga) kali lebih besar dari angka rata-rata global (23 persen). Sementara persentase warga yang menyumbang untuk orang asing berjumlah 58 persen, sedikit lebih rendah dari angka rata-rata global (62 persen).</p>\r\n\r\n<p>&ldquo;Peneliti dan pegiat Filantropi menilai keberhasilan pegiat Filantropi dalam mengoptimalkan pemanfaatan TIK (Teknologi, Informasi dan Komunikasi) untuk kegiatan filantropi juga ikut andil dalam mendongkrak posisi Indonesia di WGI.&rdquo; Kata Hamid</p>\r\n\r\n<p>Pemanfaatan TIK menurut Hamid juga menjadi tonggak Lembaga filantropi bisa tetap beroperasi di masa pandemi dan memfasilitasi penyaluran sumbangan dari masyarakat. Namun seperti di tahun sebelumnya, berbagai peraturan perundang-undangan terkait Filantropi (UU 9/1961, PP 29/1980, Permensos 28/2021, dll) justru menghambat kedermawanan Indonesia, karena dianggap sudah ketinggalan zaman, kurangnya pendukung dan cenderung restriktif terhadap kegiatan kedermawanan.</p>\r\n\r\n<p>&ldquo;Sementara Insentif pajak di Indonesia belum menjadi pendorong warga untuk&nbsp;<a href=\"https://www.tempo.co/tag/donasi\" rel=\"noopener\" target=\"_blank\">donasi</a>&nbsp;karena cakupannya terbatas,&nbsp; jumlah insentif yang kecil, serta ketidakjelasan dan ketidakkonsistenan dalam penerapan kebijakannya.&rdquo; ujar Hamid</p>\r\n\r\n<p>Hamid memperkirakan beberapa tahun yang mendatang, sektor filantropi diseluruh dunia khususnya di Indonesia akan menghadapi 3 tantangan berat, yakni lingkungan geopolitik yang tidak stabil akibat perang Rusia - Ukraina, ancaman resesi ekonomi global, dan&nbsp; dampak perubahan iklim yang mempengaruhi pasokan makanan, migrasi dan bencana alam. Dukungan pemerintah menjadi salah satu cara agar dapat menunjang keberlanjutan organisasi Filantropi dan juga nirbala.</p>', 0, 'Indonesia Ditetapkan Negara Paling Dermawan versi World Giving Index 2022', 'Indonesia Ditetapkan Negara Paling Dermawan versi World Giving Index 2022', 0, 'posts/5gS4zJhyXmh60QVnTCa5rlMwiQt7lGD2ibTFUtlA.jpg', 2, '2022-11-16 09:10:19', '2022-12-05 03:28:21', NULL),
(2, 'Tiga Bencana Alam Terjadi di Papua', 'tiga-bencana-alam-terjadi-di-papua', 21, '<p>JAYAPURA -- Badan Penanggulangan Bencana Daerah (BPBD) Papua menyatakan sejumlah kabupaten dan kota di provinsi itu mengalami tiga bencana alam, yakni banjir, tanah longsor, dan air laut pasang (rob).</p>\r\n\r\n<p>Kepala BPBD Papua William Manderi mengatakan, sejumlah daerah yang melaporkan bencana alam secara lisan, yakni Kabupaten Waropen, Yapen, Biak, dan Kabupaten Nabire. &quot;Kami masih menunggu laporan tertulis karena baru Kota dan Kabupaten Jayapura yang melaporkannya,&quot; kata dia, Senin (10/1).</p>\r\n\r\n<p>Di Kota Jayapura, BPBD Papua membuka dapur umum yang menyiapkan 600 nasi bungkus per hari sejak Sabtu (8/1). Wakil Wali Kota Jayapura yang juga Ketua Tanggap Darurat Bencana Alam Kota Jayapura Rustan Saru mengatakan, 7.005 warga terdampak banjir dan tanah longsor.</p>\r\n\r\n<p>Sebanyak 12 orang tertimbun longsoran, tujuh meninggal dunia, lima orang mengalami luka-luka, dan empat dirawat di rumah sakit. &ldquo;Saat ini, air sudah surut dan sedang dilakukan pembersihan di berbagai kawasan yang terdampak,&rdquo; kata dia.</p>\r\n\r\n<p>Dinas Sosial, Kependudukan, Pemberdayaan Perempuan dan Anak Provinsi Papua mengatakan, Kementerian Sosial (Kemensos) mengirimkan 20 ton beras dan kebutuhan dasar, seperti selimut, kasur, pakaian layak pakai, sikat gigi, sabun mandi, serta lainnya untuk warga yang terdampak banjir. &quot;Kini dalam proses pendistribusian ke Papua,&quot; kata Pelaksana tugas Kepala Dinas Sosial, Kependudukan, Pemberdayaan Perempuan dan Anak Provinsi Papua Nius Wenda.</p>\r\n\r\n<p>Menurut Nius, persediaan bantuan logistik untuk korban bencana alam di wilayahnya sudah semakin menipis. Dinsos Papua sudah menyalurkan bantuan lima ton beras dan makanan siap saji pada hari pertama pascabencana banjir dan longsor di Kota Jayapura.</p>\r\n\r\n<p>Wali Kota Jayapura Benhur Tomi Mano menyatakan, Badan Nasional Penanggulangan Bencana (BNPB) akan membantu pemasangan alarm pendeteksi pergerakan tanah di Ibu Kota Provinsi Papua itu. Ia mengatakan, pemasangan alat tersebut dapat membantu mendeteksi pergeseran tanah di sekitarnya sehingga warga ada kesempatan untuk menyelamatkan diri.</p>\r\n\r\n<p>Dia mengatakan, ada tiga lokasi yang akan dipasang pendeteksi itu, yakni sekitar Bhayangkara, Angkasa, dan Klofkamp atau Paldam. Selain bantuan tersebut, Pemkot Jayapura akan memperbanyak penyebaran pengumuman di daerah-daerah yang rawan bencana mengingat dari laporan BMKG curah hujan akan meningkat pada Februari mendatang.</p>\r\n\r\n<p>&quot;Warga yang bermukim di lereng gunung dan pinggir kali diminta waspada. Bila memungkinkan untuk sementara mengungsi ke daerah yang lebih aman, terutama pada malam hari,&quot; katanya.</p>\r\n\r\n<p>Balai Besar Meteorologi Klimatologi dan Geofisika (BBMKG) Wilayah V Jayapura memprakirakan kondisi cuaca di Kota Jayapura cerah berawan hingga dilanda hujan lokal untuk tiga hari ke depan. Kepala BBMKG Wilayah V Jayapura Cahyo Nugroho&nbsp;</p>\r\n\r\n<p>mengimbau masyarakat agar tetap waspada dan berhati-hati terhadap potensi cuaca ekstrem serta dampak yang dapat ditimbulkan, seperti banjir, tanah longsor, banjir bandang, genangan, angin kencang, pohon tumbang, serta jalan licin.</p>', 1, 'Tiga Bencana Alam Terjadi di Papua', 'Tiga Bencana Alam Terjadi di Papua', 0, 'posts/QGbnEHRqDqQvgyUqs10OtmtQEC9I3ZMrOW2Cvnd2.jpg', 1, '2022-11-29 15:27:33', '2022-11-29 15:27:33', NULL),
(3, 'Kasus Kematian Akibat Kanker di Jayapura Semakin Tinggi', 'kasus-kematian-akibat-kanker-di-jayapura-semakin-tinggi', 22, '<p>Jakarta, CNN Indonesia -- Kasus kanker di Jayapura berjumlah semakin&nbsp;tinggi dibandingkan dengan beberapa kasus penyakit menular lainnya.<br />\r\n<br />\r\nKonsultan kanker, Dr. Putu Agus Suwarta, di Jayapura, Jumat (26/2), mengatakan, setiap bulannya terdapat sepuluh&nbsp;penderita kanker baru di sana.&nbsp;Dia membandingkan, di kota Surabaya ada 800 penderita kanker baru dalam setahun.<br />\r\n<br />\r\nAhok Akan Tambah Radiotherapy untuk Pasien Kanker<br />\r\nNamun secara keseluruhan, angka kematian akibat kanker di seluruh dunia memang terus meningkat.<br />\r\n<br />\r\n&quot;Kita ngomong dua menit saja ini ada satu ibu sudah ada yang meninggal akibat kanker serviks,&quot; kata dokter Putu.<br />\r\n<br />\r\nDokter Putu&nbsp;dapat menyimpulkan demikian, karena&nbsp;kini semenjak enam bulan kedatangannya di Jayapira, sudah ada 50 kasus kanker yang ditangani.<br />\r\n<br />\r\n&quot;Meski kanker bukanlah penyakit yang menular dan hanya tergolong epidemis, penyakit kanker terbilang ganas karena membunuh secara perlahan,&quot; ujar dokter Putu.<br />\r\n<br />\r\nWalau&nbsp;angka kasus kematian akibat kanker semakin tinggi, namun pihaknya mengaku tidak punya alat kemotrapi yang memadai di Rumah Sakit Umum Daerah Jayapura.<br />\r\n<br />\r\nUntuk itu, lanjut dokter Putu, adanya informasi pencegahan dini terhadap kanker dirasa mampu mengurangi&nbsp;jumlah kematian yang tinggi.<br />\r\n<br />\r\nMenurutnya, Pemda belum memberi perhatian khusus terhadap masyarakat untuk mengatasi penyakit kanker yang bisa membunuh secara perlahan, apalagi kanker anak.<br />\r\n<br />\r\n&quot;Harusnya Pemda bisa&nbsp;lebih terbuka, bahwa kematian kanker itu jauh lebih besar dari TBC, AIDS dan kematian lalu intas,&quot; tegasnya.<br />\r\n<br />\r\n&quot;Bagaimana kalau ibu kena kanker serviks akibat pendarahan sehingga tidak bisa mengurus kekuarga, bagaimana kalau bapaknya terkena kanker mesoparing sehingga tidak bisa mencari nafkah untuk keluargannya, bagaimana seorang saudara bila terkena kanker kulit. Semua akan kacau bila ada satu anggota keluarga kena kanker,&quot; kata dokter Putu.<br />\r\n<br />\r\nDitempat terpisah, Ketua Yayasan Kanker Indonesia Wilayah Papua, Regina Karma belum lama ini mengatakan pencegahan kanker secara dini masyarakat bisa hidup sehat.<br />\r\n<br />\r\n&quot;Menghindari kanker dengan hidup sehat seperti mengkonsumsi makanan yang sehat seperti banyak makan sayur, buah, rajin olahraga dan tidur teratur agar bisa mengatur masa depannya,&quot; kata Regina.</p>', 1, 'Kasus Kematian Akibat Kanker di Jayapura Semakin Tinggi', 'Kasus Kematian Akibat Kanker di Jayapura Semakin Tinggi', 0, 'posts/UVylHas83zoU6iwhy9gmMQmotlq0Jmx2wCR6S68E.jpg', 1, '2022-11-29 15:35:23', '2022-11-29 15:35:23', NULL),
(4, 'Gempa Bumi Berkekuatan 5,6 Magnitudo Menerjang Cianjur Jawa Barat', 'gempa-bumi-berkekuatan-56-magnitudo-menerjang-cianjur-jawa-barat', 21, '<p>Gempa menerjang beberapa wilayah di Jawa Barat pada Senin, 21 November 2022, Gempa ini berpusat di Cianjur berada pada titik koordinat 6,84 Lintang Selatan dan 107.05 Bujur Timur. BMKG menyatakan gempa bumi di Cianjur siang hari ini tidak berpotensi tsunami.</p>\r\n\r\n<p>Gempa ini terjadi pada siang hari, saat para warga &nbsp;Cianjur tengah beraktifitas menjalankan rutinitas hariannya, selain di Cianjur gempa ini terasa hingga Kota Jakarta, Depok, Bekasi, Tangerang hingga wilayah Bandung.</p>\r\n\r\n<p>Pasca kejadian gempa bumi ini beredar video warga cianjur yang mengalami luka akibat terkena reruntuhan bangunan yang diakibatkan dari gempa bumi tersebut.</p>\r\n\r\n<p>Dari salah satu unggahan video yang dibuat oleh selebgram @dodihidayatullah terlihat bahwa beberapa warga alami luka berat hingga ringan bahkan ada yang terlihat tidak sadarkan diri akibat terkena reruntuhan bangunan.</p>\r\n\r\n<p>Sampai berita ini diturunkan belum ada keterangan pasti berapa jumlah warga yang terdampak akibat bencana alam ini.</p>\r\n\r\n<p>Pihak pemerintah Provinsi Jawa Barat melalui Jabar Quick respon saat ini tengah mempersiapkan segala kebutuhan yang diperlukan para warga Cianjur yang mengalami musibah bencana ini.</p>\r\n\r\n<p>Pemerintah Provinsi pun menghimbau kepada warga Cianjur untuk selalu berhati - hati akan adanya gempa susulan yang mungkin saja bisa terjadi di beberapa waktu kedepan.</p>\r\n\r\n<p>Untuk warga yang mengalami kerusakan bangunan pun diharapkan melapor kepada pejabat setempat untuk dilakukan pendataan yang nantinya bisa dicarikan solusi untuk perbaikan bangunan yang rusak akibat bencana ini.</p>\r\n\r\n<p>Terdapat beberapa postingan warga cianjur yang beredar di media sosial, kepanikan para warga yang histeris menyaksikan rumahnya hancur bahkan roboh dikarenakan gempa ini.</p>\r\n\r\n<p>Banyak netizen yang mendoakan untuk para warga Cianjur agar diberikan kesabaran dan ketawakalan dalam menghadapi ujian bencana ini.</p>\r\n\r\n<p>Berbagai aksi solidaritas antar masyarakat saat ini sudah mulai dilakukan guna membantu para warga terdampak bencana di Cianjur Jawa Barat ini.</p>\r\n\r\n<p>&nbsp;</p>', 0, 'Bencana Alam', 'Gempa Bumi Berkekuatan 5,6 Magnitudo Menerjang Cianjur Jawa Barat', 0, 'posts/PvSFs7qFwkHIns06HrLsEwhO0K5nuy53hDoAfB3d.jpg', 1, '2022-11-30 01:37:17', '2023-08-14 18:24:54', NULL),
(5, 'Bahaya Hepatitis \"Misterius\" pada Anak, Waspada Ini Gejalanya', 'bahaya-hepatitis-misterius-pada-anak-waspada-ini-gejalanya', 22, '<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Jakarta, CNBC Indonesia</span></span></span></strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">&nbsp;- Akhir-akhir ini orangtua cemas akan dugaan munculnya penyakit hepatitis misterius yang menyerang anak-anak.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Kementerian Kesehatan pun meminta warga waspada jika menemukan sejumlah gejala tertentu pada anak-anak yang sedang sakit.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">&quot;Jika anak-anak memiliki gejala kuning, sakit perut, muntah-muntah dan diare mendadak, buang air kecil berwarna teh tua, buang air besar berwarna pucat, kejang, penurunan kesadaran, agar segera memeriksakan anak ke fasilitas layanan kesehatan terdekat,&quot;&nbsp;kata Juru Bicara Kementerian Kesehatan dr. Siti Nadia Tarmizi, Minggu (1/5/2022).&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Siti Nadia meminta masyarakat meningkatkan kewaspadaan, terutama setelah tiga pasien anak yang dirawat di RSUPN Dr. Ciptomangunkusumo (RSCM) Jakarta dengan dugaan penyakit itu meninggal dunia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Kematian ketiganya dalam waktu yang berbeda dengan rentang dua minggu terakhir hingga 30 April 2022. Ketiga pasien ini merupakan rujukan dari rumah sakit yang berada di Jakarta Timur dan Jakarta Barat.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Gejala yang ditemukan pada pasien-pasien ini adalah mual, muntah, diare berat, demam, kuning, kejang dan penurunan kesadaran.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">&quot;Selama masa investigasi, kami mengimbau masyarakat untuk berhati-hati dan tetap tenang. Lakukan tindakan pencegahan seperti mencuci tangan, memastikan makanan dalam keadaan matang dan bersih, tidak bergantian alat makan, menghindari kontak dengan orang sakit serta tetap melaksanakan protokol kesehatan,&quot; katanya.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Sebelumnya,&nbsp;Badan Kesehatan Dunia (WHO) telah menyatakan Kejadian Luar Biasa (KLB) pada kasus Hepatitis Akut yang Belum Diketahui Penyebabnya (<em><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\">Acute Hepatitis of Unknown Etiology</span></em>) yang menyerang anak-anak di Eropa, Amerika dan Asia sejak 15 April 2022.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">WHO pertama kali menerima laporan pada 5 April 2022 dari Inggris Raya dengan 10 kasus. Mereka yang terinfeksi adalah anak-anak usia 11 bulan-5 tahun pada periode Januari hingga Maret 2022 di Skotlandia Tengah.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Sejak secara resmi dipublikasikan sebagai KLB, jumlah laporan terus bertambah. Tercatat lebih dari 170 kasus dilaporkan oleh lebih dari 12 negara.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Sebelumnya, pemeriksaan laboratorium di luar negeri telah dilakukan. Virus hepatitis tipe A, B, C, D dan E tidak ditemukan sebagai penyebab dari penyakit tersebut.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\"><span style=\"color:black\">Adenovirus terdeteksi pada 74 kasus di luar negeri yang setelah dilakukan tes molekuler, teridentifikasi sebagai F type 41. SARS-CoV-2 ditemukan pada 20 kasus, sedangkan 19 kasus terdeteksi adanya ko-infeksi SARS-CoV-2 dan adenovirus.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 0, 'Penyakit', 'Bahaya Hepatitis \"Misterius\" pada Anak, Waspada Ini Gejalanya', 4, 'posts/kB2cg8S3n9Z5y1XkRfNDLROMdLjfjpfJwTSESSwb.jpg', 1, '2022-11-30 01:55:13', '2023-08-14 18:23:24', NULL),
(6, 'Artikel Baru', 'artikel-baru', 21, 'Deskripsi baru', 1, NULL, NULL, 0, 'posts/AVEb8z7zjjZQPK9mFZqe7obd1Y6EuF8c0bmkNuaK.jpg', 7, '2022-12-08 16:24:35', '2022-12-18 16:24:25', '2022-12-18 16:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags`
--

CREATE TABLE `posts_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 8),
(2, 2, 31),
(4, 3, 32),
(3, 3, 33),
(5, 3, 34),
(6, 4, 31),
(8, 5, 32),
(7, 5, 33),
(9, 5, 34),
(10, 7, 32),
(11, 7, 34);

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(21, 'Bencana Alam', 'bencana-alam', '2022-11-29 15:24:00', '2022-11-29 15:24:00'),
(22, 'Penyakit', 'penyakit', '2022-11-29 15:31:56', '2022-11-29 15:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(31, 'Bencana Alam', 'bencana-alam', '2022-11-29 15:24:25', '2022-11-29 15:24:25'),
(32, 'Penyakit', 'penyakit', '2022-11-29 15:32:03', '2022-11-29 15:32:03'),
(33, 'Pasien', 'pasien', '2022-11-29 15:32:09', '2022-11-29 15:32:09'),
(34, 'Rumah Sakit', 'rumah-sakit', '2022-11-29 15:32:15', '2022-11-29 15:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_category_id` bigint UNSIGNED NOT NULL,
  `time_up` date DEFAULT NULL,
  `donation_collacted` bigint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_selected` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `donation_target` bigint DEFAULT NULL,
  `location` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_withdrawal` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `slug`, `program_category_id`, `time_up`, `donation_collacted`, `description`, `meta_keyword`, `meta_description`, `image`, `status`, `is_published`, `is_selected`, `user_id`, `donation_target`, `location`, `created_at`, `updated_at`, `deleted_at`, `is_withdrawal`) VALUES
(2, 'Dukung Bidan-Bidan Tangguh di Flores, NTT', 'dukung-bidan-bidan-tangguh-di-flores-ntt', 21, NULL, NULL, '<p>Kabupaten Flores Timur adalah Kabupaten Kepulauan yang terdiri atas 3 pulau besar yaitu Pulau Flores, Pulau Adonara dan Pulau Solor. Masih banyak kasus kematian ibu hamil yang dialami di Flores, NTT. Namun semangat juang bidan-bidan tangguh terus menyala, mereka terus berjuang membantu ibu-ibu hamil agar kasus kematian ibu hamil bisa dihindari.</p>', 'Dukung Bidan-Bidan Tangguh di Flores, NTT', 'Dukung Bidan-Bidan Tangguh di Flores, NTT', 'programs/O0rvpsW4mj4NIOdjgI5IiReBXcLhZP5k0yWEpTFX.jpg', 0, 1, 0, 1, 71400000, 'Flores', '2022-11-12 21:32:31', '2023-08-08 05:21:17', NULL, 0),
(3, 'Bantu Korban Bencana Bersama Dompet Dhuafa', 'bantu-korban-bencana-bersama-dompet-dhuafa', 21, NULL, NULL, '<p>Melihat kondisi ini, Dompet Dhuafa dan WeCare.id mengajak semua TemanPeduli untuk bergotong royong membantu para korban terdampak banjir dengan berdonasi. Hasil donasi akan digunakan untuk nembeli bahan pokok, mengevakuasi korban banjir hingga memenuhi kebutuhan medis.</p>\r\n\r\n<p>Mari bersama bergandengan tangan untuk membantu mereka yang membutuhkan.</p>', 'Bantu Korban Bencana Bersama Dompet Dhuafa', 'Bantu Korban Bencana Bersama Dompet Dhuafa', 'programs/ZK0V445XN0BLdFDvEsO97q32vOUtCswskm20UzNe.jpg', 0, 1, 0, 1, 51000000, 'Jakarta', '2022-11-12 21:33:05', '2022-11-29 15:42:04', NULL, 0),
(4, 'Derita Penyakit Jantung Bawaan Hingga Penyempitan Saluran Nafas, Salvina Butuh Bantuanmu!', 'derita-penyakit-jantung-bawaan-hingga-penyempitan-saluran-nafas-salvina-butuh-bantuanmu', 21, NULL, NULL, '<h3><strong>Komplikasi Jantung Dan Penyempitan Saluran Nafas Menghambat Tumbuh Kembang Salvina!!!</strong></h3>\r\n\r\n<hr />\r\n<p>Assalamualaikum. Wr. Wb. Saya Kuliya, asli dari Pemalang. Saya bekerja sebagai pelayan di salah satu rumah makan daerah Jakarta, sedangkan suami saya bekerja sebagai cleaning service. <strong>Saat ini anak saya Salvina yang berusia 15 bulan mengidap penyakit komplikasi jantung bawaan.</strong></p>\r\n\r\n<p>Awalnya pada saat usia 9 bulan ternyata telapak tangan dan kuku Salvina biru. Saya pikir itu hal biasa/kedinginan saja. Namun bidan menyarankan untuk ke dokter. Setelah dilakukan pemeriksaan oleh dokter baru diketahui ternyata Salvina ada kelainan dijantungnya.Akhirnya Salvina rawat inap selama 19 hari, dan itu <strong>membuat tabungan kami habis tanpa sisa.</strong> Pengobatan Salvina kami bayar sendiri karena BPJSnya belum diurus. Tidak hanya sampai disitu saja, Salvina masih harus kontrol rutin.</p>\r\n\r\n<p>Saat usia 12 bulan, Salvina sesak nafas. Saya bawa kembali ke rs dan Salvina langsung masuk IGD. Salvina terdiagnosa Tricuspid Atresia, VSD, dan ASD. Kondisi saat ini malah lebih buruk, yaitu ada nya masalah baru. Setelah ada tindakan non bedah yaitu PDA sten dan BAS pada jantung, 9 hari menggunakan ETT, jadi ada penyempitan saluran nafas atau stenosis subglotis mencapai 90%. <strong>Tindakan non bedah tersebut dilakukan di ICU selama 13 hari dan menggunakan ventilator sekitar 9 hari.</strong></p>\r\n\r\n<p><strong>Salvina sering sesak nafas dan berat badannya menurun.</strong> Saat ini Salvina menggunakan selang NGT untuk minum susu. Sudah bronkoskopi berkali-kali, sudah di laser dan di latasi balon. Masih muncul lagi. Jika tidak ditangani segera, Salvina kesulitan bernafas bahkan bisa fatal. Salvina saat ini hanya minum susu khusus melalui NGT dan belum diperbolehkan makan berat.</p>\r\n\r\n<p>Kami saat ini sudah tidak mampu lagi untuk biaya pengobatan Salvina, tabungan habis dan <strong>sawah orang tua kami di kampung juga habis terjual untuk biaya pengobatan Salvina.</strong> Bukan hanya itu, <strong>motor yang suami sewa buat ngojek selepas kerja pun hilang dicuri orang.</strong> Ya Allah cobaan ini begitu berat sampai saya tidak kuat menghadapi semua ini, Semoga Salvina bisa sembuh, jadi anak Solehah.</p>\r\n\r\n<p>TemanPeduli, Salvina sangat membutuhkan uluran tanganmu, jika Tuhan memberi kita lebih dari satu tangan, itu berarti tangan yang lainnya dimaksudkan untuk membantu orang yang tangannya terikat oleh keadaan. Ke dua orang tua Salvina hanya ingin kondisi anaknya segera membaik dan tumbuh sehat seperti anak-anak seusianya.</p>\r\n\r\n<p>Selain donasi, TemanPeduli juga bisa bagikan link galang dana ini ke orang-orang terdekat, semoga penggalangan dana untuk Salvina segera terkumpul. Kalau bukan dimulai dari kamu, siapa yang mau mulai? :)</p>', 'Derita Penyakit Jantung Bawaan Hingga Penyempitan Saluran Nafas, Salvina Butuh Bantuanmu!', 'Derita Penyakit Jantung Bawaan Hingga Penyempitan Saluran Nafas, Salvina Butuh Bantuanmu!', NULL, 0, 1, 0, 1, 71400000, 'Bandung', '2022-11-12 23:12:22', '2022-11-20 08:30:58', NULL, 0),
(5, 'Rasyid Alami Kelainan pada Kepala, Mata, Tangan, dan Kakinya serta Gizi Buruk', 'rasyid-alami-kelainan-pada-kepala-mata-tangan-dan-kakinya-serta-gizi-buruk', 21, NULL, NULL, '<h3><strong>Bantu Adik Rasyid Melawan Penyakitnya!</strong></h3>\r\n\r\n<hr />\r\n<p><strong>Sejak lahir Rasyid sudah dalam keadaan spesial mulai dari bagian kepala, mata, dan juga kondisi langit-langitnya mengalami kelainan.</strong> Tidak hanya itu, pada jari-jari kedua tangan menempel satu sama lain, begitupun pada kakinya. Saat usia 3 bulan mulai muncul bengkak di tangan kanan yang lama kelamaan keluar nanah dan darah hingga alami demam berkepanjangan.</p>\r\n\r\n<p>Walupun sudah dibawa ke rumah sakit, kondisi Rasyid masih belum ada perubahan malah tangannya tambah berdarah dan juga bengkak. Setelah itu Rasyid mulai sering muntah dan berat badannya turun drastis. Pemeriksaan demi pemeriksaan Rasyid jalani hingga akhirnya di rujuk ke rumah sakit pusat Jakarta untuk tindakan operasi tangan ke bedah plastik. Kata dokter jika tidak dioperasi, <strong>Rasyid tidak bisa sembuh malah kondisi tangannya akan bertambah parah.</strong></p>\r\n\r\n<p>Namun sayangnya operasi Rasyid sempat tertunda karena tidak ada biaya transportasi ke Jakarta. Selagi merawat Rasyid sakit, saya juga merawat suami yang sakit stroke dan anak yang paling besar mengalami pembengkakan jantung. Sehingga sehari-hari saya merawat 3 orang yang sakit dan harus tetap mencari nafkah juga untuk memenuhi biaya berobat.</p>\r\n\r\n<p>Cobaan datang tiada hentinya, 2 bulan lalu suami saya pergi meninggal duni. Saya cuma bisa berkata, &ldquo;Subhanallah, terimakasih yaAllah, Engkau telah memberikan anugerah kepada keluarga untuk belajar ikhlas,sabar dan menerima, karena apapun yang Allah berikan itu yang terbaik, walaupun dilingkungan banyak gunjingan, cemoohan, saya cuma bisa pasrah sama Allah SWT.&rdquo; <strong>Semenjak itu sampai sekarang saya berjuang sendiri untuk kesembuhan anak-anak saya.</strong></p>\r\n\r\n<p>Akhirnya, berkat bantuan saudara dan tetangga terdekat, Rasyid bisa berobat ke rumah sakit pusat di Jakarta untuk melakukan operasi pada tangannya. Tapi operasi lanjutan terpaksa tertunda karena <strong>Rasyid mengalami gizi buruk dan anemia. Padahal Rasyid masih harus melakukan 3x operasi kepala dan 1x lagi operasi tangannya.</strong></p>\r\n\r\n<p>Dokter menyarankan Rasyid mengonsumsi susu tinggi protein agar gizinya baik. <strong>Sejujurnya saya tidak mampu membelinya karena harga susu yang dibutuhkan mencapai jutaan/bulannya.</strong> Saya hanya berharap semoga ada jalan untuk Rasyid kembali sembuh.</p>', 'Rasyid Alami Kelainan pada Kepala, Mata, Tangan, dan Kakinya serta Gizi Buruk', 'Rasyid Alami Kelainan pada Kepala, Mata, Tangan, dan Kakinya serta Gizi Buruk', NULL, 0, 1, 0, 1, 275400000, 'Palembang', '2022-11-12 23:13:07', '2022-11-20 08:26:32', NULL, 0),
(6, 'Mari kita bangun kembali jembatan layak lainnya di wilayah pelosok Indonesia', 'mari-kita-bangun-kembali-jembatan-layak-lainnya-di-wilayah-pelosok-indonesia', 22, NULL, NULL, '<p>Kebaikan ini tentunya telah membawa perubahan besar di Desa Cawiri dan membuat masyarakat lebih mudah dalam menjalankan aktivitasnya.&nbsp;&nbsp;</p>\r\n\r\n<p>Namun, ternyata di luar sana masih banyak lagi wilayah yang juga membutuhkan bantuan pembangunan jembatan. Salah satunya Kampung Kubang, Jawa Barat, di mana jembatan yang ada saat ini tidak layak lagi karena sangat membahayakan bagi siapa saja yang melewatinya.&nbsp;</p>', 'Mari kita bangun kembali jembatan layak lainnya di wilayah pelosok Indonesia', 'Mari kita bangun kembali jembatan layak lainnya di wilayah pelosok Indonesia', 'programs/du1UWgNsfTHxi2neigE3uE4d3trVuGH8txe7gdbP.jpg', 0, 1, 0, 1, 234600000, 'Yogyakarta', '2022-11-12 23:13:59', '2022-12-16 03:30:25', NULL, 0),
(7, 'Tangani Krisis Air Bersih dengan membangun water and sanitation', 'tangani-krisis-air-bersih-dengan-membangun-water-and-sanitation', 22, NULL, NULL, '<p>Bahkan bila musim kemarau mereka harus memakai air payau yang diambil dari tempat penampungan air kebun mereka.</p>\r\n\r\n<p>Marilah kita bantu warga desa di pelosok Indonesia yang mengalami krisis air bersih dengan berdonasi untuk membangun water and sanitation sehingga permasalahan krisis air bersih dapat kita tangani bersama-sama.</p>', 'Tangani Krisis Air Bersih dengan membangun water and sanitation', 'Tangani Krisis Air Bersih dengan membangun water and sanitation', 'programs/a92UuuHgZ9XEtRtceTRJ7RbSEaUJJZMNgAgkfL3V.jpg', 0, 1, 0, 1, 102000000, 'Jakarta', '2022-11-12 23:14:42', '2022-12-16 03:35:32', NULL, 0),
(8, 'Bantu Wujudkan Akses Kesehatan yang Layak', 'bantu-wujudkan-akses-kesehatan-yang-layak', 22, NULL, NULL, '<p><strong>Wakaf untuk kesehatan telah menjadi bagian dari sejarah penting wakaf semenjak zaman dahulu dan terus berkembang hingga saat ini.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hal itu disebabkan oleh kebutuhan umat Islam terhadap layanan kesehatan yang bersifat primer yang memiliki kecenderungan semakin meningkat. Semenjak zaman dahulu, Rumah Sakit yang di danai lembaga wakaf telah berkembang di Hijaz, Syam, Mesir, Sudan, dan negara-negara Islam lainnya, termasuk Indonesia.</p>', 'Bantu Wujudkan Akses Kesehatan yang Layak', 'Bantu Wujudkan Akses Kesehatan yang Layak', 'programs/oIvN20oZxMovyzdmD6Unnjc6aTvTfa09ursa0z79.jpg', 0, 1, 0, 1, 5100000, 'Jayapura', '2022-11-12 23:15:22', '2022-12-16 03:37:37', NULL, 0),
(9, 'Bantu Bali Bangkit Kembali', 'bantu-bali-bangkit-kembali', 22, NULL, NULL, '<p>Cuaca ekstrem yang terjadi akhir-akhir ini menimbulkan beragam bencana alam di seluruh Indonesia, salah satunya seperti yang menimpa Bali. Hujan yang terus mengguyur Bali sejak hari Minggu (16/10/2022) menyebabkan banjir dan tanah longsor pada beberapa titik di wilayah Bali.</p>\r\n\r\n<p>Berdasarkan data dari BPBD Provinsi Bali yang dikutip melalui antaranews.com, musibah tersebut setidaknya telah menyebabkan 6 (enam) orang korban meninggal dunia. Diantaranya, tiga orang di Kabupaten Karangasem, satu orang di Bangli, satu orang di Tabanan, dan satu orang lainnya di Jembrana.</p>\r\n\r\n<p>Selain menyebabkan korban meninggal dunia, musibah banjir dan tanah longsor di Provinsi Bali juga menyebabkan sejumlah jembatan penghubung di kabupaten terputus dan sejumlah rumah warga dikabarkan mengalami rusak berat. Beberapa warga pun dilaporkan terpaksa mengungsi ke rumah saudara dan kerabat terdekat yang tidak terkena dampak banjir serta tanah longsor.</p>\r\n\r\n<p>TemanPeduli, jangan biarkan eksotisme Bali terbawa derasnya arus banjir. Mari bersama-bersama&nbsp;kita bantu pulihkan Bali dari bencana banjir dan tanah longsor. Bantuan terbaik kamu akan digunakan untuk membeli kebutuhan warga yang terdampak banjir dan tanah longsor hingga membantu pemulihan infrastruktur di Bali.</p>', 'Bantu Bali Bangkit Kembali', 'Bantu Bali Bangkit Kembali', NULL, 0, 1, 0, 1, 91800000, 'Bali', '2022-11-12 23:16:00', '2022-11-20 08:20:39', NULL, 0),
(10, 'Sedekah subuh untuk adik-adik kita', 'sedekah-subuh-untuk-adik-adik-kita', 23, NULL, NULL, '<p>Halo Bapak/ibu/Kakak/Adik, perkenalkan, saya Rahmat sekaligus pemilik Yayasan Cikal Mandiri. Yayasan ini memiliki 4 cabang asrama, yaitu: - Panti Asuhan Depok, Jln. KH. M. Yusuf Raya No. 101 Kota Depok, Jawa Barat. - Asrama Peduli Bintaro, Jln. Garuda No. 36 Pesanggrahan, Jakarta Selatan, DKI Jakarta. - Rumah Asuh Yatim Dhuafa Joglo, Jln. Masjid Assalam Komp. DKI Joglo, Jakarta Barat, DKI Jakarta. - Panti Asuhan Jln. Ciater Raya No. 75 Ciater BSD.</p>', 'Sedekah subuh untuk adik-adik kita', 'Sedekah subuh untuk adik-adik kita', 'programs/7r3rgnQFyaaXBDnxicFvm1t0CHJOf2nzvnzf024D.jpg', 0, 1, 0, 1, 102000000, 'Bandung', '2022-11-12 23:16:42', '2022-12-16 04:07:29', NULL, 0),
(11, 'Kebahagiaan untuk 500 anak-anak Yatim', 'kebahagiaan-untuk-500-anak-anak-yatim', 26, NULL, NULL, '<p>Kasih sayang dan suasana kehangatan keluarga mungkin sering kita rasakan, namun hal itu tentu sangat berbeda bagi anak-anak yatim dhuafa, mereka yang sejak lahir terpaksa harus kehilangan sosok orangtua membuat mereka tidak pernah merasakan bagaimana kasih sayang dan suasana kehangatan ketika berada di rumah</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tak jarang juga anak-anak yatim dhuafa harus menanggung beban yang lebih berat lagi karena terpaksa tidak bisa menggapai keinginan dan cita-citanya dan harus bekerja demi bisa membantu memenuhi kebutuhan sehari-harinya</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Oleh karena itu kami mengajak kepada Orang Baik untuk ikut memberikan kebahagiaan kepada adik-adik yatim dhuafa supaya mereka bisa merasakan kasih sayang melalui kepedulian kita</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Selain itu, menyantuni anak-anak yatim dhuafa yang mengalami kekurangan dan membutuhkan uluran bantuan kita akan mendapatkan pahala yang berlipatganda oleh Allah SWT dan&nbsp;Allah SWT juga akan memberi rezeki begitu luas kepada hamba-Nya yang mau berbagi, menyantuni, dan menyisihkan sebagian rezekinya kepada orang yang membutuhkan.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;Kasihilah anak yatim, usaplah mukanya, dan berilah makan dari makananmu, niscaya hatimu menjadi lunak dan kebutuhanmu akan terpenuhi.&rdquo; (HR Thobroni)</p>', 'Kebahagiaan untuk 500 anak-anak Yatim', 'Kebahagiaan untuk 500 anak-anak Yatim', 'programs/yXdWVQAZSlFEdXLRuEOuGyuOGttzpv2OdJjEJJ0o.jpg', 0, 1, 0, 1, 102000000, 'Depok', '2022-11-15 09:17:26', '2022-12-16 04:10:56', '2022-12-16 04:10:56', 0),
(12, 'Membangun Kembali Masjid-Masjid di Kampung', 'membangun-kembali-masjid-masjid-di-kampung', 22, NULL, NULL, '<p>Assalamualaikum warohmatullahi wabarakatuh</p>\r\n\r\n<p>Bismillahirohmanirohim</p>\r\n\r\n<p>إِذَا مَاتَ الْإِنْسَانُ انْقَطَعَ عَمَلُهُ إِلَّا مِنْ ثَلَاثَةٍ مِنْ صَدَقَةٍ جَارِيَةٍ وَعِلْمٍ يُنْتَفَعُ بِهِ وَوَلَدٍ صَالِحٍ يَدْعُو لَهُ</p>\r\n\r\n<p>&ldquo;Jika seseorang meninggal dunia, maka terputuslah amalannya kecuali tiga perkara yaitu: sedekah jariyah, ilmu yang dimanfaatkan, atau doa anak yang sholeh&rdquo;(HR. Muslim no. 1631)</p>\r\n\r\n<p>Ijinkan kami untuk mengenalkan salah satu program utama Yayasan Sedekah Masjid yaitu program&nbsp;&quot;Seribu Masjid&quot;&nbsp;dimana kami ingin memperbaiki dan membangun kembali sebanyak-banyaknya masjid/mushola khususnya di perkampungan-perkampungan yang sangat membutuhkan bantuan.<br />\r\n<br />\r\nMengapa di perkampungan? tinggal di perkotaan membuat kita terkadang tidak menyadari kondisi di perkampungan. Disaat kita bisa beribadah di Masjid/Mushola yang nyaman, bersih, bahkan ber-AC, ternyata di perkampungan-perkampungan terdapat ratusan bahkan ribuan Masjid/Mushola yang sudah tidak layak pakai.</p>', 'Membangun Kembali Masjid-Masjid di Kampung', 'Membangun Kembali Masjid-Masjid di Kampung', 'programs/4wNIQV0mWqf1fcsknF9F6DSXKz9YFGCuoHh6gJ6L.jpg', 0, 1, 0, 1, 292740000, 'Lebak', '2022-11-15 09:27:57', '2022-12-16 03:32:36', NULL, 0),
(13, '4th Raka Berjuang Lawan Ganasnya Leukemia Akut', '4th-raka-berjuang-lawan-ganasnya-leukemia-akut', 21, NULL, NULL, '<p>Hati Ibu mana yang tahan saat buah hatinya merengek minta pengobatan dihentikan.&nbsp;</p>\r\n\r\n<p>Seperti yang dialami Raka (7th) hampir menyerah hadapi belasan kali kemoterapi dan puluhan kali kulitnya ditembus jarum suntik akibat idap Leukemia akut.</p>\r\n\r\n<p><br />\r\nKanker ganas ini telah bersarang di darah Raka selama 4 tahun lamanya.&nbsp;</p>\r\n\r\n<p>Selama itu pula, Raka dan Ibu harus meninggalkan rumah sejauh 232 KM untuk berobat ke RS yang memadai di kota.<br />\r\nNamun permintaan Raka untuk berhenti berobat tak bisa Ibu turuti. Ibu lebih takut kehilangan Raka akibat Leukemia.&nbsp;</p>\r\n\r\n<p>Ibu bilang Raka pasti sembuh. Sekarang harus telan pil pahit jalani protokol pengobatan.<br />\r\nDibalik beratnya beban Raka lawan Leukemia, Ibu juga menanggung kekhawatiran tak bisa lanjutkan kemoterapi.&nbsp;</p>\r\n\r\n<p>Pasalnya Ayah Raka yang hanya seorang Satpam di Pabrik Kebun Karet, gajinya sangat minim.<br />\r\nBiaya pengobatan Raka mencapai puluhan bahkan hingga ratusan juta jika diestimasikan sampai kemoterapi selesai.&nbsp;</p>\r\n\r\n<p>Membayangkannya saja sudah bikin Ibu sakit kepala. Toh mereka makan sehari-hari saja sudah sulit.</p>\r\n\r\n<p>#OrangBaik, jangan patahkan semangat Raka untuk sembuh dari Leukemia akutnya. Beri pertolongan terbaikmu melalui</p>', '4th Raka Berjuang Lawan Ganasnya Leukemia Akut', '4th Raka Berjuang Lawan Ganasnya Leukemia Akut', 'programs/Uxu9IYdtvvDKClAePoGQk8kVIVcXiQ5W0rruGmNu.jpg', 0, 1, 0, 1, 306000000, 'Lampung', '2022-11-15 09:32:55', '2022-12-16 03:49:40', NULL, 0),
(14, 'Tumor Pipi Sebesar Kepala, Bu Satumi Harus Operasi', 'tumor-pipi-sebesar-kepala-bu-satumi-harus-operasi', 21, NULL, NULL, '<p>Berat sekali rasanya Bu Satumi (40) hanya sekadar mengangkat kepalanya. Gimana tak berat? Di pipi kirinya bersarang tumor yang kini besarnya hampir seperti kepalanya.&nbsp;</p>\r\n\r\n<p>&ldquo;Udah lama saya ndak bisa makan. Saya ndak bisa ngunyah,&rdquo; ungkap Bu Satumi.&nbsp;</p>\r\n\r\n<p><br />\r\nBu Satumi tak menyangka benjolan kecil yang berasal dari bisul itu kini membesar tak terkendali. Awalnya Bu Satumi takut ke dokter. Takut mendengar hal yang lebih parah dari bisul.&nbsp;</p>\r\n\r\n<p>Tapi sepertinya itu tidak bisa dibiarkan hingga akhirnya memberanikan diri periksa. Dan benar saja vonis tumor terlontar dari mulut dokter.&nbsp;</p>\r\n\r\n<p><br />\r\n&ldquo;Harus segera operasi kata dokter, nanti bisa makin besar dan menyebar,&rdquo; kata Bu Satumi.&nbsp;</p>\r\n\r\n<p>Namun Bu Sutami tak mau memaksakan kehendak. Suaminya hanya jadi buruh serabutan. Upahnya pun tak seberapa. Bu Sutami tahu selama ini keluarganya untuk bertahan hidup sehari-hari saja sulit, apalagi untuk operasi.&nbsp;</p>\r\n\r\n<p><br />\r\n&ldquo;Ndak apa-apa saya tunggu sampai uang operasinya kekumpul semua..&rdquo;&nbsp;</p>\r\n\r\n<p>Sambil menunggu Bu Satumi tetap jalani tugasnya sebagai seorang Ibu. Mulai dari memasak sampai mengantar anaknya, Aldi, ke sekolah. Saat sampai di sekolah sudah sering sekali kehadirannya ditertawakan, dijauhi, bahkan tak jarang dihina.&nbsp;</p>\r\n\r\n<p>&ldquo;Aldi, kok Ibu kamu serem?&rdquo;&nbsp;<br />\r\nSebenarnya bisa saja dimaklum kalau teman-temannya tak mengerti keadaan ibunya yang sebenarnya sedang mengidap tumor.&nbsp;</p>\r\n\r\n<p>Bu Sutami harus tutup telinga mendengar semua cibiran dan pandangan aneh teman-teman Aldi. Bukan hanya teman-temannya, tapi orang tua murid lainnya juga tak jarang menjauh dari Bu Sutami.&nbsp;</p>\r\n\r\n<p><br />\r\n&ldquo;Saya mungkin dianggap aneh dan seram sama mereka,&rdquo; ungkap pilu Bu Sutami.&nbsp;</p>\r\n\r\n<p>#OrangBaik, harus sampai kapan Bu Sutami menunggu uang operasi terkumpul? Sedang ia dikejar waktu dengan tumor yang terus membesar.</p>', 'Tumor Pipi Sebesar Kepala, Bu Satumi Harus Operasi', 'Tumor Pipi Sebesar Kepala, Bu Satumi Harus Operasi', NULL, 0, 1, 0, 1, 204000000, 'sukabumi', '2022-11-15 09:34:32', '2022-11-20 08:11:28', NULL, 0),
(15, 'Hadiah UMROH bagi Para Pemelihara MASJID', 'hadiah-umroh-bagi-para-pemelihara-masjid', 22, '2022-11-15', NULL, '<p>Umroh dan Mengumrohkah, itulah salah satu poin yang disampaikan Ipho Santosa dalam salah satu seminarnya.</p>\r\n\r\n<p>&ldquo;Wah mas Ippho, bagaimana bisa mengumrahkan, orang saya sendiri juga belum umrah, duitnya juga belum ada&rdquo;. Makanya niat dulu. Kalau niat, jadi amal. Kalau niat, bisa jadi doa. Kalau niat juga akan mendekatkan kita dengan kenyataan. Kalau tidak ada niat, habis semuanya. OK!. Meskipun saya tidak punya uang sekalipun waktu itu, saya berniat mengumrahkan orang lain. Alhamdulillah, sekarang hampir setiap bulannya saya mengumrahkan orang lain. Saya hanya wasilah atau perantara, yang mengumrahkan tetaplah Allah SWT.&quot;</p>\r\n\r\n<p>&ldquo;24 jam nonstop mereka melayani Rumah Allah untuk mengumandangkan Adzan, membersihkan Masjid, sekaligus menjadi penanggung jawab Masjid. Jarang yang tahu, dibalik profesi mulia tersebut, mereka hanya dapat upah yang minim sekali&hellip;&rdquo; - Relawan Sedekah Masjid.</p>\r\n\r\n<p>----------</p>\r\n\r\n<p>Umroh merupakan cita-cita semua umat Islam, apapun profesinya dan jabatannya, tidak terkecuali para pemelihara masjid seperti para relawan Yayasan Sedekah Masjid,&nbsp;marbot masjid&nbsp;dan jamaah lainnya.</p>\r\n\r\n<p>Tetapi tidak semua orang mampu melaksanakannya, terlebih melaksanakan ibadah umroh butuh biaya yang tidak sedikit.</p>\r\n\r\n<p>Apalagi rata-rata penghasilan para relawan masjid itu sangat terbatas, mereka hanya baru mampu memenuhi kebutuhan pribadinya semata.</p>\r\n\r\n<p>Para&nbsp;RELAWAN MASJID&nbsp;tersebut merupakan mitra kami Yayasan Sedekah Masjid yang memiliki visi yang sama dalam mengelola masjid dengan baik, oleh sebab itu kami ingin kembali memberikan peenghargaan dan apresiasi ata pengorbanan mereka. Kami ingin memberikan Hadiah UMROH untuk mereka.</p>', 'Hadiah UMROH bagi Para Pemelihara MASJID', 'Hadiah UMROH bagi Para Pemelihara MASJID', 'programs/MPK91zF5zwuAnKm5jz8Of2P35hyemIqV6bdE7NeK.jpg', 0, 1, 0, 1, 102000000, 'Indonesia', '2022-11-15 09:38:45', '2023-08-08 05:24:56', NULL, 0),
(16, 'Bangunan Lapuk, Lansia Tidur Sambil Diguyur Hujan!', 'bangunan-lapuk-lansia-tidur-sambil-diguyur-hujan', 25, NULL, NULL, '<p>&quot;Rumah nenek gak pernah direnovasi sejak tahun 90 an, nenek was-was kalo angin kencang. Airnya masuk dari&nbsp;atap dan celah dinding, sampai tidur pun sering diguyur hujan.&nbsp;</p>\r\n\r\n<p>Rumah nenek juga gak ada pondasi dan banyak lubang sehingga sering dimasuki tikus saat malam hari, jari kaki dan tangan nenek pernah digigit..&quot; lirih Nenek Fatma.</p>\r\n\r\n<p>Kisah Nenek Fatma (71 Tahun) yang tinggal di Halmahera Utara sungguh memprihatinkan. Beliau tinggal di rumah reyot &amp; kumuh sejak puluhan tahun silam.&nbsp;</p>\r\n\r\n<p>Bangunan sudah miring, dindingnya hanya ditutup dengan kayu yang semakin lapuk &amp; berjamur. Atap rumahnya hanya ditempel seng bekas, sudah berlubang dan berkarat. Tiap hujan nenek tidur sambil diguyur air.&nbsp;</p>\r\n\r\n<p>Tak hanya itu, sekeliling rumah nenek kumuh. Tikus sering menyelinap masuk dan menggigit jarinya saat tidur.</p>\r\n\r\n<p>#OrangBaik, selama puluhan tahun Nenek Fatma sudah hidup penuh penderitaan. Menahan sakit dan dingin di gubuk kumuh hingga ujung usia. Oleh karena itu, maukah kamu berbagi sedikit rezeki untuk membuat nenek tersenyum di sisa usianya?</p>', 'Bangunan Lapuk, Lansia Tidur Sambil Diguyur Hujan!', 'Bangunan Lapuk, Lansia Tidur Sambil Diguyur Hujan!', NULL, 0, 1, 0, 1, 255000000, 'Semarang', '2022-11-15 09:42:21', '2022-12-16 04:39:13', '2022-12-16 04:39:13', 0),
(17, 'Kritis Tanpa Ayah, Kenziana Butuh Mukjizat Tuhan', 'kritis-tanpa-ayah-kenziana-butuh-mukjizat-tuhan', 21, NULL, NULL, '<p><strong>Bayi baru lahir harusnya rasakan hangat pelukan ibu. Namun, tidak demikian dengan Kenziana. Fungsi organ hati Kenziana rusak akibat gagal berkembang. Lantaran prematur, bobot tubuhnya juga hanya 1.400 gram. Sangat kecil dan jauh di bawah normal! Kini Kenziana yang malang kritis di NICU, menanti mukjizat Tuhan tanpa sosok ayah di sisinya. Pak Sani terpaksa tak bisa temani Kenziana berjuang hidup. Ia harus mengais nafkah, kerja sebagai OB/cleaning service di kapal laut demi penuhi biaya RS yang bengkak sampai ratusan juta</strong></p>\r\n\r\n<p>Dunia Bu Mella Octavia seakan runtuh. Air matanya tumpah, tak terbendung lagi.&nbsp;<strong>Pupus sudah mimpi Bu Mella untuk menimang malaikat kecilnya. Diiringi suara alat medis yang terus menyala selama 24 jam nonstop, Bu Mella hanya mampu berdoa harapkan mukjizat dan pertolongan Tuhan</strong></p>\r\n\r\n<p><strong>Bu Mella tak menyangka. Kebahagiaannya menyambut kehadiran putri pertama berubah jadi duka!</strong>&nbsp;Saat usia kandungannya baru 7 bulan dan janin di perutnya belum 100% matang, Bu Mella mendadak alami pendarahan.&nbsp;<strong>Tanpa ditemani suaminya yang masih sibuk bekerja di tengah laut, mau tak mau Bu Mella harus menjalani tindakan persalinan darurat&hellip;</strong></p>', 'Kritis Tanpa Ayah, Kenziana Butuh Mukjizat Tuhan', 'Kritis Tanpa Ayah, Kenziana Butuh Mukjizat Tuhan', NULL, 0, 1, 0, 1, 125970000, 'Tangerang', '2022-11-15 09:44:46', '2022-12-16 04:33:44', '2022-12-16 04:33:44', 0),
(18, 'Kecelakaan Maut! Pendarahan Otak Ibu Koma di ICU', 'kecelakaan-maut-pendarahan-otak-ibu-koma-di-icu', 21, NULL, NULL, '<p><strong>Sosok penyayang nan perhatian itu kini rebah tak berdaya di balik balutan selang medis. Pada suatu pagi bu Sapia yang tengah menyebrang berjalan kaki hendak menjenguk saudara yang sakit dihantam amat kencang oleh motor. Ia terpental hingga darah membasahi aspal. Tengkorak bu Sapia remuk &amp; otaknya terendam darah. Tragisnya kerusakan saraf &amp; kematian mendadak mengintai bu Sapia jika tak dioperasi segera. Biaya 180 juta kini harus dipenuhi bu Sapia yang bahkan membuka mata pun tak sanggup&hellip;</strong></p>\r\n\r\n<p>&nbsp;</p>', 'Kecelakaan Maut! Pendarahan Otak Ibu Koma di ICU', 'Kecelakaan Maut! Pendarahan Otak Ibu Koma di ICU', NULL, 0, 1, 0, 1, 204000000, 'Makassar', '2022-11-15 09:46:20', '2022-12-16 04:32:49', '2022-12-16 04:32:49', 0),
(19, 'Rumah Zakat', 'rumah-zakat', 24, NULL, NULL, '<p><strong>Rumah Zakat</strong>&nbsp;adalah Lembaga Amil Zakat Nasional yang mengelola zakat, infak, sedekah, serta dana sosial lainnya melalui program-program pemberdayaan masyarakat.</p>\r\n\r\n<p>Zakat adalah harta yang&nbsp;<strong>wajib dikeluarkan</strong>&nbsp;apabila telah&nbsp;<strong>memenuhi syarat &ndash; syarat yang telah ditentukan oleh agama</strong>, dan disalurkan kepada&nbsp;<strong>orang&ndash;orang yang telah ditentukan</strong>&nbsp;pula, yaitu delapan golongan yang berhak menerima zakat sebagaimana yang tercantum dalam Al-Qur&rsquo;an surat&nbsp;<strong>At-Taubah ayat 60</strong>:</p>\r\n\r\n<p><em>&ldquo;Sesungguhnya zakat-zakat itu, hanyalah untuk orang-orang fakir, orang-orang miskin, pengurus-pengurus zakat, para muallaf yang dibujuk hatinya, untuk budak, orang-orang yang berhutang, untuk jalan Allah dan untuk mereka yuang sedang dalam perjalanan, sebagai suatu ketetapan yang diwajibkan Allah, dan Allah Maha Mengetahui lagi Maha Bijaksana.&rdquo;</em></p>\r\n\r\n<p>Rumah Zakat mengelola dan medistribusikan zakat dalam berbagai program pemberdayaan di Desa Berdaya yang merupakan Desa Binaan Rumah Zakat. Dana Zakat amanah donatur di implementasikan dalam 4 program utama yaitu Pendidikan, ekonomi, Kesehatan dan lingkungan.</p>', 'Rumah Zakat', 'Rumah Zakat', 'programs/sCoX0ZBOdgG78qqenkew8bmUQkSefq4dtPdiNmCI.png', 0, 1, 0, 1, 5100000, 'Aceh', '2022-11-15 09:48:24', '2022-12-16 04:18:02', NULL, 0),
(20, 'Memberi makan kucing liar', 'memberi-makan-kucing-liar', 25, NULL, NULL, '<p>Dalam hadis yang diriwayat Imam Al-Bukhari dan Muslim dari Abu Hurairah, Rasulullah Saw bersabda :<br />\r\n<br />\r\nبَيْنَمَا رَجُلٌ يَمْشِي بِطَرِيقٍ اشْتَدَّ عَلَيْهِ الْعَطَشُ فَوَجَدَ بِئْرًا فَنَزَلَ فِيهَا فَشَرِبَ ثُمَّ خَرَجَ فَإِذَا كَلْبٌ يَلْهَثُ يَأْكُلُ الثَّرَى مِنْ الْعَطَشِ فَقَالَ الرَّجُلُ لَقَدْ بَلَغَ هَذَا الْكَلْبَ مِنْ الْعَطَشِ مِثْلُ الَّذِي كَانَ بَلَغَ بِي فَنَزَلَ الْبِئْرَ فَمَلَأَ خُفَّهُ ثُمَّ أَمْسَكَهُ بِفِيهِ فَسَقَى الْكَلْبَ فَشَكَرَ اللَّهُ لَهُ فَغَفَرَ لَهُ قَالُوا يَا رَسُولَ اللَّهِ وَإِنَّ لَنَا فِي الْبَهَائِمِ أَجْرًا فَقَالَ نَعَمْ فِي كُلِّ ذَاتِ كَبِدٍ رَطْبَةٍ أَجْرٌ<br />\r\n<br />\r\nArtinya &quot;Pada suatu ketika ada seorang laki-laki sedang berjalan melalui suatu jalan, lalu dia merasa sangat kehausan. Kebetulan dia menemukan sebuah sumur, maka dia turun ke sumur itu untuk minum. Setelah keluar dari sumur, dia melihat seekor anjing menjulurkan lidahnya menjilat-jilat tanah karena kehausan&quot;<br />\r\n&quot;Orang itu berkata dalam hatinya; Alangkah hausnya anjing itu, seperti yang baru aku alami. Lalu dia turun kembali ke sumur, kemudian dia menciduk air dengan sepatunya, dibawanya ke atas dan meminumkannya kepada anjing itu. Maka Allah berterima kasih kepada orang itu dan mengampuni dosanya. Para sahabat bertanya; Ya, Rasulullah, dapat pahalakah kami bila menyayangi hewan-hewan ini? Beliau menjawab; Iya, setiap menyayangi makhluk hidup adalah berpahala&quot;<br />\r\nSelain memberi makan hewan peliharan, menyayangi mereka dengan sikap yang baik, tidak berlaku kasar atau memukul hewan peliharaan, memberikan tempat yang nyaman untuk hewan peliharaan juga akan memperoleh pahala.</p>', 'Memberi makan kucing liar', 'Memberi makan kucing liar', 'programs/ZyxTRdk182uonedbcT1iwM2mpFBgGBbSuOWzhamZ.jpg', 0, 1, 0, 1, 7140000, 'Jambi', '2022-11-15 09:50:31', '2022-12-16 04:00:23', NULL, 0),
(21, 'Muliahkan Yatim Penghafal Qur\'an', 'muliahkan-yatim-penghafal-quran', 25, NULL, NULL, '<p>Beruntung orang-orang yang memiliki hati lembut mudah tersentuh dan bersyukur atas nikmat yang telah diberikan.<br />\r\n<br />\r\nSedekah melembutkan Hati....</p>\r\n\r\n<p>Tahfizh Yatim Dhuafa merupakan program pemberian beasiswa dan kebutuhan pokok&nbsp;kepada santri yatim dhuafa penghafal quran.</p>\r\n\r\n<p>Santri yatim dhuafa penghafal quran mendapat pendampingan dan pembinaan langsung dari guru mengaji yang sudah terjamin kualitas pengajarannya.</p>\r\n\r\n<p>antri yatim dhuafa penghafal al-quran ini menghafal dengan cara menyetorkan hafalan di waktu tertentu yang sudah di jadwalkan oleh pembimbing, dan tak lupa para santripun dididik agar senantiasa mendirikan sholat dhuha dan tahajjud, serta rutin ibadah puasa sunnah senin-kamis.</p>', 'Muliahkan Yatim Penghafal Qur\'an', 'Muliahkan Yatim Penghafal Qur\'an', 'programs/R7Fo9xllFAJy67GfxhruuyxwR2NgpbXOkWzhie6a.jpg', 0, 1, 0, 1, 76500000, 'Jawa timur', '2022-11-15 09:52:03', '2023-08-08 05:26:02', NULL, 0),
(22, 'Donasi Bantuan Hukum untuk Rakyat Kecil', 'donasi-bantuan-hukum-untuk-rakyat-kecil', 22, NULL, NULL, '<p><strong>Halo, perkenalkan kami dari Kitasobi.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Pak Dedi merupakan seorang driver ojek online yang menjadi korban salah tangkap.</p>\r\n\r\n<p><strong>Penangkapan yang dilakukan terhadapnya mengakibatkan Pak Dedi dipaksa mengaku sebagai pelaku atas kasus pengeroyokan yang tidak pernah dilakukannya.&nbsp;</strong></p>\r\n\r\n<p>Penangkapan Pak Dedi sebenarnya secara prosedural telah melanggar undang-undang karena tak adanya surat perintah penangkapan.</p>\r\n\r\n<p>Meskipun mengalami hal yang tidak menyenangkan, Pak Dedi masih berharap aparat yang berwenang bisa segera menyelesaikan kasus tersebut dan mengungkap pelaku sebenarnya.</p>\r\n\r\n<p><strong>Akibat tindakan yang dialami oleh Dedi, Dedi harus dijebloskan ke tahanan hingga divonis penjara selama dua tahun.&nbsp;</strong></p>\r\n\r\n<p>Bergerak atas nama kemanusiaan, Kitasobi mengajak kamu untuk bersama bersolidaritas melalui sebuah gerakan bersama untuk membantu korban ketidakadilan yang tidak memiliki kemampuan ekonomi.&nbsp;</p>', 'Donasi Bantuan Hukum untuk Rakyat Kecil', 'Donasi Bantuan Hukum untuk Rakyat Kecil', 'programs/7gqky7q1yckXjtjlD7ZUDg5rAt4n9h40VP39NJPH.jpg', 0, 1, 0, 1, 54060000, 'Jakarta', '2022-11-15 09:53:47', '2022-12-16 03:39:26', NULL, 0),
(23, 'Perbaikan MASJID RUSAK Akibat Bencana Banjir', 'perbaikan-masjid-rusak-akibat-bencana-banjir', 25, NULL, NULL, '<p>Assalamualaikum warohmatullahi wabarakatuh</p>\r\n\r\n<p>Bismillahirohmanirohim</p>\r\n\r\n<p>إِذَا مَاتَ الْإِنْسَانُ انْقَطَعَ عَمَلُهُ إِلَّا مِنْ ثَلَاثَةٍ مِنْ صَدَقَةٍ جَارِيَةٍ وَعِلْمٍ يُنْتَفَعُ بِهِ وَوَلَدٍ صَالِحٍ يَدْعُو لَهُ</p>\r\n\r\n<p>&ldquo;Jika seseorang meninggal dunia, maka terputuslah amalannya kecuali tiga perkara yaitu: sedekah jariyah, ilmu yang dimanfaatkan, atau doa anak yang sholeh&rdquo;(HR. Muslim no. 1631)</p>\r\n\r\n<p>Yayasan Sedekah Masjid merupakan sebuah lembaga sosial yang fokus bergerak di bidang sosial keagamaan khususnya masjid, mulai dari pembangunan masjid, renovasi masjid, kebersihan masjid sampai dengan kemakmuran masjid.</p>\r\n\r\n<p>Tidak terkecuali masjid-masjid yang rusak karena bancana alam, melalui program ini kami ingin membantu juga masjid-masjid yang rusak karena terkena bencana alam tersebut.</p>\r\n\r\n<p>Saat bencana terjadi, tentunya banyak infrastruktur yang mengalami kerusakan, sekolah, rumah warga, fasilitas umum, tidak terkecuali masjid-masjid, pondok pesantren madrasah yang ada disana, terendam lumpur dan ikut mengalami kerusakan.</p>', 'Perbaikan MASJID RUSAK Akibat Bencana Banjir', 'Perbaikan MASJID RUSAK Akibat Bencana Banjir', 'programs/unbfCD8Xz2djjXGfIFJRuG0g7RwGegTDgMOSsfPe.jpg', 0, 1, 0, 1, 518160000, 'garut', '2022-11-15 09:56:32', '2022-12-16 03:56:09', NULL, 0),
(24, 'Berbagi untuk Anak Berkebutuhan Khusus', 'berbagi-untuk-anak-berkebutuhan-khusus', 25, NULL, NULL, '<p>Karena saya percaya, bahwa kita semua berhak untuk bahagia dan untuk itulah saya ingin berbagi dengan mereka apapun keadaannya.</p>\r\n\r\n<p>Untuk itu, saya ingin mengajak teman-teman semua untuk ikut memberikan &lsquo;kado&rsquo; ulang tahun dengan berbagi kepada anak-anak berkebutuhan khusus di Baraka Foundation.</p>', 'Berbagi untuk Anak Berkebutuhan Khusus', 'Berbagi untuk Anak Berkebutuhan Khusus', 'programs/kUKOj59Q5DyrMxgEb7KMpE0CCVb1OLpVPUMIGTmT.jpg', 0, 1, 0, 1, 1020000, 'surabaya', '2022-11-15 09:59:03', '2022-12-16 03:54:05', NULL, 0),
(25, 'Darurat ! Bantu Yatim, Duafa & Lansia Dengan Zakat', 'darurat-bantu-yatim-duafa-lansia-dengan-zakat', 25, NULL, NULL, '<p>Assalamualaikum #OrangBaik Yuk kita sisihkan sebagian dari harta kita untuk Berzakat membantu sesama dalam kebaikan, terutama untuk orang orang yang tidak mampu diluaran sana yang mereka masih memikirkan besok, lusa &amp; kedepanya mau makan apa, semoga menjadi Amal kebaikan untuk para ibu/bapak donatur semua, Aamiin</p>\r\n\r\n<p>Perkenalkan nama saya Bukhori Anggota Yayasan, saya tinggal di kampung Sawah Sari Rt/Rw 02/08 Desa Samarang Kab Garut, jawa barat &amp; Keseharian saya sebagai wiraswasta di bagian perdagangan produk</p>\r\n\r\n<p>Dengan adanya penggalangan dana ini saya bermaksud untuk membantu para kaum dhuafa, Yatim, Fakir dan Miskin Dengan Zakat yang para donatur berikan yang nantinya akan di bagikan untuk&nbsp;yang ada di daerah garut dan sekitarnya yang kondisi sekarang memperihatinkan &amp; butuh bantuan saluran tangan kebaikan kita untuk membantu mereka tetap bisa makan &amp; menikmati hari tua nya tampa banyak pikiran.</p>', 'Darurat ! Bantu Yatim, Duafa & Lansia Dengan Zakat', 'Darurat ! Bantu Yatim, Duafa & Lansia Dengan Zakat', 'programs/ian9NQWw57OxkrBYelEKLH53EZjy1moAAOs3f7sb.jpg', 0, 1, 0, 1, 1326000, 'garut', '2022-11-15 10:03:06', '2022-12-16 03:52:14', NULL, 0),
(27, 'Raih Pahala Jariyah, Wakaf Qur\'an Muslim Pelosok', 'raih-pahala-jariyah-wakaf-quran-muslim-pelosok', 27, '2022-12-31', NULL, '<p>Berwakaf Kini Lebih Mudah Dari Rumah, Mulai Rp50.000. Klik Banner Berikut Ini:</p>\r\n\r\n<p><a href=\"https://kitabisa.com/campaign/quranuntukpelosoknusantara/contribute?payamount=50000\"><img alt=\"4540fe7e-2edd-4da8-adc7-74764a44ca50.jpg\" src=\"https://img.kitabisa.cc/size/1000/4540fe7e-2edd-4da8-adc7-74764a44ca50.jpg\" style=\"height:100%; width:480px\" /></a></p>\r\n\r\n<p>Pahala dari sedekah makan akan terputus ketika selesai makanan pemberianmu, pahala sholat tahajud akan terputus ketika sholat, pahala dari puasa sunnah akan terputus saat kamu berbuka.</p>\r\n\r\n<p>Tetapi tidak dengan pahala dari berwakaf Al-Qur&#39;an, pahalanya akan terus mengalir dan memenuhi tabungan amalmu sebagai bekal hidup di akhirat kelak, bahkan tidak akan terputus walaupun pewakaf sudah meninggal dunia.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Jauh di pelosok negeri, saudara muslim kita masih banyak kekurangan Al-Qur&#39;an yang layak. Kalaupun ada kondisi mushafnya sudah usang, rusak, bahkan banyak halamannya yang tercecer karena sering digunakan.</p>\r\n\r\n<p><img alt=\"cb01c78e-48af-40d8-ae07-0d8fe4d25cb2.jpg\" src=\"https://img.kitabisa.cc/size/1000/cb01c78e-48af-40d8-ae07-0d8fe4d25cb2.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Kadang-kadang mereka harus mengantri dengan sabar karena harus bergantian untuk membaca Al-Qur&#39;an. Apalagi saat waktu shalat tiba, masjid dan mushola dipenuhi para muslim yang sambil menunggu antrian untuk bertadarus.</p>\r\n\r\n<p><img alt=\"b60de9c2-4f21-4c2f-9b27-026a97df1055.jpg\" src=\"https://img.kitabisa.cc/size/1000/b60de9c2-4f21-4c2f-9b27-026a97df1055.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Sebagai salah satu negara yang cukup dengan penduduk muslim terbesar di dunia ketersediaan Al-Qur&#39;an layak di Indonesia masih jauh dari kata. Oleh karena itu, Lazis Jateng ingin menganjak Sahabat Dermawan untuk Sedekah Jariyah dengan Berwakaf Al-Qur&#39;an.&nbsp;</p>\r\n\r\n<p>Kami memiliki keinginan besar untuk bisa&nbsp;mengalirkan 10.000 Al-Qur&#39;an untuk 100 Masjid dan Mushola di Penjuru Nusantara.</p>\r\n\r\n<p><img alt=\"1c5f5138-b702-4f5b-b757-c31ef06a23c7.jpg\" src=\"https://img.kitabisa.cc/size/1000/1c5f5138-b702-4f5b-b757-c31ef06a23c7.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Untuk memudahkan Sahabat Dermawan, kami juga telah menyediakan bentuk paket sedekah:</p>\r\n\r\n<p><img alt=\"a106fbeb-b2c4-44c2-9fbb-af1f9bf79369.jpg\" src=\"https://img.kitabisa.cc/size/1000/a106fbeb-b2c4-44c2-9fbb-af1f9bf79369.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>***</p>\r\n\r\n<p>Jika fisik tak mampu untuk hadir membersamai saudara-saudara kita belajar Al-Qur&#39;an, maka do&#39;a dan dukunganmu bisa mewakili itu semua. Karena do&#39;a dan dukunganmu tak berbatas jarak dan tempat.&nbsp;</p>\r\n\r\n<p>#SahabatBaik mari bersama-sama kita hadirkan Qur&#39;an layak untuk saudara muslim yang membutuhkan dengan beramal jariyah wakaf Al-Qur&#39;an layak.</p>\r\n\r\n<p>&nbsp;Sampaikan donasi Sahabat Baik dengan cara:</p>\r\n\r\n<ol>\r\n	<li>Klik tombol &quot;DONASI SEKARANG&quot;</li>\r\n	<li>Donasi nominal pasukan</li>\r\n	<li>Pilih metode pembayaran GO-PAY atau transfer Bank (transfer bank BNI, Mandiri, BCA, BNI Syariah, BRI) dan transfer ke no. rekening yang tertera</li>\r\n</ol>\r\n\r\n<p>InsyaAllah, ada pahala yang mengalir di setiap huruf Al-Qur&#39;an yang dilantunkan saudara muslim kita yang akan menjadi bekal untuk kita di akhirat kelak, aamiin...</p>\r\n\r\n<p>Jangan lupa sebarkan halaman campaign ini agar semakin banyak yang tersebar.</p>', 'Wakaf', 'Raih Pahala Jariyah, Wakaf Qur\'an Muslim Pelosok', 'programs/OL9VC5skvVujlKVmD5FPQQKVHnZO7AgfpoT6VSgN.jpg', 0, 1, 0, 1, 387337594, NULL, '2022-11-27 12:31:44', '2023-08-08 05:28:13', NULL, 0),
(28, 'Cianjur Berduka: 200 Lebih Meninggal Dunia', 'cianjur-berduka-200-lebih-meninggal-dunia', 22, '2022-12-30', NULL, '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Innalillahi! Korban jiwa Gempa Cianjur makin bertambah, tercatat 200 orang lebih meninggal dunia. Lebih dari 60.000 warga masih mengungsi. Mereka butuh bantuan darurat untuk bertahan hidup</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Siang hari yang damai di Cianjur, seketika berubah menjadi hiruk-pikuk&nbsp;kepanikan dan pekik takbir&nbsp;di mana-mana. Senin (21/11/2022) pukul 13.21 WIB, gempa tektonik berkekuatan Mag. 5,6 mengguncang kota itu.&nbsp;Beberapa menit kemudian, pemandangan memilukan nampak di sana-sini.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Berdasarkan data BNPB per Rabu (23/11) dilaporkan 271 orang meninggal dunia.&nbsp;Mayoritas warga meninggal karena tertimpa reruntuhan bangunan yang ambruk saat peristiwa terjadi. Korban paling banyak adalah lansia dan anak-anak.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Selain itu, korban luka bertambah jadi 2.043 orang. Sebanyak&nbsp;40 orang masih dilaporkan hilang. Pencarian masih terus dilakukan&hellip;</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Informasi yang diterima Masjid Nusantara menyebutkan, beberapa masjid pun terdampak cukup parah. Kondisi di lokasi pun gelap total, karena banyak tiang listrik yang tumbang.&nbsp;Semakin memprihatinkan lagi, karena banyak anak-anak yang membutuhkan makanan dan baju hangat.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Salah satu korban selamat, Ibu Samsiah, bercerita. Saat kejadian, beliau baru tiba di rumah sepulang berjualan. Di waktu bersamaan, sang nenek yang bernama Nek Pipih, sedang mengaji di ruang tengah.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Tiba-tiba, gempa menghantam. Tanpa pikir panjang, Bu Samsiah segera menggendong Nek Pipih, menyelamatkan diri keluar rumah.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">(Ibu samsiah adalah ibu dari Dadan, Tim Masjid Nusantara. Alhamdulillah semua selamat meski rumah hancur)</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">&ldquo;Alhamdulillah, Nenek gak lagi di kamar, jadi bisa langsung saya gendong. Saya udah gak inget apa-apa lagi selain menyelamatkan diri dan Nenek,&rdquo; tutur Bu Samsiah.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Meski rumahnya luluh lantak, Bu Samsiah masih bersyukur bisa menyelamatkan diri, karena gempa siang itu memakan korban jiwa 3 orang di kampung tempat tinggalnya, Kampung Ciendeur.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Di sana, tercatat 130 jiwa mengungsi, 4 warga luka berat, dan 3 orang meninggal dunia.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">&ldquo;Banyak rumah hancur dan berisiko untuk ditempati, jadinya warga inisiatif membuat posko darurat dengan bahan seadanya, karena hingga kini masih ada gempa susulan,&rdquo; kata Dadan Taryono, tim Program Masjid Nusantara, yang tiba di lokasi bencana tak lama setelah kejadian.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Kondisi di lokasi pun gelap total, karena banyak tiang listrik yang tumbang. Semakin memprihatinkan lagi, karena banyak anak-anak yang membutuhkan makanan dan baju hangat.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Kebutuhan mendesak untuk saat ini adalah makanan siap saji, air minum, dapur umum, tenda pengungsian, alat penerangan, obat-obatan, dan masjid darurat.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Bencana datang bukan hanya menjadi ujian kesabaran bagi para korban, tetapi juga jalan untuk membuktikan empati &lsquo;satu tubuh, satu rasa&rsquo; bagi kita yang tak terdampak langsung oleh musibah tersebut.</span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong>Saudara kita di Cianjur butuh bantuan, mari jadi bagian dari kebaikan untuk mereka dengan klik DONASI SEKARANG!</strong></span></span></p>', 'Campaign inisiatif', 'Cianjur Berduka: 200 Lebih Meninggal Dunia', 'programs/r6DUe4Yt9aAwVfRfbiv6mLe9ZclMlDrwoplq1Mzi.jpg', 0, 1, 0, 1, 272471070, NULL, '2022-11-27 12:48:57', '2022-11-27 12:50:39', NULL, 0),
(29, 'Urgent! Ribuan Warga Terdampak Banjir di Kalteng', 'urgent-ribuan-warga-terdampak-banjir-di-kalteng', 22, '2023-01-22', NULL, '<p>Banjir merendam 3 Kabupaten di Kalimantan Tengah dengan ketinggian air hampir 2 meter.</p>\r\n\r\n<p><img alt=\"00c75fd7-b88e-4308-8879-f1c49df090b3.jpg\" src=\"https://img.kitabisa.cc/size/700/00c75fd7-b88e-4308-8879-f1c49df090b3.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Beberapa pekan terakhir hujan mengguyur sejumlah wilayah di Kabupaten Kotawaringin Timur dan Kabupaten Katingan, Kalimantan Tengah. Hujan dengan intensitas tinggi ini menyebabkan banjir di puluhan desa. Sebelumnya pemerintah daerah sempat menetapkan status tanggap darurat pada 6-21 Agustus 2022, hingga banjir tersebut surut. Namun tak berselang lama, sekitar 2 minggu kemudian air tersebut kembali merendam pemukiman warga tepatnya pada 6 September 2022. Hingga saat ini, Kecamatan Kamipang, Kabupaten Katingan masih terendam banjir berminggu-minggu.</p>\r\n\r\n<p><img alt=\"54031df8-285a-476d-90f7-696d2b74611c.jpg\" src=\"https://img.kitabisa.cc/size/665/54031df8-285a-476d-90f7-696d2b74611c.jpg\" style=\"height:100%; width:480px\" /><img alt=\"346ac5fc-6821-46c3-ae72-3f761193ed17.jpg\" src=\"https://img.kitabisa.cc/size/700/346ac5fc-6821-46c3-ae72-3f761193ed17.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Dikutip dari BPBD Kabupaten Katingan, menyebutkan bahwa sebanyak&nbsp;833 KK atau 3.018 jiwa dan&nbsp;833 unit&nbsp;rumah warga terdampak banjir dengan Tinggi Muka Air (TMA) 100 - 150 sentimeter (bnpb.go.id).&nbsp;Selain itu, data dari BPBD Kabupaten Kotawaringin Timur menyebutkan bahwa&nbsp;banjir masih merendam 26 desa di empat kecamatan. Lokasinya yaitu Kecamatan Mentaya Hulu sebanyak 13 desa, Parenggean&nbsp;enam desa, Kota Besi&nbsp;enam desa dan Telawang satu desa (antarakalteng).</p>\r\n\r\n<p>Dilansir dari Tribun Kalteng, banjir&nbsp;juga merendam kota&nbsp;Palangkaraya dan&nbsp;berdampak pada&nbsp;11&nbsp;Kelurahan, bahkan aktifitas&nbsp;warga&nbsp;mulai terganggu sehinga sebagian memilih&nbsp;mengungsi. Banjir ini diakibatam limpahan banjir dari Kabupaten Gunung Mas, Kalimantan Tengah mulai meluas.</p>\r\n\r\n<p><img alt=\"8f8552f7-f2e3-400c-abb2-3fa936f6e521.jpg\" src=\"https://img.kitabisa.cc/size/1000/8f8552f7-f2e3-400c-abb2-3fa936f6e521.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Saat ini Kotawaringin Timur berstatus tanggap darurat banjir, terhitung sejak 5 hingga 19 September 2022. Status ini akan dievaluasi dengan mempertimbangkan perkembangan kondisi terbaru di lapangan. Pemerintah Kabupaten Katingan pun, kini telah menetapkan status menjadi siaga darurat banjir untuk dua minggu ke depan. Begitu pula dengan Pemerintah Kota Palangka Raya, Provinsi Kalimantan Tengah, menetapkan status siaga darurat bencana banjir, seiring terjadinya&nbsp;banjir&nbsp;kiriman di sejumlah kelurahan di daerah setempat.</p>\r\n\r\n<p><img alt=\"82817e00-4198-4acb-b270-295c499256ce.jpg\" src=\"https://img.kitabisa.cc/size/640/82817e00-4198-4acb-b270-295c499256ce.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>#OrangBaik solidaritas kita kembali diuji, banyak saudara kita yang terkena dampak banjir membutuhkan bantuan berupa makanan, pakai bersih, selimut dan obat-obatan.</p>\r\n\r\n<p>Mari kita saling jaga, kirimkan bantuanmu dengan cara berdonasi.</p>\r\n\r\n<p>Setiap dukunganmu&nbsp;akan disalurkan untuk membantu beragam kebutuhan pokok dan kebutuhan pendukung keseharian korban serta membantu penanganan banjir. Mari bersama-sama bantu korban banjir di Kalimantan Tengah dengan cara:</p>\r\n\r\n<ol>\r\n	<li>Klik tombol &quot;DONASI SEKARANG&quot;</li>\r\n	<li>Isi nominal donasi yang ingin diberikan</li>\r\n	<li>Pilih metode pembayaran GO-PAY/Mandiri/BCA/BNI/BNI Syariah/BRI dan kartu kredit</li>\r\n	<li>Ikuti instruksi untuk menyelesaikan pembayaran</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Salam Hangat,</p>', 'Campaign inisiatif', 'Urgent! Ribuan Warga Terdampak Banjir di Kalteng', 'programs/LF9eakkvQN9MnYyMxEF63ss1EeKi6efsOPkxnJfr.jpg', 0, 1, 0, 1, 202327200, NULL, '2022-11-27 13:04:42', '2022-11-27 13:04:42', NULL, 0),
(30, 'RS Balikpapan Baru untuk Korban Gempa Cianjur', 'rs-balikpapan-baru-untuk-korban-gempa-cianjur', 22, '2022-12-10', NULL, '<p>Hari senin, 21 November 2022 tepatnya pukul 13.21 WIB masyarakat Cianjur diguncang gempa bumi berkekuatan 5,6 SR dengan pusat gempa berada di 10 KM Barat Daya, Kabupaten Cianjut, Jawa Barat.</p>\r\n\r\n<p>Gempa bumi yang terjadi di CIanjur mengakibatkan kerusakan bangunan rumah, gedung dan toko serta menimbulkan korban jiwa baik luka maupun meninggal dunia. Selain gempa, juga terjadi longsor di beberapa tempat dimana saat ini sedang dilakukan evakuasi oleh BPBD Setempat.</p>', 'RS Balikpapan Baru untuk Korban Gempa Cianjur', 'RS Balikpapan Baru untuk Korban Gempa Cianjur', 'programs/WNawx1jZGN9eQNIR9iGwRgOLM4KUN6jFtY0PHAxd.jpg', 0, 1, 0, 1, 510000000, NULL, '2022-11-27 13:07:36', '2022-11-27 13:07:36', NULL, 0);
INSERT INTO `programs` (`id`, `name`, `slug`, `program_category_id`, `time_up`, `donation_collacted`, `description`, `meta_keyword`, `meta_description`, `image`, `status`, `is_published`, `is_selected`, `user_id`, `donation_target`, `location`, `created_at`, `updated_at`, `deleted_at`, `is_withdrawal`) VALUES
(31, 'Infaq Yatim: Kebahagiaan untuk 500 anak-anak Yatim', 'infaq-yatim-kebahagiaan-untuk-500-anak-anak-yatim', 26, '2025-11-30', NULL, '<p>Kasih sayang dan suasana kehangatan keluarga mungkin sering kita rasakan, namun hal itu tentu sangat berbeda bagi anak-anak yatim dhuafa, mereka yang sejak lahir terpaksa harus kehilangan sosok orangtua membuat mereka tidak pernah merasakan bagaimana kasih sayang dan suasana kehangatan ketika berada di rumah</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tak jarang juga anak-anak yatim dhuafa harus menanggung beban yang lebih berat lagi karena terpaksa tidak bisa menggapai keinginan dan cita-citanya dan harus bekerja demi bisa membantu memenuhi kebutuhan sehari-harinya</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Oleh karena itu kami mengajak kepada Orang Baik untuk ikut memberikan kebahagiaan kepada adik-adik yatim dhuafa supaya mereka bisa merasakan kasih sayang melalui kepedulian kita</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Selain itu, menyantuni anak-anak yatim dhuafa yang mengalami kekurangan dan membutuhkan uluran bantuan kita akan mendapatkan pahala yang berlipatganda oleh Allah SWT dan&nbsp;Allah SWT juga akan memberi rezeki begitu luas kepada hamba-Nya yang mau berbagi, menyantuni, dan menyisihkan sebagian rezekinya kepada orang yang membutuhkan.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;Kasihilah anak yatim, usaplah mukanya, dan berilah makan dari makananmu, niscaya hatimu menjadi lunak dan kebutuhanmu akan terpenuhi.&rdquo; (HR Thobroni)</p>', 'Infaq', 'Infaq Yatim: Kebahagiaan untuk 500 anak-anak Yatim', 'programs/RMUPOe2nJqxws7BgyE2vSILdSfr1yUQWUefOxn30.jpg', 0, 1, 0, 1, 867000000, NULL, '2022-11-27 13:14:54', '2022-11-27 13:14:54', NULL, 0),
(32, 'MRT Berbagi Untuk Korban Gempa Cianjur', 'mrt-berbagi-untuk-korban-gempa-cianjur', 21, '2022-12-15', NULL, '<p><strong>Aksi Kolaborasi Penanganan Bencana Gempa Bumi Cianjur.</strong></p>\r\n\r\n<p>MRTJ Berbagi bersama WeCare,id dan BNPB untuk korban akibat gempa magnitudo 5,6 yang mengguncang Cianjur, Jawa Barat dan sekitarnya. Sampai saat ini jumlah korban meninggal 310 orang, 24 orang masih belum ditemukan dan 62.545 warga masih mengungsi.</p>\r\n\r\n<p>Wilayah Cianjur masih diguncang 21 kali gempa susulan dalam waktu semalem, getaran gempa juga tidak hanya dirasakan di Kec. Cugenang, Cianjur. Tapi guncangan gempa juga dirasakan di sejumlah Kec. Cianjur.</p>\r\n\r\n<p>MRT Berbagi bertujuan untuk memberikan bantuan serta donasi ataupun kegiatan sosial penunjang lainnya guna memberikan dampak positif bagi komunitas maupun masyarakat umum.</p>', 'MRT Bernagi Untuk Korban Gempa Cianjur', 'MRT Berbagi Untuk Korban Gempa Cianjur', 'programs/KYjAah3EHjKQrm2EqmVWXrnPB1aQ72soo9ZferBy.jpg', 0, 1, 0, 1, 51000000, NULL, '2022-11-27 13:15:47', '2022-11-27 13:15:47', NULL, 0),
(33, 'Bersama bawa perubahan bagi hidup adik-adik yang sakit', 'bersama-bawa-perubahan-bagi-hidup-adik-adik-yang-sakit', 23, '2022-12-31', NULL, '<p>Ingin membawa perubahan bagi hidup seseorang tapi bingung memulai darimana?&nbsp;</p>\r\n\r\n<p>Yuk, memulai dari hal yang sederhana! #temanPEDULI bisa membawa perubahan bagi adik-adik yang sakit melalui inisiatif #UNTUKSEMUA. Selama 3 tahun Wecare.id beroperasi, #temanPEDULI telah membantu mengembalikan senyum di bibir pasien dan juga memberikan secercah harapan bagi adik-adik untuk bersekolah kembali.&nbsp;</p>\r\n\r\n<p><strong>Mengapa berdonasi #UNTUKSEMUA?</strong></p>\r\n\r\n<ol>\r\n	<li>Donasi akan disalurkan untuk pasien yang tidak mampu, tidak memiliki BPJS dan membutuhkan tindakan medis yang bersifat darurat</li>\r\n	<li>Donasi akan diprioritaskan untuk tindakan medis seperti operasi, obat dan alat bantu yang tidak ditanggung oleh program BPJS</li>\r\n	<li>Banyak sekali kasus dimana pengobatan pasien ditanggung oleh BPJS, tetapi pasien tidak mampu menanggung biaya akomodasi dan transportasi ke rumah sakit. Tidak jarang pasien tinggal di lokasi yang sangat jauh dari rumah sakit (3-4 jam berkendara) dan harus melakukan kontrol ke rumah sakit hingga 3 kali seminggu.</li>\r\n	<li>Donasi akan disalurkan secara berkala.</li>\r\n</ol>\r\n\r\n<p>CONTOH PASIEN-PASIEN YANG AKAN DIBANTU OLEH #UNTUKSEMUA</p>', 'Bersama bawa perubahan bagi hidup adik-adik yang sakit', 'Bersama bawa perubahan bagi hidup adik-adik yang sakit', 'programs/p3r1QVOrSReHkfzsEKnRbpe4iJTB65tyIjFUih6f.jpg', 0, 1, 0, 1, 30600000, NULL, '2022-11-27 13:23:35', '2022-11-27 13:23:35', NULL, 0),
(34, 'INNALILLAHI! Masjid Roboh Diguncang Gempa Cianjur', 'innalillahi-masjid-roboh-diguncang-gempa-cianjur', 22, '2023-02-01', NULL, '<h3><em>Innalillahi wainna ilaihi rojiun&hellip;</em></h3>\r\n\r\n<h3><em>GEMPA GUNCANG CIANJUR!268 jiwa meninggal dunia&hellip;1.083 jiwa luka-luka&hellip;58.362 jiwa mengungsi&hellip;22.198 rumah rusak&hellip;.</em></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Duka mendalam tengah dirasakan masyarakat Cianjur dan Indonesia. Tak hanya ratusan jiwa meninggal, tetapi berbagai bangunan termasuk rumah Allah roboh dan hancur hingga tak bisa digunakan lagi.Adapun salah satu masjid yang terdampak gempa tersebut adalah Masjid Al Barokah yang terletak di Kampung Ciharashas, Desa Sirnagalih, Kecamatan Cilaku, Kabupaten Cianjur. Tidak hanya gempa yang melanda Cianjur, tanah longsor pun terpantau menutup sebagian jalan di jalur Cipanas-Cianjur terputus. Sejumlah rumah dan bangunan lainnya roboh, pohon-pohon tumbang.</em></p>', 'INNALILLAHI! Masjid Roboh Diguncang Gempa Cianjur', 'INNALILLAHI! Masjid Roboh Diguncang Gempa Cianjur', 'programs/mIWzuujzmPJhTDhOQNTeL4eXxwgtN8FGdQnQZo7L.jpg', 0, 1, 0, 1, 204000000, NULL, '2022-11-27 13:29:11', '2022-11-27 13:29:11', NULL, 0),
(35, 'Solidaritas Bantu Mahasiswa Yang Membutuhkan', 'solidaritas-bantu-mahasiswa-yang-membutuhkan', 23, '2022-12-22', NULL, '<p>Belakangan ini Sobi sering dengar kabar dari para mahasiswa dan calon mahasiswa yang terancam tidak bisa melanjutkan kuliah karena kendala biaya. Apalagi dampak pandemi masih terasa bagi sebagian besar keluarga Indonesia dan belum pulih seutuhnya.</p>\r\n\r\n<p>Berangkat dari hal tersebut, Sobi tergerak untuk bantu para mahasiswa yang terancam putus kuliah dan para calon mahasiswa yang ingin melanjutkan ke jenjang perkuliahan agar bisa tetap melanjutkan rencana pendidikannya melalui gerakan Belajar Bareng Sobi</p>\r\n\r\n<p>Untuk mewujudkan gerakan ini, tentu Sobi membutuhkan bantuan #OrangBaik. Makanya Sobi mengajak teman-teman untuk ikut dalam gerakan ini dengan cara donasi. Donasi yang terkumpul akan disalurkan untuk siapapun yang sudah lulus jenjang pendidikan SMA/MA/SMK agar bisa melanjutkan ke pendidikan kuliah ataupun pendidikan nonformal lainnya.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'Solidaritas Bantu Mahasiswa Yang Membutuhkan', 'Solidaritas Bantu Mahasiswa Yang Membutuhkan', 'programs/z4omgFMH7ekeO9nrSpnXDHXaK95cx79uBUxGb2Bz.jpg', 0, 1, 0, 1, 153000000, NULL, '2022-11-27 13:37:04', '2022-11-27 13:43:05', NULL, 0),
(36, 'Sedekah Beras Bersama Abi Amir untuk Para Hafiz', 'sedekah-beras-bersama-abi-amir-untuk-para-hafiz', 22, '2022-12-15', NULL, '<p>Pesantren Fath Darut Tafsir diasuh oleh Ustadz Abi Amir yang merupakan Guru besar dalam bidang Al-Qur&rsquo;an.&nbsp;</p>\r\n\r\n<p>Terletak di desa sukawangi sukamakmur, Bogor.&nbsp;<em>Para santri berasal dari berbagai daerah di Indonesia seperti, Jawa, Sulawesi, hingga ke Indonesia Timur seperti Alor, Maluku, Papua. Kondisi santri di pesantren ini banyak diisi oleh kalangan dhuafa, fakir miskin, yang Alhamdulillah memiliki semangat dan motivasi mulia dalam belajar Al-qur&rsquo;an.</em></p>\r\n\r\n<p><em>Salah satu kebutuhan pokok dalam kegiatan belajar mengajar di pesantren adalah perihal makan untuk para santri. Para santri agar bisa berkonsentrasi dan mampu menghafal dengan fokus perlu juga mengisi energinya melalui makan. Namun kondisi pesantren saat ini mengalami kesulitan bahan pokok untuk makan santri, terutama beras.</em></p>\r\n\r\n<p><em>Kebutuhan beras di pesantren yang bisa mencapai 1,5 kwintal per/minggu sangat besar dan berat dalam segi biaya maupun akomodasi.&nbsp;Untuk mendapatkan jumlah beras sebesar itu tak jarang pihak pesantren harus merogoh kocek lebih karena lokasi pesantren yang jauh dari pasar umum. Akhirnya seringkali kebutuhan beras tak terpenuhi dan membuat anak-anak santri harus dipotong jam makannya.&nbsp;Bahkan salah satu pengurus Ustadz Imam mengatakan, &ldquo;Untuk menutupi kebutuhan bahan pokok dapur sangat kurang jika mengandalkan uang pesantren, sering kali bahkan kita mengutang beras ke warung terdekat demi mendukung kegiatan belajar santri.&rdquo;</em></p>\r\n\r\n<p>Maka dari itu Ustadz Abi Amir mengajak kita mencari ladang pahala dan berkah untuk sama sama menolong dan memudahkan para generasi penghafal Al-Qur&rsquo;an ini. Para santri ini 24 jam berinteraksi siang malam demi belajar Al-Qur&rsquo;an banyak memiliki cita-cita mulia dan tingi.&nbsp;Salah satu santri bernama Umar mengatakan, &ldquo;Saya ingin menjadi Ulama kelak, mengajarkan Al-Qur&rsquo;an ke pelosok-pelosok daerah.&rdquo; Sungguh cita-cita yang mulia dan patut kita dukung harapannya.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ustadz Abi Amir mengatakan.&rdquo;Setiap bantuan butir nasi yang diberikan maka kelak akan bersaksi di akhirat untuk mengatakan bahwa ia dihadiahkan bagi para mulut para Penghafal Quran. Bayangkan jika kita membantu untuk membeli sekarung beras, maka akan bersaksi memudahkan kita dihadapan Allah kelak mendapatkan surga.&rdquo;</p>', 'Sedekah Beras Bersama Abi Amir untuk Para Hafiz', 'Sedekah Beras Bersama Abi Amir untuk Para Hafiz', 'programs/y4mJ4FXZhU1aeEhFB4qISHFkarYV7R3QQ01iNhQX.jpg', 0, 1, 0, 1, 989400000, NULL, '2022-11-27 13:41:36', '2022-11-27 13:41:36', NULL, 0),
(37, 'Solidaritas Bantu Banjir dan Tanah Longsor Sulawesi', 'solidaritas-bantu-banjir-dan-tanah-longsor-sulawesi', 22, '2022-12-31', NULL, '<h4>Banjir dan Tanah Longsor Melanda Pulau Sulawesi. Dua provinsi dengan dampak terparah adalah Sulawesi Selatan dan Sulawesi Barat. Beberapa daerah di Sulawesi terdampak bencana Banjir dan Tanah Longsor.&nbsp;<strong>Pada hari Rabu (16/11) terjadi Bencana Tanah Longsor di Kabupaten Gowa yang mengakibatkan 9 korban, 3 korban selamat, lima sudah ditemukan dalam kondisi meninggal, satu masih hilang.</strong>&nbsp;Korban tanah longsor berada di dua titik yakni Dusun Kunyika dan Dusun Borong Sapiria, Desa Lonjoboko&nbsp; Kecamatan Parangloe, Kabupaten Gowa, Sulsel sebanyak sembilan orang.&nbsp;</h4>\r\n\r\n<p>Berselang dua hari, pada Jum&rsquo;at (18/11) akibat curah hujan tinggi mengakibatkan beberapa wilayah di Sulawesi yakni Provinsi Sulawesi Selatan dan Sulawesi Barat Banjir.&nbsp;<strong>Banjir melanda 4 Kabupaten/Kota&nbsp; yakni Kabupaten Mamuju, Kota Pare - Pare, Kabupaten Barru dan Kabupaten Gowa</strong>. Belum ada jumlah pasti dari BPBD Sulawesi Selatan dan Sulawesi Barat terkait jumlah masyarakat yang terdampak Banjir. Saat ini BPBD dan pihak - pihak terkait sedang berupaya untuk melakukan proses evakuasi bagi masyarakat yang terdampak banjir dan tanah longsor.&nbsp;<strong>Masyarakat yang dievakuasi terlebih dulu oleh BPBD adalah Lansia, Wanita, dan Balita</strong></p>\r\n\r\n<p><img src=\"https://gudang-prod.imgix.net/f48ae5be-6766-11ed-a5a6-229d7e5cbc38_DF728190583D0594.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Source: Siaga Peduli</p>\r\n\r\n<p><strong>Hujan deras juga mengakibatkan&nbsp;</strong><strong>Daerah yang terdampak banjir setinggi dada orang dewasa yaitu, sebagian wilayah di Kota Makassar, Kabupaten Baru dan Kota Pare - pare. Bahkan&nbsp;</strong><strong>beberapa rumah warga hanyut karena banjir.&nbsp;</strong></p>\r\n\r\n<p>Di hari Jum&rsquo;at, BPBD Sulsel telah mengeluarkan peringatan dini cuaca wilayah Sulawesi Selatan yang berpotensi terjadi hujan dengan intensitas ringan hingga lebat pada Kabupaten Bulukumba, Kab Jeneponto, Kab Takalar, Kab Gowa, Kab Sinjai, Kab Bone, Kab Maros, Kab Pangkep, Kab Barru, Kab Soppeng, Kab Sidrap, Kab Pinrang, Kota Makassar, Kota Pare-pare.</p>', 'Campaign inisiatif', 'Solidaritas Bantu Banjir dan Tanah Longsor Sulawesi', 'programs/5gdwzO7G8BzTLEfmuvgv4YVWrOheyxWnN7BF4Stq.jpg', 0, 1, 0, 1, 204000000, NULL, '2022-11-27 13:42:55', '2022-11-27 13:42:55', NULL, 0),
(38, '#PEDULISULAWESI, Bantu Warga Dari Banjir Bandang', 'pedulisulawesi-bantu-warga-dari-banjir-bandang', 22, '2022-12-01', NULL, '<p>Bagaimana tidak? Sejak jumat 18 Nov 2022 curah hujan yang tinggi membuat beberapa wilayah di Sulawesi diguyur hujan deras dan berujung banjir bandang.&nbsp;</p>\r\n\r\n<p>Tak main-main ketinggian air mencapai leher orang dewasa. Dikabarkan air yang deras juga membuat jalur&nbsp;trans Sulawesi mengalami longsor, hingga ada rumah yang juga hanyut.</p>\r\n\r\n<p>Sejauh ini wilayah yang terdampak meliputi Sulawesi Barat yaitu Kab. Majene, Kab. Mamuju, Polewali Mandar. Sedangkan Sulawesi Selatan meliputi Pare-pare, Kab. Barru, Kab. Pangkep, dan Kota Makassar.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Adapun kebutuhan darurat yang masyarakat butuhkan meliputi stok makanan, obat-obatan, selimut, baju dan masih banyak lagi.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '#PEDULISULAWESI, Bantu Warga Dari Banjir Bandang', '#PEDULISULAWESI, Bantu Warga Dari Banjir Bandang', 'programs/xdItTFJVDmoFIVrdi6TAy75PIVEvsQ8ekSoFEtYq.jpg', 0, 1, 0, 1, 204000000, NULL, '2022-11-27 13:48:02', '2022-11-27 13:48:02', NULL, 0),
(39, 'Wujudkan Mimpi Mang Toha Mengubah Nasib Petani', 'wujudkan-mimpi-mang-toha-mengubah-nasib-petani', 22, '2023-01-01', NULL, '<p>Lima tahun terakhir di Kecamatan Cimenyan Kabupaten Bandung marak kegiatan aksi tanam pohon. Hal itu tak lepas dari kemunculan Yayasan Odesa Indonesia sebagai penggerak pertanian ramah lingkungan. Di balik kerja kolektif Yayasan dari para jurnalis, aktivis pergerakan, dosen dan peneliti, ada sosok petani yang tak bisa diabaikan kontribusi sosialnya.</p>\r\n\r\n<p>Nama tertera di Kartu Tanda Penduduk tertulis Toha (40 tahun). Petani asal Kampung Waas Desa Mekarmanik Kecamatan Cimenyan oleh pengurus Yayasan Odesa Indonesia diberikan kepercayaan memimpin gerakan aksi sosial, seperti menyalurkan bantuan amal sosial, membangun sanitasi, dan ikut serta membantu relawan untuk kegiatan literasi anak-anak desa.</p>\r\n\r\n<p>Terutama dalam hal pertanian, Toha menjadi aktor penggerak lapangan untuk menancapkan puluhan ribuan pohon di ladang-lahan kritis Kawasan Bandung Utara (KBU) yang selama ini menjadi penyebab banjir lumpur di Kota Bandung.<br />\r\n<br />\r\n&ldquo;Sebagai petani saya sadar tidak semua aktivitas menanam itu baik. Ada pertanian yang merusak lingkungan juga. Sejak saya ikut kegiatan di Yayasan Odesa Indonesia kita mendapatkan praktik pertanian baru dengan beragam jenis tanaman. Saya merasa senang karena sebagian tanaman buah yang ditanam 4 tahun lalu sudah mulai menghasilkan,&rdquo; kata Toha.</p>', 'Wujudkan Mimpi Mang Toha Mengubah Nasib Petani', 'Wujudkan Mimpi Mang Toha Mengubah Nasib Petani', 'programs/6iGljpNBsNwZnGcJwTpZk5IvCk8P7TFerjANob2N.jpg', 0, 1, 0, 1, 204000000, NULL, '2022-11-27 13:51:20', '2023-08-08 11:40:38', NULL, 0),
(40, 'Memperbaiki Sarana dan Prasarana Masjid Kampung', 'memperbaiki-sarana-dan-prasarana-masjid-kampung', 26, '2023-01-03', NULL, '<p>Bismillaahirrahmaanirrahiim,,,</p>\r\n\r\n<p>Sebagai muslim, kita pasti sudah sangat paham bahwa sedekah jariyah adalah amalan yang pahalanya mengalir terus-menerus tanpa putus bahkan ketika kita sudah meninggal.</p>\r\n\r\n<p>&ldquo;Apabila Anak Adam (manusia) meninggal dunia, maka terputuslah semua (pahala) amal perbuatannya kecuali tiga macam perbuatan, yaitu amal jariah, ilmu yang bermanfaat dan doa anak soleh&rdquo; (Hadist Riwayat Muslim)</p>\r\n\r\n<p>Salah satu dari amalan di atas adalah amal jariyah, yang bisa kita wujudkan melalui berbagai cara, misalnya dengan membangun dan memakmurkan masjid.</p>\r\n\r\n<p>&ldquo;Hanya yang memakmurkan masjid-masjid Allah ialah orang yang beriman kepada Allah dan hari kemudian, serta tetap mendirikan shalat, menunaikan zakat da tiak takut (kepada siapapun) selain kepada Allah, maka merekalah orang-orang yang diharapkan termasuk golongan orang-orang yang mendapat petunjuk&rdquo; (QS At-Taubah:18)</p>\r\n\r\n<p>Nabi Muhammad bersabda:</p>\r\n\r\n<p>&ldquo;Barang siapa yang membangun masjid, maka Allah akan bangunkan baginya semisalnya di surga.&rdquo; (HR. Bukhari, 450 dan Muslim, 533 dari Hadist Utsman Radhiallahu&rsquo;anhu)</p>\r\n\r\n<p>Membangun masjid bagi sebagian orang yang mampu dan mau, memanglah bukan hal yang sulit jika Allah menghendaki.</p>\r\n\r\n<p>Namun, bagi sebagian orang yang lainnya yang mempunyai kebutuhan lainnya namun tetap ingin turut andil dalam sumbangsih membangun masjid, terkadang sedikit kewalahan mengatur keuangannya.</p>\r\n\r\n<p>Tapi janganlah berkecil hati, karena selalu ada cara melakukan kebaikan untuk memakmurkan masjid dengan menyediakan karpet yang Insya Allah pahalanya sama dengan membangun masjid. Insya Allah,,,</p>\r\n\r\n<p>Insya Allah Yayasan Sedekah Masjid mempunyai program&nbsp;INFAQ UMUM UNTUK SARANA DAN PRASARANA&nbsp;MASJID, dimana program ini dialokasikan untuk membantu memperbaiki dan atau menambah fasilitas masjid yang memang sangat dibutuhkan.</p>\r\n\r\n<p>Insya Allah program&nbsp;INFAQ UMUM UNTUK SARANA DAN PRASARANA&nbsp;MASJID&nbsp;ini akan dialokasikan untuk kebutuhan seperti perbaikan tempat wudhu, perbaikan pintu, perbaikan atap, perbaikan jendela, cat ulang masjid, pengadaan alat shalat yang layak dan bersih, pengadaan Al Qur&#39;an&nbsp;dan pengadaan fasilitas masjid dan&nbsp;perbaikan yang lainnya.</p>\r\n\r\n<p>InsyaAllah kami prioritaskan dulu penyaluran program&nbsp;</p>\r\n\r\n<p>INFAQ UMUM UNTUK SARANA DAN PRASARANA&nbsp;MASJID&nbsp;ini untuk masjid-masjid di perkampungan terlebih dahulu.</p>\r\n\r\n<p>Mengapa kami lebih memilih Masjid di perkampungan? Karena berdasarkan pengalaman yang kami alami, banyak tempat ibadah khususnya di perkampungan yang kurang nyaman digunakan saat ibadah, sangat berbeda jauh dengan masjid di perkotaan. Kekurangan anggaran dan kondisi ekonomi warganya menjadi salah satu faktor utamanya.</p>', 'Infaq', 'Memperbaiki Sarana dan Prasarana Masjid Kampung', 'programs/IwlhPSubT94EvPQ9vmrCP1YKhOnAzW0B7FaiJC5c.jpg', 0, 1, 0, 1, 255000000, NULL, '2022-11-27 13:52:13', '2023-08-08 11:40:35', NULL, 0),
(41, 'ZAKAT UNTUK YATIM DHUAFA DAN PENGHAFAL AL QURAN', 'zakat-untuk-yatim-dhuafa-dan-penghafal-al-quran', 24, '2023-01-26', NULL, '<p>ZAKAT UNTUK YATIM DHUAFA DAN PENGHAFAL AL QURAN</p>\r\n\r\n<p>Zakat merupakan ibadah bagi setiap Muslim, termasuk dalam rukun Islam dan menunaikan zakat adalah kegiatan yang wajib dilakukan bagi setiap muslim yang telah memenuhi syarat-syarat tertentu. Kewajiban ini, tertulis di dalam Al Quran ada pada Q.S Al-Baqarah 2:43 :</p>\r\n\r\n<p>الرّٰكِعِينَ مَعَ وَارْكَعُوا الزَّكٰوةَ وَءَاتُوا الصَّلٰوةَ وَأَقِيمُوا</p>\r\n\r\n<p>&ldquo;dan dirikanlah sholat, tunaikanlah zakat dan ruku&rsquo;lah beserta orang-orang yang ruku.&rdquo;</p>\r\n\r\n<p>Dompet Yatim dan Dhuafa merupakan Lembaga Amil Zakat yang membantu anak-anak Yatim dan&nbsp; Dhuafa, serta berperan aktif dibidang Pendidikan, Sosial, Kemanusiaan serta menerima dan menyalurkan Zakat.</p>\r\n\r\n<p>Memiliki 22 asrama asuh yatim dan dhuafa serta 2 kantor pelayanan yang tersebar di Jakarta, Depok, Tangerang dan Bekasi. &nbsp;didalamnya terdapat anak-anak yang belum mukallaf/belum mampu mandiri tapi telah terputus nafkah dari keluarganya.</p>\r\n\r\n<p>Melalui program-program pemberdayaan kepada anak-anak yatim dan dhuafa agar dapat tumbuh kembang secara baik, mendapatkan pendidikan yang layak, kesehatan yang memadai sehingga menjadi generasi penerus bangsa yang mandiri, terampil, dan religius.</p>\r\n\r\n<p>Kenapa Dompet Yatim Dhuafa Berhak Menerima Zakat?</p>\r\n\r\n<ul>\r\n	<li>Melalui Kitabisa, Dompet Yatim dan Dhuafa telah tergabung dalam jaringan ZakatHub by BAZNAS yang merupakan badan zakat resmi pemerintah. Dana zakat tersebut kami salurkan kepada para mustahik yang berstatus fakir, miskin dan para lansia yang memenuhi ketentuan layak menerima zakat.</li>\r\n	<li>Penerima manfaat dari program yang dijalankan oleh Dompet Yatim Dhuafa berasal dari asnaf Fakir, Miskin.<br />\r\n	&nbsp;</li>\r\n	<li>Saat ini ada lebih dari 500 anak yatim dan dhuafa yang telah menerima manfaat dari Program Dompet Yatim Dhuafa.</li>\r\n</ul>\r\n\r\n<p>8 Golongan yang berhak menerima Zakat (Asnaf) menurut Surat At-Taubah ayat 60:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Program biaya pendidikan dan kebutuhan hidup sehari-hari para santri yang diasuh di Asrama dimana mereka masuk dalam kategori Asnaf (8 pihak yang layak menerima zakat) yaitu anak-anak dari keluarga kurang mampu (Miskin) sampai pada keluarga yang tidak cukup untuk memenuhi kebutuhan hidupnya (Fakir) dimana mereka ingin melanjutkan Pendidikan. Kebutuhan yang diberikan meliputi makan, minum, pakaian, dan biaya operasional panti asuhan.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Berharap dari sini akan lahir manusia-manusia sholeh yang siap membantu ummat dan menduplikasi sistem pendidikan dan pembinaan yang solutif ini keseluruh Nusantara khususnya untuk para yatim dan dhuafa.</p>\r\n\r\n<p>Demi menjalankan amanah untuk terus memberikan kehidupan yang lebih baik bagi anak yatim, dhuafa serta masyarakat pada umumnya, Kami mengajak Anda, untuk membantu sesama dengan berperan aktif dalam menunaikan 2,5% kewajiban zakat dari penghasilan, melalui Yayasan DOmpet Yatim dan Dhuafa.</p>\r\n\r\n<p>Besar kecilnya harta yang dikeluarkan, berarti besar untuk merubah tatanan kehidupan sosial secara menyeluruh, mulai diri sendiri.</p>\r\n\r\n<p>&quot;Zakat untuk yatim dhuafa dan penghafal Al Quran&nbsp;... &quot;</p>', 'ZAKAT UNTUK YATIM DHUAFA DAN PENGHAFAL AL QURAN', 'ZAKAT UNTUK YATIM DHUAFA DAN PENGHAFAL AL QURAN', 'programs/TgBW1hl61BMTGaifoT5i3iF7ut2Gb4GPymvYhCZf.jpg', 0, 1, 0, 1, 255000000, NULL, '2022-11-27 13:55:06', '2023-08-08 11:40:31', NULL, 0),
(42, 'Beri Kebahagiaan untuk 1000 Yatim & Dhuafa', 'beri-kebahagiaan-untuk-1000-yatim-dhuafa', 26, '2023-01-31', NULL, '<p>Kasih sayang dan suasana kehangatan keluarga mungkin sering kita rasakan, namun hal itu tentu sangat berbeda bagi anak-anak yatim dhuafa, mereka yang sejak lahir terpaksa harus kehilangan sosok orangtua membuat mereka tidak pernah merasakan bagaimana kasih sayang dan suasana kehangatan ketika berada di rumah.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tak jarang juga anak-anak yatim dhuafa harus menanggung beban yang lebih berat lagi karena terpaksa tidak bisa menggapai keinginan dan cita-citanya dan harus bekerja demi bisa membantu memenuhi kebutuhan sehari-harinya</p>\r\n\r\n<p>Oleh karena itu kami mengajak kepada Orang Baik untuk ikut memberikan kebahagiaan kepada adik-adik yatim dhuafa supaya mereka bisa merasakan kasih sayang melalui kepedulian kita</p>\r\n\r\n<p>Selain itu, menyantuni anak-anak yatim dhuafa yang mengalami kekurangan dan membutuhkan uluran bantuan kita akan mendapatkan pahala yang berlipatganda oleh Allah SWT dan&nbsp;Allah SWT juga akan memberi rezeki begitu luas kepada hamba-Nya yang mau berbagi, menyantuni, dan menyisihkan sebagian rezekinya kepada orang yang membutuhkan.</p>\r\n\r\n<p>&quot;Kasihilah anak yatim, usaplah mukanya, dan berilah makan dari makananmu, niscaya hatimu menjadi lunak dan kebutuhanmu akan terpenuhi.&rdquo; (HR Thobroni)</p>\r\n\r\n<p>&nbsp;</p>', 'Beri Kebahagiaan untuk 1000 Yatim & Dhuafa', 'Beri Kebahagiaan untuk 1000 Yatim & Dhuafa', 'programs/wWoYQ2pL3X9Lrbhie3wDOp4I3hh1v6QqX6H6JQXV.jpg', 0, 1, 0, 1, 1247460000, NULL, '2022-11-27 14:03:12', '2023-08-08 11:37:51', NULL, 0),
(43, 'Pahala Mengalir Selamanya! Ayo Beramal Jariyah', 'pahala-mengalir-selamanya-ayo-beramal-jariyah', 25, '2022-12-02', NULL, '<p>sudah sejak 2010 al habib rizal melaksanakan safari dakwahnya di jawa barat.</p>\r\n\r\n<p>Ratusan tempat telah beliau kunjungi dalam rangka melaksanakan tugasnya Sebagai Pendakwah.<br />\r\n<br />\r\n&quot;Sedih dan menggetarkan hati&quot;&nbsp;Ternyata&nbsp;selama beliau melaksanakan safari dakwahnya ini beliau menemukan banyak sekali anak anak dan remaja yang tidak bisa melaksanakan pendidikan pesantren karena tidak memiliki Biaya untuk kebutuhan selama di pesantren.</p>\r\n\r\n<p>padahal&nbsp;sudah sepatutnya keterbatasan ekonomi tidak menjadi penghalang bagi sipapapun untuk mendapatkan pendidikan yang layak dan pantas Apalagi ilmu agama -Ungkap Beliau,</p>\r\n\r\n<p>karena hal itu terpikir dalam benaknya untuk mendirikan sebuah pesantren gratis untuk memfasilitasi kebutuhan para santri nantinya Dan alhamdulillah niat baik beliau di sambut baik oleh salah satu jama&#39;ahnya sehingga mewakafkan tanah seluas 20 Tumbak Miliknya untuk di bangun pesantren di atasnya.</p>\r\n\r\n<p>dan saat ini pembangunan&nbsp; pesantren Yang di beri nama Pesantren&nbsp;IRSYADUL MADAD&nbsp;ini di awali dengan pembangunan sebuah masjid yang di berinama&nbsp;Masjid Al Baqili&nbsp;yang&nbsp;mana saat ini pembangunannya baru sampai ke tahap pemasangan bata untuk dinding serta perangakaian besi atas untuk&nbsp;lebih jelasnya silahkan tonton video berikut ini :</p>\r\n\r\n<p>Sebagai Tambahan informasi saat ini&nbsp;&nbsp;sudah ada 60 santri dan santriyah&nbsp;yang mendaftar untuk belajar ilmu agama bersama beliau di pesantren tersebut,</p>\r\n\r\n<p>Namun Karena fasililitas madrasah dan asrama&nbsp;belum tersedia serta pembangunan masjidnya belum selesai maka Kegiatan belajarnya belum bisa di laksanakan.&nbsp;</p>\r\n\r\n<p>Semoga dengan adanya penggalangan dana ini Alloh Bukakan jalan dan mempermudah segala urusan serta prosesnya agar pembangunan masjid ini bisa segera beres dan pembangunan asrama serta madrasahnyapun bisa segera di laksanakan.</p>\r\n\r\n<p>&nbsp;</p>', 'Donasi rutin', 'Pahala Mengalir Selamanya! Ayo Beramal Jariyah', 'programs/k9ijTshp55bEUTcQmuDuyCdb2wwm4pSgshUFJ8fQ.jpg', 0, 1, 0, 1, 565212079, NULL, '2022-11-27 14:08:45', '2023-08-08 11:37:35', NULL, 0),
(44, 'Rayyan Anak Penjual Kopi Keliling Membutuhkan Biaya Operasi Jantung Lanjutan!', 'rayyan-anak-penjual-kopi-keliling-membutuhkan-biaya-operasi-jantung-lanjutan', 21, '2022-12-22', NULL, '<h3><strong>Selain Gagal Jantung, Paru-Paru jguga Rayyan Mengalami Infeksi!!!</strong></h3>\r\n\r\n<hr />\r\n<p>Assallamualaikum. Wr.Wb. Perkenalkan nama saya Leli, ingin menggalang dana untuk biaya pengobatan Rayyan.</p>\r\n\r\n<p>Sewaktu lahir Rayyan sangatlah sehat hingga usianya memasuki 1 bulan, nafasnya terlihat cepat. Saat itu juga langsung saya bawa ke rs terdekat. Ternyata Rayyan didiagnosa Pneumonia, kurang lebih di rawat 1 minggu, setelah dokter bilang membaik, akhirnya Rayyan bisa pulang. Selang beberapa bulan di rumah, masuk usia 3 bulan dia batuk dan suaranya pun hilang. Sempat saya bawa ke dokter spesialis anak di bilangan pondok pinang, menurut pemeriksaan dokter dia terkena pneumonia akut. Pagi nya saya dan suami membawa Rayyan ke RS dan ternyata harus rawat inap kembali.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dokter langsung ambil tindakan CT-scan, nebu, infus sudah di lakukan, setelah 3 hari dokter bilang dia butuh ruangan picu di karenakan ada kelainan jantung selain paru-parunya yg bermasalah, akhirnya dia di rujuk ke RSAB Harapan Kita, dengan peralatan lengkap di ambulans.</p>\r\n\r\n<p>Saat usia 9 bulan Rayyan menjalani operasi tahap awal yaitu post PA Banding, dan masih ada beberapa tindakan untuk kedepan nya. Seperti kateterisasi, lalu setelah kateterisasi <strong>masih ada tindakan operasi open heart lagi</strong>, nama operasi nya BCPS kata dokter, belum lagi tindakan di paru-parunya yang infeksi, jadi perjalanan pengobatan <strong>Rayyan masih panjang dan membutuhkan biaya besar.</strong></p>\r\n\r\n<p>Saat ini Rayyan sudah pulang ke rumah, dan harus rawat jalan, di rumah Rayyan pun tidak bisa jauh dari oksigen mengingat setiap kali dia nangis bisa menyebabkan seluruh muka nya membiru karna kekurangan oksigen di dalam darahnya. Saat ini saya dan suami kesulitan untuk memenuhi kebutuhan medis Rayyan seperti, obat, susu khusus, vitamin dan oksigen yang setiap bulannya. <strong>Sedangkan suami sudah tidak bekerja lagi karena habis kontrak,</strong> dan untuk memenuhi kebutuhan rumah tangga dan pengobatan Rayyan. Saat ini <strong>suami bekerja sebagai kuli bangunan, dan kalau malam hari berjualan kopi keliling</strong> pakai sepeda dan terkadang pakai motor yang dipinjamkan oleh temannya.</p>\r\n\r\n<p>Untuk itu saya ingin menggalang dana untuk kesembuhan anak saya. Semog masih ada yang mau membantu di luar sana yang rela menyisihkan sedikit rezeki nya untuk pengobatan Rayyan sambil menunggu jadwal operasi selanjutnya.</p>', 'Rayyan Anak Penjual Kopi Keliling Membutuhkan Biaya Operasi Jantung Lanjutan!', 'Rayyan Anak Penjual Kopi Keliling Membutuhkan Biaya Operasi Jantung Lanjutan!', 'programs/MsWfjQxk0PTljmPecZHBl0hVg4P47oeduC9mTWvF.jpg', 0, 1, 0, 1, 51000000, NULL, '2022-11-27 14:11:57', '2023-08-08 11:37:34', NULL, 0),
(45, 'Sedekah Subuh, Waktu Mustajab Raih Doa Malaikat', 'sedekah-subuh-waktu-mustajab-raih-doa-malaikat', 25, '2022-12-24', NULL, '<p>Orang Baik, ditengah aktivitas sehari-hari kita yang padat, yuk kita sempatkan untuk mengerjakan hal-hal yang dicintai Allah SWT supaya kita selalu dilimpahkan kebaikan dan keberkahan oleh Allah SWT. Jangan lupa juga kita sisihkan sedikit rezeki kita untuk membantu sesama dengan bershadaqah. Rasulullah SAW berfirman: &ldquo;Setiap datang waktu pagi yang dialami para hamba, ada 2 malaikat yang turun, yang satu berdoa: &ldquo;Ya Allah, berikanlah ganti bagi orang yang berinfaq.&rdquo; Sementara yang satunya berdoa, &ldquo;Ya Allah, berikanlah kehancuran bagi orang yang kikir.&rdquo; (HR. Bukhari &amp; Muslim) Syekh Ali Jaber juga bernah berkata dalam salah satu videonya: &quot;Semua waktu sebenarnya baik, tapi saya menemukan sedekah subuh itu yang paling baik, paling dahsyat, yang paling cepat terkabul hajat kita. Kenapa sedekah subuh dahsyat? Karena setiap waktu subuh Allah turunkan malaikat tugasnya cuma satu, mendoakan orang yang berinfak di subuh hari,&rdquo; ujar Syekh Ali Jaber (alm) di salah satu videonya. &ldquo;Tidak ada satu subuh pun yang dialami hamba-hamba Allah kecuali turun kepada mereka dua malaikat. Salah satu diantara keduanya berdoa, &lsquo;Ya Allah, berilah ganti bagi orang yang berinfak&rsquo;, sedangkan yang satunya lagi berdoa &lsquo;Ya Allah, berilah kerusakan bagi orang yang menahan hartanya.&rdquo; (HR. Bukhari &amp; Muslim) Sahabat Berbagi yuk kita manfaatkan keutamaan dari sedekah subuh ini, agar kita bisa termasuk kedalam orang-orang yang senantiasa didoakan oleh para malaikat. Ayo sedekah sekarang.. saat ini Sahabat Berbagi sudah bisa bersedekah secara online melalui crowdfunding Indonesia Berbagi dengan klik tombol donasi</p>\r\n\r\n<p>Sedekah Subuh Berbagi ini merupakan ajakan kepada Orang Baik untuk dapat memperoleh kebaikan di waktu mustajab sambil memberikan sedikit rezekinya untuk bisa membantu saudara-saudara kita yang memang sedang dalam kesulitan dan layak unutki dibantu</p>\r\n\r\n<p>Penyaluran akan dilaksanakan di daerah Bandung Raya meliputi, Kota Bandung, Kabupaten Bandung, Kabupaten Bandung Barat, Kota Cimahi, Kabupaten Sumedang dan Kabupaten Garut.</p>\r\n\r\n<p>Hasil penghimpunan sedekah akan disalurkan untuk Program-Program seperti, Berbagi Beras, Berbagi Nasi, Berbagi Nutrisi, Berbagi Al-Quran dan Berbagi Iqra sebesar Rp. 100.000.000</p>\r\n\r\n<p>Kami sangat menanti sedekah dari sahabat sekalian agar kita bisa membantu meringankan beban saudara-saudara kita yang saat ini sedang mengalami kesulitan</p>', 'Donasi rutin', 'Sedekah Subuh, Waktu Mustajab Raih Doa Malaikat', 'programs/87iWzMpELvHP47SrFngQMBbNi6GBzSdw6sPRIyDp.jpg', 0, 1, 0, 1, 102000000, NULL, '2022-11-27 14:15:49', '2023-08-08 11:37:32', NULL, 0),
(46, 'Membangun kembali rumah korban bencana', 'membangun-kembali-rumah-korban-bencana', 22, '2023-03-14', NULL, '<p>Pada hari Minggu, 30 Oktober 2022 pukul 00.00 WITA telah terjadi bencana alam gelombang pasang yang menimpa 17 (Tujuh belas) keluarga di wilayah Kelurahan Nangaroro, Kecamatan Nangaroro, Kabupaten Nagekeo, Propinsi Nusa Tenggara Timur. Musibah ini mengakibatkan 1l2 warga kehilangan tempat tinggal karena ditempa arus gelombang yang dasyat. Kelurahan Nangaroro merupakan sebuah wilayah yang sebagian besar penduduknya menempati pesisir sempadan pantai, tempat mereka mencari nafkah sebagai nelayan.</p>\r\n\r\n<p>Mimpi mereka untuk menafkai keluarga saat ini sirna oleh karena ganasnya arus gelombang yang dasyat. Oleh karena itu dengan penuh rasa hormat, kami memohon dukungan donasi agar mereka dapat membangun kembali rumah mereka di tempat yang aman sehingga musibah ini tidak menimpa mereka lagi.</p>\r\n\r\n<p>Target penerima manfaat dari penggalangan dana ini, yaitu masyarakat pesisir di sempadan pantai yang merupakan korban bencana gelombang pasang sebanyak 17 KK yang terdiri dari 112 jiwa.&nbsp;Sebagian besar diantara warga terdampak adalah kelompok rentan, yaitu anak-anak, kaum perempuan, orang tua tunggal dan lansia.</p>\r\n\r\n<p>Setelah&nbsp;donasi ini terkumpul, rencananya rumah bantuan tersebut akan dibangun secara gotong royong pada bulan Januari 2023 di Kelurahan Nangaroro. Donasi anda sangat berarti bagi mereka untuk memberikan dampak dan membebaskan mereka dari ancaman bencana gelombag pasang ke depan.</p>\r\n\r\n<p>Biaya yang dibutuhkan senillai Rp. 510.000.000. (Lima Ratus Sepuluh Juta Rupiah). Rencana kebutuhan dana tersebut akan digunakan untuk pengadaan bahan lokal, non lokal dan perabot rumah tangga yang akan dikerjakan secara gotong royong.</p>', 'Campaign inisiatif', 'Membangun kembali rumah korban bencana', 'programs/kfGDHeFLwoUuObfBpkYSQABhckGe012a4ESx6VmW.jpg', 2, 0, 0, 1, 520200000, NULL, '2022-11-27 14:20:58', '2023-08-14 18:15:21', NULL, 1),
(47, 'Wakaf Sumur Air Bersih untuk 745 Penyintas Banjir', 'wakaf-sumur-air-bersih-untuk-745-penyintas-banjir', 27, '2022-12-12', NULL, '<h1>Bangun Sumur Air Bersih Pertama untuk 745 Penyintas Banjir di Ile Ape, NTT</h1>\r\n\r\n<p>Banjir bandang yang terjadi di Kecamatan Ile Ape, Kabupaten Lembata, Nusa Tenggara Timur pada 4 April 2021 lalu masih berdampak sampai saat ini. Terutama kebutuhan air yang saat ini sangat dirindukan para penyintas yang pasca bencana tinggal di gubuk/hunian sementara yang didirikan di perkebunan.&nbsp;</p>\r\n\r\n<p>Pasalnya wilayah Ile Ape ini merupakan daerah yang gersang dan kering, tidak ada sumber air bersih di sana, bahkan air sumur pun tidak bisa dimanfaatkan dikarenakan sampai kedalaman 200 meter, air tanahnya masih terasa asin dan jarak dari hunian ke sumur ditempuh dengan berjalan kaki sejauh 1-2 kilometer.</p>\r\n\r\n<p>Satu-satunya sumber air dari alam adalah hujan, di musim penghujan warga menampung air hujan dan itulah yang digunakan untuk kebutuhan sehari-hari. Sedangkan di musim kemarau, warga membeli air dari truk tangki yang datang ke wilayah Ile Ape, harganya Rp15.000 untuk satu drum air (200 liter) yang hanya dapat memenuhi kebutuhan 2-3 hari keluarga kecil.&nbsp;</p>\r\n\r\n<p>&quot;Kita sudah kekurangan air bersih selama bulan Juli 2021&nbsp;sampai dengan sekarang. Mandi dan mencuci pakai air sumur yang berjalan dari gubuk sekitar 1-2 kilometer. Air di sumur rasanya payau/asin, sedangkan untuk konsumsi terpaksa beli sendiri yang dijual menggunakan tangki air,&quot; ungkap Ibu Kamsina Kuma.</p>\r\n\r\n<p>Tercatat 5 Perkebunan yang dijadikan hunian sementara untuk para penyintas, sebagai berikut:&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Perkebunan Waisesa Jumlah 40 KK dan 105 Jiwa;</li>\r\n	<li>Perkebunan Buka Tanah Jumlah 60 KK dan 220 Jiwa;&nbsp;</li>\r\n	<li>Perkebunan Duliwoho Jumlah 55 KK dan 150 Jiwa;&nbsp;</li>\r\n	<li>Perkebunan Kalabahi Jumlah 40 KK dan 100 Jiwa dan&nbsp;</li>\r\n	<li>Perkebunan Lagadop Jumlah 60 KK dan 170 Jiwa.</li>\r\n</ul>\r\n\r\n<p>Oleh karena itu,&nbsp;Gerakan Berbagi Air mengajak&nbsp;#orangbaikIndonesia&nbsp;untuk sama-sama kita cukupi kebutuhan air bersih di kecamatan Ile Ape. Dimulai dari Rp 5.000, kamu sudah bantu cukupi 1 liter air bersih.</p>', 'Wakaf', 'Wakaf Sumur Air Bersih untuk 745 Penyintas Banjir', 'programs/jkjucGs24cLmHVqHROwIbLIhNmjTcHXhQ8H8ww1E.jpg', 2, 0, 0, 1, 204000000, NULL, '2022-11-27 14:27:37', '2023-08-14 18:15:03', NULL, 1),
(51, 'Kaki Nara di Amputasi akibat Alami Tumor Ganas, Bantuanmu sangat diharapkan!', 'kaki-nara-di-amputasi-akibat-alami-tumor-ganas-bantuanmu-sangat-diharapkan', 21, '2022-12-28', NULL, '<p><strong>Akibat Tumor Tulang Ganas Dan Penyakit Lupus, Kaki Nara Di Amputasi ! !</strong></p>\r\n\r\n<p>Perkenalan Saya Karlina, dan saya bekerja sebagai cleaning servis. Saya ingin menggalang dana untuk membeli kaki palsu dan kursi roda untuk Nara, anak saya sendiri. Saya tergerak menggalang dana karena saya tidak mampu membeli kaki palsu, kursi roda dan biaya pengobatan buat Nara.</p>\r\n\r\n<p>Sejak suami meninggal karena kanker darah, saya sendirian merawat Nara yang menderita penyakit Tumor tulang dan Lupus. sekarang gak ada.. Nyari uangnya pun sendiri, makanya saya galang dana untuk membelikan kaki palsu dan kursi roda buat Nara karena kakinya di amputasi akibat tumor tulang.</p>\r\n\r\n<p>5 tahun sudah tumor tulang menggerogoti tubuh Nara. Bukannya membaik, tumor malah bertambah ganas, lalu ia juga terkena 5 bakteri dan juga di diagnosa SLE atau yang disebut Lupus. Dulu, saya bisa sedikit tenang karena ada suami, tapi sekarang sendirian karena suami sudah meninggal. Tapi saya tak putus asa, selalu terus ingat pesan suami dulu, Jaga dan rawatlah anak kita satu-satunya.</p>\r\n\r\n<p>Nara berusia 18 tahun, menderita penyakit tumor tulang dan Lupus. Tumor di kaki Nara bertambah ganas dan akhirnya kaki Nara di amputasi. Sekarang tinggal penyembuhan pasca operasi sambil berobat dan kontrol rutin ke RS Hermina Bekasi karena Nara masih menderita penyakit Lupus.</p>', 'Kaki Nara di Amputasi akibat Alami Tumor Ganas, Bantuanmu sangat diharapkan!', 'Kaki Nara di Amputasi akibat Alami Tumor Ganas, Bantuanmu sangat diharapkan!', 'programs/AFAXpq3lv2VNkn4qdFSdbFnGMHA6mkd3JmpBq6V5.jpg', 2, 0, 0, 1, 61200000, 'Bandung', '2022-11-27 15:48:11', '2023-08-14 18:14:32', NULL, 1),
(53, 'URGENT! Bantu Salma Selamat dari Luka Bakar 80%', 'urgent-bantu-salma-selamat-dari-luka-bakar-80', 21, '2023-02-28', NULL, '<p><strong>&ldquo;Mak&hellip; Sakit&hellip; Mak sakit Mak&hellip; Salma takut&hellip;&rdquo;</strong></p>\r\n\r\n<p><strong>Tak pernah berhenti Salma merintih menahan sakit di sekujur tubuhnya. Bocah 5 tahun itu, sedang berjuang hidup melawan sakitnya luka bakar yang melepuhkan sekujur tubuhnya!</strong></p>\r\n\r\n<p><img src=\"https://img.kitabisa.cc/size/1000/885165b1-5ae4-4d13-be5f-d5c68b7de96e.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Tawa riang&nbsp;<strong>Salma Kamaliah (5)</strong>&nbsp;sudah tak terdengar lagi menggema di rumah&nbsp;<strong>Bapak Haryono dan Ibu Yatimah.</strong>&nbsp;Tawa riang itu kini berubah menjadi&nbsp;<strong>jeritan tangis,</strong>&nbsp;menahan sakit dan perih akibat luka bakar yang membuat sekujur tubuh mungilnya melepuh!</p>\r\n\r\n<p>Putri bungsu Pak Haryono dan Bu Yatimah ini baru saja mengalami kejadian yang nyaris merenggut nyawanya. Saat hendak mengambil minum setelah bermain bersama temannya di dapur,&nbsp;<strong>Salma terpeleset ke dalam kompor galian yang sedang digunakan Ibunya untuk memasak air.</strong></p>\r\n\r\n<p><strong>Sontak, api yang membara melahap seluruh tubuh mungil Salma.</strong>&nbsp;Seketika itu pula Salma langsung menjerit dan menangis sejadi-jadinya. Bu Yatimah yang sedang menyapu, kaget dengan jeritan Salma dan langsung bergegas ke dapur.</p>\r\n\r\n<p>Nahas, sesampainya di dapur,&nbsp;<strong>tubuh buah hatinya sudah gosong dilalap api.</strong>&nbsp;Pakaian yang digunakan Salma, terbakar habis dan menempel pada kulit tipisnya, menambah rasa perih di tubuh Salma. Tanpa pikir panjang, Bu Yatimah langsung bergegas membawa Salma ke RS terdekat.</p>\r\n\r\n<p><strong>Rontaan dan jeritan Salma mengiringi setiap langkah perjalanan Bu Yatimah ke RS&hellip;</strong></p>\r\n\r\n<p><img src=\"https://img.kitabisa.cc/size/464/2b7546b1-e768-4f3f-b47c-0fb5668b3892.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Menurut dokter, Salma menderita luka bakar yang sangat serius.&nbsp;<strong>Tubuhnya dari dada hingga kaki hangus hingga melepuh.</strong>&nbsp;Dokter mengatakan bahwa Ibunya datang disaat yang tepat, bila terlambat beberapa menit saja, Salma bisa saja meninggalkan Ayah Ibunya untuk selamanya.</p>\r\n\r\n<p>Selama mendapat perawatan RS, Salma masih sering kali merintih kesakitan.&nbsp;<strong>Rasa sakit dan perih di sekujur tubuhnya masih belum hilang walau sudah diberi salep dan obat berkali-kali.</strong>&nbsp;Bahkan saat tidur, Salma sering tiba-tiba bangun dan langsung berteriak kesakitan.&nbsp;<strong>Operasi yang menjadi satu-satunya jalan selamat Salma juga belum bisa dilakukan karena terkendala biaya.</strong></p>\r\n\r\n<p>Pak Haryono hanya seorang buruh tani dengan penghasilan&nbsp;<strong>paling banyak 65 ribu/hari,</strong>&nbsp;itupun tak setiap hari jasanya digunakan, hanya tergantung panggilan saja. Dengan penghasilan segitu, hanya cukup untuk penuhi kebutuhan sehari-hari.&nbsp;<strong>Bahkan tak jarang Pak Haryono dan Bu Yatimah harus menahan lapar demi ke-3 anaknya bisa makan.</strong></p>\r\n\r\n<p><em>&ldquo;Kalau ada panggilan kerja, saya akan langsung kerjakan, Mas. Ngga peduli mau kerja apapun yang penting halal. Saya cuma ingin Salma selamat dan bisa kembali ke rumah lagi, Mas&hellip;&rdquo;,</em>&nbsp;ucap Pak Haryono.</p>\r\n\r\n<p><img src=\"https://img.kitabisa.cc/size/1000/4c04cf1a-02bc-4d14-a68e-df220e60d36a.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p><strong>Namun kini, mereka dihadapkan dengan ujian besar dari Allah.</strong>&nbsp;Anak bungsunya sedang meregang nyawa seorang diri di RS.&nbsp;<strong>Tanpa operasi,</strong>&nbsp;ruam-ruam di kulitnya akan timbulkan infeksi yang mengancam keselamatannya. Namun, entah sampai kapan tubuh Salma bisa bertahan, sambil menunggu sang Ayah kumpulkan biaya pengobatan.</p>\r\n\r\n<p><strong>#OrangBaik,</strong>&nbsp;Salma baru saja kehilangan masa kecilnya. Ia harus habiskan seluruh masa kecilnya untuk selamat dari luka bakar yang ia derita. Sementara orangtuanya, banting tulang mencari biaya operasi keselamatannya. Mari, kita sama-sama bergandengan tangan, meringankan beban Pak Haryono dan Bu Yatimah menyelamatkan buah hatinya, dengan cara:</p>\r\n\r\n<ol>\r\n	<li><strong>Klik tombol &ldquo;Donasi sekarang!&rdquo;.</strong></li>\r\n	<li><strong>Masukkan Nominal Donasi.</strong></li>\r\n	<li><strong>Pilih metode pembayaran (Dompet Kebaikan/GO-PAY/DANA/ShopeePay/LinkAja/Jenius Pay/BCA/BNI/BNI Syariah/BRI/Mandiri/Mandiri Syariah/Kartu Kredit).</strong></li>\r\n	<li><strong>Teman-teman akan mendapat laporan via email.</strong></li>\r\n</ol>\r\n\r\n<p>Terima kasih,&nbsp;<strong>#OrangBaik!</strong></p>', 'Donasi pasien', 'URGENT! Bantu Salma Selamat dari Luka Bakar 80%', 'programs/9tWstBtHTS3TWVDy5vZ4v2QSVDehIB56a8zucQJZ.jpg', 2, 0, 0, 1, 204000000, NULL, '2022-12-16 04:30:13', '2023-08-14 18:03:22', NULL, 1),
(54, 'Selamatkan 100 Anak Gizi Buruk di Pelosok', 'selamatkan-100-anak-gizi-buruk-di-pelosok', 21, '2023-01-31', NULL, '<p>Dilansir dari&nbsp;<a href=\"https://www.unicef.org/indonesia/id/press-releases/angka-masalah-gizi-pada-anak-di-indonesia-akibat-covid-19-dapat-meningkat-tajam\">UNICEF</a>, lebih dari&nbsp;2 juta&nbsp;anak Indonesia menderita gizi buruk dan dari lebih dari&nbsp;7 juta&nbsp;anak menderita stunting sebelum usia lima tahun,&nbsp;</p>\r\n\r\n<p>dengan&nbsp;12x&nbsp;peningkatan resiko kematian dibanding anak dengan gizi cukup.</p>\r\n\r\n<p>Angka gizi buruk di Indonesia dan juga secara global ini meningkat tajam sebanyak&nbsp;15%&nbsp;pada 2020 akibat hantaman pandemi.&nbsp;</p>\r\n\r\n<p>Yayasan Sahabat Kristiawan Peduli ingin mengajakmu bersama-sama penuhi kebutuhan 100 anak gizi buruk di pelosok. Yuk simak beberapa kisah anak-anak gizi buruk di Indonesia yang sangat membutuhkan bantan kita.</p>\r\n\r\n<p>_____________________________________________</p>\r\n\r\n<p>Tengok kisah Alzim mubarok yang usianya 8 tahun,</p>\r\n\r\n<p><img alt=\"028faac3-7493-4ebc-a7d3-cc0f5e85a6ff.jpg\" src=\"https://img.kitabisa.cc/size/780/028faac3-7493-4ebc-a7d3-cc0f5e85a6ff.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Alzim berdaring tak berdaya sejak usianya 4 bulan karena penyakit Tb Milier yang membuat paru-parunya dipenuhi cairan.</p>\r\n\r\n<p>Ia pun lahir dengan kaki membengkok dan kini mengalami gizi buruk karena kesulitan menyerap nutrisi.</p>\r\n\r\n<p>Ayahnya telah meninggalkan Alzim setelah ayahnya bercerai dengan ibunya. Ibunya pun tak bisa bekerja karena harus menjaga Alzim 24 jam,</p>\r\n\r\n<p><img alt=\"b372cd04-b7c6-41a4-956a-6de7bddf6002.jpg\" src=\"https://img.kitabisa.cc/size/1000/b372cd04-b7c6-41a4-956a-6de7bddf6002.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Untuk kebutuhan sehari-hari Alzim dicukupi oleh kakaknya yang bekerja di minimarket.</p>\r\n\r\n<p>Namun Alzim membutuhkan pemenuhan gizi yang khusus karena penyakitnya dengan harga yang tak murah.</p>\r\n\r\n<p>Penyakitnya pun sudah menahun tak diobati sehingga kondisinya terus memburuk.</p>\r\n\r\n<p><img alt=\"abf916af-b821-4090-8bda-7c1d2e0b0766.jpg\" src=\"https://img.kitabisa.cc/size/1000/abf916af-b821-4090-8bda-7c1d2e0b0766.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>--</p>\r\n\r\n<p>Kisah lainnya datang dari Sukabumi, ia bernama Mutiarani dan sudah 22 tahun terbaring di atas kasur karena gizi buruk dan cerebral palsy.</p>\r\n\r\n<p><img alt=\"3d6be2c6-d2d5-45dd-9f7e-1f1e90d8454d.jpg\" src=\"https://img.kitabisa.cc/size/1000/3d6be2c6-d2d5-45dd-9f7e-1f1e90d8454d.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>Ayahnya banting tulang bekerja sebagai penjahit dan menyambi sebagai pekerja serabutan dan ibunya bekerja di sebuah pabrik sepatu.&nbsp;</p>\r\n\r\n<p>Awalnya mereka masih bisa memenuhi pengobatan Mutia, yaitu fisioterapi dan susu khusus yang harganya sangat mahal.</p>\r\n\r\n<p>Namun, 22 tahun berjuang mempertahankan Mutia untuk terus hidup dengan kejangnya yang tak berkesudahan, kondisi ekonomi mereka terus memburuk.</p>\r\n\r\n<p>Kini Mutia Rani hanya bisa dirawat di rumah, tubuhnya hanya tinggal kulit dan tulang dan setiap kejangnya datang, kedua orang tua hanya bisa mendekapnya sambil melantunkan doa.</p>\r\n\r\n<p><img alt=\"a72dfb26-1a65-42bc-84bd-3f23c5cbd958.jpg\" src=\"https://img.kitabisa.cc/size/1000/a72dfb26-1a65-42bc-84bd-3f23c5cbd958.jpg\" style=\"height:100%; width:480px\" /></p>\r\n\r\n<p>--</p>\r\n\r\n<p>#OrangBaik, yuk bantu penuhi gizi Alzim dan 100&nbsp;gizi buruk Indonesia dengan cara:</p>\r\n\r\n<p>1. Klik tombol&nbsp;&quot;DONASI SEKARANG&quot;</p>\r\n\r\n<p>2. Isi nominal donasi yang ingin diberikan;</p>\r\n\r\n<p>3. Pilih metode pembayaran GO-PAY/Mandiri/BCA/BNI/BNI Syariah/BRI dan kartu kredit;</p>', 'Donasi pasien', 'Selamatkan 100 Anak Gizi Buruk di Pelosok', 'programs/RoQnyPMx7ajJI2Ba0T4qGcj3Kti9uwlA6VPnlBqc.jpg', 2, 0, 0, 1, 1146115350, NULL, '2022-12-16 04:37:34', '2023-08-14 18:02:57', '2023-08-14 18:02:57', 0),
(55, 'Bantu Agung untuk beli Aerok karena dana BLT belum cair', 'bantu-agung-untuk-beli-aerok-karena-dana-blt-belum-cair', 22, '2023-03-02', NULL, '<p>Bantu agung untuk beli aerok.<br />\r\nDikarenakan pencairan dana yang masih belum bisa di proses, seseorang bernama agung kusaeri membutuhkan uluran tangan anda untuk membelikan motor aerok.</p>', 'aerok', 'aerrok', 'programs/HdjOOdZZkoJPBCR8rhpqJ12Qm9jwA7cAg3KvjAcl.jpg', 2, 0, 0, 1, 35700000, 'Bandung', '2023-01-02 10:04:08', '2023-08-14 18:03:00', '2023-08-14 18:03:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_budget`
--

CREATE TABLE `program_budget` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `nominal` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_budget`
--

INSERT INTO `program_budget` (`id`, `name`, `program_id`, `nominal`, `created_at`, `updated_at`) VALUES
(29, 'Biaya Operasi', 18, 180000000, '2022-11-20 07:56:21', '2022-11-20 07:56:21'),
(30, 'Biaya Penujang Pengobatan', 18, 20000000, '2022-11-20 07:56:21', '2022-11-20 07:56:21'),
(31, 'Biaya Admin', 18, 4000000, '2022-11-20 07:56:21', '2022-11-20 07:56:21'),
(32, 'Biaya Rumah Sakit', 17, 121000000, '2022-11-20 07:59:19', '2022-11-20 07:59:19'),
(33, 'Biaya Pengobatan', 17, 1500000, '2022-11-20 07:59:19', '2022-11-20 07:59:19'),
(34, 'Uang Santunan', 17, 1000000, '2022-11-20 07:59:19', '2022-11-20 07:59:19'),
(35, 'Biaya Admin', 17, 2470000, '2022-11-20 07:59:19', '2022-11-20 07:59:19'),
(36, 'Biaya Renovasi Rumahh', 16, 200000000, '2022-11-20 08:04:29', '2022-11-20 08:04:29'),
(37, 'Biaya Tukang', 16, 50000000, '2022-11-20 08:04:29', '2022-11-20 08:04:29'),
(38, 'Biaya Admin', 16, 5000000, '2022-11-20 08:04:29', '2022-11-20 08:04:29'),
(41, 'Biaya Operasi', 14, 200000000, '2022-11-20 08:11:28', '2022-11-20 08:11:28'),
(42, 'Biaya Admin', 14, 4000000, '2022-11-20 08:11:28', '2022-11-20 08:11:28'),
(53, 'Biaya Operasional', 9, 90000000, '2022-11-20 08:20:39', '2022-11-20 08:20:39'),
(54, 'Biaya Admin', 9, 1800000, '2022-11-20 08:20:39', '2022-11-20 08:20:39'),
(62, 'Biaya Operasi', 5, 150000000, '2022-11-20 08:26:32', '2022-11-20 08:26:32'),
(63, 'Biaya Pengobatan', 5, 95000000, '2022-11-20 08:26:32', '2022-11-20 08:26:32'),
(64, 'Biaya Santunan', 5, 25000000, '2022-11-20 08:26:32', '2022-11-20 08:26:32'),
(65, 'Biaya Admin', 5, 5400000, '2022-11-20 08:26:32', '2022-11-20 08:26:32'),
(66, 'Biaya Pengobatan', 4, 70000000, '2022-11-20 08:30:58', '2022-11-20 08:30:58'),
(67, 'Biaya Admin', 4, 1400000, '2022-11-20 08:30:58', '2022-11-20 08:30:58'),
(74, 'Raih Pahala Jariyah, Wakaf Qur\'an Muslim Pelosok', 27, 379742739, '2022-11-27 12:32:41', '2022-11-27 12:32:41'),
(75, 'Biaya Admin', 27, 7594855, '2022-11-27 12:32:41', '2022-11-27 12:32:41'),
(78, 'Cianjur Berduka: 200 Lebih Meninggal DuniaCianjur Berduka: 200 Lebih Meninggal Dunia', 28, 267128500, '2022-11-27 12:50:39', '2022-11-27 12:50:39'),
(79, 'Biaya Admin', 28, 5342570, '2022-11-27 12:50:39', '2022-11-27 12:50:39'),
(80, 'Urgent! Ribuan Warga Terdampak Banjir di Kalteng', 29, 198360000, '2022-11-27 13:04:42', '2022-11-27 13:04:42'),
(81, 'Biaya Admin', 29, 3967200, '2022-11-27 13:04:42', '2022-11-27 13:04:42'),
(82, 'Uang Santunan', 30, 500000000, '2022-11-27 13:07:36', '2022-11-27 13:07:36'),
(83, 'Biaya Admin', 30, 10000000, '2022-11-27 13:07:36', '2022-11-27 13:07:36'),
(84, 'Infaq Yatim: Kebahagiaan untuk 500 anak-anak Yatim', 31, 850000000, '2022-11-27 13:14:54', '2022-11-27 13:14:54'),
(85, 'Biaya Admin', 31, 17000000, '2022-11-27 13:14:54', '2022-11-27 13:14:54'),
(86, 'Biaya Operasional', 32, 50000000, '2022-11-27 13:15:47', '2022-11-27 13:15:47'),
(87, 'Biaya Admin', 32, 1000000, '2022-11-27 13:15:47', '2022-11-27 13:15:47'),
(88, 'Biaya Operasional', 33, 30000000, '2022-11-27 13:23:35', '2022-11-27 13:23:35'),
(89, 'Biaya Admin', 33, 600000, '2022-11-27 13:23:35', '2022-11-27 13:23:35'),
(90, 'Biaya Pembangunan', 34, 200000000, '2022-11-27 13:29:11', '2022-11-27 13:29:11'),
(91, 'Biaya Admin', 34, 4000000, '2022-11-27 13:29:11', '2022-11-27 13:29:11'),
(92, 'Biaya Santunan', 35, 150000000, '2022-11-27 13:37:04', '2022-11-27 13:37:04'),
(93, 'Biaya Admin', 35, 3000000, '2022-11-27 13:37:04', '2022-11-27 13:37:04'),
(94, 'Biaya Bahan Pokok', 36, 970000000, '2022-11-27 13:41:36', '2022-11-27 13:41:36'),
(95, 'Biaya Admin', 36, 19400000, '2022-11-27 13:41:36', '2022-11-27 13:41:36'),
(96, 'Solidaritas Bantu Banjir dan Tanah Longsor Sulawesi', 37, 200000000, '2022-11-27 13:42:55', '2022-11-27 13:42:55'),
(97, 'Biaya Admin', 37, 4000000, '2022-11-27 13:42:55', '2022-11-27 13:42:55'),
(98, 'Biaya Bantuan', 38, 200000000, '2022-11-27 13:48:02', '2022-11-27 13:48:02'),
(99, 'Biaya Admin', 38, 4000000, '2022-11-27 13:48:02', '2022-11-27 13:48:02'),
(100, 'Biaya Santunan', 39, 200000000, '2022-11-27 13:51:20', '2022-11-27 13:51:20'),
(101, 'Biaya Admin', 39, 4000000, '2022-11-27 13:51:20', '2022-11-27 13:51:20'),
(102, 'Memperbaiki Sarana dan Prasarana Masjid Kampung', 40, 250000000, '2022-11-27 13:52:13', '2022-11-27 13:52:13'),
(103, 'Biaya Admin', 40, 5000000, '2022-11-27 13:52:13', '2022-11-27 13:52:13'),
(104, 'Biaya Santunan', 41, 250000000, '2022-11-27 13:55:06', '2022-11-27 13:55:06'),
(105, 'Biaya Admin', 41, 5000000, '2022-11-27 13:55:06', '2022-11-27 13:55:06'),
(106, 'Biaya Operasional', 42, 1223000000, '2022-11-27 14:03:12', '2022-11-27 14:03:12'),
(107, 'Biaya Admin', 42, 24460000, '2022-11-27 14:03:12', '2022-11-27 14:03:12'),
(108, 'Pahala Mengalir Selamanya! Ayo Beramal Jariyah', 43, 554129489, '2022-11-27 14:08:45', '2022-11-27 14:08:45'),
(109, 'Biaya Admin', 43, 11082590, '2022-11-27 14:08:45', '2022-11-27 14:08:45'),
(110, 'Biaya Rumah Sakit', 44, 50000000, '2022-11-27 14:11:57', '2022-11-27 14:11:57'),
(111, 'Biaya Admin', 44, 1000000, '2022-11-27 14:11:57', '2022-11-27 14:11:57'),
(116, 'Sedekah Subuh, Waktu Mustajab Raih Doa Malaikat', 45, 100000000, '2022-11-27 14:22:15', '2022-11-27 14:22:15'),
(117, 'Biaya Admin', 45, 2000000, '2022-11-27 14:22:15', '2022-11-27 14:22:15'),
(120, 'jsjsj', 48, 6498686, '2022-11-27 15:21:44', '2022-11-27 15:21:44'),
(121, 'Biaya Admin', 48, 129974, '2022-11-27 15:21:44', '2022-11-27 15:21:44'),
(122, 'jsjsh', 49, 6464, '2022-11-27 15:33:09', '2022-11-27 15:33:09'),
(123, 'Biaya Admin', 49, 129, '2022-11-27 15:33:09', '2022-11-27 15:33:09'),
(124, 'BAZNAZ Hub', 50, 5678995, '2022-11-27 15:36:18', '2022-11-27 15:36:18'),
(125, 'Biaya Admin', 50, 113580, '2022-11-27 15:36:18', '2022-11-27 15:36:18'),
(130, 'Biaya Operasional', 2, 70000000, '2022-11-29 15:40:35', '2022-11-29 15:40:35'),
(131, 'Biaya Admin', 2, 1400000, '2022-11-29 15:40:35', '2022-11-29 15:40:35'),
(132, 'Biaya Santunan', 3, 50000000, '2022-11-29 15:42:04', '2022-11-29 15:42:04'),
(133, 'Biaya Admin', 3, 1000000, '2022-11-29 15:42:04', '2022-11-29 15:42:04'),
(137, 'Transportasi', 52, 500000, '2022-12-15 15:30:23', '2022-12-15 15:30:23'),
(138, 'Biaya Admin', 52, 10000, '2022-12-15 15:30:23', '2022-12-15 15:30:23'),
(143, 'Biaya Umroh', 15, 100000000, '2022-12-15 15:45:10', '2022-12-15 15:45:10'),
(144, 'Biaya Admin', 15, 2000000, '2022-12-15 15:45:10', '2022-12-15 15:45:10'),
(145, 'Biaya Bangunan', 6, 200000000, '2022-12-16 03:30:25', '2022-12-16 03:30:25'),
(146, 'Biaya Tukang', 6, 30000000, '2022-12-16 03:30:25', '2022-12-16 03:30:25'),
(147, 'Biaya Admin', 6, 4600000, '2022-12-16 03:30:25', '2022-12-16 03:30:25'),
(148, 'Biaya Bahan Bangunan', 12, 200000000, '2022-12-16 03:32:36', '2022-12-16 03:32:36'),
(149, 'Biaya Tukang', 12, 87000000, '2022-12-16 03:32:36', '2022-12-16 03:32:36'),
(150, 'Biaya Admin', 12, 5740000, '2022-12-16 03:32:36', '2022-12-16 03:32:36'),
(151, 'Biaya Operasional', 7, 100000000, '2022-12-16 03:35:32', '2022-12-16 03:35:32'),
(152, 'Biaya Admin', 7, 2000000, '2022-12-16 03:35:32', '2022-12-16 03:35:32'),
(153, 'Biaya Kesehatan', 8, 5000000, '2022-12-16 03:37:37', '2022-12-16 03:37:37'),
(154, 'Biaya Admin', 8, 100000, '2022-12-16 03:37:37', '2022-12-16 03:37:37'),
(155, 'Biaya Pengacara', 22, 1000000, '2022-12-16 03:39:26', '2022-12-16 03:39:26'),
(156, 'Biaya Operasional', 22, 2000000, '2022-12-16 03:39:26', '2022-12-16 03:39:26'),
(157, 'Biaya Tebusan', 22, 50000000, '2022-12-16 03:39:26', '2022-12-16 03:39:26'),
(158, 'Biaya Admin', 22, 1060000, '2022-12-16 03:39:26', '2022-12-16 03:39:26'),
(159, 'Biaya Rumah Sakit', 13, 200000000, '2022-12-16 03:49:40', '2022-12-16 03:49:40'),
(160, 'Biaya Pengobatan', 13, 100000000, '2022-12-16 03:49:40', '2022-12-16 03:49:40'),
(161, 'Biaya Admin', 13, 6000000, '2022-12-16 03:49:40', '2022-12-16 03:49:40'),
(162, 'Uang Santunan', 25, 300000, '2022-12-16 03:52:14', '2022-12-16 03:52:14'),
(163, 'Sembako', 25, 1000000, '2022-12-16 03:52:14', '2022-12-16 03:52:14'),
(164, 'Biaya Admin', 25, 26000, '2022-12-16 03:52:14', '2022-12-16 03:52:14'),
(165, 'Uang Santunan', 24, 1000000, '2022-12-16 03:54:05', '2022-12-16 03:54:05'),
(166, 'Biaya Admin', 24, 20000, '2022-12-16 03:54:05', '2022-12-16 03:54:05'),
(167, 'Bahan Bangunan', 23, 500000000, '2022-12-16 03:56:09', '2022-12-16 03:56:09'),
(168, 'Biaya Tukang', 23, 8000000, '2022-12-16 03:56:09', '2022-12-16 03:56:09'),
(169, 'Biaya Admin', 23, 10160000, '2022-12-16 03:56:09', '2022-12-16 03:56:09'),
(170, 'Biaya Operasional', 21, 75000000, '2022-12-16 03:58:18', '2022-12-16 03:58:18'),
(171, 'Biaya Admin', 21, 1500000, '2022-12-16 03:58:18', '2022-12-16 03:58:18'),
(172, 'Biaya Obat', 20, 2000000, '2022-12-16 04:00:23', '2022-12-16 04:00:23'),
(173, 'Biaya Makanan', 20, 5000000, '2022-12-16 04:00:23', '2022-12-16 04:00:23'),
(174, 'Biaya Admin', 20, 140000, '2022-12-16 04:00:23', '2022-12-16 04:00:23'),
(175, 'Uang Santunan', 10, 100000000, '2022-12-16 04:07:29', '2022-12-16 04:07:29'),
(176, 'Biaya Admin', 10, 2000000, '2022-12-16 04:07:29', '2022-12-16 04:07:29'),
(177, 'Uang Santunan', 11, 100000000, '2022-12-16 04:09:58', '2022-12-16 04:09:58'),
(178, 'Biaya Admin', 11, 2000000, '2022-12-16 04:09:58', '2022-12-16 04:09:58'),
(179, 'Uang Santunan', 19, 5000000, '2022-12-16 04:18:02', '2022-12-16 04:18:02'),
(180, 'Biaya Admin', 19, 100000, '2022-12-16 04:18:02', '2022-12-16 04:18:02'),
(191, 'Motor aerok', 55, 35000000, '2023-08-14 17:43:07', '2023-08-14 17:43:07'),
(192, 'Biaya Admin', 55, 700000, '2023-08-14 17:43:07', '2023-08-14 17:43:07'),
(193, 'Selamatkan 100 Anak Gizi Buruk di Pelosok', 54, 1123642500, '2023-08-14 17:50:21', '2023-08-14 17:50:21'),
(194, 'Biaya Admin', 54, 22472850, '2023-08-14 17:50:21', '2023-08-14 17:50:21'),
(195, 'URGENT! Bantu Salma Selamat dari Luka Bakar 80%', 53, 200000000, '2023-08-14 18:03:08', '2023-08-14 18:03:08'),
(196, 'Biaya Admin', 53, 4000000, '2023-08-14 18:03:08', '2023-08-14 18:03:08'),
(197, 'Biaya Operasional', 51, 60000000, '2023-08-14 18:03:46', '2023-08-14 18:03:46'),
(198, 'Biaya Admin', 51, 1200000, '2023-08-14 18:03:46', '2023-08-14 18:03:46'),
(199, 'Wakaf Sumur Air Bersih untuk 745 Penyintas Banjir', 47, 200000000, '2023-08-14 18:14:40', '2023-08-14 18:14:40'),
(200, 'Biaya Admin', 47, 4000000, '2023-08-14 18:14:40', '2023-08-14 18:14:40'),
(201, 'Membangun kembali rumah korban bencana', 46, 510000000, '2023-08-14 18:15:10', '2023-08-14 18:15:10'),
(202, 'Biaya Admin', 46, 10200000, '2023-08-14 18:15:10', '2023-08-14 18:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `program_categories`
--

CREATE TABLE `program_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_categories`
--

INSERT INTO `program_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(21, 'Donasi pasien', 'donasi-pasien', '2022-11-12 21:22:53', '2022-11-12 21:22:53'),
(22, 'Campaign inisiatif', 'campaign-inisiatif', '2022-11-12 21:23:00', '2022-11-12 21:23:00'),
(23, 'Donasi Universal', 'donasi-universal', '2022-11-12 21:23:08', '2022-11-12 21:23:08'),
(24, 'Zakat', 'zakat', '2022-11-12 21:23:18', '2022-11-12 21:23:18'),
(25, 'Donasi rutin', 'donasi-rutin', '2022-11-12 21:23:27', '2022-11-12 21:23:27'),
(26, 'Infaq', 'infaq', '2022-11-12 21:23:34', '2022-11-12 21:23:34'),
(27, 'Wakaf', 'wakaf', '2022-11-27 12:13:08', '2022-11-27 12:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `program_galleries`
--

CREATE TABLE `program_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-11-07 06:57:59', '2022-11-07 06:57:59'),
(2, 'Admin', 'web', '2022-11-07 06:57:59', '2022-11-07 06:57:59'),
(5, 'Donatur', 'web', '2022-11-29 14:48:13', '2022-11-29 14:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(22, 2),
(24, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_fee` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `email`, `address`, `phone`, `favicon`, `image`, `meta_keyword`, `meta_description`, `description`, `author`, `admin_fee`, `created_at`, `updated_at`) VALUES
(1, 'Hayu Donasi', 'hayudonasi@gmail.com', 'Purwakarta, Jawa Barat Indonesia', '6281919956872', NULL, 'settings/MfuETV4g9STm7q0Dg94zsN6Old9qba6Yl0uuG7As.png', 'Hayu Donasi', 'Hayu Donasi adalah situs web informasi donasi yang anda bisa dapatkan', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsa, voluptatem! Molestias adipisci cum, excepturi officia quidem similique id impedit culpa animi debitis? Magnam aliquam a facere repellendus nisi corrupti amet tempora molestiae dolorum odit nam, nobis voluptatem impedit consequuntur dolorem dolore. Quis impedit eligendi quas quod vel consequuntur placeat doloremque rem itaque necessitatibus modi, suscipit iusto id quos velit autem nam, blanditiis quo quia quae error totam voluptatibus! Quibusdam rerum sunt pariatur maxime exercitationem! Reiciendis repellat, rem quidem at tenetur harum atque quaerat sequi ratione neque nulla iste ipsa modi libero accusantium? Sed cumque error tenetur officiis magni quis suscipit.', 'Kelompok 1', 2, '2022-11-07 06:58:00', '2023-08-15 06:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `image`, `program_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Bantu Warga Dari Banjir Bandang', 'Bantu Warga Dari Banjir Bandang', 'sliders/SAiC8D6npTYpIalzMyLeEmaQocjO7tjWDmlhm58V.jpg', 38, 1, '2022-11-30 04:59:01', '2022-11-30 04:59:01'),
(2, 'Gempa Cianjur', '<p>Gempa Cianjur</p>', 'sliders/of3Wfz7RnJLsSY2FssZJ65m8NQFwbCnY0PzWDGkL.jpg', 28, 1, '2022-11-30 05:01:29', '2023-08-14 16:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `socmeds`
--

CREATE TABLE `socmeds` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socmeds`
--

INSERT INTO `socmeds` (`id`, `icon`, `name`, `link`, `created_at`, `updated_at`) VALUES
(1, 'socmed/3KtYn6XQaDfyb5nkSh101Ab54y1GXjtevgnNrAbc.svg', 'Facebook', 'https://facebook.com', '2022-11-07 06:58:00', '2022-12-16 10:01:49'),
(2, 'socmed/p33mWOTlkK0DZ1wICBs3XxP7Tbh3lqaCRWHp4Kp4.svg', 'Twitter', 'https://twitter.com', '2022-11-07 06:58:00', '2022-12-16 10:01:56'),
(3, 'socmed/mUhTosWMUalsd0qrsziJgAtv6FLp9JsOgHo8Z7Zh.svg', 'Instagram', 'https://instagram.com', '2022-11-07 06:58:00', '2022-12-16 10:02:03');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `code` bigint NOT NULL,
  `type` enum('manual','otomatis') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `program_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` bigint NOT NULL,
  `u_code` int NOT NULL DEFAULT '0',
  `payment_id` int DEFAULT NULL,
  `evidence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonim` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code`, `type`, `program_id`, `name`, `email`, `acceptance`, `nominal`, `u_code`, `payment_id`, `evidence`, `is_verified`, `phone_number`, `is_anonim`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20221210001, 'manual', 27, 'Erika Oktaviani', 'erika.okt20@gmail.com', 'semangat', 25981, 981, 16, NULL, 0, '0895412881430', 0, 14, '2022-12-09 21:54:52', '2022-12-09 21:54:52', NULL),
(2, 20221210002, 'manual', 35, 'Erika Oktaviani', 'kkartinah31@gmail.com', 'semangat', 50907, 907, 15, NULL, 0, '0895412881430', 1, 14, '2022-12-09 21:59:47', '2022-12-09 21:59:47', NULL),
(3, 20221210003, 'manual', 2, 'Erika Oktaviani', 'erika.okt20@gmail.com', 'semangat', 5402, 402, 16, NULL, 0, '0895412881430', 1, 14, '2022-12-09 22:01:15', '2022-12-09 22:01:15', NULL),
(4, 20221210004, 'manual', 3, 'Erika Oktaviani', 'erika.okt20@gmail.com', 'semangat', 35351, 351, 12, NULL, 0, '0895412881430', 1, 14, '2022-12-09 22:02:19', '2022-12-09 22:02:19', NULL),
(5, 20221210005, 'manual', 47, 'erika', 'kkartinah31@gmail.com', 'semangat', 664, 663, 11, NULL, 0, '0895412881430', 1, NULL, '2022-12-09 22:03:30', '2022-12-09 22:03:30', NULL),
(6, 20221210006, 'manual', 41, 'erika', 'kkartinah31@gmail.com', 'semangat', 384, 184, 13, NULL, 0, '0895412881430', 1, NULL, '2022-12-09 22:04:33', '2022-12-09 22:04:33', NULL),
(7, 20221210007, 'manual', 2, 'agung', NULL, 'Cepet sembuh', 50156, 156, 10, NULL, 0, '081919956872', 1, NULL, '2022-12-09 23:28:08', '2022-12-09 23:28:08', NULL),
(8, 20221210008, 'manual', 51, 'ujang', NULL, 'Semangat', 200494, 494, 16, NULL, 0, '08191927337', 1, NULL, '2022-12-09 23:29:20', '2022-12-09 23:29:20', NULL),
(9, 20221210009, 'manual', 3, 'Manda Agustriya', 'agustriyamanda@gmail.com', 'Semangat', 200252, 252, 12, NULL, 0, '+62 895-0911-0578', 1, 15, '2022-12-10 06:10:17', '2022-12-10 06:10:17', NULL),
(13, 20221210013, 'manual', 29, 'Manda Agustriya', 'agustriyamanda@gmail.com', 'semangat..', 50193, 193, 12, NULL, 0, '+62 895-0911-0578', 1, 15, '2022-12-10 09:02:17', '2022-12-10 09:02:17', NULL),
(14, 20221210014, 'manual', 43, 'Manda Agustriya', 'agustriyamanda@gmail.com', 'semoga bermanfaat', 100300, 300, 12, NULL, 0, '+62 895-0911-0578', 1, 15, '2022-12-10 09:03:40', '2022-12-10 09:03:40', NULL),
(15, 20221210015, 'manual', 31, 'Manda Agustriya', 'agustriyamanda@gmail.com', 'Semangat adek..', 200711, 711, 12, NULL, 0, '+62 895-0911-0578', 1, 15, '2022-12-10 09:04:23', '2022-12-10 09:04:23', NULL),
(16, 20221210016, 'manual', 33, 'Manda Agustriya', 'agustriyamanda@gmail.com', 'Semoga bermanfaat', 100487, 487, 12, NULL, 0, '+62 895-0911-0578', 1, 15, '2022-12-10 09:08:48', '2022-12-10 09:08:48', NULL),
(17, 20221210017, 'manual', 3, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', 'Tetap Semangat!!!', 15898, 898, 12, NULL, 0, '082198403940', 1, 16, '2022-12-10 12:22:41', '2022-12-10 12:22:41', NULL),
(18, 20221210018, 'manual', 27, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', NULL, 25754, 754, 15, NULL, 0, '082198403940', 1, 16, '2022-12-10 12:23:37', '2022-12-10 12:23:37', NULL),
(19, 20221210019, 'manual', 2, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', NULL, 5270, 270, 13, NULL, 0, '082198403940', 1, 16, '2022-12-10 12:25:28', '2022-12-10 12:25:28', NULL),
(20, 20221210020, 'manual', 2, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', NULL, 5844, 844, 16, NULL, 0, '082198403940', 1, 16, '2022-12-10 12:26:08', '2022-12-10 12:26:08', NULL),
(21, 20221210021, 'manual', 46, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', NULL, 5589, 589, 13, NULL, 0, '082198403940', 1, 16, '2022-12-10 12:27:05', '2022-12-10 12:27:05', NULL),
(22, 20221210022, 'manual', 46, 'uhuy', 'uhuy@gmail.com', 'semangat', 5211, 211, 12, NULL, 0, '08966864675', 1, NULL, '2022-12-10 14:00:46', '2022-12-10 14:00:46', NULL),
(23, 20221210023, 'manual', 46, 'uhuy', 'uhuy@gmail.com', 'sertbsthrs', 5913, 913, 11, NULL, 0, '08966864675', 1, NULL, '2022-12-10 14:02:04', '2022-12-10 14:02:04', NULL),
(24, 20221210024, 'manual', 46, 'uhuy', 'uhuy@gmail.com', 'go', 280717949, 677, 13, NULL, 0, '08966864675', 1, NULL, '2022-12-10 14:04:11', '2022-12-10 14:04:11', NULL),
(25, 20221210025, 'manual', 2, 'uhuy', 'uhuy@gmail.com', NULL, 5388, 388, 11, NULL, 0, '08966864675', 1, NULL, '2022-12-10 14:43:59', '2022-12-10 14:43:59', NULL),
(26, 20221211001, 'manual', 47, 'salsabilla', 'salsa2@gmail.com', 'semoga bermanfaat', 175268, 268, 12, NULL, 0, '085380296526', 1, 7, '2022-12-10 18:26:18', '2022-12-10 18:26:18', NULL),
(27, 20221211002, 'manual', 44, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga lekas sembuh', 290351, 351, 15, NULL, 0, '085380296526', 1, 17, '2022-12-10 18:34:33', '2022-12-10 18:34:33', NULL),
(28, 20221211003, 'manual', 41, 'salsabilla', 'dwioktalia86@gmail.com', NULL, 50195, 195, 12, NULL, 0, '085380296526', 1, 17, '2022-12-10 18:37:34', '2022-12-10 18:37:34', NULL),
(29, 20221211004, 'manual', 27, 'salsabilla', 'dwioktalia86@gmail.com', NULL, 25335, 335, 14, NULL, 1, '085380296526', 1, 17, '2022-12-10 18:38:30', '2022-12-11 18:18:26', NULL),
(30, 20221211005, 'manual', 35, 'salsabilla', 'dwioktalia86@gmail.com', NULL, 5436, 436, 16, NULL, 1, '085380296526', 0, 17, '2022-12-10 18:39:23', '2022-12-11 18:18:20', NULL),
(31, 20221211006, 'manual', 2, 'Agung UF', NULL, 'semangat', 100830, 830, 12, NULL, 1, '081919956872', 1, NULL, '2022-12-11 01:38:24', '2022-12-11 01:39:02', NULL),
(32, 20221211007, 'manual', 2, 'asfasdfasd', NULL, 'sdafsadf', 100470, 470, 13, NULL, 1, '0895412881430', 1, NULL, '2022-12-11 14:20:46', '2022-12-11 18:18:15', NULL),
(33, 20221212001, 'manual', 2, 'uhuy', 'uhuy@gmail.com', 'fvarwrvrfv', 15804, 804, 12, NULL, 0, '08966864675', 1, NULL, '2022-12-12 03:45:32', '2022-12-12 03:45:32', NULL),
(34, 20221212002, 'otomatis', 2, 'asdfasd', NULL, 'asdfasdf', 50311, 311, NULL, NULL, 0, '12312321', 0, NULL, '2022-12-12 04:20:17', '2022-12-12 04:20:17', NULL),
(35, 20221212003, 'otomatis', 3, 'asasdfads', NULL, 'asadasdasd', 200670, 670, NULL, NULL, 0, '08192312431', 0, NULL, '2022-12-12 04:22:28', '2022-12-12 04:22:28', NULL),
(36, 20221212004, 'otomatis', 51, 'User', 'user@gmail.com', NULL, 100976, 976, NULL, NULL, 0, '08192312431', 0, 4, '2022-12-12 04:33:24', '2022-12-12 04:33:24', NULL),
(37, 20221212005, 'otomatis', 2, 'Agung UF', NULL, 'asdcasdcasd', 50512, 512, NULL, NULL, 0, '0895412881430', 1, NULL, '2022-12-12 04:38:00', '2022-12-12 04:38:00', NULL),
(38, 20221212006, 'otomatis', 3, 'asdadasd', NULL, 'sadada', 100686, 686, NULL, NULL, 0, '23232', 0, NULL, '2022-12-12 04:39:23', '2022-12-12 04:39:23', NULL),
(39, 20221212007, 'otomatis', 3, 'dasdcasdcasd', NULL, 'asdcasdcas', 200983, 983, NULL, NULL, 0, '12312321', 1, NULL, '2022-12-12 04:40:52', '2022-12-12 04:40:52', NULL),
(40, 20221212008, 'otomatis', 3, 'asdcasdc', 'aascdas@sdasd', 'casdcasd', 200454, 454, NULL, NULL, 0, '08192312431', 0, NULL, '2022-12-12 04:41:36', '2022-12-12 04:41:36', NULL),
(41, 20221212009, 'manual', 2, 'asdfasdfasd', NULL, 'asdfasdfasd', 200755, 755, NULL, NULL, 0, '081919956872', 0, NULL, '2022-12-12 04:43:55', '2022-12-12 04:43:55', NULL),
(42, 20221212010, 'otomatis', 2, 'qwqweqw', NULL, 'sadasdas', 100378, 378, NULL, NULL, 0, '081919956872', 0, NULL, '2022-12-12 04:45:46', '2022-12-12 04:45:46', NULL),
(43, 20221212011, 'otomatis', 2, 'qwqweqw', NULL, 'sadasdasasdasdasd', 100827, 827, NULL, NULL, 0, '081919956872', 0, NULL, '2022-12-12 04:46:24', '2022-12-12 04:46:24', NULL),
(44, 20221212012, 'otomatis', 2, 'asdfa', NULL, 'sdcasdcasd', 200621, 621, NULL, NULL, 0, '98112312321', 0, NULL, '2022-12-12 04:47:10', '2022-12-12 04:47:10', NULL),
(45, 20221212013, 'otomatis', 2, 'Super Admin', 'superadmin@gmail.com', 'asdfadasd', 100146, 146, NULL, NULL, 0, '121213', 0, 1, '2022-12-12 04:55:33', '2022-12-12 04:55:33', NULL),
(46, 20221212014, 'otomatis', 3, 'Super Admin', 'superadmin@gmail.com', 'sadfasdfasdfasdfasd', 100270, 270, NULL, NULL, 0, '121212', 1, 1, '2022-12-12 04:57:30', '2022-12-12 04:57:30', NULL),
(47, 20221212015, 'otomatis', 3, 'asdfasdfasdfasd', NULL, 'asdfasdfasd', 50536, 536, NULL, NULL, 0, '12312312', 0, NULL, '2022-12-12 04:57:58', '2022-12-12 04:57:58', NULL),
(48, 20221212016, 'otomatis', 2, 'asdfasdfasdfas', NULL, 'asdfasdfasd', 100305, 305, NULL, NULL, 0, '123323423', 0, NULL, '2022-12-12 10:18:09', '2022-12-12 10:18:09', NULL),
(49, 20221212017, 'otomatis', 2, 'User', 'user@gmail.com', 'sadfasdfsad', 100102, 102, NULL, NULL, 0, '12312312312', 0, 4, '2022-12-12 10:18:40', '2022-12-12 10:18:40', NULL),
(50, 20221212018, 'otomatis', 2, 'User', 'user@gmail.com', 'asdfsadfasd', 100269, 269, NULL, NULL, 0, '1231312', 0, 4, '2022-12-12 10:19:45', '2022-12-12 10:19:45', NULL),
(51, 20221212019, 'otomatis', 2, 'User', 'user@gmail.com', 'sadcasdcasd', 100543, 543, NULL, NULL, 1, '08192312431', 0, 4, '2022-12-12 12:08:48', '2022-12-12 12:09:06', NULL),
(52, 20221212020, 'otomatis', 2, 'Hshshs', NULL, 'Hshs', 200966, 966, NULL, NULL, 0, '0855447543664', 1, NULL, '2022-12-12 12:11:14', '2022-12-12 12:11:14', NULL),
(53, 20221212021, 'manual', 46, 'Agung UF', NULL, 'semangat', 100145, 145, 12, NULL, 1, '081919956872', 0, NULL, '2022-12-12 14:30:25', '2022-12-12 14:35:09', NULL),
(54, 20221212022, 'otomatis', 51, 'Agung Agung', NULL, 'semangat', 50897, 897, NULL, NULL, 1, '081919956872', 0, NULL, '2022-12-12 14:31:25', '2022-12-12 14:34:35', NULL),
(55, 20221212023, 'manual', 2, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', 'Tetap Semangat!!!', 50957, 957, 12, NULL, 0, '082198403940', 0, 16, '2022-12-12 14:36:58', '2022-12-12 14:36:58', NULL),
(56, 20221212024, 'otomatis', 3, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 200889, 889, NULL, NULL, 0, '085380296526', 1, NULL, '2022-12-12 14:37:08', '2022-12-12 14:37:08', NULL),
(57, 20221212025, 'manual', 2, 'erikao', 'erika@gmail.com', 'semangat', 200963, 963, 16, NULL, 0, '0895412881430', 1, 14, '2022-12-12 14:37:18', '2022-12-12 14:37:18', NULL),
(58, 20221212026, 'manual', 35, 'Manda', NULL, 'semangat', 100780, 780, 15, NULL, 0, '6281264629029', 1, 15, '2022-12-12 14:37:45', '2022-12-12 14:37:45', NULL),
(59, 20221212027, 'otomatis', 3, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 200558, 558, NULL, NULL, 0, '6285380296526', 1, NULL, '2022-12-12 14:38:06', '2022-12-12 14:38:06', NULL),
(60, 20221212028, 'otomatis', 27, 'erikao', 'erika@gmail.com', 'shgyad', 50940, 940, NULL, NULL, 1, '0895412881430', 1, 14, '2022-12-12 14:38:32', '2022-12-12 14:39:00', NULL),
(61, 20221212029, 'otomatis', 30, 'Manda', NULL, 'semangat', 35441, 441, NULL, NULL, 1, '6281264629029', 1, 15, '2022-12-12 14:39:19', '2022-12-12 14:40:17', NULL),
(62, 20221212030, 'manual', 44, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', 'Tetap Semangat!!!', 50827, 827, 10, NULL, 0, '082198403940', 0, 16, '2022-12-12 14:40:04', '2022-12-12 14:40:04', NULL),
(63, 20221212031, 'manual', 3, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 200345, 345, 15, NULL, 0, '6285380296526', 1, NULL, '2022-12-12 14:40:47', '2022-12-12 14:40:47', NULL),
(64, 20221212032, 'otomatis', 3, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', 'Tetap Semangat!!!', 25617, 617, NULL, NULL, 1, '082198403940', 0, 16, '2022-12-12 14:40:58', '2022-12-12 14:42:06', NULL),
(65, 20221212033, 'manual', 3, 'erikao', 'erika@gmail.com', 'osdo', 15874, 874, 15, NULL, 0, '0895412881430', 0, 14, '2022-12-12 14:41:31', '2022-12-12 14:41:31', NULL),
(66, 20221212034, 'otomatis', 47, 'erikao', 'erika@gmail.com', 'ifjciefj', 25468, 468, NULL, NULL, 1, '0895412881430', 0, 14, '2022-12-12 14:42:39', '2022-12-12 14:43:07', NULL),
(67, 20221212035, 'otomatis', 3, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 200144, 144, 15, NULL, 0, '6285380296526', 1, NULL, '2022-12-12 14:43:13', '2022-12-12 14:43:13', NULL),
(68, 20221212036, 'manual', 40, 'Manda', NULL, 'semangatt', 50180, 180, 12, NULL, 0, '6281264629029', 1, 15, '2022-12-12 14:43:30', '2022-12-12 14:48:10', NULL),
(69, 20221212037, 'otomatis', 2, 'Muhammad Andhika Bayu Prasetya', 'andix2573@gmail.com', 'Tetap Semangat!!!', 100907, 907, NULL, NULL, 1, '082198403940', 0, 16, '2022-12-12 14:43:52', '2022-12-12 14:48:37', NULL),
(70, 20221212038, 'manual', 2, 'Super Admin', 'superadmin@gmail.com', 'sdfsdf', 100634, 634, 12, NULL, 0, '23423', 0, 1, '2022-12-12 14:56:20', '2022-12-18 16:06:49', NULL),
(71, 20221212039, 'otomatis', 2, 'Super Admin', 'superadmin@gmail.com', 'vdfvfdsvfd', 100659, 659, NULL, NULL, 1, '23423', 0, 1, '2022-12-12 14:56:33', '2022-12-12 14:57:05', NULL),
(72, 20221212040, 'otomatis', 51, 'Super Admin', 'superadmin@gmail.com', 'asdfasdfasd', 50674, 674, NULL, NULL, 1, '1231231', 0, 1, '2022-12-12 15:01:13', '2022-12-12 15:02:11', NULL),
(73, 20221213001, 'otomatis', 32, 'Agung UF', NULL, 'Ayo', 200603, 603, NULL, NULL, 1, '081919956872', 1, NULL, '2022-12-12 21:25:43', '2022-12-12 21:26:18', NULL),
(74, 20221213002, 'manual', 2, 'Agung Kusaeri', 'agungproject62@gmail.com', 'semangat', 100269, 269, 12, NULL, 0, '081919956872', 0, 20, '2022-12-13 06:47:37', '2022-12-13 06:50:42', NULL),
(75, 20221213003, 'otomatis', 46, 'Agung Kusaeri', 'agungproject62@gmail.com', 'semangat', 200116, 116, NULL, NULL, 1, '081919956872', 0, 20, '2022-12-13 06:48:48', '2022-12-13 06:50:07', NULL),
(76, 20221213004, 'otomatis', 31, 'john', 'john@gmail.com', NULL, 5143, 143, NULL, NULL, 0, '08118505071', 1, NULL, '2022-12-13 09:42:27', '2022-12-13 09:42:27', NULL),
(77, 20221213005, 'otomatis', 51, 'R DIAN ISKANDAR', 'admin@gmail.com', NULL, 5379, 379, NULL, NULL, 0, '08118505071', 1, NULL, '2022-12-13 16:19:14', '2022-12-13 16:19:14', NULL),
(78, 20221215001, 'otomatis', 47, 'sdfasdf', NULL, 'fasdfasd', 100387, 387, NULL, NULL, 1, '089124124521', 0, NULL, '2022-12-15 02:20:07', '2022-12-15 02:22:17', NULL),
(79, 20221215002, 'otomatis', 51, 'raihan', 'raihan@gmail.com', 'Semoga cepat sembuh', 3768, 768, NULL, NULL, 1, '+6281289121212', 1, NULL, '2022-12-15 02:20:33', '2022-12-15 02:21:16', NULL),
(80, 20221215003, 'otomatis', 27, 'Andika Kusaeri', 'kusaeri@gmail.com', 'i love kusanagi', 500495, 495, NULL, NULL, 0, '463636346346346', 0, 21, '2022-12-15 02:23:30', '2022-12-15 02:23:30', NULL),
(81, 20221215004, 'otomatis', 46, 'adfasdf', 'asdfsad@asdgasd', 'safd', 200185, 185, NULL, NULL, 0, '12312', 0, NULL, '2022-12-15 02:26:10', '2022-12-15 02:26:10', NULL),
(82, 20221215005, 'otomatis', 46, 'adsfasdf', NULL, 'asdfasd', 35356, 356, NULL, NULL, 0, '1231231231', 0, NULL, '2022-12-15 02:26:52', '2022-12-15 02:26:52', NULL),
(83, 20221215006, 'otomatis', 51, 'asdfasdfasd', NULL, 'asdfasdf', 100455, 455, NULL, NULL, 0, '12312312', 0, NULL, '2022-12-15 02:27:43', '2022-12-15 02:27:43', NULL),
(84, 20221215007, 'otomatis', 3, 's', 's', 's', 5548, 548, NULL, NULL, 0, 's', 1, NULL, '2022-12-15 03:48:23', '2022-12-15 03:48:23', NULL),
(85, 20221215008, 'manual', 33, 'Super Admin', 'superadmin@gmail.com', 'semangat', 50659, 659, 11, NULL, 0, '6281264629029', 1, 1, '2022-12-15 15:24:45', '2022-12-15 15:24:45', NULL),
(86, 20221215009, 'manual', 33, 'Super Admin', 'superadmin@gmail.com', 'semangat', 50408, 408, 11, NULL, 1, '6281264629029', 1, 1, '2022-12-15 15:24:47', '2022-12-15 15:34:11', NULL),
(87, 20221215010, 'manual', 2, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 100762, 762, 15, NULL, 0, '6285380296526', 1, 17, '2022-12-15 15:25:48', '2022-12-15 15:25:48', NULL),
(88, 20221215011, 'manual', 2, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 100405, 405, 15, NULL, 0, '6285380296526', 1, 17, '2022-12-15 15:25:51', '2022-12-15 15:25:51', NULL),
(89, 20221215012, 'otomatis', 40, 'Super Admin', 'superadmin@gmail.com', 'semangat', 100371, 371, NULL, NULL, 0, '6281264629029', 1, 1, '2022-12-15 15:27:50', '2022-12-15 15:27:50', NULL),
(90, 20221215013, 'manual', 44, 'Super Admin', 'superadmin@gmail.com', '..', 100231, 231, 13, NULL, 1, '6281264629029', 1, 1, '2022-12-15 15:31:45', '2022-12-15 15:32:35', NULL),
(91, 20221215014, 'otomatis', 27, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 200252, 252, NULL, NULL, 0, '6285380296526', 1, 17, '2022-12-15 15:33:20', '2022-12-15 15:34:26', NULL),
(92, 20221215015, 'otomatis', 40, 'salsabilla', 'dwioktalia86@gmail.com', 'semoga bermanfaat', 250163, 163, NULL, NULL, 0, '6285380296526', 1, 17, '2022-12-15 15:36:27', '2022-12-15 15:36:27', NULL),
(93, 20221215016, 'otomatis', 2, 'Super Admin', 'superadmin@gmail.com', 'asfasdfasd', 100670, 670, NULL, NULL, 1, '23423423', 1, 1, '2022-12-15 15:38:12', '2022-12-15 15:39:17', NULL),
(94, 20221215017, 'otomatis', 3, 'raihan', 'raihan@gmail.com', 'semangat yaa', 25900, 900, NULL, NULL, 1, '+6281289121212', 0, NULL, '2022-12-15 15:54:01', '2022-12-15 15:54:25', NULL),
(95, 20221215018, 'otomatis', 31, 'chumovie', 'chumovieee@gmail.com', 'semangat dek', 25833, 833, NULL, NULL, 0, '+6281289121212', 1, 23, '2022-12-15 15:59:20', '2022-12-15 15:59:20', NULL),
(96, 20221216001, 'otomatis', 54, 'tes', 'admin@gmail.com', NULL, 5897, 897, NULL, NULL, 0, '33', 1, NULL, '2022-12-16 07:08:04', '2022-12-16 07:08:04', NULL),
(97, 20221216002, 'otomatis', 54, 'Super Admin', 'superadmin@gmail.com', 'asdfasdfasdf', 50350, 350, NULL, NULL, 1, '123123123', 0, 1, '2022-12-16 11:21:06', '2022-12-16 11:21:30', NULL),
(98, 20221216003, 'otomatis', 53, 'Super Admin', 'superadmin@gmail.com', 'asdfasdfasdf', 200419, 419, NULL, NULL, 1, '12312312', 0, 1, '2022-12-16 11:21:54', '2022-12-16 11:22:42', NULL),
(99, 20221216004, 'otomatis', 53, 'raihan', 'raihan123@gmail.com', 'semangat semoga cepet sembuh', 15208, 208, NULL, NULL, 0, '318-612-0069', 1, NULL, '2022-12-16 14:26:40', '2022-12-16 14:26:40', NULL),
(100, 20221218001, 'manual', 54, 'Super Admin', 'superadmin@gmail.com', 'semangat', 500436, 436, 12, NULL, 0, '081923123', 0, 1, '2022-12-18 16:14:11', '2022-12-18 16:14:11', NULL),
(101, 20221218002, 'otomatis', 35, 'Super Admin', 'superadmin@gmail.com', 'semangat', 100605, 605, NULL, NULL, 1, '081919956872', 0, 1, '2022-12-18 16:15:25', '2022-12-18 16:16:22', NULL),
(102, 20221219001, 'manual', 54, 'Agung Kusaeri', 'agungkusaer@gimail.com', 'SEMANGAT', 2000481, 481, 11, NULL, 1, '08192312431', 0, 24, '2022-12-19 03:45:58', '2022-12-19 15:32:21', NULL),
(103, 20221219002, 'otomatis', 46, 'Agung Kusaeri', 'agungkusaer@gimail.com', 'SEMANGAT', 50248, 248, NULL, NULL, 1, '0982342323', 0, 24, '2022-12-19 03:46:53', '2022-12-19 03:48:21', NULL),
(104, 20221219003, 'manual', 54, 'Agung Kusaeri', 'agunguf7@gmail.com', 'semangat kawan', 500236, 236, 12, NULL, 0, '0812312321', 1, 25, '2022-12-19 15:42:51', '2022-12-20 01:32:51', NULL),
(105, 20221219004, 'otomatis', 45, 'Agung Kusaeri', 'agunguf7@gmail.com', 'semangat lagi', 200304, 304, NULL, NULL, 1, '081919956872', 0, 25, '2022-12-19 15:44:00', '2022-12-19 15:46:03', NULL),
(106, 20221220001, 'manual', 54, 'Agung Kusaeri', 'agungproject62@gmail.com', 'semangat semoga cepet membaik', 1000627, 627, 15, NULL, 1, '081919956872', 1, 26, '2022-12-20 01:41:35', '2022-12-20 01:43:19', NULL),
(107, 20221220002, 'otomatis', 45, 'Agung Kusaeri', 'agungproject62@gmail.com', 'semangat', 100317, 317, NULL, NULL, 1, '081919956872', 0, 26, '2022-12-20 01:44:00', '2022-12-20 01:45:04', NULL),
(108, 20221223001, 'otomatis', 54, 'Manda', 'agustriyamanda@gmail.com', 'semangat', 100236, 236, NULL, NULL, 0, '6281264629029', 1, NULL, '2022-12-23 02:46:09', '2022-12-23 02:46:09', NULL),
(109, 20221226001, 'otomatis', 53, 'asdfasd', 'asdfasd@asdfasdf', 'asdfasdfasd', 50794, 794, NULL, NULL, 1, '12312312', 1, NULL, '2022-12-26 10:23:40', '2022-12-26 10:23:55', NULL),
(110, 20221229001, 'otomatis', 54, 'Jodi', 'jodi@nurulfikri.co.id', 'Semoga bermanfaat', 35480, 480, NULL, NULL, 0, '08999234786', 1, 28, '2022-12-29 13:52:58', '2022-12-29 13:52:58', NULL),
(111, 20221230001, 'otomatis', 54, 'Jodi', 'jodi@nurulfikri.co.id', 'Semoga Bermanfaat', 200625, 625, NULL, NULL, 0, '08999234786', 1, 28, '2022-12-30 07:31:58', '2022-12-30 07:31:58', NULL),
(112, 20221231001, 'otomatis', 53, 'Jajang', NULL, NULL, 5210, 210, NULL, NULL, 0, '08136271', 0, NULL, '2022-12-31 16:08:33', '2022-12-31 16:08:33', NULL),
(113, 20230102001, 'otomatis', 55, 'Ilham', 'ilhamkusaeri@gmail.com', 'Untuk kamu ya dek semoga kamu rajin menyogok', 30000618, 618, NULL, NULL, 1, '082246358623', 0, NULL, '2023-01-02 10:09:58', '2023-01-02 10:10:25', NULL),
(114, 20230104005, 'otomatis', 54, 'Super Admin', 'superadmin@gmail.com', 'adfasdf', 35140, 140, NULL, NULL, 0, '12312', 0, 1, '2023-01-03 17:14:15', '2023-01-03 17:14:15', NULL),
(115, 20230104006, 'otomatis', 53, 'adfsadf', 'asdfsad@sdfasdf', 'asdfasdfasd', 100430, 430, NULL, NULL, 1, '12312312', 1, NULL, '2023-01-04 02:41:59', '2023-01-04 02:42:20', NULL),
(116, 20230124001, 'otomatis', 46, 'adminn', 'admin@gmail.com', 'sdfasdfasd', 200619, 619, NULL, NULL, 0, '12312312', 0, 2, '2023-01-24 07:07:22', '2023-01-24 07:07:22', NULL),
(117, 20230130001, 'otomatis', 35, 'asaaas', 'user@gmail.com', 'ass', 200472, 472, NULL, NULL, 0, '12312312312', 0, NULL, '2023-01-30 16:22:45', '2023-01-30 16:22:45', NULL),
(118, 20230130002, 'otomatis', 43, 'qq', 'agunguf7@gmail.com', 'qq', 200906, 906, NULL, NULL, 1, '12312312312', 0, NULL, '2023-01-30 16:24:12', '2023-01-30 16:28:29', NULL),
(119, 20230130003, 'otomatis', 36, 'gyyy', 'agunguf7@gmail.com', 'hhhh', 200677, 677, NULL, NULL, 0, '08124124512', 0, NULL, '2023-01-30 16:26:40', '2023-01-30 16:26:40', NULL),
(120, 20230130004, 'otomatis', 10, 'jjjjjj', 'mitrabunkem@gmail.com', 'hhjnj', 200726, 726, NULL, NULL, 0, '081912312412', 1, NULL, '2023-01-30 16:27:48', '2023-01-30 16:27:48', NULL),
(121, 20230130005, 'otomatis', 35, 'hjj', NULL, 'hhhh', 200126, 126, NULL, NULL, 0, '08124125125', 1, NULL, '2023-01-30 16:28:46', '2023-01-30 16:28:46', NULL),
(122, 20230214001, 'otomatis', 55, 'bebas', 'laravelmr1@gmail.com', 'Hjsjj', 35951, 951, NULL, NULL, 0, '089677777', 0, 33, '2023-02-14 13:51:56', '2023-02-14 13:51:56', NULL),
(123, 20230214002, 'otomatis', 45, 'bebas', 'laravelmr1@gmail.com', 'Hhh', 35540, 540, NULL, NULL, 0, '086777', 0, 33, '2023-02-14 13:54:38', '2023-02-14 13:54:38', NULL),
(124, 20230214003, 'otomatis', 55, 'bebas', 'laravelmr1@gmail.com', 'Ggh', 35277, 277, NULL, NULL, 0, '0867374', 0, 33, '2023-02-14 13:56:19', '2023-02-14 13:56:19', NULL),
(125, 20230814001, 'manual', 33, 'asdfasd', 'asdfasd@asfasdfasdfasd', 'asdfasd', 10378, 378, 15, NULL, 1, '089123124124124', 1, NULL, '2023-08-14 12:22:34', '2023-08-14 18:18:48', NULL),
(126, 20230814002, 'otomatis', 54, 'asdfasdfasdfasd', 'asdfas@asdfasdg', 'asdfasdf', 200817, 817, NULL, NULL, 0, '08912312412412', 1, NULL, '2023-08-14 12:29:38', '2023-08-14 12:29:38', NULL),
(127, 20230814003, 'manual', 33, 'User', 'user@gmail.com', 'sdfvsdf', 400101, 101, 15, NULL, 0, '345q45245', 1, 37, '2023-08-14 16:54:43', '2023-08-14 18:20:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` bigint UNSIGNED NOT NULL,
  `transaction_id` int NOT NULL,
  `snap_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `transaction_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement_time` datetime DEFAULT NULL,
  `payment_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gross_amount` double(8,2) DEFAULT NULL,
  `fraud_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `snap_token`, `transaction_time`, `transaction_status`, `transaction_uuid`, `store`, `status_message`, `status_code`, `signature_key`, `settlement_time`, `payment_code`, `payment_type`, `order_id`, `merchant_id`, `gross_amount`, `fraud_status`, `currency`, `created_at`, `updated_at`) VALUES
(1, 36, 'f2c7bb31-57f0-4ccc-9803-56423040c73e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 04:33:28', '2022-12-12 04:33:28'),
(2, 38, 'f28be70e-f0e1-4e76-994a-1a8f3403e544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 04:39:26', '2022-12-12 04:39:26'),
(3, 40, '46a087ae-d4bb-4431-8976-91e9d982eacf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 04:41:38', '2022-12-12 04:41:38'),
(4, 46, '4d2e0262-9407-4ef9-92eb-2f232a63c153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 04:57:32', '2022-12-12 04:57:32'),
(5, 50, '7dce373a-845a-4b8e-85ac-45fabb388d40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 10:19:48', '2022-12-12 10:19:48'),
(6, 51, 'dbb143c8-032f-4539-bde9-8f8201031fa1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 12:08:50', '2022-12-12 12:08:50'),
(7, 52, 'ec950caa-3f98-4229-a74d-ccdcedceb831', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 12:11:18', '2022-12-12 12:11:18'),
(8, 54, '483da4b9-ae4c-4c34-9831-a40fdcdb7ba5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:31:37', '2022-12-12 14:31:37'),
(9, 59, 'e80e134e-12b0-44f8-96aa-3ff96fb4af24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:38:17', '2022-12-12 14:38:17'),
(10, 60, '12bf509b-3587-4fc3-b764-4d607d3e3117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:38:40', '2022-12-12 14:38:40'),
(11, 61, 'aca21267-bb0f-4927-9bac-ebc06343adc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:39:25', '2022-12-12 14:39:25'),
(12, 64, '435befe1-e8f2-4e4b-94d3-16e3a6578598', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:41:17', '2022-12-12 14:41:17'),
(13, 64, '8ca62873-3ebb-461a-bf22-de483819aa68', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:41:19', '2022-12-12 14:41:19'),
(14, 64, '57e4d8f3-4ad1-47b0-b168-0f4ebab6ded2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:41:22', '2022-12-12 14:41:22'),
(15, 64, 'f9821f87-047b-4ba3-96ca-331c83a07c18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:41:22', '2022-12-12 14:41:22'),
(16, 66, '48da4e89-4f72-43c9-84cf-199fc9326258', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:42:43', '2022-12-12 14:42:43'),
(17, 67, '48ba2143-358a-4650-919a-02b0c40bf731', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:43:16', '2022-12-12 14:43:16'),
(18, 69, 'f0c6a75d-df57-4c2c-a05a-cf2385f36d88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:43:53', '2022-12-12 14:43:53'),
(19, 71, 'f053341b-eed6-4a05-9152-d1a73b5e5e6f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 14:56:40', '2022-12-12 14:56:40'),
(20, 72, 'f94af8de-06d7-4e90-bf68-15064a98c70e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 15:01:54', '2022-12-12 15:01:54'),
(21, 73, '02124a19-c72d-4dad-a95d-6ad4513d5745', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 21:25:49', '2022-12-12 21:25:49'),
(22, 75, '6185a146-7a31-4afa-9ac5-a769dd0f629b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-13 06:49:05', '2022-12-13 06:49:05'),
(23, 76, '3de03642-5d17-4be9-966b-a810d7c08e65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-13 09:42:51', '2022-12-13 09:42:51'),
(24, 77, '9b057749-2973-4ee2-8f2f-d2732e02ab9a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-13 16:19:17', '2022-12-13 16:19:17'),
(25, 78, '1fba8c2e-2616-49f1-9b4e-03e9a6123e3c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:20:12', '2022-12-15 02:20:12'),
(26, 79, 'f1a64737-6d6b-439e-87e6-923b3199b0b0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:20:37', '2022-12-15 02:20:37'),
(27, 80, 'e725acfd-24c0-4cdf-ab4f-18958eabe577', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:24:13', '2022-12-15 02:24:13'),
(28, 80, '53a470aa-63e7-4dac-bf54-01c5ba879649', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:24:39', '2022-12-15 02:24:39'),
(29, 81, '4db09ecc-1238-4c8f-b080-758ba172ff5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:26:12', '2022-12-15 02:26:12'),
(30, 82, '2237acb7-82a7-4882-bc97-d293ecbabc6f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:26:54', '2022-12-15 02:26:54'),
(31, 83, '5094d4cd-ae01-4f2d-9600-fc648492d014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 02:27:45', '2022-12-15 02:27:45'),
(32, 89, '3075dc42-e5c0-4d85-8a93-d59f046310d2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:27:55', '2022-12-15 15:27:55'),
(33, 91, '35ec776b-338b-4caa-a82c-c00afdf1e6aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:33:50', '2022-12-15 15:33:50'),
(34, 92, '94baa010-20d7-4578-882c-1ee274f041c4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:36:31', '2022-12-15 15:36:31'),
(35, 93, '80952f70-43a2-4bf4-a0a0-2c1033d1c9e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:38:16', '2022-12-15 15:38:16'),
(36, 94, '7d3a4a86-3983-4a34-bf81-701862cf3f87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:54:05', '2022-12-15 15:54:05'),
(37, 95, '24fb3e27-f850-4844-ba5d-2db4d8f7190e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:59:23', '2022-12-15 15:59:23'),
(38, 96, '4234eef1-29e2-443a-8c93-3fe9a73f5764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-16 07:08:16', '2022-12-16 07:08:16'),
(39, 97, 'd54d185c-097c-47ff-b4e7-146ea197d6de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-16 11:21:09', '2022-12-16 11:21:09'),
(40, 98, '10d9b096-d9f9-4ce5-8680-5434916cf445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-16 11:21:56', '2022-12-16 11:21:56'),
(41, 99, '95afa228-3033-4f03-9548-edb5c752d30a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-16 14:26:43', '2022-12-16 14:26:43'),
(42, 101, 'c926a20d-de44-444c-b7ce-5e053e0429f2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-18 16:15:34', '2022-12-18 16:15:34'),
(43, 103, 'e8dc9ef3-ffe4-4e8e-89d9-922b1ac3ebdc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-19 03:47:07', '2022-12-19 03:47:07'),
(44, 105, 'be6b9a85-400f-4fea-b35a-ff3ad7a3c51d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-19 15:44:17', '2022-12-19 15:44:17'),
(45, 107, '7e8b3bde-0e27-46d7-ac35-5a6d85dca95a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-20 01:44:11', '2022-12-20 01:44:11'),
(46, 108, '733ab098-72fa-4887-a625-3054ff74a890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-23 02:46:22', '2022-12-23 02:46:22'),
(47, 109, 'ce27b4e2-3ca2-4fd1-810e-4777a448b977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-26 10:23:43', '2022-12-26 10:23:43'),
(48, 112, '5a47d733-9005-4a43-9ce6-c2fd6799ce7f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-31 16:08:37', '2022-12-31 16:08:37'),
(49, 113, '69c16ed5-d41c-446e-b3c1-b546fb07a324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-02 10:10:11', '2023-01-02 10:10:11'),
(50, 115, 'd3bf611c-e76b-4987-ae3d-72a18a1fbfae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-04 02:42:01', '2023-01-04 02:42:01'),
(51, 116, 'ca24be5b-16c4-4734-8b34-6076046c1b1e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-24 07:07:27', '2023-01-24 07:07:27'),
(52, 117, '5437fd57-cd8c-44a6-8b5d-cabda732aafc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-30 16:22:48', '2023-01-30 16:22:48'),
(53, 117, '3917a5f3-4584-4c3a-8223-719d9aaf1ca1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-30 16:23:03', '2023-01-30 16:23:03'),
(54, 118, '51d76ab3-3b55-422c-89c5-1e9133e0ab6a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-30 16:24:15', '2023-01-30 16:24:15'),
(55, 120, '067c6474-fea1-4c15-b748-b1a141b5557d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-30 16:27:55', '2023-01-30 16:27:55'),
(56, 121, '5bc54172-57f6-4684-be8f-95bb3c98d976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-30 16:28:51', '2023-01-30 16:28:51'),
(57, 122, 'be9964ac-9e17-46f6-abf6-d47fb2f44e78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 13:52:03', '2023-02-14 13:52:03'),
(58, 123, 'e3fee600-78ea-406d-8a76-e914f2f97f01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 13:54:44', '2023-02-14 13:54:44'),
(59, 124, '63513055-2ec0-4b5f-a5df-505d29df0c92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 13:56:22', '2023-02-14 13:56:22'),
(60, 126, '39a05f33-c3f0-4386-8d6d-62cbc1b5d146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 12:31:21', '2023-08-14 12:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `status`, `avatar`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'superadmin', 'superadmin@gmail.com', '2022-12-10 16:28:49', '$2y$10$G.eUrEz8WiAgXBPHasoqQOihFo3o/OKpRza.MdC0FH0IW00rCy8lS', 1, NULL, '48NBLMZEB8wZVb1UF8OPHs2XeC0pmhTGl2mAIqQpbQi3NaPeL1vfiOyPhuNg', '2022-11-07 06:58:00', '2023-04-18 11:18:29', NULL),
(2, 'adminn', 'admin', 'admin@gmail.com', '2022-12-10 16:28:54', '$2a$12$1ul2NMNIVgAg66jR9KEDxee8nk7knudv6TTGreHzbmOLwjxqWolaq', 0, NULL, 'YWVI7AC5z6Jhg6kxCQ47T6eT1nFc3fYKzIN9kBKXTrylGQ6vYWlCvh8BSRVe', '2022-11-07 06:58:00', '2023-02-02 03:39:31', NULL),
(9, 'Muhammad Andhika Bayu Prasetya', 'Dikaabayyy', 'dika@gmail.com', NULL, '$2y$10$3J.hGbzXM/qkEMZ2/znabOGa3hPaEl/TJOYsp3ikeokzXGFyD2y.m', 1, NULL, NULL, '2022-11-30 04:39:26', '2022-11-30 04:39:26', NULL),
(22, 'raihan', 'raihan368', 'raihan123@gmail.com', NULL, '$2y$10$nYdq79TghG6YXLTo6vCiReUR1LGYSXJeX1Hv9qROGpmqeaQBjpA6K', 1, NULL, NULL, '2022-12-15 15:56:25', '2022-12-15 15:56:25', NULL),
(23, 'chumovie', 'chumovie303', 'chumovieee@gmail.com', '2022-12-15 15:58:13', '$2y$10$OW7pd4pv5bgnGDzzD7OeQ.4tNJNIpoIahVqpMiPRPWXonatS/i/Ym', 1, NULL, NULL, '2022-12-15 15:57:33', '2022-12-15 15:58:13', NULL),
(24, 'Agung Kusaeri', 'AgungKusaeri828', 'agungkusaer@gimail.com', NULL, '$2y$10$UCEeZFFtQ4nwHcwLndGXF.NGVbnoN8604QY24VRzHe7aj0CE3ata.', 1, NULL, NULL, '2022-12-19 03:43:11', '2022-12-19 03:43:11', NULL),
(27, 'Agung Kusaeri', 'AgungKusaeri126', 'agungproject62@gmail.com', NULL, '$2y$10$pSGgj4L3sGFAxMgt6PoWi.dSoPJrUVs/nAfzbhxOGlI260IDDrq96', 0, NULL, NULL, '2022-12-20 02:04:00', '2022-12-20 02:08:36', NULL),
(28, 'Jodi', 'Jodi333', 'jodi@nurulfikri.co.id', '2022-12-29 13:51:35', '$2y$10$uvzoi2QZqKCnzLWdzfMQRutwL5Z3msNwa4Vf39uy.XMwACh7BaVma', 1, NULL, NULL, '2022-12-29 13:49:08', '2022-12-29 13:51:35', NULL),
(29, 'Manda Agustriya', 'MandaAgustriya513', 'agustriyamanda@gmail.com', '2022-12-30 01:01:00', '$2y$10$Io9zT0dgvoJNv0LdLfMJ7ug8.XervksKzqzqgEulK43nTYjYhGNj2', 1, NULL, NULL, '2022-12-30 00:57:41', '2022-12-30 01:01:00', NULL),
(30, 'Sule', 'Sule136', 'bolavid99@gmail.com', '2022-12-30 07:34:02', '$2y$10$JztIHgTPfkG9NDgRUtXZ7OCc/Mi5htMdJfajGtJFWblmTfDLEPYaC', 1, NULL, NULL, '2022-12-30 07:30:29', '2022-12-30 07:34:02', NULL),
(31, 'Zainullah', 'Zainullah718', 'zain.flutter@gmail.com', NULL, '$2y$10$dj7Af2YnVuxFqWeFKxs78.AZdpSf66nTYOhr6LjbJUSk5WhLrV80C', 1, NULL, 'jV4oY17p8gGEdSDBYLPja3j0MEEpBL9BnA9y7AvNKaJRiVhljouGbn8zaAyA', '2022-12-30 07:34:03', '2022-12-30 07:34:03', NULL),
(32, 'Selena', 'Selena730', 'fajrimaulidia92@gmail.com', NULL, '$2y$10$5ekJhTtA6NDAqcQRLlARJOncs99I/rswIXPYFMTFgjmx.o2PoBGgS', 1, NULL, 'M8k3pDFG11jFEauuDKHqiiPi35L0Mafod92R9CzSeyF3HWJPl9Odg3x2r47h', '2023-01-31 16:38:07', '2023-01-31 16:38:07', NULL),
(33, 'bebas', 'bebas598', 'laravelmr1@gmail.com', '2023-02-14 13:50:56', '$2y$10$WhBfqmzyVkQtHyh9ZV9kxeAHjM50r3Bp/fRLWucg6t1bDyoQRwI1O', 1, NULL, NULL, '2023-02-14 13:50:28', '2023-02-14 13:50:56', NULL),
(34, 'asdfasdf', 'asdfasdf668', 'asdfasd@asdfasdf', NULL, '$2y$10$BwZLOthG6K9ovKpsfvmDc.hZC7oHltx.ZJ0AwwevSAhh2LM8rhO1K', 1, NULL, NULL, '2023-08-11 07:20:14', '2023-08-11 07:20:14', NULL),
(35, 'asdfasdf', 'asdfasdf249', 'asdfasd@asdfasd', NULL, '$2y$10$NBoUNfabbCdhL0g/JE9J..8URp114KT7TgIp33c2NFki9JCcA5iH.', 1, NULL, NULL, '2023-08-11 07:21:34', '2023-08-11 07:21:34', NULL),
(36, 'asdfasdf', 'asdfasdf134', 'asdfasd@asdfasda', NULL, '$2y$10$PqY2V1U9/blmVJZmOwD56u.MPrnJFu7eAOYQDlYz/rWpkFwrdmyAq', 1, NULL, NULL, '2023-08-11 07:22:31', '2023-08-11 07:22:31', NULL),
(37, 'User', 'User830', 'user@gmail.com', '2023-08-14 16:50:16', '$2y$10$6Juu6qA.gviwydhRs/k9XO9lnMsVMCzCXGHLHy7tse0T1YAP4ClOm', 1, NULL, NULL, '2023-08-14 16:49:41', '2023-08-14 16:49:41', NULL),
(38, 'Frances Mcmahon', 'FrancesMcmahon552', 'ligyt@mailinator.com', '2023-08-14 17:23:37', '$2y$10$GLyTmp3Ml3vY2Z0Bkp8jNu0acZbhvTv38nTnZWC0SMIhFNpnlPXP.', 1, NULL, NULL, '2023-08-14 17:19:03', '2023-08-14 17:23:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal`
--

CREATE TABLE `withdrawal` (
  `id` bigint UNSIGNED NOT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `manual_payment_amount` bigint DEFAULT NULL,
  `automatic_payment_amount` bigint DEFAULT NULL,
  `amount_total` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal`
--

INSERT INTO `withdrawal` (`id`, `program_id`, `manual_payment_amount`, `automatic_payment_amount`, `amount_total`, `created_at`, `updated_at`) VALUES
(8, 54, 3001108, 50350, 3051458, '2023-08-14 18:01:56', '2023-08-14 18:01:56'),
(9, 53, 0, 351643, 351643, '2023-08-14 18:03:22', '2023-08-14 18:03:22'),
(10, 51, 0, 105339, 105339, '2023-08-14 18:03:55', '2023-08-14 18:03:55'),
(11, 47, 0, 125855, 125855, '2023-08-14 18:14:48', '2023-08-14 18:14:48'),
(12, 46, 100145, 250364, 350509, '2023-08-14 18:15:21', '2023-08-14 18:15:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_category_id_foreign` (`post_category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_tags_post_id_tag_id_unique` (`post_id`,`tag_id`),
  ADD KEY `posts_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_name_unique` (`name`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_name_unique` (`name`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programs_slug_unique` (`slug`),
  ADD KEY `programs_program_category_id_foreign` (`program_category_id`),
  ADD KEY `programs_user_id_foreign` (`user_id`);

--
-- Indexes for table `program_budget`
--
ALTER TABLE `program_budget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_budget_program_id_foreign` (`program_id`);

--
-- Indexes for table `program_categories`
--
ALTER TABLE `program_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program_categories_name_unique` (`name`);

--
-- Indexes for table `program_galleries`
--
ALTER TABLE `program_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_galleries_program_id_foreign` (`program_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_program_id_foreign` (`program_id`);

--
-- Indexes for table `socmeds`
--
ALTER TABLE `socmeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_code_unique` (`code`),
  ADD KEY `donaturs_program_id_foreign` (`program_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdrawal`
--
ALTER TABLE `withdrawal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_program_id_foreign` (`program_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `program_budget`
--
ALTER TABLE `program_budget`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `program_categories`
--
ALTER TABLE `program_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `program_galleries`
--
ALTER TABLE `program_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socmeds`
--
ALTER TABLE `socmeds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `withdrawal`
--
ALTER TABLE `withdrawal`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `withdrawal`
--
ALTER TABLE `withdrawal`
  ADD CONSTRAINT `withdrawal_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
