-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-02-10 02:54:20
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `lena-ordering-machine`
--

-- --------------------------------------------------------

--
-- 資料表結構 `data_rows`
--
-- 建立時間： 2023-02-10 01:35:58
--

CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- 建立時間： 2023-02-10 01:35:58
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- 資料表結構 `menus`
--
-- 建立時間： 2023-02-10 01:35:58
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- 建立時間： 2023-02-10 01:35:58
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;


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
-- 資料庫 lena-ordering-machine 的元資料
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
