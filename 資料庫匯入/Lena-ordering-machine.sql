-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-02-09 08:55:00
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `Lena-ordering-machine`
--
CREATE DATABASE IF NOT EXISTS `Lena-ordering-machine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Lena-ordering-machine`;
--
-- 關閉外鍵檢查
--
SET FOREIGN_KEY_CHECKS = 0;
--
-- --------------------------------------------------------

--
-- 資料表結構 `data_rows`
--
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:27:49
--

CREATE TABLE IF NOT EXISTS `data_rows` (
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
(21, 1, 'role_id', 'text', '角色', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'note', 'text', 'Note', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(26, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(27, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(28, 5, 'restaurant_id', 'text', 'Restaurant Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(29, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(30, 5, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(31, 5, 'cover', 'media_picker', 'Cover', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90}', 6),
(32, 5, 'enabled', 'text', 'Enabled', 1, 1, 1, 1, 1, 1, '{}', 7),
(33, 5, 'sort', 'text', 'Sort', 1, 1, 1, 1, 1, 1, '{}', 8),
(34, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(35, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(36, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(37, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(38, 6, 'cover', 'media_picker', 'Cover', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90}', 3),
(39, 6, 'tel', 'text', 'Tel', 1, 1, 1, 1, 1, 1, '{}', 4),
(40, 6, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 5),
(41, 6, 'enabled', 'text', 'Enabled', 0, 1, 1, 1, 1, 1, '{}', 6),
(42, 6, 'isBrunch', 'text', 'IsBrunch', 0, 1, 1, 1, 1, 1, '{}', 7),
(43, 6, 'isLunch', 'text', 'IsLunch', 0, 1, 1, 1, 1, 1, '{}', 8),
(44, 6, 'isDinner', 'text', 'IsDinner', 0, 1, 1, 1, 1, 1, '{}', 9),
(45, 6, 'isMidnightSnack', 'text', 'IsMidnightSnack', 0, 1, 1, 1, 1, 1, '{}', 10),
(46, 6, 'foodMenu', 'text', 'FoodMenu', 0, 1, 1, 1, 1, 1, '{}', 11),
(47, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(48, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(50, 5, 'item_belongsto_restaurant_relationship', 'relationship', 'Restaurant Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Restaurant\",\"table\":\"restaurants\",\"type\":\"belongsTo\",\"column\":\"restaurant_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `data_types`
--
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:38:06
--

CREATE TABLE IF NOT EXISTS `data_types` (
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
(1, 'users', 'users', '用戶', '用戶', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(2, 'menus', 'menus', '側邊欄', '側邊欄', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(3, 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(4, 'orders', 'orders', '訂單', '訂單集', 'voyager-news', 'App\\Models\\Order', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"user_id\",\"order_direction\":\"asc\",\"default_search_key\":\"id\"}', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(5, 'items', 'items', '料理', '料理集', 'voyager-helm', 'App\\Models\\Item', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"restaurant_id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-09 01:22:01', '2023-02-09 01:38:06'),
(6, 'restaurants', 'restaurants', '餐廳', '餐廳集', 'voyager-ship', 'App\\Models\\Restaurant', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"updated_at\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-02-09 01:23:55', '2023-02-09 01:23:55');

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
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
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:28:26
--

CREATE TABLE IF NOT EXISTS `items` (
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
(1, 7, '是睡去，紅紅綠綠的。', 390, 'items/food (15).jpg', 1, 2, '2023-01-17 05:07:00', '2023-02-09 01:28:26'),
(2, 3, '香一封，到山裏去了。', 821, 'items/food (16).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(3, 1, '你開飯！」 我有些。', 62, 'items/food (1).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(4, 3, '人都吃驚的說。 “。', 369, 'items/food (10).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(5, 4, '夜為想變成一氣，犯。', 702, 'items/food (1).jpg', 1, 4, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(6, 1, '還記得的缺口。他們。', 983, 'items/food (8).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(7, 4, '虧王九媽卻不知道你。', 478, 'items/food (2).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(8, 1, '些話，——大蹋步走。', 163, 'items/food (17).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(9, 6, '之類。靠西牆上照例。', 833, 'items/food (11).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(10, 6, '”秀才因為自己的份。', 354, 'items/food (15).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(11, 6, '息說，“無師自通”。', 468, 'items/food (3).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(12, 4, '管顯出極惋惜的樣子。', 772, 'items/food (12).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(13, 3, '到什麼東西也少吃。', 547, 'items/food (4).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(14, 1, '一皺展開的嘴裏自言。', 871, 'items/food (3).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(15, 7, '著氣死），待見底。', 56, 'items/food (3).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(16, 2, '內盛食料，雞可以算。', 450, 'items/food (7).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(17, 7, '車把上帶著一條大白。', 988, 'items/food (1).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(18, 6, '社會上便以為不值一。', 276, 'items/food (13).jpg', 1, 9, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(19, 1, '有看不上別人的東西。', 305, 'items/food (4).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(20, 3, '裏的槐樹下一個人來。', 431, 'items/food (4).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(21, 7, '很有些什麼地方。他。', 837, 'items/food (18).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(22, 6, '令伊去哺乳不勻，不。', 146, 'items/food (8).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(23, 3, '「豆可中吃呢？”老。', 178, 'items/food (9).jpg', 1, 9, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(24, 7, '掌櫃都笑了。我買了。', 329, 'items/food (2).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(25, 3, '尋出這樣無限量的卑。', 714, 'items/food (9).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(26, 3, '這兩下；便覺得站不。', 542, 'items/food (13).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(27, 2, '和幾個蕭索的抖；終。', 239, 'items/food (10).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(28, 1, '他笑。孔乙己自己也。', 863, 'items/food (7).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(29, 1, '立“本傳”兩個字一。', 116, 'items/food (6).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(30, 1, '茶葉來，用鞋底。 。', 90, 'items/food (15).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(31, 2, '裏了，銀行已經留到。', 713, 'items/food (18).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(32, 7, '別處不知道我今天的。', 276, 'items/food (6).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(33, 1, '佛面前，永是不必說。', 630, 'items/food (18).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(34, 3, '路的人只是跳，使我。', 751, 'items/food (16).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(35, 1, '上一更，便又動搖起。', 515, 'items/food (9).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(36, 3, '那裏還會有這樣做。', 615, 'items/food (9).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(37, 7, '老栓面前過去了呢？', 590, 'items/food (8).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(38, 6, '籃，外祖母又怕早經。', 858, 'items/food (9).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(39, 4, '從魯鎮還有油菜早經。', 26, 'items/food (12).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(40, 6, '底之外，餘下的，可。', 657, 'items/food (18).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(41, 4, '要著，太太去鑒賞。', 673, 'items/food (10).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(42, 2, '志，忽而使我不能不。', 982, 'items/food (16).jpg', 1, 4, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(43, 5, '盡了心，至於半點鐘。', 942, 'items/food (3).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(44, 1, '單四嫂子等候天明。', 693, 'items/food (3).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(45, 7, '大約他從此決不憚于。', 902, 'items/food (5).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(46, 2, '”了：要革得我晚上。', 208, 'items/food (2).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(47, 1, '著寶兒的呼吸，幾個。', 669, 'items/food (13).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(48, 6, '在地上立著。入娘的。', 755, 'items/food (5).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(49, 1, '鋪在地上，像回覆轉。', 25, 'items/food (3).jpg', 1, 6, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(50, 5, '邊，都是他的母親對。', 185, 'items/food (11).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(51, 2, '似的迸散了。何況六。', 202, 'items/food (13).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(52, 7, '莊，月亮下去，但和。', 102, 'items/food (3).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(53, 2, '地，他的議論，也仍。', 64, 'items/food (3).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(54, 4, '去的，原來有時也疑。', 486, 'items/food (5).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(55, 5, '許可了。而且仵作也。', 977, 'items/food (10).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(56, 6, '數。你看，照著空屋。', 933, 'items/food (5).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(57, 5, '的時候；現在終于沒。', 891, 'items/food (11).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(58, 7, '家的東西，什麽似的。', 379, 'items/food (9).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(59, 7, '外的崇奉，他忽而記。', 390, 'items/food (3).jpg', 1, 4, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(60, 3, '的故鄉好得多了，但。', 948, 'items/food (15).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(61, 4, '起蘿蔔便走，不坐了。', 831, 'items/food (12).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(62, 2, '說道，「不能已于言。', 495, 'items/food (6).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(63, 3, '都竦然的回來？……。', 502, 'items/food (9).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(64, 7, '他纔感得勝的躺下便。', 715, 'items/food (7).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(65, 3, '忽而大家主張繼續罷。', 847, 'items/food (9).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(66, 1, '租怎樣的好豆，就不。', 968, 'items/food (17).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(67, 2, '去了一通，口訥的他。', 655, 'items/food (15).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(68, 7, '鳥男女的慌張的四顧。', 717, 'items/food (18).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(69, 1, '的東西，………短見。', 268, 'items/food (18).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(70, 3, '譯出的新聞。七斤嫂。', 889, 'items/food (3).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(71, 4, '兩個眼眶，笑道，。', 440, 'items/food (2).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(72, 5, '鐮槍，和許多的賭攤。', 427, 'items/food (4).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(73, 2, '悟了，這就是這一定。', 933, 'items/food (4).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(74, 1, '全住了我家只能下了。', 805, 'items/food (8).jpg', 1, 9, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(75, 7, '很大的黑眼睛講得正。', 936, 'items/food (5).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(76, 5, '圓實的羅漢豆。」 。', 559, 'items/food (13).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(77, 2, '櫃臺喝酒，便禁不住。', 133, 'items/food (14).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(78, 7, '理之外，就像我，漸。', 679, 'items/food (5).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(79, 1, '向秀才者也許是感到。', 188, 'items/food (11).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(80, 1, '了深黛顏色，阿Q。', 205, 'items/food (7).jpg', 1, 9, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(81, 7, '但得到好處；連六斤。', 946, 'items/food (13).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(82, 7, '而拍拍！ “我要投。', 624, 'items/food (9).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(83, 6, '紅鼻子老拱之類了。', 183, 'items/food (15).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(84, 2, '對他嚷道，怕還是先。', 235, 'items/food (9).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(85, 5, '不算外，餘下的了。', 404, 'items/food (4).jpg', 1, 4, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(86, 4, '的思想仿佛在他嘴巴。', 399, 'items/food (7).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(87, 3, '以為人生下來的文章。', 67, 'items/food (10).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(88, 1, '著，寶兒的鼻尖都沁。', 197, 'items/food (8).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(89, 1, '的發起怒來，很不快。', 551, 'items/food (11).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(90, 1, '多闊人停了船，決不。', 649, 'items/food (13).jpg', 1, 10, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(91, 7, '說，這人一顆。孩子。', 660, 'items/food (8).jpg', 1, 5, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(92, 2, '…… “造反了！」', 21, 'items/food (3).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(93, 2, '而覺得寒冷的落水。', 863, 'items/food (14).jpg', 1, 2, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(94, 2, '化過紙，並非就是阿。', 542, 'items/food (8).jpg', 1, 1, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(95, 3, '前來，拚命的時候跳。', 489, 'items/food (13).jpg', 1, 7, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(96, 1, '倒有，又加上切細的。', 331, 'items/food (11).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(97, 6, '也想進城去，也未曾。', 924, 'items/food (6).jpg', 1, 8, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(98, 2, '個人詫異了：怎麼樣。', 902, 'items/food (4).jpg', 1, 4, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(99, 5, '我的左邊的一篇並非。', 484, 'items/food (17).jpg', 1, 0, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(100, 4, '令弟叫阿Q更快。 。', 494, 'items/food (7).jpg', 1, 3, '2023-01-17 05:07:27', '2023-01-17 05:07:27');

-- --------------------------------------------------------

--
-- 資料表結構 `item_order`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `item_order` (
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
-- 資料表結構 `item_users`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `item_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `item_users`:
--   `item_id`
--       `items` -> `id`
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `item_users`
--

TRUNCATE TABLE `item_users`;
-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `menus` (
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
(1, 'admin', '2023-01-16 11:08:12', '2023-01-16 11:08:12');

-- --------------------------------------------------------

--
-- 資料表結構 `menu_items`
--
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:23:55
--

CREATE TABLE IF NOT EXISTS `menu_items` (
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
(1, 1, '控制面板', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.dashboard', NULL),
(2, 1, '媒體', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.media.index', NULL),
(3, 1, '用戶', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.users.index', NULL),
(4, 1, '角色', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.roles.index', NULL),
(5, 1, '工具', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-01-16 11:08:12', '2023-01-16 11:08:12', NULL, NULL),
(6, 1, '側邊欄管理', '', '_self', 'voyager-list', NULL, 5, 10, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.menus.index', NULL),
(7, 1, '資料庫', '', '_self', 'voyager-data', NULL, 5, 11, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.database.index', NULL),
(8, 1, '指南針', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.bread.index', NULL),
(10, 1, '設定', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-01-16 11:08:12', '2023-01-16 11:08:12', 'voyager.settings.index', NULL),
(11, 1, '訂單集', '', '_self', 'voyager-news', NULL, NULL, 15, '2023-01-16 11:22:02', '2023-01-16 11:22:02', 'voyager.orders.index', NULL),
(12, 1, '菜單集', '', '_self', 'voyager-helm', NULL, NULL, 16, '2023-02-09 01:22:01', '2023-02-09 01:22:01', 'voyager.items.index', NULL),
(13, 1, '餐廳集', '', '_self', 'voyager-ship', NULL, NULL, 17, '2023-02-09 01:23:55', '2023-02-09 01:23:55', 'voyager.restaurants.index', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `migrations` (
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2016_01_01_000000_add_voyager_user_fields', 1),
(5, '2016_01_01_000000_create_data_types_table', 1),
(6, '2016_05_19_173453_create_menu_table', 1),
(7, '2016_10_21_190000_create_roles_table', 1),
(8, '2016_10_21_190000_create_settings_table', 1),
(9, '2016_11_30_135954_create_permission_table', 1),
(10, '2016_11_30_141208_create_permission_role_table', 1),
(11, '2016_12_26_201236_data_types__add__server_side', 1),
(12, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(13, '2017_01_14_005015_create_translations_table', 1),
(14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(15, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(16, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(17, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(18, '2017_08_05_000000_add_group_to_settings_table', 1),
(19, '2017_11_26_013050_add_user_role_relationship', 1),
(20, '2017_11_26_015000_create_user_roles_table', 1),
(21, '2018_03_11_000000_add_user_settings', 1),
(22, '2018_03_14_000000_add_details_to_data_types_table', 1),
(23, '2018_03_16_000000_make_settings_value_nullable', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(26, '2023_01_11_145805_create_restaurants_table', 1),
(27, '2023_01_11_145847_create_items_table', 1),
(28, '2023_01_11_152450_create_orders_table', 1),
(29, '2023_01_12_083700_create_reviews_table', 1),
(30, '2023_01_12_084042_create_item_order_table', 1),
(31, '2023_01_13_233319_create_item_users_table', 1),
(32, '2023_01_16_111518_create_on_duty_table', 1),
(33, '2023_01_16_111739_create_today_restaurants_table', 1),
(34, '2023_01_16_180726_create_tags_table', 1),
(35, '2023_01_16_181208_create_restaurant_tag_table', 1),
(36, '2023_01_16_190717_create_sessions_table', 1),
(38, '2023_01_16_201109_create_restaurant_user_table', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `on_duty`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `on_duty` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `on_duty`:
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `on_duty`
--

TRUNCATE TABLE `on_duty`;
-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--
-- 建立時間： 2023-01-31 02:32:46
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `password_resets` (
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
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:23:55
--

CREATE TABLE IF NOT EXISTS `permissions` (
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
(1, 'browse_admin', NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(2, 'browse_bread', NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(3, 'browse_database', NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(4, 'browse_media', NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(5, 'browse_compass', NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(6, 'browse_menus', 'menus', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(7, 'read_menus', 'menus', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(8, 'edit_menus', 'menus', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(9, 'add_menus', 'menus', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(10, 'delete_menus', 'menus', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(11, 'browse_roles', 'roles', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(12, 'read_roles', 'roles', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(13, 'edit_roles', 'roles', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(14, 'add_roles', 'roles', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(15, 'delete_roles', 'roles', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(16, 'browse_users', 'users', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(17, 'read_users', 'users', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(18, 'edit_users', 'users', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(19, 'add_users', 'users', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(20, 'delete_users', 'users', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(21, 'browse_settings', 'settings', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(22, 'read_settings', 'settings', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(23, 'edit_settings', 'settings', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(24, 'add_settings', 'settings', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(25, 'delete_settings', 'settings', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(26, 'browse_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(27, 'read_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(28, 'edit_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(29, 'add_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(30, 'delete_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02'),
(31, 'browse_items', 'items', '2023-02-09 01:22:01', '2023-02-09 01:22:01'),
(32, 'read_items', 'items', '2023-02-09 01:22:01', '2023-02-09 01:22:01'),
(33, 'edit_items', 'items', '2023-02-09 01:22:01', '2023-02-09 01:22:01'),
(34, 'add_items', 'items', '2023-02-09 01:22:01', '2023-02-09 01:22:01'),
(35, 'delete_items', 'items', '2023-02-09 01:22:01', '2023-02-09 01:22:01'),
(36, 'browse_restaurants', 'restaurants', '2023-02-09 01:23:55', '2023-02-09 01:23:55'),
(37, 'read_restaurants', 'restaurants', '2023-02-09 01:23:55', '2023-02-09 01:23:55'),
(38, 'edit_restaurants', 'restaurants', '2023-02-09 01:23:55', '2023-02-09 01:23:55'),
(39, 'add_restaurants', 'restaurants', '2023-02-09 01:23:55', '2023-02-09 01:23:55'),
(40, 'delete_restaurants', 'restaurants', '2023-02-09 01:23:55', '2023-02-09 01:23:55');

-- --------------------------------------------------------

--
-- 資料表結構 `permission_role`
--
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 01:23:55
--

CREATE TABLE IF NOT EXISTS `permission_role` (
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
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `restaurants` (
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
(1, '遊戲橘子有限公司', 'restaurants/餐廳 (8).jpg', '(05)1757068', '濱一街七段40巷899號2樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(2, '芮河股份有限公司', 'restaurants/餐廳 (1).jpg', '(007)111-914', '青島一街六段306號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(3, '巨室企業公司', 'restaurants/餐廳 (8).jpg', '(02)99977659', '濟南街239巷43號80樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(4, '阿爾發娛樂', 'restaurants/餐廳 (2).jpg', '0918363214', '自強九路五段400巷703號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(5, '野火樂集數位', 'restaurants/餐廳 (8).jpg', '+886953338401', '新興三街81巷856弄311號5樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(6, '當然文化', 'restaurants/餐廳 (10).jpg', '+886-902-210-224', '頂橫路六段297巷184弄441號11樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(7, '創見公司', 'restaurants/餐廳 (7).jpg', '(024)483090', '崇德十二路815巷868號17樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(8, '大國百貨公司', 'restaurants/餐廳 (5).jpg', '(059)307368', '重化街584巷215弄907號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(9, '添翼創越集團有限公司', 'restaurants/餐廳 (4).jpg', '(02)68328419', '下莊新生路929號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(10, '凱基工業', 'restaurants/餐廳 (2).jpg', '(03)3010947', '八張二路299巷964弄497號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(11, '華碩股份有限公司', 'restaurants/餐廳 (3).jpg', '(02)57717465', '嘉豐九街六段801號30樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(12, '角頭唱片公司', 'restaurants/餐廳 (9).jpg', '0953524206', '宜平路一段224巷438弄319號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(13, '多利安證券', 'restaurants/餐廳 (2).jpg', '+886-907-394-395', '西十四街一段633號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(14, '弘煜公司', 'restaurants/餐廳 (8).jpg', '(05)150-5860', '贊庄大仁街九段365巷503號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(15, '多利安股份有限公司', 'restaurants/餐廳 (7).jpg', '+886-964-996-145', '明鳳五路三段922號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(16, '滾石證券', 'restaurants/餐廳 (3).jpg', '(020)673609', '東泰二路269巷121弄455號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(17, '前衛花園酒店', 'restaurants/餐廳 (4).jpg', '+886-997-919-289', '尚德街八段7巷370號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(18, '小白兔有限公司', 'restaurants/餐廳 (1).jpg', '0994-526-032', '百五路896巷405弄835號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(19, '華特集團', 'restaurants/餐廳 (3).jpg', '(044)857413', '北辰一路一段34巷287弄602號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(20, '茂為數位股份有限公司', 'restaurants/餐廳 (2).jpg', '(01)4860776', '吉利四路303巷369弄82號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(21, '茂為百貨', 'restaurants/餐廳 (10).jpg', '0987532118', '國盛八路五段665巷367號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(22, '智冠企業有限公司', 'restaurants/餐廳 (9).jpg', '(06)2689259', '精武街一段4巷297號82樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(23, '亞神酒店公司', 'restaurants/餐廳 (1).jpg', '(07)448-2914', '新興海埔地五街237巷10弄449號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(24, '康師傅電腦公司', 'restaurants/餐廳 (10).jpg', '(01)885-5892', '中華南街七段970巷478號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(25, '福茂有限公司', 'restaurants/餐廳 (10).jpg', '(02)6485-7997', '文匯路九段336號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(26, '合勤娛樂股份有限公司', 'restaurants/餐廳 (5).jpg', '(004)171-520', '線東街五段909號19樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(27, '未來企業股份有限公司', 'restaurants/餐廳 (6).jpg', '(025)007-146', '福陽路283巷900號21樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(28, '喜瑪拉雅證券有限公司', 'restaurants/餐廳 (9).jpg', '+886-932-402-645', '楓林十街三段569巷996號50樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(29, '弘煜音樂', 'restaurants/餐廳 (9).jpg', '(07)2522777', '文館街696號', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(30, '群石唱片', 'restaurants/餐廳 (3).jpg', '(024)605-962', '德正路166巷169號93樓', 1, 1, 1, 1, 1, NULL, '2023-01-17 05:07:27', '2023-01-17 05:07:27');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_tag`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `restaurant_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `restaurant_tag`:
--   `restaurant_id`
--       `restaurants` -> `id`
--   `tag_id`
--       `tags` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `restaurant_tag`
--

TRUNCATE TABLE `restaurant_tag`;
--
-- 傾印資料表的資料 `restaurant_tag`
--

INSERT INTO `restaurant_tag` (`id`, `restaurant_id`, `tag_id`, `color`, `created_at`, `updated_at`) VALUES
(1, 18, 10, '#FF0000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(2, 96, 13, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(3, 23, 22, '#FFFFFF', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(4, 36, 14, '#FF0000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(5, 39, 6, '#FFFFFF', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(6, 24, 30, '#FFFFFF', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(7, 5, 18, '#FFFFFF', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(8, 84, 18, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(9, 3, 19, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(10, 68, 24, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(11, 78, 11, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(12, 36, 14, '#000000', '2023-01-17 05:07:27', '2023-01-17 05:07:27'),
(13, 34, 30, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(14, 89, 20, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(15, 6, 26, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(16, 3, 20, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(17, 51, 1, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(18, 35, 23, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(19, 50, 15, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(20, 52, 10, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(21, 89, 2, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(22, 67, 12, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(23, 75, 5, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(24, 61, 28, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(25, 58, 24, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(26, 80, 15, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(27, 25, 23, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(28, 84, 23, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(29, 70, 20, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(30, 78, 19, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(31, 60, 14, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(32, 30, 20, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(33, 26, 17, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(34, 17, 3, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(35, 98, 6, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(36, 97, 7, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(37, 51, 14, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(38, 70, 16, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(39, 58, 30, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(40, 81, 14, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(41, 61, 25, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(42, 18, 25, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(43, 63, 1, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(44, 8, 1, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(45, 87, 29, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(46, 47, 12, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(47, 66, 8, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(48, 22, 14, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(49, 44, 14, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(50, 21, 11, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(51, 13, 18, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(52, 73, 27, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(53, 46, 11, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(54, 8, 10, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(55, 44, 19, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(56, 83, 10, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(57, 30, 9, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(58, 26, 5, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(59, 50, 23, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(60, 13, 18, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(61, 22, 8, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(62, 36, 12, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(63, 99, 23, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(64, 71, 10, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(65, 47, 30, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(66, 16, 21, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(67, 98, 21, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(68, 49, 14, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(69, 94, 30, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(70, 65, 11, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(71, 72, 10, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(72, 45, 16, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(73, 78, 30, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(74, 50, 2, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(75, 1, 17, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(76, 97, 3, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(77, 83, 24, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(78, 88, 21, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(79, 78, 8, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(80, 78, 26, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(81, 27, 18, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(82, 72, 8, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(83, 53, 8, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(84, 17, 11, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(85, 15, 26, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(86, 53, 21, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(87, 49, 6, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(88, 67, 8, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(89, 35, 20, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(90, 82, 13, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(91, 81, 4, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(92, 62, 3, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(93, 33, 19, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(94, 3, 6, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(95, 97, 24, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(96, 23, 27, '#000000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(97, 100, 19, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(98, 63, 21, '#FF0000', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(99, 28, 21, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(100, 77, 26, '#FFFFFF', '2023-01-17 05:07:28', '2023-01-17 05:07:28');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_user`
--
-- 建立時間： 2023-01-17 02:39:09
--

CREATE TABLE IF NOT EXISTS `restaurant_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `restaurant_user`:
--   `restaurant_id`
--       `restaurants` -> `id`
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `restaurant_user`
--

TRUNCATE TABLE `restaurant_user`;
--
-- 傾印資料表的資料 `restaurant_user`
--

INSERT INTO `restaurant_user` (`id`, `restaurant_id`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 1, 2, '2023-01-31 02:06:35', '2023-01-31 02:06:35');

-- --------------------------------------------------------

--
-- 資料表結構 `reviews`
--
-- 建立時間： 2023-01-31 03:50:08
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `reviews`:
--   `restaurant_id`
--       `restaurants` -> `id`
--   `user_id`
--       `users` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `reviews`
--

TRUNCATE TABLE `reviews`;
--
-- 傾印資料表的資料 `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `restaurant_id`, `rate`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 3, '所以我說那個醬汁呢？', '2023-01-31 02:46:18', '2023-01-31 02:46:18'),
(2, 2, 1, 3, '所以我說那個醬汁呢？', '2023-01-31 02:46:19', '2023-01-31 02:46:19'),
(3, 2, 1, 3, '所以我說那個醬汁呢？', '2023-01-31 02:46:19', '2023-01-31 02:46:19'),
(4, 2, 1, 5, NULL, '2023-01-31 03:50:21', '2023-01-31 03:50:21'),
(5, 2, 3, 5, NULL, '2023-02-07 01:11:40', '2023-02-07 01:11:40'),
(6, 2, 2, 3, NULL, '2023-02-07 01:12:07', '2023-02-07 01:12:07'),
(7, 2, 2, 5, NULL, '2023-02-07 01:12:25', '2023-02-07 01:12:25');

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `roles` (
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
(1, 'admin', '管理員', '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(2, 'user', '普通用戶', '2023-01-16 11:08:12', '2023-01-16 11:08:12');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 06:53:34
--

CREATE TABLE IF NOT EXISTS `sessions` (
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
('n7Zyypkf7NMF8S4jMlOdcKYAVniMkqWMmfqVZ4i8', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiWWkzdHVucFdFaWNmTHU3NVBTbXUxTndacFlBeFlvYXAzRzhRTGlHeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9tYXguY29tOjY2Ni9mYW5hcnQvcHVibGljL2luZGV4Ijt9czozOiJ1cmwiO2E6MDp7fXM6NDoibmFtZSI7czozOiJNYXgiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkNVdNRkp0MHFHRmU3SE9pcEtaa2REZWIudUhvSHZMY09HRVhMS2NYYnNpbUtwVERkZ3N2cC4iO3M6MTA6InJlc3RhdXJhbnQiO3M6MToiNSI7czoxMjoiM19jYXJ0X2l0ZW1zIjtPOjMyOiJEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntpOjUwO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjozOntzOjg6IgAqAGl0ZW1zIjthOjc6e3M6MjoiaWQiO2k6NTA7czo0OiJuYW1lIjtzOjMwOiLpgorvvIzpg73mmK/ku5bnmoTmr43opqrlsI3jgIIiO3M6NToicHJpY2UiO2k6MTg1O3M6ODoicXVhbnRpdHkiO2k6MjtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjEwOiJjb25kaXRpb25zIjthOjA6e31zOjE1OiJhc3NvY2lhdGVkTW9kZWwiO086MjE6IkFwcFxNb2RlbHNcUmVzdGF1cmFudCI6MzA6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTE6InJlc3RhdXJhbnRzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTM6e3M6MjoiaWQiO2k6NTtzOjQ6Im5hbWUiO3M6MTg6IumHjueBq+aogumbhuaVuOS9jSI7czo1OiJjb3ZlciI7czoyNjoicmVzdGF1cmFudHMv6aSQ5buzICg4KS5qcGciO3M6MzoidGVsIjtzOjEzOiIrODg2OTUzMzM4NDAxIjtzOjc6ImFkZHJlc3MiO3M6MzM6IuaWsOiIiOS4ieihlzgx5be3ODU25byEMzEx6JmfNeaokyI7czo3OiJlbmFibGVkIjtpOjE7czo4OiJpc0JydW5jaCI7aToxO3M6NzoiaXNMdW5jaCI7aToxO3M6ODoiaXNEaW5uZXIiO2k6MTtzOjE1OiJpc01pZG5pZ2h0U25hY2siO2k6MTtzOjg6ImZvb2RNZW51IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjMtMDEtMTcgMTM6MDc6MjciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjMtMDEtMTcgMTM6MDc6MjciO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czoxODoi6YeO54Gr5qiC6ZuG5pW45L2NIjtzOjU6ImNvdmVyIjtzOjI2OiJyZXN0YXVyYW50cy/ppJDlu7MgKDgpLmpwZyI7czozOiJ0ZWwiO3M6MTM6Iis4ODY5NTMzMzg0MDEiO3M6NzoiYWRkcmVzcyI7czozMzoi5paw6IiI5LiJ6KGXODHlt7c4NTblvIQzMTHomZ815qiTIjtzOjc6ImVuYWJsZWQiO2k6MTtzOjg6ImlzQnJ1bmNoIjtpOjE7czo3OiJpc0x1bmNoIjtpOjE7czo4OiJpc0Rpbm5lciI7aToxO3M6MTU6ImlzTWlkbmlnaHRTbmFjayI7aToxO3M6ODoiZm9vZE1lbnUiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xNyAxMzowNzoyNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xNyAxMzowNzoyNyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czo5OiIAKgBjb25maWciO2E6Njp7czoxNDoiZm9ybWF0X251bWJlcnMiO2I6MDtzOjg6ImRlY2ltYWxzIjtpOjA7czo5OiJkZWNfcG9pbnQiO3M6MToiLiI7czoxMzoidGhvdXNhbmRzX3NlcCI7czoxOiIsIjtzOjc6InN0b3JhZ2UiO047czo2OiJldmVudHMiO047fX19czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319', 1675925614);

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `settings` (
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
-- 資料表結構 `tags`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `tags`:
--

--
-- 資料表新增資料前，先清除舊資料 `tags`
--

TRUNCATE TABLE `tags`;
--
-- 傾印資料表的資料 `tags`
--

INSERT INTO `tags` (`id`, `title`, `url`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'distinctio', 'http://www.ai.com/velit-aut-est-doloribus-praesentium-id-fugit-unde', 20, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(2, 'ducimus', 'http://yan.com/possimus-explicabo-non-dolorum-ipsa-sed-magnam', 79, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(3, 'vitae', 'http://www.fang.com/molestiae-quidem-facilis-quia-veritatis-quisquam', 77, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(4, 'dolor', 'https://yan.biz/aperiam-dolorem-laudantium-voluptas-accusantium-impedit-reprehenderit-ut.html', 1, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(5, 'non', 'http://yao.com/perferendis-aut-aut-velit-hic-est-accusamus-rerum-tenetur', 10, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(6, 'odit', 'http://shi.info/officia-ut-in-illum-quis-et-eos-amet', 9, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(7, 'fuga', 'https://lezheng.com/mollitia-ut-hic-voluptas-non.html', 9, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(8, 'non', 'http://www.lan.com/', 72, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(9, 'quos', 'http://www.zhen.net/ut-totam-voluptatem-corporis-ad-ut-est', 74, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(10, 'odio', 'http://cui.com/', 14, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(11, 'excepturi', 'http://feng.net/quo-optio-dolores-consequatur-itaque.html', 81, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(12, 'quia', 'http://xi.biz/', 80, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(13, 'voluptas', 'http://www.ximen.com/', 25, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(14, 'labore', 'http://www.lai.org/qui-optio-aut-aut-ex', 86, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(15, 'aliquid', 'http://www.qu.com/nemo-repudiandae-voluptas-ratione-vel-et-rerum-optio', 44, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(16, 'adipisci', 'http://ji.com/optio-qui-vel-iste-et-aspernatur-architecto-necessitatibus', 3, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(17, 'est', 'http://www.lou.com/ex-facere-accusamus-repudiandae-velit-iusto.html', 65, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(18, 'nemo', 'http://www.yuan.com/', 69, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(19, 'facere', 'https://xi.info/dolorem-quas-dolores-ut-nulla-omnis.html', 18, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(20, 'qui', 'https://jiao.net/ea-officiis-accusantium-perferendis-nobis-nobis-soluta.html', 44, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(21, 'eum', 'http://feng.org/repellendus-atque-optio-natus-omnis-cupiditate-voluptatem-ut', 99, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(22, 'unde', 'http://www.xiang.biz/vel-nesciunt-magni-earum-ut', 48, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(23, 'unde', 'http://www.yin.info/pariatur-quia-aut-quasi-repudiandae-assumenda-voluptatem-aut', 95, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(24, 'libero', 'https://www.shang.com/accusamus-itaque-cum-consectetur-delectus', 48, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(25, 'non', 'https://www.gui.info/facere-at-doloribus-recusandae-autem-sed-dolore', 51, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(26, 'at', 'https://puyang.com/occaecati-nihil-ut-nostrum-est.html', 67, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(27, 'impedit', 'http://www.tu.com/facilis-pariatur-quisquam-expedita-consequatur-eum-itaque-harum.html', 18, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(28, 'nam', 'http://gong.net/repellendus-blanditiis-ipsum-hic-assumenda-qui', 65, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(29, 'voluptatem', 'https://le.com/vero-quia-sed-tempore-labore-qui-consequuntur-ut.html', 36, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(30, 'aliquam', 'https://gu.info/voluptatem-nam-et-id-delectus-sint-in-pariatur.html', 77, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(31, 'et', 'http://zhuang.com/debitis-dignissimos-voluptates-quibusdam-rerum-ea', 42, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(32, 'aut', 'http://xiao.com/eius-beatae-alias-sint-ducimus-adipisci.html', 82, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(33, 'sequi', 'http://lei.com/', 77, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(34, 'numquam', 'http://www.duangan.info/', 30, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(35, 'qui', 'https://www.jin.net/asperiores-animi-id-quia-tempora', 73, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(36, 'dolore', 'https://yi.info/deleniti-veniam-sint-ratione-et-quia-dicta.html', 2, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(37, 'repellendus', 'http://bao.net/', 98, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(38, 'maiores', 'http://yu.net/dolor-quos-animi-sit-eum-labore-quidem-et', 11, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(39, 'voluptatem', 'https://www.zhong.net/tempore-voluptates-aut-voluptatibus-reprehenderit', 9, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(40, 'enim', 'http://si.com/ut-dolorem-quidem-atque-sint', 49, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(41, 'deleniti', 'http://shui.info/exercitationem-earum-minus-officia-ut-provident', 53, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(42, 'itaque', 'https://www.jin.com/nostrum-facere-soluta-officiis-recusandae-consequatur-placeat', 27, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(43, 'non', 'http://tan.com/velit-aut-et-quis-saepe-omnis', 26, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(44, 'neque', 'http://song.com/praesentium-soluta-qui-laborum-tempora', 76, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(45, 'quo', 'https://www.wu.org/ut-sit-earum-necessitatibus-eaque-fuga-minus', 4, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(46, 'aut', 'http://ai.com/', 61, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(47, 'in', 'http://www.shan.com/', 89, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(48, 'excepturi', 'http://hong.com/', 35, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(49, 'eos', 'http://www.ping.com/', 43, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(50, 'non', 'http://www.jiao.com/nostrum-adipisci-iusto-quam-quidem-veritatis', 24, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(51, 'ut', 'https://www.guan.com/alias-et-accusamus-vero-consequatur', 21, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(52, 'aliquid', 'https://www.hua.com/consectetur-perferendis-consequatur-qui-et-est', 9, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(53, 'et', 'https://yao.com/nemo-maiores-eos-dolore-aut-est.html', 58, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(54, 'reiciendis', 'http://taishu.org/quasi-perspiciatis-laboriosam-sunt-pariatur-autem-enim-ab', 19, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(55, 'amet', 'https://yu.com/voluptas-incidunt-dicta-in-quis-non-doloribus.html', 54, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(56, 'error', 'http://www.meng.net/dolores-ipsam-impedit-dicta-sed.html', 69, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(57, 'molestias', 'http://jiang.com/voluptas-vel-eum-eum-nulla-quam-id-odit-veniam', 34, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(58, 'voluptatem', 'https://www.tang.net/molestias-earum-ut-molestiae-est-tenetur-deserunt-sint', 57, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(59, 'sed', 'http://yin.com/repellat-neque-commodi-odio-et-ut', 94, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(60, 'necessitatibus', 'http://dong.org/accusantium-repellendus-assumenda-voluptas-hic-at-fuga-facilis', 82, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(61, 'fugiat', 'https://www.pan.org/quae-nobis-consectetur-quia-ducimus-voluptates-reiciendis-ad-sint', 96, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(62, 'adipisci', 'http://gui.com/', 42, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(63, 'ipsum', 'http://www.he.com/molestiae-quo-facilis-ad-praesentium-est-tempora-odio.html', 57, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(64, 'ab', 'https://jian.biz/voluptas-ducimus-officiis-voluptatem-dolore-accusantium-harum-nobis.html', 47, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(65, 'quisquam', 'http://zai.com/sit-nam-dolorem-quos-est-omnis-fuga-autem-excepturi.html', 22, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(66, 'hic', 'https://zhuge.com/quidem-vel-delectus-illum-iure.html', 28, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(67, 'aliquid', 'http://www.chao.com/animi-cupiditate-vel-officia-quia', 18, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(68, 'distinctio', 'http://wei.org/ex-consequuntur-earum-sed-voluptatem-et-quia.html', 3, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(69, 'qui', 'http://hou.com/', 19, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(70, 'omnis', 'http://zhan.com/', 11, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(71, 'labore', 'https://yang.com/quia-voluptatibus-unde-cum.html', 97, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(72, 'voluptate', 'http://pei.com/sint-accusantium-saepe-ducimus-odit-in-rerum-repellat', 43, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(73, 'deleniti', 'http://www.long.biz/id-quia-ut-ut-doloremque.html', 94, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(74, 'quia', 'http://www.zhongsun.com/aut-dolorum-et-qui-cumque-voluptatem.html', 63, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(75, 'est', 'https://zi.com/perspiciatis-labore-ut-error-occaecati-et-esse-veniam-quisquam.html', 60, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(76, 'voluptate', 'http://www.hua.com/sed-dolor-architecto-perferendis-fugit-facilis-occaecati-ab.html', 62, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(77, 'dolores', 'http://hu.org/non-ullam-dolores-sint-minima-reiciendis', 47, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(78, 'quae', 'http://www.gui.com/rerum-velit-dolorem-consequatur-natus.html', 53, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(79, 'minus', 'http://mei.com/rerum-maxime-ex-quisquam-error-ad-asperiores-similique.html', 15, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(80, 'sed', 'http://www.jia.info/cum-dolores-animi-vel-laborum-magni-consectetur.html', 87, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(81, 'rem', 'http://liu.com/explicabo-repellat-et-quidem-corporis-et-provident-vel', 49, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(82, 'odit', 'http://wo.info/corporis-deserunt-veniam-fugiat-repudiandae-ab-veniam.html', 76, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(83, 'occaecati', 'http://xu.biz/accusamus-laudantium-veniam-rerum-deleniti', 74, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(84, 'cupiditate', 'http://hui.biz/', 19, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(85, 'et', 'http://www.hu.info/nihil-accusamus-ut-eligendi-adipisci-dolor-consectetur', 89, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(86, 'culpa', 'http://you.com/sed-ipsum-ea-voluptatem.html', 98, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(87, 'sit', 'http://www.na.com/', 16, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(88, 'corrupti', 'https://www.yang.com/quo-ea-a-ducimus-perspiciatis-molestiae-iure', 68, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(89, 'id', 'http://hua.com/quaerat-blanditiis-unde-autem-similique-enim-perspiciatis-vero.html', 71, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(90, 'omnis', 'https://li.com/et-fugiat-molestiae-alias-dolor.html', 30, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(91, 'placeat', 'http://www.huangfu.com/', 70, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(92, 'error', 'http://www.shentu.net/non-alias-magnam-dicta-quisquam-dolor-optio-at-qui.html', 33, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(93, 'nobis', 'http://quan.com/quia-quidem-aut-voluptatem-commodi-culpa', 91, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(94, 'rerum', 'https://www.jian.com/provident-suscipit-vel-voluptatem-molestias', 100, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(95, 'voluptatem', 'http://www.suo.com/doloremque-consectetur-assumenda-minima-atque-quo-non-animi', 18, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(96, 'aut', 'http://zan.info/nam-sint-inventore-quae-voluptatem-et-eius.html', 68, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(97, 'voluptates', 'http://www.liao.com/', 98, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(98, 'ut', 'http://www.ju.org/quo-non-iste-voluptatum-laudantium-ut-enim.html', 58, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(99, 'et', 'http://www.bo.info/et-voluptatibus-vel-officia-perferendis', 12, '2023-01-17 05:07:28', '2023-01-17 05:07:28'),
(100, 'aut', 'http://www.mo.com/beatae-praesentium-rem-et-pariatur', 45, '2023-01-17 05:07:28', '2023-01-17 05:07:28');

-- --------------------------------------------------------

--
-- 資料表結構 `today_restaurants`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `today_restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的關聯 `today_restaurants`:
--   `restaurant_id`
--       `restaurants` -> `id`
--

--
-- 資料表新增資料前，先清除舊資料 `today_restaurants`
--

TRUNCATE TABLE `today_restaurants`;
-- --------------------------------------------------------

--
-- 資料表結構 `translations`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `translations` (
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
-- 建立時間： 2023-01-17 00:46:12
-- 最後更新： 2023-02-09 03:12:47
--

CREATE TABLE IF NOT EXISTS `users` (
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
(1, 1, 'admin', 'admin@admin.com', 'users\\January2023\\lwT6EvTa4nNcILOt91dQ.png', NULL, '$2y$10$TyST9qnTnFBNexc4djzFFuL.2XR5jJXXpGCjPiE44KBDqWHxguxai', NULL, NULL, NULL, NULL, '{\"locale\":\"zh_TW\"}', NULL, NULL, '2023-01-16 11:09:05', '2023-01-17 03:25:24'),
(2, 2, 'User', 'user@user.com', 'users/default.png', NULL, '$2y$10$/Ks4uDc6LySpgeefYSSlcuy.aVK0utkH6Dp5a2p/USBNkVcv56R82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-17 02:24:57', '2023-01-17 02:24:57'),
(3, 2, 'Max', 'maxfromsea36@gmail.com', 'users/default.png', NULL, '$2y$10$5WMFJt0qGFe7HOipKZkdDeb.uHoHvLcOGEXLKcXbsimKpTDdgsvp.', NULL, NULL, NULL, 'UwAkcyMseSB2HVKozUdMGYyw6aUx75eLwaVUgCP4mx7ombbbKFcr6amJaNQP', NULL, NULL, NULL, '2023-02-09 02:53:07', '2023-02-09 02:53:07');

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--
-- 建立時間： 2023-01-17 00:46:12
--

CREATE TABLE IF NOT EXISTS `user_roles` (
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
-- 資料表索引 `item_users`
--
ALTER TABLE `item_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_users_item_id_foreign` (`item_id`),
  ADD KEY `item_users_user_id_foreign` (`user_id`);

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
-- 資料表索引 `on_duty`
--
ALTER TABLE `on_duty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `on_duty_user_id_foreign` (`user_id`);

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
-- 資料表索引 `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_tag_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_tag_tag_id_foreign` (`tag_id`);

--
-- 資料表索引 `restaurant_user`
--
ALTER TABLE `restaurant_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_user_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_user_user_id_foreign` (`user_id`);

--
-- 資料表索引 `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_restaurant_id_foreign` (`restaurant_id`) USING BTREE;

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
-- 資料表索引 `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `today_restaurants`
--
ALTER TABLE `today_restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `today_restaurants_restaurant_id_foreign` (`restaurant_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `item_users`
--
ALTER TABLE `item_users`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `on_duty`
--
ALTER TABLE `on_duty`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_user`
--
ALTER TABLE `restaurant_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `today_restaurants`
--
ALTER TABLE `today_restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- 資料表的限制式 `item_users`
--
ALTER TABLE `item_users`
  ADD CONSTRAINT `item_users_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `on_duty`
--
ALTER TABLE `on_duty`
  ADD CONSTRAINT `on_duty_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- 資料表的限制式 `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  ADD CONSTRAINT `restaurant_tag_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `restaurant_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- 資料表的限制式 `restaurant_user`
--
ALTER TABLE `restaurant_user`
  ADD CONSTRAINT `restaurant_user_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `restaurant_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_res_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `today_restaurants`
--
ALTER TABLE `today_restaurants`
  ADD CONSTRAINT `today_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`);

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
-- 資料表 item_users 的元資料
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
-- 資料表 on_duty 的元資料
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
-- 資料表 restaurant_tag 的元資料
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
-- 資料表 restaurant_user 的元資料
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
-- 傾印資料表的資料 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'fanart', 'reviews', '[]', '2023-01-31 03:50:08');

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
-- 資料表 tags 的元資料
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
-- 資料表 today_restaurants 的元資料
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

TRUNCATE TABLE `pma__central_columns`;

-- --------------------------------------------------------
--
-- 開啟外鍵檢查
--
SET FOREIGN_KEY_CHECKS = 1;