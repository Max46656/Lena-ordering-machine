-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-01-13 08:00:06
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `fanart`
--

-- --------------------------------------------------------

--
-- 資料表結構 `data_rows`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `data_rows`:
--   `data_type_id`
--       `data_types` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `data_rows`
--

TRUNCATE TABLE `data_rows`;
--
-- 傾印資料表的資料 `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', '電子郵件', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', '密碼', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', '創建於', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', '頭像', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', '角色', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', '顯示名稱', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', '角色', 1, 1, 1, 1, 1, 1, NULL, 9);

-- --------------------------------------------------------

--
-- 資料表結構 `data_types`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `data_types`:
--

--
-- 資料表新增資料前，先清除舊資料 `data_types`
--

TRUNCATE TABLE `data_types`;
--
-- 傾印資料表的資料 `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', '用戶', '用戶', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(2, 'menus', 'menus', '側邊欄', '側邊欄', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(3, 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37');

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--
-- 建立時間： 2023-01-12 05:59:07
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `failed_jobs`:
--

--
-- 資料表新增資料前，先清除舊資料 `failed_jobs`
--

TRUNCATE TABLE `failed_jobs`;
-- --------------------------------------------------------

--
-- 資料表結構 `items`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:29
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `items`:
--   `restaurant_id`
--       `restaurants` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `items`
--

TRUNCATE TABLE `items`;
--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`id`, `restaurant_id`, `name`, `price`, `cover`, `enabled`, `sort`, `created_at`, `updated_at`) VALUES
(1, 5, '了。 阿Q肚子比別。', 314, 'items/food (6).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(2, 5, '似乎以為薪之不可。', 14, 'items/food (7).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(3, 6, '靜，咸亨酒店不賒。', 908, 'items/food (1).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(4, 1, '又仿佛握著無形的大。', 771, 'items/food (20).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(5, 1, '便買定一條大道，“。', 720, 'items/food (1).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(6, 5, '枝，跳到裏面竄出一。', 779, 'items/food (25).jpg', 1, 0, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(7, 2, '加以揣測的，這人一。', 372, 'items/food (12).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(8, 4, '答說，「這裏沒有？', 582, 'items/food (6).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(9, 6, '個碧綠的西高峰這方。', 377, 'items/food (10).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(10, 3, '竄了。這種人待到知。', 206, 'items/food (9).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(11, 3, '也遲了。 “什麼缺。', 55, 'items/food (24).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(12, 3, '孫時，他竟在錢家的。', 992, 'items/food (28).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(13, 5, ' 兩個默默的吸煙。', 681, 'items/food (3).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(14, 4, '人撈將上來。「迅兒。', 331, 'items/food (3).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(15, 1, '十多個碗碟來，說著。', 959, 'items/food (30).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(16, 3, '所發散出來了。 。', 762, 'items/food (4).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(17, 4, '後並不見有許多跳魚。', 572, 'items/food (7).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(18, 7, '” “呵！他卻連這。', 763, 'items/food (13).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(19, 2, '一斤重的——一說是。', 366, 'items/food (25).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(20, 5, '九歲了，而且擔心的。', 928, 'items/food (13).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(21, 6, '迂。不一會，似乎要。', 959, 'items/food (23).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(22, 6, '和開船，本也如我所。', 865, 'items/food (15).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(23, 4, '所以我往往同時又很。', 614, 'items/food (10).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(24, 2, '是阿桂，是武斷的。', 683, 'items/food (4).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(25, 6, '煙，額上帖起『蝮蛇。', 966, 'items/food (8).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(26, 5, '得的懲罰他忘了前面。', 124, 'items/food (30).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(27, 4, '經開場了，我靠著船。', 38, 'items/food (33).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(28, 5, '…，而且打罵之後。', 490, 'items/food (12).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(29, 5, '餘，卻又向自己一看。', 34, 'items/food (31).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(30, 1, '足有四樣寫的？不就。', 61, 'items/food (1).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(31, 1, '到末路[编辑] 趙。', 859, 'items/food (24).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(32, 5, '附和着笑，那自然而。', 829, 'items/food (9).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(33, 7, '萬分的空氣中撲面的。', 309, 'items/food (3).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(34, 5, '出沒。 拍，吧～～。', 610, 'items/food (28).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(35, 7, '亂蓬蓬冒煙，額上帖。', 907, 'items/food (16).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(36, 4, '紅活圓實的羅漢豆正。', 485, 'items/food (1).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(37, 3, '…”他扭住了陳士成。', 20, 'items/food (4).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(38, 6, '了酒，喝道，「這回。', 708, 'items/food (9).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(39, 3, '最好的睡在床沿上哭。', 559, 'items/food (33).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(40, 2, '和宏兒。驢……趕走。', 265, 'items/food (16).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(41, 2, '著走去……他們便不。', 103, 'items/food (13).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(42, 5, '說： “阿”字面上。', 221, 'items/food (18).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(43, 1, '的奧妙，但望這紅白。', 925, 'items/food (22).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(44, 5, '也暫時開不得了。 。', 294, 'items/food (1).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(45, 1, '東西，……\" 我們。', 668, 'items/food (23).jpg', 1, 0, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(46, 4, '民來，但泥土來。我。', 986, 'items/food (29).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(47, 1, '又仿佛這是怎麼這些。', 615, 'items/food (12).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(48, 6, '他見人。夫“不孝有。', 157, 'items/food (15).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(49, 5, '他，往往的搬，箱子。', 517, 'items/food (8).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(50, 4, '富，那當然都學起小。', 326, 'items/food (27).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(51, 1, '身上也曾聽得背後。', 957, 'items/food (7).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(52, 5, '間歪歪斜斜一條辮子。', 921, 'items/food (23).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(53, 5, '景也好罷，”趙太爺。', 100, 'items/food (4).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(54, 2, '我，也顧不得近火』', 255, 'items/food (5).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(55, 1, '于言的人！……」 。', 222, 'items/food (8).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(56, 6, '活的人都願意根究。', 893, 'items/food (5).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(57, 2, '使我非常憂愁，忘卻。', 612, 'items/food (26).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(58, 4, '出茶碗茶葉來，決不。', 304, 'items/food (20).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(59, 3, '只有托一個早已成功。', 175, 'items/food (12).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(60, 6, '男人”了。” 阿Q。', 377, 'items/food (14).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(61, 2, '”他站住。他的家裏。', 459, 'items/food (32).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(62, 4, '只見假洋鬼子！——。', 39, 'items/food (11).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(63, 5, '上的註解，穿著寶藍。', 849, 'items/food (15).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(64, 4, '看出他的腳比我高興。', 341, 'items/food (30).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(65, 7, '宏兒聽得裏面了。 。', 28, 'items/food (27).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(66, 1, '於是合上檢查一回。', 209, 'items/food (15).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(67, 7, '…” 於是有一塊小。', 331, 'items/food (30).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(68, 4, '尚動得，便任憑航船。', 68, 'items/food (11).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(69, 4, '我還有趙太爺的威風。', 653, 'items/food (30).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(70, 4, '他急忙拋下鋤頭柄了。', 750, 'items/food (11).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(71, 3, '人都好，那當然無可。', 615, 'items/food (20).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(72, 7, '早在我所謂回憶者。', 825, 'items/food (1).jpg', 1, 3, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(73, 6, '起一本《大乘起信論。', 45, 'items/food (33).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(74, 7, '當的尊敬，自然只有。', 125, 'items/food (20).jpg', 1, 0, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(75, 7, '看愈生氣，白氣，店。', 807, 'items/food (27).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(76, 5, '易纔捉到三四天之後。', 476, 'items/food (28).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(77, 5, '亡，無論如何總不能。', 293, 'items/food (20).jpg', 1, 10, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(78, 6, '聲音道，……”於是。', 582, 'items/food (2).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(79, 7, '疏朗朗的站著趙白眼。', 927, 'items/food (32).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(80, 4, '去得最遲，但因為白。', 218, 'items/food (30).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(81, 4, '了。母親，待到傍晚。', 845, 'items/food (22).jpg', 1, 7, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(82, 4, '物的腰間說。 第二。', 124, 'items/food (12).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(83, 7, '總焦急，也躲在背後。', 907, 'items/food (22).jpg', 1, 6, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(84, 3, '群孩子又不住心跳起。', 91, 'items/food (8).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(85, 5, '樣憑空汚人清白……。', 927, 'items/food (25).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(86, 3, '去了。 我吃過晚飯。', 961, 'items/food (32).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(87, 3, '搬，要是還有什麼女。', 998, 'items/food (28).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(88, 4, '兩個腳……”阿Q一。', 359, 'items/food (21).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(89, 7, '栓，就是了。他們纔。', 841, 'items/food (28).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(90, 4, '見過官府的門。街上。', 273, 'items/food (20).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(91, 1, ' 這時便立刻覺得奇。', 958, 'items/food (14).jpg', 1, 9, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(92, 6, '細。阿Q那裏啦～～。', 402, 'items/food (1).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(93, 6, '怏的努了嘴站著說。', 729, 'items/food (32).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(94, 6, '精光像這老不死的死。', 141, 'items/food (3).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(95, 5, '待回來，用力的囑咐。', 648, 'items/food (2).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(96, 1, '子，有意思。從前的。', 773, 'items/food (2).jpg', 1, 4, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(97, 6, '栓進來罷，——分明。', 280, 'items/food (32).jpg', 1, 1, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(98, 4, '了。 住在未曾受他。', 591, 'items/food (18).jpg', 1, 8, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(99, 1, '踱去的唱。那時大抵。', 913, 'items/food (10).jpg', 1, 2, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(100, 5, '繁榮，還是受了死刑。', 738, 'items/food (21).jpg', 1, 5, '2023-01-13 01:53:29', '2023-01-13 01:53:29');

-- --------------------------------------------------------

--
-- 資料表結構 `item_order`
--
-- 建立時間： 2023-01-13 01:53:25
--

DROP TABLE IF EXISTS `item_order`;
CREATE TABLE `item_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `item_order`:
--   `item_id`
--       `items` -> `id`
--   `order_id`
--       `orders` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `item_order`
--

TRUNCATE TABLE `item_order`;
-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--
-- 建立時間： 2023-01-12 05:59:07
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `menus`:
--

--
-- 資料表新增資料前，先清除舊資料 `menus`
--

TRUNCATE TABLE `menus`;
--
-- 傾印資料表的資料 `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-13 01:53:37', '2023-01-13 01:53:37');

-- --------------------------------------------------------

--
-- 資料表結構 `menu_items`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `menu_items`:
--   `menu_id`
--       `menus` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `menu_items`
--

TRUNCATE TABLE `menu_items`;
--
-- 傾印資料表的資料 `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, '控制面板', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.dashboard', NULL),
(2, 1, '媒體', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.media.index', NULL),
(3, 1, '用戶', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.users.index', NULL),
(4, 1, '角色', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.roles.index', NULL),
(5, 1, '工具', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-01-13 01:53:37', '2023-01-13 01:53:37', NULL, NULL),
(6, 1, '側邊欄管理', '', '_self', 'voyager-list', NULL, 5, 10, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.menus.index', NULL),
(7, 1, '資料庫', '', '_self', 'voyager-data', NULL, 5, 11, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.database.index', NULL),
(8, 1, '指南針', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.bread.index', NULL),
(10, 1, '設定', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-01-13 01:53:37', '2023-01-13 01:53:37', 'voyager.settings.index', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--
-- 建立時間： 2023-01-12 05:54:13
-- 最後更新： 2023-01-13 01:53:25
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `migrations`:
--

--
-- 資料表新增資料前，先清除舊資料 `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(32, '2014_10_12_000000_create_users_table', 1),
(33, '2014_10_12_100000_create_password_resets_table', 1),
(34, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(35, '2016_01_01_000000_add_voyager_user_fields', 1),
(36, '2016_01_01_000000_create_data_types_table', 1),
(37, '2016_05_19_173453_create_menu_table', 1),
(38, '2016_10_21_190000_create_roles_table', 1),
(39, '2016_10_21_190000_create_settings_table', 1),
(40, '2016_11_30_135954_create_permission_table', 1),
(41, '2016_11_30_141208_create_permission_role_table', 1),
(42, '2016_12_26_201236_data_types__add__server_side', 1),
(43, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(44, '2017_01_14_005015_create_translations_table', 1),
(45, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(46, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(47, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(48, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(49, '2017_08_05_000000_add_group_to_settings_table', 1),
(50, '2017_11_26_013050_add_user_role_relationship', 1),
(51, '2017_11_26_015000_create_user_roles_table', 1),
(52, '2018_03_11_000000_add_user_settings', 1),
(53, '2018_03_14_000000_add_details_to_data_types_table', 1),
(54, '2018_03_16_000000_make_settings_value_nullable', 1),
(55, '2019_08_19_000000_create_failed_jobs_table', 1),
(56, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(57, '2023_01_11_033751_create_sessions_table', 1),
(58, '2023_01_11_145805_create_restaurants_table', 1),
(59, '2023_01_11_145847_create_items_table', 1),
(60, '2023_01_11_152450_create_orders_table', 1),
(61, '2023_01_12_083700_create_reviews_table', 1),
(62, '2023_01_12_084042_create_item_order_table', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--
-- 建立時間： 2023-01-13 01:53:25
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subTotal` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `orders`:
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `orders`
--

TRUNCATE TABLE `orders`;
-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--
-- 建立時間： 2023-01-12 05:59:07
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `password_resets`:
--

--
-- 資料表新增資料前，先清除舊資料 `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- 資料表結構 `permissions`
--
-- 建立時間： 2023-01-12 05:59:07
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `permissions`:
--

--
-- 資料表新增資料前，先清除舊資料 `permissions`
--

TRUNCATE TABLE `permissions`;
--
-- 傾印資料表的資料 `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(2, 'browse_bread', NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(3, 'browse_database', NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(4, 'browse_media', NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(5, 'browse_compass', NULL, '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(6, 'browse_menus', 'menus', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(7, 'read_menus', 'menus', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(8, 'edit_menus', 'menus', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(9, 'add_menus', 'menus', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(10, 'delete_menus', 'menus', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(11, 'browse_roles', 'roles', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(12, 'read_roles', 'roles', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(13, 'edit_roles', 'roles', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(14, 'add_roles', 'roles', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(15, 'delete_roles', 'roles', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(16, 'browse_users', 'users', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(17, 'read_users', 'users', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(18, 'edit_users', 'users', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(19, 'add_users', 'users', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(20, 'delete_users', 'users', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(21, 'browse_settings', 'settings', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(22, 'read_settings', 'settings', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(23, 'edit_settings', 'settings', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(24, 'add_settings', 'settings', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(25, 'delete_settings', 'settings', '2023-01-13 01:53:37', '2023-01-13 01:53:37');

-- --------------------------------------------------------

--
-- 資料表結構 `permission_role`
--
-- 建立時間： 2023-01-12 05:59:07
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `permission_role`:
--   `permission_id`
--       `permissions` -> `id`
--   `role_id`
--       `roles` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `permission_role`
--

TRUNCATE TABLE `permission_role`;
--
-- 傾印資料表的資料 `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
--
-- 建立時間： 2023-01-12 05:59:07
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `personal_access_tokens`:
--

--
-- 資料表新增資料前，先清除舊資料 `personal_access_tokens`
--

TRUNCATE TABLE `personal_access_tokens`;
-- --------------------------------------------------------

--
-- 資料表結構 `restaurants`
--
-- 建立時間： 2023-01-12 05:59:14
-- 最後更新： 2023-01-13 01:53:29
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `isBrunch` tinyint(1) DEFAULT 1,
  `isLunch` tinyint(1) DEFAULT 1,
  `isDinner` tinyint(1) DEFAULT 1,
  `isMidnightSnack` tinyint(1) DEFAULT 1,
  `foodMenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `restaurants`:
--

--
-- 資料表新增資料前，先清除舊資料 `restaurants`
--

TRUNCATE TABLE `restaurants`;
--
-- 傾印資料表的資料 `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `cover`, `tel`, `address`, `enabled`, `isBrunch`, `isLunch`, `isDinner`, `isMidnightSnack`, `foodMenu`, `created_at`, `updated_at`) VALUES
(1, '智冠有限公司', 'restaurants/餐廳 (5).jpg', '(00)9001027', '工業二十路696巷898號', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(2, '巨室企業', 'restaurants/餐廳 (3).jpg', '(096)176-431', '新基南路七段5號', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(3, '巨大酒店', 'restaurants/餐廳 (9).jpg', '0981-889-085', '中坑街七段366巷92弄887號58樓', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(4, '遊戲橘子唱片', 'restaurants/餐廳 (4).jpg', '(04)9085607', '北辰一街911巷650號59樓', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(5, '紅心辣椒有限公司', 'restaurants/餐廳 (6).jpg', '(04)9203647', '中心街213巷618號68樓', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29'),
(6, '宏碁集團公司', 'restaurants/餐廳 (6).jpg', '+886-999-738-905', '楓林十路321巷311弄941號55樓', 1, 1, 1, 1, 1, NULL, '2023-01-13 01:53:29', '2023-01-13 01:53:29');

-- --------------------------------------------------------

--
-- 資料表結構 `reviews`
--
-- 建立時間： 2023-01-13 01:53:25
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `res_id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `reviews`:
--   `res_id`
--       `restaurants` -> `id`
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `reviews`
--

TRUNCATE TABLE `reviews`;
-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--
-- 建立時間： 2023-01-12 05:59:07
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `roles`:
--

--
-- 資料表新增資料前，先清除舊資料 `roles`
--

TRUNCATE TABLE `roles`;
--
-- 傾印資料表的資料 `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '管理員', '2023-01-13 01:53:37', '2023-01-13 01:53:37'),
(2, 'user', '普通用戶', '2023-01-13 01:53:37', '2023-01-13 01:53:37');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--
-- 建立時間： 2023-01-12 05:59:07
-- 最後更新： 2023-01-13 06:57:44
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `sessions`:
--

--
-- 資料表新增資料前，先清除舊資料 `sessions`
--

TRUNCATE TABLE `sessions`;
--
-- 傾印資料表的資料 `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5Q1zXnD8EDRUJRY67WeixW9zaKtYLbxVja3ZIpxQ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiMGVpYlZtaE9sT1BMeFNBYUpBY1NCc2VTUXVYbEZoMDdDTkdKdVFVRiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vbWF4LmNvbTo2NjYvZmFuYXJ0L3B1YmxpYy9tZW51LzEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEU0RHp1a004UVlyNEprblVBeUIydGVTbjdsSThFODdVcmFqY3B2TmN4SnRZTmEvQ2w1NVBTIjtpOjA7czoxMDoicmVzdGF1cmFudCI7czoxMjoiMV9jYXJ0X2l0ZW1zIjtPOjMyOiJEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToyOntpOjQ1O086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjozOntzOjg6IgAqAGl0ZW1zIjthOjc6e3M6MjoiaWQiO2k6NDU7czo0OiJuYW1lIjtzOjI2OiLmnbHopb/vvIzigKbigKYiIOaIkeWAkeOAgiI7czo1OiJwcmljZSI7aTo2Njg7czo4OiJxdWFudGl0eSI7aToxMDtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjEwOiJjb25kaXRpb25zIjthOjA6e31zOjE1OiJhc3NvY2lhdGVkTW9kZWwiO086MjE6IkFwcFxNb2RlbHNcUmVzdGF1cmFudCI6MzA6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUi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', 1673593064);

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:37
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `settings`:
--

--
-- 資料表新增資料前，先清除舊資料 `settings`
--

TRUNCATE TABLE `settings`;
--
-- 傾印資料表的資料 `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', '網站標題', '網站標題', '', 'text', 1, 'Site'),
(2, 'site.description', '網站描述', '網站描述', '', 'text', 2, 'Site'),
(3, 'site.logo', '網站 Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', '後台背景圖像', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin 標題', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', '後台描述', '歡迎使用 Voyager - 不可錯過的 Laravel 後台管理框架', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', '後台圖標', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID （於後台控制面板使用）', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- 資料表結構 `translations`
--
-- 建立時間： 2023-01-12 05:59:07
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `translations`:
--

--
-- 資料表新增資料前，先清除舊資料 `translations`
--

TRUNCATE TABLE `translations`;
-- --------------------------------------------------------

--
-- 資料表結構 `users`
--
-- 建立時間： 2023-01-13 01:53:21
-- 最後更新： 2023-01-13 01:53:53
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `users`:
--   `role_id`
--       `roles` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `users`
--

TRUNCATE TABLE `users`;
--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$E4DzukM8QYr4JknUAyB2teSn7lI8E87UrajcpvNcxJtYNa/Cl55PS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-13 01:53:53', '2023-01-13 01:53:53');

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--
-- 建立時間： 2023-01-12 05:59:07
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `user_roles`:
--   `role_id`
--       `roles` -> `id`
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `user_roles`
--

TRUNCATE TABLE `user_roles`;
--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- 資料表索引 `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- 資料表索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_restaurant_id_foreign` (`restaurant_id`);

--
-- 資料表索引 `item_order`
--
ALTER TABLE `item_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_order_order_id_index` (`order_id`),
  ADD KEY `item_order_item_id_index` (`item_id`);

--
-- 資料表索引 `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- 資料表索引 `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- 資料表索引 `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- 資料表索引 `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- 資料表索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 資料表索引 `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_res_id_foreign` (`res_id`);

--
-- 資料表索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- 資料表索引 `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- 資料表索引 `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- 資料表索引 `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `item_order`
--
ALTER TABLE `item_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`);

--
-- 資料表的限制式 `item_order`
--
ALTER TABLE `item_order`
  ADD CONSTRAINT `item_order_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_res_id_foreign` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- 資料表的限制式 `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;


--
-- 元資料
--
USE `phpmyadmin`;

--
-- 資料表 data_rows 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 data_types 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 failed_jobs 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 items 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 item_order 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 menus 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 menu_items 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 migrations 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 orders 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 password_resets 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 permissions 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 permission_role 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 personal_access_tokens 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 restaurants 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 reviews 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 roles 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 sessions 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 settings 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 translations 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 users 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 user_roles 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料庫 fanart 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__bookmark`
--

TRUNCATE TABLE `pma__bookmark`;
--
-- 資料表新增資料前，先清除舊資料 `pma__relation`
--

TRUNCATE TABLE `pma__relation`;
--
-- 資料表新增資料前，先清除舊資料 `pma__savedsearches`
--

TRUNCATE TABLE `pma__savedsearches`;
--
-- 資料表新增資料前，先清除舊資料 `pma__central_columns`
--

TRUNCATE TABLE `pma__central_columns`;SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
