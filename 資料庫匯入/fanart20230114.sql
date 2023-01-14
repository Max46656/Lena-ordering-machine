-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-01-14 08:57:23
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.2

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
(22, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 5, 'cover', 'media_picker', 'Cover', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"show_as_images\":true}', 3),
(25, 5, 'tel', 'text', 'Tel', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 5, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 5),
(27, 5, 'enabled', 'text', 'Enabled', 0, 1, 1, 1, 1, 1, '{}', 6),
(28, 5, 'isBrunch', 'text', 'IsBrunch', 0, 1, 1, 1, 1, 1, '{}', 7),
(29, 5, 'isLunch', 'text', 'IsLunch', 0, 1, 1, 1, 1, 1, '{}', 8),
(30, 5, 'isDinner', 'text', 'IsDinner', 0, 1, 1, 1, 1, 1, '{}', 9),
(31, 5, 'isMidnightSnack', 'text', 'IsMidnightSnack', 0, 1, 1, 1, 1, 1, '{}', 10),
(32, 5, 'foodMenu', 'text', 'FoodMenu', 0, 1, 1, 1, 1, 1, '{}', 11),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(35, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(36, 6, 'restaurant_id', 'text', 'Restaurant Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(37, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(38, 6, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 4),
(39, 6, 'cover', 'media_picker', 'Cover', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"show_as_images\":true}', 5),
(40, 6, 'enabled', 'text', 'Enabled', 1, 1, 1, 1, 1, 1, '{}', 6),
(41, 6, 'sort', 'text', 'Sort', 1, 1, 1, 1, 1, 1, '{}', 7),
(42, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(43, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9);

-- --------------------------------------------------------

--
-- 資料表結構 `data_types`
--

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
-- 傾印資料表的資料 `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', '用戶', '用戶', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(2, 'menus', 'menus', '側邊欄', '側邊欄', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(3, 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(5, 'restaurants', 'restaurants', 'Restaurant', 'Restaurants', NULL, 'App\\Models\\Restaurant', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-13 12:26:16', '2023-01-13 12:27:05'),
(6, 'items', 'items', 'Item', 'Items', NULL, 'App\\Models\\Item', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-01-13 12:26:47', '2023-01-13 12:26:47');

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
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
-- 資料表結構 `items`
--

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
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`id`, `restaurant_id`, `name`, `price`, `cover`, `enabled`, `sort`, `created_at`, `updated_at`) VALUES
(1, 1, '水餃', 10, 'items/bee.jpg', 1, 1, '2023-01-13 12:30:37', '2023-01-13 12:30:37'),
(2, 1, '鍋貼', 12, 'items/crab.png', 1, 1, '2023-01-13 12:31:00', '2023-01-13 12:31:00'),
(3, 2, '啤酒', 20, 'items/lux.jpg', 1, 2, '2023-01-13 12:49:41', '2023-01-13 12:49:41'),
(4, 2, '紅酒', 30, 'items/soraka.png', 1, 2, '2023-01-13 12:50:04', '2023-01-13 12:50:04'),
(5, 1, '玉米湯', 20, 'items/hadog.png', 1, 1, '2023-01-13 18:53:03', '2023-01-13 18:53:03');

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

--
-- 傾印資料表的資料 `item_users`
--

INSERT INTO `item_users` (`id`, `item_id`, `user_id`, `qty`, `created_at`, `updated_at`) VALUES
(60, 5, 2, 1, '2023-01-13 21:32:40', '2023-01-13 21:32:40'),
(143, 1, 1, 1, '2023-01-14 06:41:21', '2023-01-14 06:41:21'),
(144, 2, 1, 2, '2023-01-14 06:41:21', '2023-01-14 06:41:21'),
(145, 5, 1, 3, '2023-01-14 06:41:21', '2023-01-14 06:41:21'),
(146, 1, 2, 4, '2023-01-14 07:54:54', '2023-01-14 07:54:54'),
(147, 2, 2, 4, '2023-01-14 07:54:54', '2023-01-14 07:54:54'),
(148, 5, 2, 0, '2023-01-14 07:54:54', '2023-01-14 07:54:54');

-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-13 12:11:48', '2023-01-13 12:11:48');

-- --------------------------------------------------------

--
-- 資料表結構 `menu_items`
--

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
-- 傾印資料表的資料 `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, '控制面板', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.dashboard', NULL),
(2, 1, '媒體', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.media.index', NULL),
(3, 1, '用戶', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.users.index', NULL),
(4, 1, '角色', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.roles.index', NULL),
(5, 1, '工具', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-01-13 12:11:48', '2023-01-13 12:11:48', NULL, NULL),
(6, 1, '側邊欄管理', '', '_self', 'voyager-list', NULL, 5, 10, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.menus.index', NULL),
(7, 1, '資料庫', '', '_self', 'voyager-data', NULL, 5, 11, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.database.index', NULL),
(8, 1, '指南針', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.bread.index', NULL),
(10, 1, '設定', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-01-13 12:11:48', '2023-01-13 12:11:48', 'voyager.settings.index', NULL),
(11, 1, 'Restaurants', '', '_self', NULL, NULL, NULL, 15, '2023-01-13 12:26:16', '2023-01-13 12:26:16', 'voyager.restaurants.index', NULL),
(12, 1, 'Items', '', '_self', NULL, NULL, NULL, 16, '2023-01-13 12:26:47', '2023-01-13 12:26:47', 'voyager.items.index', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(26, '2023_01_11_033751_create_sessions_table', 1),
(27, '2023_01_11_145805_create_restaurants_table', 2),
(28, '2023_01_11_145847_create_items_table', 2),
(29, '2023_01_11_152450_create_orders_table', 2),
(30, '2023_01_12_083700_create_reviews_table', 3),
(31, '2023_01_12_084042_create_item_order_table', 3),
(32, '2023_01_13_233319_create_item_user_table', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subTotal` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(2, 'browse_bread', NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(3, 'browse_database', NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(4, 'browse_media', NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(5, 'browse_compass', NULL, '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(6, 'browse_menus', 'menus', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(7, 'read_menus', 'menus', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(8, 'edit_menus', 'menus', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(9, 'add_menus', 'menus', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(10, 'delete_menus', 'menus', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(11, 'browse_roles', 'roles', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(12, 'read_roles', 'roles', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(13, 'edit_roles', 'roles', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(14, 'add_roles', 'roles', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(15, 'delete_roles', 'roles', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(16, 'browse_users', 'users', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(17, 'read_users', 'users', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(18, 'edit_users', 'users', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(19, 'add_users', 'users', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(20, 'delete_users', 'users', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(21, 'browse_settings', 'settings', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(22, 'read_settings', 'settings', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(23, 'edit_settings', 'settings', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(24, 'add_settings', 'settings', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(25, 'delete_settings', 'settings', '2023-01-13 12:11:48', '2023-01-13 12:11:48'),
(26, 'browse_restaurants', 'restaurants', '2023-01-13 12:26:16', '2023-01-13 12:26:16'),
(27, 'read_restaurants', 'restaurants', '2023-01-13 12:26:16', '2023-01-13 12:26:16'),
(28, 'edit_restaurants', 'restaurants', '2023-01-13 12:26:16', '2023-01-13 12:26:16'),
(29, 'add_restaurants', 'restaurants', '2023-01-13 12:26:16', '2023-01-13 12:26:16'),
(30, 'delete_restaurants', 'restaurants', '2023-01-13 12:26:16', '2023-01-13 12:26:16'),
(31, 'browse_items', 'items', '2023-01-13 12:26:47', '2023-01-13 12:26:47'),
(32, 'read_items', 'items', '2023-01-13 12:26:47', '2023-01-13 12:26:47'),
(33, 'edit_items', 'items', '2023-01-13 12:26:47', '2023-01-13 12:26:47'),
(34, 'add_items', 'items', '2023-01-13 12:26:47', '2023-01-13 12:26:47'),
(35, 'delete_items', 'items', '2023-01-13 12:26:47', '2023-01-13 12:26:47');

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
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
--

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

-- --------------------------------------------------------

--
-- 資料表結構 `restaurants`
--

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
-- 傾印資料表的資料 `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `cover`, `tel`, `address`, `enabled`, `isBrunch`, `isLunch`, `isDinner`, `isMidnightSnack`, `foodMenu`, `created_at`, `updated_at`) VALUES
(1, '大中華', 'restaurants/ashe.jpg', '1234456', 'asdasd', 1, 1, 1, 1, 1, '1', '2023-01-13 12:30:00', '2023-01-13 12:30:00'),
(2, '酒店', 'restaurants/crab.png', '123324', 'asd', 1, 1, 1, 1, 1, '2', '2023-01-13 12:48:29', '2023-01-13 12:48:29'),
(3, 'sdf', 'restaurants/omg.png', '12312', 'asd', 1, 1, 1, 1, 1, '3', '2023-01-13 13:39:37', '2023-01-13 13:39:37');

-- --------------------------------------------------------

--
-- 資料表結構 `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `res_id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-01-13 12:09:50', '2023-01-13 12:09:50'),
(2, 'user', '普通用戶', '2023-01-13 12:11:48', '2023-01-13 12:11:48');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5uBpopLy5NZaUDSgX2mAG2AZ2GksJGfL7tq1Xw6J', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6IlFxNXNRaVV1ejZCWmtBR05wdnEzMVBPN3ppRG16ajBlMmxrcjI5SnkiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNzoiaHR0cDovL3dlYjExMWIuY29tOjYwODAvZmFuYXJ0L3B1YmxpYyI7fXM6NDoibmFtZSI7czo0OiJVc2VyIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGN2U043cnlqVVhjc0xQMllFLmRRb3VyLk9sNFZ0NmFTRHRaOFpPUU1rNWZIb1V0VFUvNVQyIjtzOjEwOiJyZXN0YXVyYW50IjtzOjE6IjEiO3M6MTI6IjJfY2FydF9pdGVtcyI7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6Mzp7aToxO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjozOntzOjg6IgAqAGl0ZW1zIjthOjc6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6Njoi5rC06aSDIjtzOjU6InByaWNlIjtpOjEwO3M6ODoicXVhbnRpdHkiO2k6NDtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjEwOiJjb25kaXRpb25zIjthOjA6e31zOjE1OiJhc3NvY2lhdGVkTW9kZWwiO086MjE6IkFwcFxNb2RlbHNcUmVzdGF1cmFudCI6MzA6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTE6InJlc3RhdXJhbnRzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTM6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToi5aSn5Lit6I+vIjtzOjU6ImNvdmVyIjtzOjIwOiJyZXN0YXVyYW50cy9hc2hlLmpwZyI7czozOiJ0ZWwiO3M6NzoiMTIzNDQ1NiI7czo3OiJhZGRyZXNzIjtzOjY6ImFzZGFzZCI7czo3OiJlbmFibGVkIjtpOjE7czo4OiJpc0JydW5jaCI7aToxO3M6NzoiaXNMdW5jaCI7aToxO3M6ODoiaXNEaW5uZXIiO2k6MTtzOjE1OiJpc01pZG5pZ2h0U25hY2siO2k6MTtzOjg6ImZvb2RNZW51IjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjMtMDEtMTMgMjA6MzA6MDAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjMtMDEtMTMgMjA6MzA6MDAiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo5OiLlpKfkuK3oj68iO3M6NToiY292ZXIiO3M6MjA6InJlc3RhdXJhbnRzL2FzaGUuanBnIjtzOjM6InRlbCI7czo3OiIxMjM0NDU2IjtzOjc6ImFkZHJlc3MiO3M6NjoiYXNkYXNkIjtzOjc6ImVuYWJsZWQiO2k6MTtzOjg6ImlzQnJ1bmNoIjtpOjE7czo3OiJpc0x1bmNoIjtpOjE7czo4OiJpc0Rpbm5lciI7aToxO3M6MTU6ImlzTWlkbmlnaHRTbmFjayI7aToxO3M6ODoiZm9vZE1lbnUiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xMyAyMDozMDowMCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xMyAyMDozMDowMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czo5OiIAKgBjb25maWciO2E6Njp7czoxNDoiZm9ybWF0X251bWJlcnMiO2I6MDtzOjg6ImRlY2ltYWxzIjtpOjA7czo5OiJkZWNfcG9pbnQiO3M6MToiLiI7czoxMzoidGhvdXNhbmRzX3NlcCI7czoxOiIsIjtzOjc6InN0b3JhZ2UiO047czo2OiJldmVudHMiO047fX1pOjI7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcSXRlbUNvbGxlY3Rpb24iOjM6e3M6ODoiACoAaXRlbXMiO2E6Nzp7czoyOiJpZCI7aToyO3M6NDoibmFtZSI7czo2OiLpjYvosrwiO3M6NToicHJpY2UiO2k6MTI7czo4OiJxdWFudGl0eSI7aTo0O3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTA6ImNvbmRpdGlvbnMiO2E6MDp7fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7cjoyNTt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6OToiACoAY29uZmlnIjthOjY6e3M6MTQ6ImZvcm1hdF9udW1iZXJzIjtiOjA7czo4OiJkZWNpbWFscyI7aTowO3M6OToiZGVjX3BvaW50IjtzOjE6Ii4iO3M6MTM6InRob3VzYW5kc19zZXAiO3M6MToiLCI7czo3OiJzdG9yYWdlIjtOO3M6NjoiZXZlbnRzIjtOO319aTo1O086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjozOntzOjg6IgAqAGl0ZW1zIjthOjc6e3M6MjoiaWQiO2k6NTtzOjQ6Im5hbWUiO3M6OToi546J57Gz5rmvIjtzOjU6InByaWNlIjtpOjIwO3M6ODoicXVhbnRpdHkiO2k6MDtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjEwOiJjb25kaXRpb25zIjthOjA6e31zOjE1OiJhc3NvY2lhdGVkTW9kZWwiO3I6MjU7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NDoidXNlZCI7czo0OiJVc2VyIjt9', 1673682950),
('6ErED9chmPgiqmk5bTppkKQmSWQKnNu7rVRdfLHc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IldUNnRlWFlsQWE5NUFHTXNVMHYybWpnYWNpS2ZOMHF3dWJBdXpGZHkiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0OToiaHR0cDovL3dlYjExMWIuY29tOjYwODAvZmFuYXJ0L3B1YmxpYy9jb25maXJtQ2FydCI7fXM6NDoibmFtZSI7czo0OiJVc2VyIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGN2U043cnlqVVhjc0xQMllFLmRRb3VyLk9sNFZ0NmFTRHRaOFpPUU1rNWZIb1V0VFUvNVQyIjtpOjA7czoxMDoicmVzdGF1cmFudCI7czo0OiJ1c2VkIjtzOjQ6IlVzZXIiO3M6MTA6InJlc3RhdXJhbnQiO3M6MToiMSI7czoxMjoiMl9jYXJ0X2l0ZW1zIjtPOjMyOiJEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTozOntpOjE7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcSXRlbUNvbGxlY3Rpb24iOjM6e3M6ODoiACoAaXRlbXMiO2E6Nzp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo2OiLmsLTppIMiO3M6NToicHJpY2UiO2k6MTA7czo4OiJxdWFudGl0eSI7aToxO3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTA6ImNvbmRpdGlvbnMiO2E6MDp7fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7TzoyMToiQXBwXE1vZGVsc1xSZXN0YXVyYW50IjozMDp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czoxMToicmVzdGF1cmFudHMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo5OiLlpKfkuK3oj68iO3M6NToiY292ZXIiO3M6MjA6InJlc3RhdXJhbnRzL2FzaGUuanBnIjtzOjM6InRlbCI7czo3OiIxMjM0NDU2IjtzOjc6ImFkZHJlc3MiO3M6NjoiYXNkYXNkIjtzOjc6ImVuYWJsZWQiO2k6MTtzOjg6ImlzQnJ1bmNoIjtpOjE7czo3OiJpc0x1bmNoIjtpOjE7czo4OiJpc0Rpbm5lciI7aToxO3M6MTU6ImlzTWlkbmlnaHRTbmFjayI7aToxO3M6ODoiZm9vZE1lbnUiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xMyAyMDozMDowMCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0xMyAyMDozMDowMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjk6IuWkp+S4reiPryI7czo1OiJjb3ZlciI7czoyMDoicmVzdGF1cmFudHMvYXNoZS5qcGciO3M6MzoidGVsIjtzOjc6IjEyMzQ0NTYiO3M6NzoiYWRkcmVzcyI7czo2OiJhc2Rhc2QiO3M6NzoiZW5hYmxlZCI7aToxO3M6ODoiaXNCcnVuY2giO2k6MTtzOjc6ImlzTHVuY2giO2k6MTtzOjg6ImlzRGlubmVyIjtpOjE7czoxNToiaXNNaWRuaWdodFNuYWNrIjtpOjE7czo4OiJmb29kTWVudSI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTEzIDIwOjMwOjAwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTEzIDIwOjMwOjAwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9fWk6MjtPOjMyOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQ29sbGVjdGlvbiI6Mzp7czo4OiIAKgBpdGVtcyI7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJuYW1lIjtzOjY6IumNi+iyvCI7czo1OiJwcmljZSI7aToxMjtzOjg6InF1YW50aXR5IjtpOjI7czoxMDoiYXR0cmlidXRlcyI7Tzo0MToiRGFycnlsZGVjb2RlXENhcnRcSXRlbUF0dHJpYnV0ZUNvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czoxMDoiY29uZGl0aW9ucyI7YTowOnt9czoxNToiYXNzb2NpYXRlZE1vZGVsIjtyOjI3O31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czo5OiIAKgBjb25maWciO2E6Njp7czoxNDoiZm9ybWF0X251bWJlcnMiO2I6MDtzOjg6ImRlY2ltYWxzIjtpOjA7czo5OiJkZWNfcG9pbnQiO3M6MToiLiI7czoxMzoidGhvdXNhbmRzX3NlcCI7czoxOiIsIjtzOjc6InN0b3JhZ2UiO047czo2OiJldmVudHMiO047fX1pOjU7TzozMjoiRGFycnlsZGVjb2RlXENhcnRcSXRlbUNvbGxlY3Rpb24iOjM6e3M6ODoiACoAaXRlbXMiO2E6Nzp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo5OiLnjonnsbPmua8iO3M6NToicHJpY2UiO2k6MjA7czo4OiJxdWFudGl0eSI7aTozO3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTA6ImNvbmRpdGlvbnMiO2E6MDp7fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7cjoyNzt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6OToiACoAY29uZmlnIjthOjY6e3M6MTQ6ImZvcm1hdF9udW1iZXJzIjtiOjA7czo4OiJkZWNpbWFscyI7aTowO3M6OToiZGVjX3BvaW50IjtzOjE6Ii4iO3M6MTM6InRob3VzYW5kc19zZXAiO3M6MToiLCI7czo3OiJzdG9yYWdlIjtOO3M6NjoiZXZlbnRzIjtOO319fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fQ==', 1673650425);

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--

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

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

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
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$k9DtQwKI7WML/9Svs6pGh.F96nNIl4SrMt9Pv7wCUTDomQt6m.0I2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-13 12:09:50', '2023-01-13 12:09:50'),
(2, 2, 'User', 'user@user.com', 'users/default.png', NULL, '$2y$10$cvSN7ryjUXcsLP2YE.dQour.Ol4Vt6aSDtZ8ZOQMk5fHoUtTU/5T2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-10 11:45:50', '2023-01-10 11:45:50');

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
  ADD KEY `item_user_item_id_foreign` (`item_id`),
  ADD KEY `item_user_user_id_foreign` (`user_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `item_order`
--
ALTER TABLE `item_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `item_users`
--
ALTER TABLE `item_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `item_user_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
