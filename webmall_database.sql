-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table webmall.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.categories: ~6 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(3, NULL, 1, 'Men', 'men', '2020-03-07 15:10:58', '2020-03-07 15:10:58'),
	(4, 3, 2, 'watch', 'watch', '2020-03-07 15:11:36', '2020-03-07 15:11:36'),
	(5, NULL, 4, 'Women', 'women', '2020-03-14 10:02:06', '2020-03-14 10:02:06'),
	(6, 5, 1, 'cosmetics', 'cosmetics', '2020-03-14 10:02:28', '2020-03-14 10:02:41'),
	(7, 6, 1, 'lipsticks', 'lipsticks', '2020-03-14 10:03:54', '2020-03-14 10:03:54'),
	(8, NULL, 1, 'Electronics', 'electronics', '2020-03-14 11:52:14', '2020-03-14 11:52:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table webmall.coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.coupons: ~2 rows (approximately)
DELETE FROM `coupons`;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `name`, `code`, `type`, `value`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'winter sale', '89rr', 'discount', '-50%', '50 percent discount', '2020-04-04 14:54:20', NULL),
	(2, 'good friday sale', 'friday_sale', 'discount', '-10%', '10 offsklkdjlsdk', '2020-04-04 09:12:44', '2020-04-04 09:12:44');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table webmall.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.data_rows: ~106 rows (approximately)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 7, 'order_number', 'text', 'Order Number', 1, 1, 1, 1, 1, 1, '{}', 3),
	(58, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(59, 7, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"options":{"pending":"Pending","processing":"Processing","completed":"Completed","decline":"Decline"}}', 4),
	(60, 7, 'grand_total', 'text', 'Grand Total', 1, 1, 1, 1, 1, 1, '{}', 5),
	(61, 7, 'item_count', 'text', 'Item Count', 1, 1, 1, 1, 1, 1, '{}', 6),
	(62, 7, 'is_paid', 'checkbox', 'Is Paid', 1, 1, 1, 1, 1, 1, '{"on":"Paid","off":"Not Paid","checked":true}', 7),
	(63, 7, 'payment_method', 'select_dropdown', 'Payment Method', 1, 1, 1, 1, 1, 1, '{"options":{"cash_on_delivery":"Cash on Delivery","paypal":"Paypal","stripe":"Stripe","card":"Card"}}', 8),
	(64, 7, 'shipping_fullname', 'text', 'Shipping Fullname', 1, 1, 1, 1, 1, 1, '{}', 9),
	(65, 7, 'shipping_address', 'text', 'Shipping Address', 1, 1, 1, 1, 1, 1, '{}', 10),
	(66, 7, 'shipping_city', 'text', 'Shipping City', 1, 0, 1, 1, 1, 1, '{}', 11),
	(67, 7, 'shipping_state', 'text', 'Shipping State', 1, 0, 1, 1, 1, 1, '{}', 12),
	(68, 7, 'shipping_zipcode', 'text', 'Shipping Zipcode', 1, 0, 1, 1, 1, 1, '{}', 13),
	(69, 7, 'shipping_phone', 'text', 'Shipping Phone', 1, 0, 1, 1, 1, 1, '{}', 14),
	(70, 7, 'notes', 'text_area', 'Notes', 0, 0, 1, 1, 1, 1, '{}', 15),
	(71, 7, 'billing_fullname', 'text', 'Billing Fullname', 1, 0, 1, 1, 1, 1, '{}', 16),
	(72, 7, 'billing_address', 'text', 'Billing Address', 1, 0, 1, 1, 1, 1, '{}', 17),
	(73, 7, 'billing_city', 'text', 'Billing City', 1, 0, 1, 1, 1, 1, '{}', 18),
	(74, 7, 'billing_state', 'text', 'Billing State', 1, 0, 1, 1, 1, 1, '{}', 19),
	(75, 7, 'billing_zipcode', 'text', 'Billing Zipcode', 1, 0, 1, 1, 1, 1, '{}', 20),
	(76, 7, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 1, '{}', 21),
	(77, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 22),
	(78, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 23),
	(79, 7, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 24),
	(80, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(81, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
	(82, 8, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(83, 8, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{"on":"Active","off":"InActive"}', 4),
	(84, 8, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
	(85, 8, 'rating', 'text', 'Rating', 0, 1, 1, 1, 1, 1, '{}', 6),
	(86, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(87, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
	(88, 8, 'shop_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 9),
	(89, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(90, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
	(91, 9, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
	(92, 9, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
	(93, 9, 'cover_img', 'image', 'Cover Img', 0, 1, 1, 1, 1, 1, '{}', 6),
	(94, 9, 'shop_id', 'text', 'Shop Id', 0, 1, 1, 1, 1, 1, '{}', 2),
	(95, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(96, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
	(97, 9, 'product_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Shop","table":"shops","type":"belongsTo","column":"shop_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 9),
	(98, 9, 'product_belongstomany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Category","table":"categories","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"product_categories","pivot":"1","taggable":"on"}', 10),
	(99, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(100, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(101, 10, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 3),
	(102, 10, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 4),
	(103, 10, 'value', 'text', 'Value', 1, 1, 1, 1, 1, 1, '{}', 5),
	(104, 10, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
	(105, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(106, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table webmall.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.data_types: ~10 rows (approximately)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-02-11 00:10:11', '2020-02-19 17:28:01'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(7, 'orders', 'orders', 'Order', 'Orders', 'voyager-buy', 'App\\Order', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-11 00:22:34', '2020-02-13 01:06:26'),
	(8, 'shops', 'shops', 'Shop', 'Shops', 'voyager-bag', 'App\\Shop', 'App\\Policies\\ShopPolicy', 'App\\Http\\Controllers\\Admin\\ShopController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-19 17:15:37', '2020-02-19 17:16:25'),
	(9, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', 'App\\Policies\\ProductPolicy', 'App\\Http\\Controllers\\Admin\\ProductController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-19 17:18:39', '2020-02-19 18:23:32'),
	(10, 'coupons', 'coupons', 'Coupon', 'Coupons', NULL, 'App\\Coupon', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-04-04 09:11:42', '2020-04-04 09:11:42');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table webmall.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table webmall.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.menus: ~1 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2020-02-11 00:10:11', '2020-02-11 00:10:11');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table webmall.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.menu_items: ~18 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-02-11 00:10:11', '2020-02-11 00:10:11', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-02-11 00:10:11', '2020-02-11 00:10:11', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-02-11 00:10:14', '2020-02-11 00:10:14', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-02-11 00:10:14', '2020-02-11 00:10:14', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-02-11 00:10:14', '2020-02-11 00:10:14', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-02-11 00:10:14', '2020-02-11 00:10:14', 'voyager.hooks', NULL),
	(15, 1, 'Orders', '', '_self', 'voyager-buy', NULL, NULL, 15, '2020-02-11 00:22:34', '2020-02-11 00:22:34', 'voyager.orders.index', NULL),
	(16, 1, 'Shops', '', '_self', 'voyager-shop', '#000000', NULL, 16, '2020-02-19 17:15:37', '2020-02-19 17:20:29', 'voyager.shops.index', 'null'),
	(17, 1, 'Products', '', '_self', 'voyager-bag', '#000000', NULL, 17, '2020-02-19 17:18:39', '2020-02-19 17:20:44', 'voyager.products.index', 'null'),
	(18, 1, 'Coupons', '', '_self', NULL, NULL, NULL, 18, '2020-04-04 09:11:42', '2020-04-04 09:11:42', 'voyager.coupons.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table webmall.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.migrations: ~33 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_01_01_000000_create_pages_table', 1),
	(6, '2016_01_01_000000_create_posts_table', 1),
	(7, '2016_02_15_204651_create_categories_table', 1),
	(8, '2016_05_19_173453_create_menu_table', 1),
	(9, '2016_10_21_190000_create_roles_table', 1),
	(10, '2016_10_21_190000_create_settings_table', 1),
	(11, '2016_11_30_135954_create_permission_table', 1),
	(12, '2016_11_30_141208_create_permission_role_table', 1),
	(13, '2016_12_26_201236_data_types__add__server_side', 1),
	(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(15, '2017_01_14_005015_create_translations_table', 1),
	(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
	(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(21, '2017_08_05_000000_add_group_to_settings_table', 1),
	(22, '2017_11_26_013050_add_user_role_relationship', 1),
	(23, '2017_11_26_015000_create_user_roles_table', 1),
	(24, '2018_03_11_000000_add_user_settings', 1),
	(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(26, '2018_03_16_000000_make_settings_value_nullable', 1),
	(27, '2019_08_19_000000_create_failed_jobs_table', 1),
	(28, '2020_02_01_064736_create_shops_table', 1),
	(29, '2020_02_02_070326_create_products_table', 1),
	(30, '2020_02_06_174602_create_orders_table', 1),
	(31, '2020_02_06_181800_create_order_items_table', 1),
	(32, '2020_03_14_095509_create_product_categories_table', 2),
	(33, '2020_04_04_090325_create_coupons_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table webmall.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `grand_total` double(8,2) NOT NULL,
  `item_count` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method` enum('cash_on_delivery','paypal','stripe','card') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `shipping_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table webmall.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.order_items: ~0 rows (approximately)
DELETE FROM `order_items`;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- Dumping structure for table webmall.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.pages: ~1 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-02-11 00:10:14', '2020-02-11 00:10:14');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table webmall.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table webmall.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.permissions: ~61 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(2, 'browse_bread', NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(3, 'browse_database', NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(4, 'browse_media', NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(5, 'browse_compass', NULL, '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(6, 'browse_menus', 'menus', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(7, 'read_menus', 'menus', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(8, 'edit_menus', 'menus', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(9, 'add_menus', 'menus', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(10, 'delete_menus', 'menus', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(11, 'browse_roles', 'roles', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(12, 'read_roles', 'roles', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(13, 'edit_roles', 'roles', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(14, 'add_roles', 'roles', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(15, 'delete_roles', 'roles', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(16, 'browse_users', 'users', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(17, 'read_users', 'users', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(18, 'edit_users', 'users', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(19, 'add_users', 'users', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(20, 'delete_users', 'users', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(21, 'browse_settings', 'settings', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(22, 'read_settings', 'settings', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(23, 'edit_settings', 'settings', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(24, 'add_settings', 'settings', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(25, 'delete_settings', 'settings', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(26, 'browse_categories', 'categories', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(27, 'read_categories', 'categories', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(28, 'edit_categories', 'categories', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(29, 'add_categories', 'categories', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(30, 'delete_categories', 'categories', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(31, 'browse_posts', 'posts', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(32, 'read_posts', 'posts', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(33, 'edit_posts', 'posts', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(34, 'add_posts', 'posts', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(35, 'delete_posts', 'posts', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(36, 'browse_pages', 'pages', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(37, 'read_pages', 'pages', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(38, 'edit_pages', 'pages', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(39, 'add_pages', 'pages', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(40, 'delete_pages', 'pages', '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(41, 'browse_hooks', NULL, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(42, 'browse_orders', 'orders', '2020-02-11 00:22:34', '2020-02-11 00:22:34'),
	(43, 'read_orders', 'orders', '2020-02-11 00:22:34', '2020-02-11 00:22:34'),
	(44, 'edit_orders', 'orders', '2020-02-11 00:22:34', '2020-02-11 00:22:34'),
	(45, 'add_orders', 'orders', '2020-02-11 00:22:34', '2020-02-11 00:22:34'),
	(46, 'delete_orders', 'orders', '2020-02-11 00:22:34', '2020-02-11 00:22:34'),
	(47, 'browse_shops', 'shops', '2020-02-19 17:15:37', '2020-02-19 17:15:37'),
	(48, 'read_shops', 'shops', '2020-02-19 17:15:37', '2020-02-19 17:15:37'),
	(49, 'edit_shops', 'shops', '2020-02-19 17:15:37', '2020-02-19 17:15:37'),
	(50, 'add_shops', 'shops', '2020-02-19 17:15:37', '2020-02-19 17:15:37'),
	(51, 'delete_shops', 'shops', '2020-02-19 17:15:37', '2020-02-19 17:15:37'),
	(52, 'browse_products', 'products', '2020-02-19 17:18:39', '2020-02-19 17:18:39'),
	(53, 'read_products', 'products', '2020-02-19 17:18:39', '2020-02-19 17:18:39'),
	(54, 'edit_products', 'products', '2020-02-19 17:18:39', '2020-02-19 17:18:39'),
	(55, 'add_products', 'products', '2020-02-19 17:18:39', '2020-02-19 17:18:39'),
	(56, 'delete_products', 'products', '2020-02-19 17:18:39', '2020-02-19 17:18:39'),
	(57, 'browse_coupons', 'coupons', '2020-04-04 09:11:42', '2020-04-04 09:11:42'),
	(58, 'read_coupons', 'coupons', '2020-04-04 09:11:42', '2020-04-04 09:11:42'),
	(59, 'edit_coupons', 'coupons', '2020-04-04 09:11:42', '2020-04-04 09:11:42'),
	(60, 'add_coupons', 'coupons', '2020-04-04 09:11:42', '2020-04-04 09:11:42'),
	(61, 'delete_coupons', 'coupons', '2020-04-04 09:11:42', '2020-04-04 09:11:42');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table webmall.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.permission_role: ~74 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
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
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(47, 3),
	(48, 1),
	(48, 3),
	(49, 1),
	(49, 3),
	(50, 1),
	(50, 3),
	(51, 1),
	(51, 3),
	(52, 1),
	(52, 3),
	(53, 1),
	(53, 3),
	(54, 1),
	(54, 3),
	(55, 1),
	(55, 3),
	(56, 1),
	(56, 3),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table webmall.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.posts: ~4 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-11 00:10:14', '2020-02-11 00:10:14'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-11 00:10:14', '2020-02-11 00:10:14');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table webmall.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_shop_id_foreign` (`shop_id`),
  CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.products: ~48 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `price`, `cover_img`, `shop_id`, `created_at`, `updated_at`) VALUES
	(3, 'Non ut voluptatem.', '<p>Exercitationem accusantium distinctio fuga aliquid quod sequi praesentium quia et recusandae qui deserunt expedita veniam recusandae ex molestias cumque sed deserunt reprehenderit.</p>', 4721.00, NULL, NULL, '2020-02-19 18:05:00', '2020-03-14 10:04:31'),
	(4, 'Sunt et distinctio.', '<p>Itaque dicta quo inventore esse natus enim aliquid molestiae reiciendis cumque ad voluptas nobis.</p>', 3105.00, 'products\\March2020\\ZsIocI2E5iZGZHwCtBxp.jpg', NULL, '2020-02-19 18:05:00', '2020-03-22 09:06:43'),
	(5, 'Reprehenderit est.', '<p>Sunt atque aliquam explicabo sapiente et quis ducimus enim molestiae perspiciatis fuga qui corporis nobis iste impedit aut aperiam et aut ut qui eum quia ullam et.</p>', 929.00, NULL, NULL, '2020-02-19 18:05:00', '2020-03-14 10:49:45'),
	(6, 'Rerum fugit deserunt.', '<p>Maiores ut qui aperiam voluptates sed quod cum incidunt ut occaecati libero et minus sed earum ea qui sequi nihil aspernatur.</p>', 4839.00, NULL, NULL, '2020-02-19 18:05:00', '2020-03-14 10:05:06'),
	(7, 'Ipsa illo.', '<p>Illo sit laborum est quod natus maiores voluptas dolores maxime dolorem sequi nam quis similique qui ut similique est nisi est dolorem quo aut.</p>', 2020.00, NULL, NULL, '2020-02-19 18:05:00', '2020-03-14 10:05:20'),
	(8, 'Ducimus perspiciatis provident.', 'Non maxime impedit omnis vero nulla officiis et vel corporis rerum id vero nisi architecto mollitia et qui eaque aut necessitatibus commodi enim.', 3978.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(9, 'Quo reiciendis.', 'Sunt architecto ducimus porro iusto explicabo et quod quibusdam nemo aliquid et accusantium inventore nam totam qui.', 331.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(10, 'Maiores accusantium molestiae.', 'Aut est fugit voluptatem quidem adipisci consectetur architecto tenetur aut id quam enim eaque.', 4207.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(11, 'Quo nostrum voluptas.', 'Voluptas sed et aliquam consequatur temporibus consequatur nulla in commodi dicta est unde totam molestiae recusandae et.', 947.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(12, 'Non ullam.', 'Quis iure quo accusantium ea adipisci non facere odit ducimus aut in sunt velit sunt.', 2179.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(13, 'Mollitia quisquam molestias.', 'Omnis sapiente ut sunt voluptas maiores numquam ut quia debitis exercitationem id accusamus blanditiis quisquam voluptas minus eaque quasi deleniti aut.', 3778.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(14, 'Molestias facilis.', 'Hic numquam dolorum nostrum molestias dolorum quasi debitis cumque error aliquam officia et quae repellat consequatur et nesciunt quam dolores officia deserunt inventore est inventore fugit ducimus maxime.', 4890.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(15, 'Animi recusandae.', 'Odit in asperiores veritatis et a numquam quaerat maxime in quam eos asperiores doloribus et libero sint eos debitis perspiciatis perspiciatis vel nulla est maiores.', 4884.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(16, 'Tenetur quibusdam.', 'Minus nisi sint quo dolor ipsam illum quo soluta sapiente illo porro facilis adipisci ducimus quia nihil temporibus autem non sunt error consequatur nulla nemo.', 2767.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(17, 'Corrupti ut.', 'Ad quo dolores iste deleniti aliquam unde aut molestias officiis est laudantium illo earum ipsum consectetur qui cumque autem nobis quisquam natus harum nostrum qui fugit voluptas fuga vitae.', 3284.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(18, 'Voluptas quisquam.', 'Qui perferendis aut voluptas est ut officia aut quas vitae soluta voluptas perspiciatis omnis ducimus ut error animi ea autem odit voluptas.', 4358.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(19, 'Sint atque enim.', 'Et provident ut nemo placeat amet soluta non ea non beatae ad et quisquam ipsam temporibus quia aut aut nihil soluta.', 719.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(20, 'Atque repellat vitae.', 'Magnam atque ipsa rem numquam qui sint aliquid magni aliquid dolorum labore doloribus dolores et veniam aliquam consequatur quas molestiae natus quos ipsa saepe culpa nihil est.', 4585.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(21, 'Eum quo qui.', 'Cupiditate quia debitis voluptates ut sit aspernatur commodi est aut asperiores ullam placeat rerum sapiente error aspernatur animi laudantium eos molestiae.', 1026.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(22, 'Dolores culpa autem.', 'Qui esse minima deleniti voluptatibus officiis labore omnis voluptatem eius sapiente ut deleniti delectus quo quia officia assumenda.', 4117.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(23, 'Quae eveniet consequuntur.', 'Officia rerum necessitatibus aut sint non voluptatum veritatis harum non eos sunt cupiditate unde deleniti error eum dolorem architecto deserunt omnis dolorum dolore sed voluptatum quia.', 3216.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(24, 'Aperiam vel qui.', 'Et odio totam magnam odio corrupti neque illum sunt quae et rerum perspiciatis non minima soluta et porro esse fuga facilis vitae qui et soluta in alias facere.', 701.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(25, 'Et aut libero.', 'Labore necessitatibus maiores id ab voluptatibus quisquam quaerat est corporis sit dolores nostrum eveniet ad eum aperiam qui saepe natus.', 3577.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(26, 'Tenetur corporis.', 'Voluptates et modi deserunt ullam minus labore neque mollitia nemo provident eius eveniet sint quod veniam tenetur perferendis commodi aspernatur neque aliquid animi amet minima ad.', 1438.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(27, 'Minus voluptatem.', 'In fugiat eum quibusdam et eos aut porro veniam aut aperiam est in pariatur laborum.', 274.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(28, 'Vel qui.', 'At aut qui maiores recusandae non voluptas consequatur est aspernatur cumque laborum eum tenetur molestias.', 2846.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(29, 'Aut neque.', 'Quia reprehenderit accusamus odio eaque et non officiis sapiente et porro reprehenderit laboriosam accusantium et nobis adipisci eos non et.', 3161.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(30, 'Rerum facere.', 'Voluptatem quia repudiandae nulla voluptas aut quia cum qui veritatis minima qui dignissimos aperiam veniam mollitia consequatur et.', 4361.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(31, 'Eum enim.', 'Beatae dolor recusandae similique natus aut aut rerum qui omnis sint omnis excepturi ratione modi iusto modi quis illum maiores rerum molestias reiciendis maxime.', 1943.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(32, 'Ut numquam est.', 'Nisi aut et ut quibusdam et aut laboriosam assumenda iste facilis nemo fugiat est debitis.', 1614.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(33, 'Consequatur vel incidunt.', 'Est repellendus laborum vitae accusantium aut corporis voluptas quos voluptas perspiciatis eaque magnam fuga ut est voluptatem ipsa consequatur reprehenderit voluptatibus aut quidem architecto est voluptatibus modi nulla.', 4119.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(34, 'Tenetur explicabo.', 'Dolor deserunt quia et sequi facilis rerum voluptatibus voluptate sint sint quasi eius assumenda consequatur recusandae possimus cum accusantium perferendis nisi.', 1458.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(35, 'Ex qui non.', 'Beatae commodi consequatur ipsam placeat incidunt maxime iste reprehenderit velit eveniet molestias eligendi sunt facilis laborum eligendi voluptates tenetur quos eveniet cum blanditiis similique commodi.', 4040.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(36, 'Quis modi possimus.', 'Provident numquam assumenda quibusdam aliquam odit accusamus ex sunt quaerat numquam aperiam laborum ea sit numquam voluptas veniam facere doloribus pariatur sed iste cumque assumenda.', 3711.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(37, 'Voluptas ipsum.', 'Dolorum ut qui ratione corporis ut id et omnis aut porro magni fugiat incidunt qui placeat sit est est corporis eos iure praesentium doloremque.', 2986.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(38, 'Quibusdam quas id.', 'Aut suscipit sint voluptatum in aut maxime magnam sed vel velit illo praesentium ut fugit aliquam nulla.', 3519.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(39, 'Perferendis dolores numquam.', 'Nihil ut voluptas voluptate molestiae quas nobis temporibus soluta optio non et sint laudantium eius iusto et harum quibusdam et accusamus.', 4462.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(40, 'Hic quo tempore.', 'Beatae accusantium veritatis deleniti ipsa fugit dolor fugit fugiat inventore a at voluptatem consequatur ea natus deleniti atque et.', 2358.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(41, 'Quis qui.', 'Voluptas et porro unde est eos necessitatibus et doloremque soluta vitae est eligendi non eum adipisci voluptatem.', 2355.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(42, 'Odit temporibus.', 'Et laboriosam saepe nam culpa dolorum ipsam qui occaecati et eius voluptate dicta ut in alias soluta nulla.', 4790.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(43, 'Aut voluptatem.', 'Consequatur nobis corporis quia nemo consequatur quis in at voluptatem dolore sunt voluptas porro ut et autem et.', 1996.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(44, 'Quibusdam incidunt.', 'Aut enim assumenda et expedita temporibus impedit voluptas omnis laudantium ipsam pariatur quas libero architecto pariatur.', 336.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(45, 'Rem ut eaque.', 'Cumque quia ipsum est repellendus vel voluptate dignissimos nihil saepe consequatur perferendis unde cum id et consequuntur.', 2871.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(46, 'Quisquam sint.', 'Corrupti recusandae qui iure id porro soluta delectus exercitationem ipsam blanditiis hic et voluptatibus quo a nam magni eum dolor aut pariatur aut quod sunt.', 1100.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(47, 'Sunt officiis.', 'Ut eligendi commodi eaque animi qui voluptate ipsam fugit sit facilis est ex et ea eaque perspiciatis neque non.', 3071.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(48, 'Atque nisi eius.', 'Tempore et neque et eligendi velit unde unde laudantium cum saepe non corporis et.', 3271.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(49, 'Eos quis doloribus.', 'Eum qui cum cum eligendi voluptates est esse est ipsum quo perspiciatis soluta dolorem quasi animi optio sint magni voluptas.', 4509.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10'),
	(50, 'Nihil error pariatur.', 'Omnis amet voluptatibus dolores aut praesentium ab quibusdam dolores doloremque nulla tempora accusamus temporibus.', 1121.00, NULL, NULL, '2020-02-19 18:05:10', '2020-02-19 18:05:10');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table webmall.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.product_categories: ~5 rows (approximately)
DELETE FROM `product_categories`;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 3, 4, NULL, NULL),
	(2, 6, 5, NULL, NULL),
	(3, 6, 6, NULL, NULL),
	(4, 7, 3, NULL, NULL),
	(5, 5, 7, NULL, NULL);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;

-- Dumping structure for table webmall.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.roles: ~3 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(2, 'user', 'Normal User', '2020-02-11 00:10:11', '2020-02-11 00:10:11'),
	(3, 'seller', 'Seller', '2020-02-19 17:25:16', '2020-02-19 17:25:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table webmall.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.settings: ~10 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table webmall.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `rating` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_user_id_foreign` (`user_id`),
  CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.shops: ~1 rows (approximately)
DELETE FROM `shops`;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `name`, `user_id`, `is_active`, `description`, `rating`, `created_at`, `updated_at`) VALUES
	(2, 'Recusandae similique : seller 2 shop', 5, 1, 'Id tempora voluptates sed aut quis rerum provident est natus illo dolor quam quia eos.', NULL, '2020-02-19 18:05:00', '2020-02-25 00:39:14');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table webmall.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.translations: ~0 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table webmall.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@webmall.com', 'users/default.png', '2020-02-09 12:42:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bUcKj1RxZeZGcZ8Bk8Ph0FxVQmOq5KTNdJSzFPfSxyyhXdhOKCd83iB0ZYPb', NULL, '2020-02-09 12:42:53', '2020-02-11 00:15:23'),
	(2, 2, 'customer 1', 'customer@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, '{"locale":"en"}', '2020-02-11 00:16:34', '2020-02-19 17:25:45'),
	(3, 2, 'customer 2', 'customer2@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-11 00:16:34', '2020-02-11 00:16:34'),
	(4, 3, 'Seller 1', 'seller1@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-11 00:16:34', '2020-02-11 00:16:34'),
	(5, 3, 'Seller 2', 'seller2@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-11 00:16:34', '2020-02-11 00:16:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table webmall.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webmall.user_roles: ~0 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
