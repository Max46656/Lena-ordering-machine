-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 01 月 16 日 15:37
-- 伺服器版本： 10.4.27-MariaDB
-- PHP 版本： 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `fanart`
--

-- --------------------------------------------------------

--
-- 資料表結構 `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(26, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5);

-- --------------------------------------------------------

--
-- 資料表結構 `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', '用戶', '用戶', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(2, 'menus', 'menus', '側邊欄', '側邊欄', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(3, 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-16 11:08:12', '2023-01-16 11:08:12'),
(4, 'orders', 'orders', '訂單', '訂單集', 'voyager-news', 'App\\Models\\Order', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"user_id\",\"order_direction\":\"asc\",\"default_search_key\":\"id\"}', '2023-01-16 11:22:02', '2023-01-16 11:22:02');

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--

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
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `cover` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`id`, `restaurant_id`, `name`, `price`, `cover`, `enabled`, `sort`, `created_at`, `updated_at`) VALUES
(1, 7, '筋斗，只有小栓也似。', 345, 'items/food (6).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(2, 6, '卻並未煮熟的，五行。', 648, 'items/food (4).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(3, 2, '將小兔是生下來的又。', 190, 'items/food (3).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(4, 7, '錢，學校裏又聽得外。', 199, 'items/food (15).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(5, 2, '夜重，便又現成話。', 220, 'items/food (16).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(6, 3, '又沒有辮子？買稿要。', 867, 'items/food (2).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(7, 3, '反？媽媽的……」他。', 569, 'items/food (17).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(8, 7, '的胖紳士早在船頭激。', 211, 'items/food (3).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(9, 4, '也就從嗚咽起來，攙。', 667, 'items/food (6).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(10, 4, '羞，伊原來他還在房。', 187, 'items/food (15).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(11, 2, '可是確沒有聲音，後。', 154, 'items/food (16).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(12, 6, '先研究的質問了。\"。', 349, 'items/food (3).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(13, 6, '緊革掉的該還有些板。', 112, 'items/food (17).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(14, 3, '憤的迴轉身，只見一。', 945, 'items/food (13).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(15, 5, '說的名字會和“犯忌。', 502, 'items/food (9).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(16, 5, '老栓候他平日安排的。', 843, 'items/food (1).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(17, 4, '著，是人不是回去吃。', 303, 'items/food (6).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(18, 5, '生，說可以做點事做。', 728, 'items/food (3).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(19, 6, '經的證明，卻又不會。', 447, 'items/food (1).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(20, 3, '略有些疲倦了，但屋。', 206, 'items/food (2).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(21, 4, '身邊；別的話，單說。', 550, 'items/food (10).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(22, 7, '我麼？” 阿Q跌出。', 660, 'items/food (16).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(23, 5, '記說了半天，飄飄然。', 823, 'items/food (18).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(24, 6, '近觀察所得而痛苦。', 230, 'items/food (6).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(25, 5, '的眼光，是與他為阿。', 435, 'items/food (18).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(26, 6, '是不應該由會計科送。', 845, 'items/food (18).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(27, 5, '家之後，便改為「差。', 702, 'items/food (7).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(28, 1, '起他們都眼巴巴的想。', 397, 'items/food (1).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(29, 1, '親說。 涼風雖然自。', 882, 'items/food (5).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(30, 6, '歲的兒子……」 我。', 238, 'items/food (1).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(31, 4, '夜和他講話，或笑。', 950, 'items/food (10).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(32, 7, '那裏的小尼姑及假洋。', 825, 'items/food (4).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(33, 4, '步格外倒運的神情。', 774, 'items/food (2).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(34, 3, '聽話，忽聽得許多時。', 272, 'items/food (10).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(35, 2, '也求過了。他又看一。', 621, 'items/food (5).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(36, 3, '職務。雖然答應他也。', 72, 'items/food (8).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(37, 1, '心於其間，小傳……。', 200, 'items/food (10).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(38, 7, '他來要債，他的景況。', 74, 'items/food (16).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(39, 1, '原，無可挽救的臨終。', 897, 'items/food (8).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(40, 1, '一口茶，纔有兩盤？', 714, 'items/food (14).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(41, 2, '土。我可不驅除的。', 479, 'items/food (7).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(42, 2, '哈德門香煙，額上便。', 823, 'items/food (13).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(43, 3, '斤們連忙捏好磚頭。', 89, 'items/food (4).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(44, 3, '氣，——雞也叫了。', 820, 'items/food (13).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(45, 7, '向來無所得而痛苦。', 398, 'items/food (10).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(46, 4, '又向他來“嚓”的女。', 628, 'items/food (6).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(47, 3, '之現在將生命的本領。', 715, 'items/food (8).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(48, 6, '耳朵裏喤的響了之後。', 461, 'items/food (11).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(49, 1, '生很有排斥的，現在。', 97, 'items/food (16).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(50, 3, '…收成又壞。種出東。', 258, 'items/food (9).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(51, 3, '我愈不耐煩。」 七。', 321, 'items/food (8).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(52, 3, '成正心焦，一年真可。', 426, 'items/food (4).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(53, 1, '自己是不必再冠姓。', 483, 'items/food (14).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(54, 1, '他還在這學堂的學生。', 387, 'items/food (7).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(55, 7, '面走，自己的屋子越。', 233, 'items/food (9).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(56, 5, '的嘴裏塞了一遍，自。', 601, 'items/food (15).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(57, 7, '煙，額上鼻尖說，。', 172, 'items/food (18).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(58, 7, '非福”罷，”阿Q卻。', 516, 'items/food (6).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(59, 4, '夾襖還在，然而沒有。', 482, 'items/food (5).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(60, 5, '尚，但現在知道有多。', 744, 'items/food (7).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(61, 2, '他關好大門口的土場。', 493, 'items/food (12).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(62, 4, '個耳朵邊又確鑿沒有。', 458, 'items/food (9).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(63, 2, '羞愧自己談話： “。', 673, 'items/food (15).jpg', 1, 0, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(64, 1, '的青年，所以女人沒。', 903, 'items/food (15).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(65, 4, '自己門口，當氣憤。', 613, 'items/food (14).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(66, 2, '然在昏暗圍住了。他。', 995, 'items/food (15).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(67, 3, '醫生的議論，卻並不。', 281, 'items/food (8).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(68, 3, '的房門口卻還守著農。', 208, 'items/food (15).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(69, 5, '似的蘇生過來，然而。', 659, 'items/food (2).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(70, 6, '給一定是非常得意的。', 876, 'items/food (17).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(71, 3, '豆腐店的。因為老爺。', 972, 'items/food (5).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(72, 5, '便不是已經氣破肚皮。', 364, 'items/food (10).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(73, 1, '決不定。他們大概是。', 81, 'items/food (14).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(74, 7, '我晚上。這畜生很伶。', 631, 'items/food (11).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(75, 5, '的在酒店，看看四面。', 328, 'items/food (12).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(76, 1, '覺得沒有了敵人，仿。', 864, 'items/food (3).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(77, 2, '一樣壞脾氣有點停步。', 411, 'items/food (13).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(78, 5, '四日——是倒塌，只。', 426, 'items/food (9).jpg', 1, 1, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(79, 5, '相干的親戚朋友的。', 870, 'items/food (11).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(80, 7, '著，誰知道曾有多少。', 615, 'items/food (8).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(81, 3, '意兒了？現在你們不。', 491, 'items/food (2).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(82, 3, '沁出一月，定了阿爾。', 219, 'items/food (15).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(83, 2, '興再幫忙是可憐他們。', 927, 'items/food (17).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(84, 1, '亂的鴿子毛，而且也。', 89, 'items/food (11).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(85, 7, '存的六斤手裏，一同。', 158, 'items/food (16).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(86, 4, '采，因爲這些時候喪。', 617, 'items/food (15).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(87, 7, '看。這車夫便也不妥。', 510, 'items/food (15).jpg', 1, 2, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(88, 3, '頭破血出了，便向他。', 107, 'items/food (10).jpg', 1, 3, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(89, 2, '樣的人大抵早就興高。', 761, 'items/food (3).jpg', 1, 4, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(90, 3, '在牆角發見了些，頸。', 420, 'items/food (9).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(91, 5, '只要看《嘗試集》。', 78, 'items/food (3).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(92, 3, '的說，便披在背後。', 503, 'items/food (18).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(93, 7, '些賞鑒這田家樂，卻。', 431, 'items/food (3).jpg', 1, 10, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(94, 7, '幾個蕭索的荒村，都。', 418, 'items/food (1).jpg', 1, 7, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(95, 6, '有的還在寶座上時。', 409, 'items/food (12).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(96, 5, '的。從先前幾回，連。', 303, 'items/food (1).jpg', 1, 8, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(97, 6, '探，悄悄地到了趙太。', 486, 'items/food (10).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(98, 7, '給一個銹銅錢，洋紗。', 285, 'items/food (5).jpg', 1, 5, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(99, 2, '徒列傳”這一次的勝。', 120, 'items/food (13).jpg', 1, 9, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(100, 4, '園。阿Q說是萬分的。', 407, 'items/food (5).jpg', 1, 6, '2023-01-16 11:08:15', '2023-01-16 11:08:15');

-- --------------------------------------------------------

--
-- 資料表結構 `item_order`
--

CREATE TABLE `item_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `item_users`
--

CREATE TABLE `item_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-16 11:08:12', '2023-01-16 11:08:12');

-- --------------------------------------------------------

--
-- 資料表結構 `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(11, 1, '訂單集', '', '_self', 'voyager-news', NULL, NULL, 15, '2023-01-16 11:22:02', '2023-01-16 11:22:02', 'voyager.orders.index', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(36, '2023_01_16_190717_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `on_duty`
--

CREATE TABLE `on_duty` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(30, 'delete_orders', 'orders', '2023-01-16 11:22:02', '2023-01-16 11:22:02');

-- --------------------------------------------------------

--
-- 資料表結構 `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(30, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
--

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
-- 資料表結構 `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `isBrunch` tinyint(1) DEFAULT 1,
  `isLunch` tinyint(1) DEFAULT 1,
  `isDinner` tinyint(1) DEFAULT 1,
  `isMidnightSnack` tinyint(1) DEFAULT 1,
  `foodMenu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `cover`, `tel`, `address`, `enabled`, `isBrunch`, `isLunch`, `isDinner`, `isMidnightSnack`, `foodMenu`, `created_at`, `updated_at`) VALUES
(1, '美利達電子', 'restaurants/餐廳 (1).jpg', '(045)407379', '茶專二街753巷419弄209號', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(2, '乾坤證券', 'restaurants/餐廳 (9).jpg', '0910526376', '中興十街562巷772弄309號13樓', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(3, '茂為集團有限公司', 'restaurants/餐廳 (4).jpg', '0963-527-154', '中興十路848號40樓', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(4, '華碩文化', 'restaurants/餐廳 (4).jpg', '0949697414', '八德中路七段555巷456號', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(5, '豪記股份有限公司', 'restaurants/餐廳 (9).jpg', '(02)558-6124', '成功十六路四段926巷536弄596號', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(6, '多利安電腦', 'restaurants/餐廳 (2).jpg', '+886926290104', '新華街547號44樓', 1, 1, 1, 1, 1, NULL, '2023-01-16 11:08:15', '2023-01-16 11:08:15');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_tag`
--

CREATE TABLE `restaurant_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `restaurant_tag`
--

INSERT INTO `restaurant_tag` (`id`, `restaurant_id`, `tag_id`, `color`, `created_at`, `updated_at`) VALUES
(1, 40, 29, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(2, 44, 13, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(3, 27, 18, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(4, 94, 16, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(5, 37, 20, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(6, 13, 15, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(7, 13, 9, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(8, 99, 11, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(9, 47, 10, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(10, 69, 30, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(11, 54, 8, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(12, 10, 23, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(13, 17, 21, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(14, 71, 20, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(15, 7, 6, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(16, 8, 28, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(17, 3, 25, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(18, 89, 10, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(19, 32, 27, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(20, 65, 16, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(21, 95, 27, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(22, 58, 18, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(23, 69, 11, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(24, 95, 13, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(25, 40, 9, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(26, 59, 2, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(27, 70, 22, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(28, 26, 26, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(29, 91, 5, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(30, 41, 27, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(31, 51, 19, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(32, 37, 27, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(33, 1, 12, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(34, 53, 27, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(35, 46, 17, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(36, 66, 1, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(37, 41, 19, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(38, 58, 11, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(39, 55, 16, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(40, 73, 29, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(41, 17, 28, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(42, 59, 30, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(43, 46, 9, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(44, 95, 7, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(45, 59, 14, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(46, 97, 17, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(47, 12, 14, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(48, 85, 18, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(49, 96, 21, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(50, 45, 2, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(51, 40, 18, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(52, 47, 5, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(53, 42, 14, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(54, 49, 24, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(55, 62, 29, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(56, 76, 13, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(57, 48, 9, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(58, 32, 11, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(59, 81, 11, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(60, 28, 2, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(61, 4, 3, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(62, 15, 9, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(63, 60, 15, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(64, 90, 5, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(65, 51, 11, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(66, 29, 24, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(67, 56, 1, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(68, 63, 25, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(69, 9, 1, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(70, 74, 21, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(71, 60, 27, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(72, 83, 23, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(73, 10, 30, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(74, 43, 6, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(75, 44, 15, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(76, 90, 18, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(77, 17, 27, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(78, 31, 18, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(79, 53, 4, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(80, 74, 30, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(81, 50, 13, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(82, 55, 3, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(83, 53, 21, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(84, 44, 21, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(85, 16, 28, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(86, 90, 8, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(87, 58, 5, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(88, 92, 29, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(89, 8, 7, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(90, 55, 3, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(91, 19, 16, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(92, 22, 22, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(93, 84, 8, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(94, 18, 5, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(95, 76, 18, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(96, 16, 21, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(97, 30, 16, '#000000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(98, 4, 23, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(99, 61, 1, '#FFFFFF', '2023-01-16 11:08:15', '2023-01-16 11:08:15'),
(100, 1, 6, '#FF0000', '2023-01-16 11:08:15', '2023-01-16 11:08:15');

-- --------------------------------------------------------

--
-- 資料表結構 `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `res_id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8eYUIvP0D11ZkP2ECHoAlEc2yzKImisvNGFGMoJa', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFA2cGV1anJkdW1zczNPVXFrWldCVW1lZ1NPM1Y1WmZtd0xUblIwbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1673879730),
('KIun08iEB2PdgPgLFKT58RlCQS76eNbtLEQbZzvO', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiYVJhMzdDMWlNOWZld01TWEVoc3J2aUhLdmJaN0VybVFDRnc2clJnOCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbWVudS8yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRUeVNUOXFuVG5GQk5leGM0ZGp6RkZ1TC4yWFI1akpYWHBHQ2pQaUU0NEtCRHFXSHhndXhhaSI7czoxMDoicmVzdGF1cmFudCI7czoxOiIyIjtzOjEyOiIxX2NhcnRfaXRlbXMiO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6NDE7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcSXRlbUNvbGxlY3Rpb24iOjM6e3M6ODoiACoAaXRlbXMiO2E6Nzp7czoyOiJpZCI7aTo0MTtzOjQ6Im5hbWUiO3M6Mjc6IuWcn+OAguaIkeWPr+S4jemphemZpOeahOOAgiI7czo1OiJwcmljZSI7aTo0Nzk7czo4OiJxdWFudGl0eSI7aTo2O3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTA6ImNvbmRpdGlvbnMiO2E6MDp7fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7TzoyMToiQXBwXE1vZGVsc1xSZXN0YXVyYW50IjozMDp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czoxMToi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', 1673879809),
('uI1vIp20raD66m7Ua08OjTnl9qPj6vkpgHQ7nhWt', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiRTVNQW00U2JkT0pSV0l3bG01SWlsd0RvTW5OSzBtV0s2anNFSE16TCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3RvcmVDYXJ0P190b2tlbj1FNU1BbTRTYmRPSlJXSXdsbTVJaWx3RG9Nbk5LMG1XSzZqc0VITXpMIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRUeVNUOXFuVG5GQk5leGM0ZGp6RkZ1TC4yWFI1akpYWHBHQ2pQaUU0NEtCRHFXSHhndXhhaSI7czoxMDoicmVzdGF1cmFudCI7czoxOiIyIjtzOjEyOiIxX2NhcnRfaXRlbXMiO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjI6e2k6NDE7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcSXRlbUNvbGxlY3Rpb24iOjM6e3M6ODoiACoAaXRlbXMiO2E6Nzp7czoyOiJpZCI7aTo0MTtzOjQ6Im5hbWUiO3M6Mjc6IuWcn+OAguaIkeWPr+S4jemphemZpOeahOOAgiI7czo1OiJwcmljZSI7aTo0Nzk7czo4OiJxdWFudGl0eSI7aToxO3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTA6ImNvbmRpdGlvbnMiO2E6MDp7fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7TzoyMToiQXBwXE1vZGVsc1xSZXN0YXVyYW50IjozMDp7czox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', 1673870923);

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `tags`
--

INSERT INTO `tags` (`id`, `title`, `url`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'quia', 'http://rangsi.biz/', 75, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(2, 'qui', 'http://zi.info/omnis-voluptas-natus-suscipit-qui-odio-commodi-expedita.html', 74, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(3, 'labore', 'https://wan.com/sunt-vitae-distinctio-enim-non-qui-aliquam-illum.html', 31, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(4, 'deleniti', 'http://liangqiu.info/aut-delectus-aut-adipisci-eum.html', 32, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(5, 'consectetur', 'http://zhuge.net/quia-quas-est-placeat-et-vitae-accusamus-veritatis', 99, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(6, 'magni', 'http://jin.com/qui-voluptatem-magni-et-eaque-quas-minima.html', 29, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(7, 'rerum', 'http://wu.info/corporis-est-maiores-voluptatem-eum', 55, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(8, 'laboriosam', 'http://ling.com/possimus-impedit-assumenda-voluptatem-totam', 88, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(9, 'et', 'http://dantai.com/tempore-harum-quam-commodi-necessitatibus', 97, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(10, 'laborum', 'http://www.xun.biz/deserunt-facere-tempora-porro-dolore', 79, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(11, 'nulla', 'http://www.yue.com/quo-corrupti-qui-ipsa-qui.html', 74, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(12, 'placeat', 'http://zongzheng.com/quos-minima-qui-natus-tenetur-aliquid-recusandae', 25, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(13, 'rem', 'http://www.ji.org/beatae-eum-rerum-explicabo-facilis-debitis.html', 36, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(14, 'quo', 'http://liao.org/', 33, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(15, 'saepe', 'http://www.she.com/et-ipsam-eius-ut-consectetur-vitae.html', 93, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(16, 'dolores', 'http://li.com/est-laboriosam-harum-vel-iste-nemo-nihil', 96, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(17, 'rerum', 'https://neng.org/ut-enim-dolorem-recusandae.html', 74, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(18, 'omnis', 'http://guan.org/esse-harum-asperiores-aliquam-aut-quo-quo', 84, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(19, 'qui', 'http://www.duanmu.biz/', 55, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(20, 'expedita', 'http://www.yang.com/consequatur-est-unde-voluptatem', 94, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(21, 'fugit', 'https://www.dang.com/impedit-voluptate-explicabo-nulla', 97, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(22, 'inventore', 'https://kui.com/doloribus-laudantium-dolores-eum-voluptates-quidem.html', 100, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(23, 'nesciunt', 'http://wang.com/nostrum-qui-inventore-recusandae-ratione-et-cupiditate.html', 99, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(24, 'sapiente', 'http://shang.biz/fugit-ut-molestiae-maxime-aut-aut-ab', 10, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(25, 'aspernatur', 'http://pang.org/officia-dolores-vero-incidunt-eius-atque-architecto', 49, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(26, 'animi', 'http://ju.com/aut-voluptatum-placeat-ratione-quas-velit-facere', 60, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(27, 'placeat', 'https://www.qiao.com/qui-quaerat-placeat-officiis-autem-tempora-et', 74, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(28, 'ratione', 'http://huang.com/accusantium-laborum-et-saepe', 44, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(29, 'quas', 'http://www.an.org/nihil-assumenda-cupiditate-quia-rerum-accusantium-aspernatur-reiciendis', 22, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(30, 'perferendis', 'http://www.wen.com/est-velit-dolorum-neque', 28, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(31, 'voluptatem', 'http://www.yang.net/rerum-qui-rerum-illo-aut.html', 29, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(32, 'autem', 'http://qin.net/voluptas-non-dolore-nesciunt', 57, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(33, 'incidunt', 'http://www.tang.com/voluptatem-ab-rerum-odit-laudantium-totam-sint-soluta.html', 42, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(34, 'nobis', 'http://www.you.com/quaerat-dolorum-mollitia-est-consectetur-quis-est', 11, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(35, 'expedita', 'http://www.you.info/', 43, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(36, 'dolorem', 'http://rui.org/eaque-aut-quam-id-voluptatem-repellendus-pariatur-voluptatem', 31, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(37, 'dolores', 'http://www.cheng.biz/', 98, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(38, 'minus', 'http://yu.net/sit-corporis-dolores-aspernatur-blanditiis-error-hic-velit', 56, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(39, 'quia', 'http://ming.com/aut-et-omnis-ex-libero-neque-sequi-itaque', 75, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(40, 'ad', 'http://pan.com/pariatur-voluptatum-accusantium-et-ut', 23, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(41, 'distinctio', 'http://www.tu.org/', 21, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(42, 'omnis', 'http://www.linghu.com/vero-architecto-placeat-perspiciatis-perspiciatis-qui.html', 30, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(43, 'libero', 'http://www.tan.com/suscipit-asperiores-nam-quia-exercitationem-error.html', 48, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(44, 'inventore', 'http://www.bao.biz/exercitationem-quas-hic-dicta-dolor-illo-incidunt.html', 100, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(45, 'ab', 'http://www.fu.org/dolorum-suscipit-animi-quo-dolore', 33, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(46, 'quisquam', 'http://www.dou.com/', 37, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(47, 'aut', 'http://ni.biz/nam-odit-cum-ut-sint-nihil-debitis', 33, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(48, 'ut', 'http://www.ban.net/velit-consequatur-quos-debitis-quia-omnis-corporis', 57, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(49, 'in', 'http://www.situ.com/nihil-rerum-laborum-iusto-necessitatibus-quia-autem', 3, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(50, 'perferendis', 'http://www.gu.com/', 98, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(51, 'eaque', 'http://bao.org/unde-perferendis-ab-reiciendis-voluptates-beatae', 22, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(52, 'officiis', 'http://www.tu.biz/quidem-rem-beatae-praesentium-accusantium-placeat', 65, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(53, 'odit', 'https://wei.com/quia-molestiae-quasi-dolorum-id-voluptatem-repellendus-necessitatibus.html', 69, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(54, 'consequatur', 'http://www.xuanyuan.info/placeat-fugiat-iste-inventore-distinctio', 78, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(55, 'aut', 'http://ji.net/eaque-odit-vel-qui-quisquam-consequuntur-quasi.html', 68, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(56, 'omnis', 'http://shen.biz/possimus-explicabo-iste-deleniti-deserunt', 76, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(57, 'excepturi', 'http://www.li.org/laboriosam-quae-rerum-quibusdam-sit.html', 40, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(58, 'distinctio', 'http://www.nanmen.org/laudantium-ut-voluptas-beatae-eaque-animi', 45, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(59, 'odio', 'http://she.com/hic-suscipit-dolor-consectetur-dignissimos-porro', 98, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(60, 'assumenda', 'http://www.bei.com/sapiente-aspernatur-dolor-sit-cupiditate-laudantium-unde-minus-iste', 89, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(61, 'et', 'http://www.xing.biz/natus-est-autem-odio-ea', 36, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(62, 'velit', 'http://puyang.info/quaerat-enim-rerum-sit-aliquid-animi-sed.html', 13, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(63, 'nobis', 'http://www.qin.com/', 40, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(64, 'facilis', 'http://www.shang.com/', 92, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(65, 'dignissimos', 'http://gu.info/ut-in-rem-voluptas-eum-voluptatem-molestias-qui.html', 34, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(66, 'rerum', 'http://www.chong.com/distinctio-et-ad-eaque-ut-aut-enim-eos', 9, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(67, 'sapiente', 'http://www.tao.com/omnis-voluptas-est-eum-numquam-omnis-accusantium', 0, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(68, 'quia', 'http://www.du.info/deleniti-rerum-veniam-tempora-consectetur-culpa-fugit-non', 65, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(69, 'ad', 'http://www.mao.com/est-recusandae-sunt-qui-nihil-doloremque.html', 99, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(70, 'quo', 'http://www.gongsun.com/atque-impedit-ea-eligendi-error-maxime-aut-aut-maiores.html', 78, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(71, 'quaerat', 'http://xianyu.com/accusamus-consequatur-accusantium-non-culpa.html', 62, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(72, 'atque', 'http://www.pang.biz/', 7, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(73, 'voluptas', 'http://www.zhuo.biz/veniam-quia-voluptatibus-quis-qui', 79, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(74, 'atque', 'http://www.shen.com/quis-iste-ipsa-saepe-nisi-harum.html', 67, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(75, 'cumque', 'https://ji.biz/libero-blanditiis-tempora-sunt-autem.html', 90, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(76, 'perspiciatis', 'http://shen.com/excepturi-ipsam-molestias-officia-molestias-et-fugiat', 42, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(77, 'cum', 'https://www.shang.com/similique-deserunt-necessitatibus-et-maiores-veritatis', 32, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(78, 'inventore', 'http://cha.net/est-ut-eveniet-quia-molestias-illum', 81, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(79, 'est', 'http://www.wu.net/nihil-vero-vero-eveniet-soluta.html', 64, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(80, 'nisi', 'https://luo.net/fugiat-quis-laudantium-ullam-nostrum-error-dignissimos-eos.html', 25, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(81, 'soluta', 'http://www.lei.com/vel-placeat-qui-nihil-molestiae', 30, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(82, 'eveniet', 'http://long.com/optio-non-consectetur-quam-veniam-sed-minima', 26, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(83, 'error', 'http://bao.info/', 37, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(84, 'non', 'http://www.he.org/ut-et-eos-eaque-officia', 86, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(85, 'aliquam', 'http://www.yang.com/consequatur-doloribus-adipisci-maxime-nihil-consequatur', 41, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(86, 'quo', 'http://www.wu.info/esse-cumque-voluptate-aut-temporibus-possimus-aut-dolor', 47, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(87, 'sequi', 'http://sikou.com/', 15, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(88, 'non', 'http://www.ding.com/minus-laudantium-iste-sapiente-id-facilis-eius.html', 53, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(89, 'est', 'http://bao.com/', 32, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(90, 'assumenda', 'http://www.kong.com/', 3, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(91, 'non', 'http://qin.com/incidunt-officiis-sit-et-qui-labore.html', 60, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(92, 'quo', 'http://www.e.net/voluptas-quam-voluptate-dolorum-aliquid-explicabo-accusamus-sint', 2, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(93, 'et', 'http://www.gong.com/sunt-nihil-eos-mollitia-quia.html', 64, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(94, 'ut', 'http://ouyang.com/', 31, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(95, 'in', 'https://www.huang.com/ea-dolorem-rem-ea-officia-soluta-asperiores', 79, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(96, 'corrupti', 'http://www.hong.biz/est-labore-ipsa-quae-libero.html', 0, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(97, 'occaecati', 'http://dou.biz/quibusdam-labore-similique-pariatur-dignissimos-placeat', 16, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(98, 'quo', 'http://kuang.com/enim-illum-iste-ratione-laboriosam', 99, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(99, 'ea', 'http://zaifu.com/ipsum-molestias-libero-minus-quos-dolores-vel', 20, '2023-01-16 11:08:16', '2023-01-16 11:08:16'),
(100, 'atque', 'http://www.hai.org/aut-nisi-et-quidem-sapiente-quae-cumque-dolor.html', 44, '2023-01-16 11:08:16', '2023-01-16 11:08:16');

-- --------------------------------------------------------

--
-- 資料表結構 `today_restaurants`
--

CREATE TABLE `today_restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$TyST9qnTnFBNexc4djzFFuL.2XR5jJXXpGCjPiE44KBDqWHxguxai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 11:09:05', '2023-01-16 11:09:05');

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `on_duty`
--
ALTER TABLE `on_duty`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
-- 資料表的限制式 `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_res_id_foreign` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`id`),
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
