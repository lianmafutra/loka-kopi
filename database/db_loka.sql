-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 5.7.24 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk db_loka
CREATE DATABASE IF NOT EXISTS `db_loka` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_loka`;

-- membuang struktur untuk table db_loka.audits
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.audits: ~49 rows (lebih kurang)
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 112277, 'created', 'App\\Models\\PermissionGroup', 38, '[]', '{"id":38,"name":"dwqd","desc":"wqdqw"}', 'http://127.0.0.1:8000/admin/permission-group', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 01:14:21', '2023-07-19 01:14:21'),
	(2, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\PermissionGroup', 38, '{"id":38,"desc":"wqdqw","name":"dwqd"}', '[]', 'http://127.0.0.1:8000/admin/permission-group/38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 01:16:08', '2023-07-19 01:16:08'),
	(3, 'App\\Models\\User', 112277, 'created', 'App\\Models\\PermissionGroup', 39, '[]', '{"id":39,"name":"s","desc":"s"}', 'http://127.0.0.1:8000/admin/permission-group', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 01:19:21', '2023-07-19 01:19:21'),
	(4, 'App\\Models\\User', 112277, 'created', 'App\\Models\\PermissionGroup', 40, '[]', '{"id":40,"name":"dqw","desc":"dwqd"}', 'http://127.0.0.1:8000/admin/permission-group', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 01:22:45', '2023-07-19 01:22:45'),
	(5, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-18 21:24:43"}', '{"last_login_at":"2023-07-19 08:49:34"}', 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 08:49:34', '2023-07-19 08:49:34'),
	(6, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\PermissionGroup', 40, '{"id":40,"desc":"dwqd","name":"dqw"}', '[]', 'http://127.0.0.1:8000/admin/permission-group/40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 08:55:15', '2023-07-19 08:55:15'),
	(7, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\PermissionGroup', 39, '{"id":39,"desc":"s","name":"s"}', '[]', 'http://127.0.0.1:8000/admin/permission-group/39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 08:58:35', '2023-07-19 08:58:35'),
	(8, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-19 08:49:34"}', '{"last_login_at":"2023-07-19 22:22:04"}', 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:22:04', '2023-07-19 22:22:04'),
	(9, 'App\\Models\\User', 112277, 'created', 'App\\Models\\User', 112278, '[]', '{"id":112278,"username":"lwmqld","nama_lengkap":"lmdlqm","kontak":"21312","email":null,"password":"$2y$10$BryukqQ\\/CwoTrWdHW\\/K8veHRR971YQcI5AvDRd55w3rMhQ4p59IP6"}', 'http://127.0.0.1:8000/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:35:00', '2023-07-19 22:35:00'),
	(10, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 112278, '{"id":112278,"username":"lwmqld","nip":null,"bidang_id":null,"email":null,"nama_lengkap":"lmdlqm","kontak":"21312","alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$BryukqQ\\/CwoTrWdHW\\/K8veHRR971YQcI5AvDRd55w3rMhQ4p59IP6","remember_token":null,"gldepan":null,"nama":null,"glblk":null,"kunker":null,"nunker":null,"kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://127.0.0.1:8000/admin/master-user/112278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:35:10', '2023-07-19 22:35:10'),
	(11, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-19 22:22:04"}', '{"last_login_at":"2023-07-19 22:37:09"}', 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:37:09', '2023-07-19 22:37:09'),
	(12, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-19 22:37:09"}', '{"last_login_at":"2023-07-19 22:41:59"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:41:59', '2023-07-19 22:41:59'),
	(13, 'App\\Models\\User', 112277, 'created', 'App\\Models\\User', 112278, '[]', '{"id":112278,"username":"dq","nama_lengkap":"dqw","kontak":null,"email":"dq","password":"$2y$10$m4wVwdfIgNTwWgoRHIM8WuHrjvMox048eEOCZgAGTVzL6.x9nlwki"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:52:33', '2023-07-19 22:52:33'),
	(14, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 112278, '{"id":112278,"username":"dq","nip":null,"bidang_id":null,"email":"dq","nama_lengkap":"dqw","kontak":null,"alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$m4wVwdfIgNTwWgoRHIM8WuHrjvMox048eEOCZgAGTVzL6.x9nlwki","remember_token":null,"gldepan":null,"nama":null,"glblk":null,"kunker":null,"nunker":null,"kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://laravel-starter.test:8080/admin/master-user/112278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:52:43', '2023-07-19 22:52:43'),
	(15, 'App\\Models\\User', 112277, 'created', 'App\\Models\\User', 112279, '[]', '{"id":112279,"username":"q","nama_lengkap":"d","kontak":null,"email":null,"password":"$2y$10$bYRF1F8Po7ifbUHBp9Dxo.\\/sqkKn1tTrx7kjnfoQY8AgOP\\/7DHzwm"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 22:57:08', '2023-07-19 22:57:08'),
	(16, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 112279, '{"id":112279,"username":"q","nip":null,"bidang_id":null,"email":null,"nama_lengkap":"d","kontak":null,"alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$bYRF1F8Po7ifbUHBp9Dxo.\\/sqkKn1tTrx7kjnfoQY8AgOP\\/7DHzwm","remember_token":null,"gldepan":null,"nama":null,"glblk":null,"kunker":null,"nunker":null,"kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://laravel-starter.test:8080/admin/master-user/112279', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 23:01:07', '2023-07-19 23:01:07'),
	(17, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-19 22:41:59"}', '{"last_login_at":"2023-07-19 23:03:38"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-19 23:03:38', '2023-07-19 23:03:38'),
	(18, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-19 23:03:38"}', '{"last_login_at":"2023-07-20 06:23:06"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 06:23:06', '2023-07-20 06:23:06'),
	(19, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-20 06:23:06"}', '{"last_login_at":"2023-07-20 09:04:47"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 09:04:47', '2023-07-20 09:04:47'),
	(20, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 48, '{"nama_lengkap":"admin2","password":"$2y$10$AjP.Sn2TTBkVpDkAOnICTu\\/uHMqfpWnI6bZYtleg6GW\\/W\\/dueQbgu"}', '{"nama_lengkap":"admin22","password":"$2y$10$iIqFXRzSULAgIIDUunfOke15McZC8DmEfV0e6CKaKDnqIqnToNE9m"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 09:25:41', '2023-07-20 09:25:41'),
	(21, 'App\\Models\\User', 112277, 'created', 'App\\Models\\User', 112278, '[]', '{"id":112278,"username":"dqwd","nama_lengkap":"wqd","kontak":"1212","email":null,"password":"$2y$10$BoNECQh3zZGVkb1k3K7xveGf0N1kscJBqUkh1bjNVFY5FdwMLbQla"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 09:25:52', '2023-07-20 09:25:52'),
	(22, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 112278, '{"id":112278,"username":"dqwd","nip":null,"bidang_id":null,"email":null,"nama_lengkap":"wqd","kontak":"1212","alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$BoNECQh3zZGVkb1k3K7xveGf0N1kscJBqUkh1bjNVFY5FdwMLbQla","remember_token":null,"gldepan":null,"nama":null,"glblk":null,"kunker":null,"nunker":null,"kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://laravel-starter.test:8080/admin/master-user/112278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 09:25:56', '2023-07-20 09:25:56'),
	(23, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-20 09:04:47"}', '{"last_login_at":"2023-07-20 19:13:42"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 19:13:42', '2023-07-20 19:13:42'),
	(24, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 48, '{"kontak":null,"password":"$2y$10$iIqFXRzSULAgIIDUunfOke15McZC8DmEfV0e6CKaKDnqIqnToNE9m"}', '{"kontak":"089902103902","password":"$2y$10$Uei3iIW\\/IEFVcHZe7wa4L.G\\/K.neOgCMh0nX4yW4Evb85e1ZbZjp."}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 20:39:28', '2023-07-20 20:39:28'),
	(25, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 49, '{"kontak":null,"password":"$2y$10$hTxfMLhXUT9bOUrRSjpdauUsarOxEeRBuYd7TP9Ojv\\/l1Yrw.9qte"}', '{"kontak":"0323901923","password":"$2y$10$3ZnbvjOQwIy6NZRtOnpoGul6t3UcIY3KjwKuXIagoFMOQ3U3MqQa6"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 20:39:42', '2023-07-20 20:39:42'),
	(26, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 48, '{"id":48,"username":"200105072023021002","nip":"200105072023021002","bidang_id":null,"email":"admin2@gmail.com","nama_lengkap":"admin22","kontak":"089902103902","alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$Uei3iIW\\/IEFVcHZe7wa4L.G\\/K.neOgCMh0nX4yW4Evb85e1ZbZjp.","remember_token":null,"gldepan":null,"nama":"ADIB YUDA PRATAMA","glblk":"A.Md.Ak.","kunker":"4002000000","nunker":"INSPEKTORAT KOTA JAMBI","kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://laravel-starter.test:8080/admin/master-user/48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 20:39:54', '2023-07-20 20:39:54'),
	(27, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-20 19:13:42"}', '{"last_login_at":"2023-07-20 23:57:32"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 23:57:32', '2023-07-20 23:57:32'),
	(28, 'App\\Models\\User', 112277, 'created', 'App\\Models\\User', 112278, '[]', '{"id":112278,"username":"d","nama_lengkap":"dq","kontak":"3213","email":null,"password":"$2y$10$4TPThJtFlKmQO2V6lFJR9O4rkB0Fu6VkemsMAj2Mko525\\/fcd8tYK"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 23:57:51', '2023-07-20 23:57:51'),
	(29, 'App\\Models\\User', 112277, 'deleted', 'App\\Models\\User', 112278, '{"id":112278,"username":"d","nip":null,"bidang_id":null,"email":null,"nama_lengkap":"dq","kontak":"3213","alamat":null,"jenis_kelamin":null,"status":"AKTIF","password":"$2y$10$4TPThJtFlKmQO2V6lFJR9O4rkB0Fu6VkemsMAj2Mko525\\/fcd8tYK","remember_token":null,"gldepan":null,"nama":null,"glblk":null,"kunker":null,"nunker":null,"kjab":null,"njab":null,"foto":null,"keselon":null,"neselon":null,"kgolru":null,"ngolru":null,"pangkat":null,"last_login_at":null,"last_login_ip":null}', '[]', 'http://laravel-starter.test:8080/admin/master-user/112278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-20 23:58:14', '2023-07-20 23:58:14'),
	(30, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"foto":null}', '{"foto":"a1699373-6ddb-42aa-bca1-160729e2c994"}', 'http://laravel-starter.test:8080/user/profile/photo/change', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:13:20', '2023-07-21 00:13:20'),
	(31, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"kontak":"082244261525"}', '{"kontak":"0822442615252"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:36:16', '2023-07-21 00:36:16'),
	(32, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"kontak":"0822442615252"}', '{"kontak":"082244261525"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:36:21', '2023-07-21 00:36:21'),
	(33, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"email":"lianmafutra@gmail.com","kontak":"082244261525"}', '{"email":"lianmafutra@gmail.com2","kontak":"0822442615252"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:36:48', '2023-07-21 00:36:48'),
	(34, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"email":"lianmafutra@gmail.com2","nama_lengkap":"Lian Mafutra Dev","kontak":"0822442615252"}', '{"email":"lianmafutra@gmail.com22","nama_lengkap":"Lian Mafutra Dev2","kontak":"08224426152522"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:37:04', '2023-07-21 00:37:04'),
	(35, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"email":"lianmafutra@gmail.com22","nama_lengkap":"Lian Mafutra Dev2","kontak":"08224426152522"}', '{"email":"lianmafutra@gmail.com","nama_lengkap":"Lian Mafutra Dev","kontak":"082244261525"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:37:11', '2023-07-21 00:37:11'),
	(36, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"alamat":null}', '{"alamat":"jl"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:38:07', '2023-07-21 00:38:07'),
	(37, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"alamat":"jl"}', '{"alamat":"Jl. Jawa No.99Kebun Handil, Kec. Jelutung, Kota Jambi, Jambi 36125"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:40:51', '2023-07-21 00:40:51'),
	(38, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"jenis_kelamin":null}', '{"jenis_kelamin":"L"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:45:12', '2023-07-21 00:45:12'),
	(39, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"jenis_kelamin":"L"}', '{"jenis_kelamin":"P"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:46:12', '2023-07-21 00:46:12'),
	(40, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"jenis_kelamin":"P"}', '{"jenis_kelamin":"L"}', 'http://laravel-starter.test:8080/user/profile/112277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 00:46:17', '2023-07-21 00:46:17'),
	(41, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-20 23:57:32"}', '{"last_login_at":"2023-07-21 02:02:05"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 02:02:05', '2023-07-21 02:02:05'),
	(42, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-21 02:02:05"}', '{"last_login_at":"2023-07-21 02:04:40"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 02:04:40', '2023-07-21 02:04:40'),
	(43, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"last_login_at":"2023-07-21 02:04:40"}', '{"last_login_at":"2023-07-21 08:36:29"}', 'http://laravel-starter.test:8080/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 08:36:29', '2023-07-21 08:36:29'),
	(44, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 49, '{"password":"$2y$10$3ZnbvjOQwIy6NZRtOnpoGul6t3UcIY3KjwKuXIagoFMOQ3U3MqQa6"}', '{"password":"$2y$10$uZSdsqJzPyUXfedJpMMJ9eFGTuTnh4uZQlUgVk6h31q8Ttj\\/HYcDK"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:30:08', '2023-07-21 09:30:08'),
	(45, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 192, '{"password":"$2y$10$2wLaswl9FTPeSvgcLgdCl.VyxNLafluR.unhmuLqyz8\\/ixyl9G.mi"}', '{"password":"$2y$10$fcSX59FP\\/0WKNUPQgV41WOZuGwXli\\/xajGPbfEgmlhKiBtam9q\\/8S"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:30:16', '2023-07-21 09:30:16'),
	(46, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 192, '{"password":"$2y$10$fcSX59FP\\/0WKNUPQgV41WOZuGwXli\\/xajGPbfEgmlhKiBtam9q\\/8S"}', '{"password":"$2y$10$iTIA4LGNVzrczxNdScEBEexn4k9ml7HAZLzkQgwcb0nHV8zq.yRwm"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:30:25', '2023-07-21 09:30:25'),
	(47, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 112277, '{"password":"$2y$10$chRjlp8KIegoD6wsyAwMi.Vm9no0A\\/SjWyDC9ivLiWsTRUUStANga"}', '{"password":"$2y$10$0NB6gLigZ4UxuZ0nnjaQxuSqr2Nk8L7KQTn6NK3DJq9uF418UOIL6"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:33:47', '2023-07-21 09:33:47'),
	(48, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 49, '{"email":null,"password":"$2y$10$uZSdsqJzPyUXfedJpMMJ9eFGTuTnh4uZQlUgVk6h31q8Ttj\\/HYcDK"}', '{"email":"ok@gmail.com","password":"$2y$10$2alaM\\/qTDj2dsNLml4WrHeNznfGcvuMCwoxpKNA8\\/1xTOG9.wNO86"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:34:03', '2023-07-21 09:34:03'),
	(49, 'App\\Models\\User', 112277, 'updated', 'App\\Models\\User', 192, '{"email":null,"kontak":null,"password":"$2y$10$iTIA4LGNVzrczxNdScEBEexn4k9ml7HAZLzkQgwcb0nHV8zq.yRwm"}', '{"email":"bb@gmail.com","kontak":"0829389273","password":"$2y$10$SdutgiYNd3dG.HiAYT6h0u2J7IVLVOCNeF1OjuMy.w18\\/BC0J.i12"}', 'http://laravel-starter.test:8080/admin/master-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', NULL, '2023-07-21 09:34:19', '2023-07-21 09:34:19');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.barista
CREATE TABLE IF NOT EXISTS `barista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `gerobak_id` int(11) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `tgl_registrasi` date NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.barista: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `barista` DISABLE KEYS */;
INSERT INTO `barista` (`id`, `users_id`, `gerobak_id`, `tgl_lahir`, `tgl_registrasi`, `alamat`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2024-04-18', '2024-04-19', 'Jl. Sudirman No. 452', '2024-09-07 07:42:43', '2024-09-07 09:05:14'),
	(2, 2, 2, '1995-05-22', '2024-09-07', 'Jl. Ahmad Yani No. 12', '2024-09-07 07:42:43', '2024-09-07 07:42:43'),
	(3, 3, 3, '1988-03-10', '2024-09-07', 'Jl. Gajah Mada No. 5', '2024-09-07 07:42:43', '2024-09-07 07:42:43'),
	(5, 5, 5, '1992-11-11', '2024-09-07', 'Jl. Merdeka No. 20', '2024-09-07 07:42:43', '2024-09-07 07:42:43'),
	(44, 4, 4, '1993-07-19', '2024-09-07', 'Jl. Panglima Polim No. 8', '2024-09-07 07:42:43', '2024-09-07 07:42:43');
/*!40000 ALTER TABLE `barista` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.failed_jobs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` varchar(500) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `name_origin` text NOT NULL,
  `name_hash` varchar(200) NOT NULL,
  `path` varchar(500) NOT NULL,
  `mime` varchar(500) NOT NULL,
  `extension` varchar(500) DEFAULT NULL,
  `size` varchar(500) DEFAULT NULL,
  `desc` text,
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_hash` (`name_hash`),
  KEY `FK_file_users` (`created_by`),
  KEY `FK_file_kanban` (`model_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1308 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_loka.file: ~162 rows (lebih kurang)
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`id`, `file_id`, `model_id`, `name_origin`, `name_hash`, `path`, `mime`, `extension`, `size`, `desc`, `order`, `created_by`, `created_at`, `updated_at`) VALUES
	(1018, '4239ddf4-c0f0-4f56-b224-833991c2f7f0', 323, 'BARCODE-REAKSI-CEPAT-1200x1200.jpg', 'Ha4qVAWjt1Iu4p3-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '276375', NULL, 1, 112277, '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(1019, '4239ddf4-c0f0-4f56-b224-833991c2f7f0', 323, 'HUT-KOTA-1024x1024.jpg', 'Ha4qVAWjt1Iu4p3-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '163957', NULL, 2, 112277, '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(1020, '4239ddf4-c0f0-4f56-b224-833991c2f7f0', 323, 'IKM-SM2-2022-1200x1200.jpg', 'Ha4qVAWjt1Iu4p3-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '225351', NULL, 3, 112277, '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(1021, '172efa83-5a85-4938-836b-66f89a52896d', 323, 'HUT-KOTA-768x768.jpg', 'uHcpqqbR7vaEo2F.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '111301', NULL, 1, 112277, '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(1022, 'bf4077ee-ce78-4c0c-bd80-b6d1aa4f392b', 323, 'SK-DAN-SP.pdf', 'Fh04KiQHXDPOhwM-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(1023, '5185e0d7-badb-4ff8-8ad9-b981dc538780', 325, 'BARCODE-REAKSI-CEPAT.jpg', 'TcT74R0VneXKIln-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 06:11:05', '2023-08-11 06:11:05'),
	(1024, 'fe56c1b7-95db-4351-bcf5-bc649c5ff51f', 333, 'BARCODE-REAKSI-CEPAT.jpg', 'sfEays5tBFcH1MU-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 06:17:17', '2023-08-11 06:17:17'),
	(1025, 'f6b65bc5-f248-4440-b57d-25b00f087c29', 335, 'BARCODE-REAKSI-CEPAT.jpg', 'gaeLOcwY041Qi6E-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 06:18:13', '2023-08-11 06:18:13'),
	(1026, '773ae080-edb1-49d0-8402-af95674dcfd9', 345, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'CGUHwzEMKBwxlxW-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '149541', NULL, 1, 112277, '2023-08-11 06:22:24', '2023-08-11 06:22:24'),
	(1027, '74ca7b64-3877-4845-8b95-62f55db6e1a9', 347, 'HUT-KOTA-768x768.jpg', 'Tj31n6yrdDK9FGq-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '111301', NULL, 1, 112277, '2023-08-11 06:23:14', '2023-08-11 06:23:14'),
	(1028, '74ca7b64-3877-4845-8b95-62f55db6e1a9', 347, 'logo hut png.png', 'Tj31n6yrdDK9FGq-2.png', '2023/08/cover_multi/', 'image/png', 'png', '187846', NULL, 2, 112277, '2023-08-11 06:23:15', '2023-08-11 06:23:15'),
	(1029, '74ca7b64-3877-4845-8b95-62f55db6e1a9', 347, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'Tj31n6yrdDK9FGq-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '151970', NULL, 3, 112277, '2023-08-11 06:23:16', '2023-08-11 06:23:16'),
	(1030, '74ca7b64-3877-4845-8b95-62f55db6e1a9', 347, 'BARCODE-REAKSI-CEPAT.jpg', 'Tj31n6yrdDK9FGq-4.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 4, 112277, '2023-08-11 06:23:18', '2023-08-11 06:23:18'),
	(1031, 'af888b59-06f9-4e6a-bbd5-fba9398eb0b0', 348, 'HUT-KOTA-768x768.jpg', 'O7KhTT2c16mMXzO-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '111301', NULL, 1, 112277, '2023-08-11 06:23:19', '2023-08-11 06:23:19'),
	(1032, 'af888b59-06f9-4e6a-bbd5-fba9398eb0b0', 348, 'logo hut png.png', 'O7KhTT2c16mMXzO-2.png', '2023/08/cover_multi/', 'image/png', 'png', '187846', NULL, 2, 112277, '2023-08-11 06:23:20', '2023-08-11 06:23:20'),
	(1033, 'af888b59-06f9-4e6a-bbd5-fba9398eb0b0', 348, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'O7KhTT2c16mMXzO-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '151970', NULL, 3, 112277, '2023-08-11 06:23:22', '2023-08-11 06:23:22'),
	(1034, 'af888b59-06f9-4e6a-bbd5-fba9398eb0b0', 348, 'BARCODE-REAKSI-CEPAT.jpg', 'O7KhTT2c16mMXzO-4.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 4, 112277, '2023-08-11 06:23:23', '2023-08-11 06:23:23'),
	(1035, '750df43b-3a32-4003-a44e-ff24550ee796', 353, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'zUX7iR61tJM6luj-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '75309', NULL, 1, 112277, '2023-08-11 06:27:13', '2023-08-11 06:27:13'),
	(1036, '750df43b-3a32-4003-a44e-ff24550ee796', 353, 'BARCODE-REAKSI-CEPAT-150x150.jpg', 'zUX7iR61tJM6luj-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '10786', NULL, 2, 112277, '2023-08-11 06:27:13', '2023-08-11 06:27:13'),
	(1037, 'c9667289-7f5c-4ebc-81ac-2438f2bc3b66', 354, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'SMKejBvH2ljLjWv-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '151970', NULL, 1, 112277, '2023-08-11 06:27:34', '2023-08-11 06:27:34'),
	(1038, 'c9667289-7f5c-4ebc-81ac-2438f2bc3b66', 354, 'HUT-KOTA.jpg', 'SMKejBvH2ljLjWv-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '817442', NULL, 2, 112277, '2023-08-11 06:27:34', '2023-08-11 06:27:34'),
	(1039, '73bca5cb-b1d1-446f-bad7-95987c3e6c16', 362, 'BARCODE-REAKSI-CEPAT.jpg', '8rsHSi8oJM3hdOf-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 06:31:23', '2023-08-11 06:31:23'),
	(1040, '3fa6158d-e5fa-4840-a166-b2963e573909', 364, 'BARCODE-REAKSI-CEPAT.jpg', '7l95y5actDb6GlL-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 06:31:47', '2023-08-11 06:31:47'),
	(1041, 'be3a7b2c-d4a3-4dd6-8ce5-0610e177b2e7', 365, 'BARCODE-REAKSI-CEPAT.jpg', 'w75YvSXwiaVyIsb-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 09:22:37', '2023-08-11 09:22:37'),
	(1042, 'be3a7b2c-d4a3-4dd6-8ce5-0610e177b2e7', 365, 'HUT-KOTA.jpg', 'w75YvSXwiaVyIsb-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '817442', NULL, 2, 112277, '2023-08-11 09:22:37', '2023-08-11 09:22:37'),
	(1043, '3f4cc8b3-b140-4fcf-b5d2-409b8d431bde', 368, 'BARCODE-REAKSI-CEPAT.jpg', 'KwYh3WYjDwI9kaO-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 09:42:34', '2023-08-11 09:42:34'),
	(1054, '5532d73e-2449-4bbe-891a-9b729f6c0e61', 381, 'HUT-KOTA.jpg', 'HfhvBrXgtJ7KqYX-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '817442', NULL, 1, 112277, '2023-08-11 09:49:20', '2023-08-11 09:49:20'),
	(1055, '7fa7c351-74bf-4987-bb86-9dc33d9e1727', 382, 'HUT-KOTA-768x768.jpg', 'lcjklz1Tqu7zwvr-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '111301', NULL, 1, 112277, '2023-08-11 09:50:01', '2023-08-11 09:50:01'),
	(1056, 'aee20d72-89e6-40c0-8977-0f9dad392bc0', 382, 'BARCODE-REAKSI-CEPAT.jpg', 'dNbUvaGJuPuDh6S.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-11 09:50:01', '2023-08-11 09:50:01'),
	(1058, '46c138a6-43e6-437e-b8bc-971cafbac188', 387, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'mQj4ywVDbSHNmrI.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '149541', NULL, 1, 112277, '2023-08-11 09:52:08', '2023-08-11 09:52:08'),
	(1059, '966ff223-982f-4b89-8852-28e0a35fe51c', 387, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'UwGLjqHNf0Pxpug-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '103306', NULL, 1, 112277, '2023-08-11 09:52:08', '2023-08-11 09:52:08'),
	(1060, 'ca17ad5f-1557-4349-a3b4-76aa4b2ca669', 388, 'HUT-KOTA.jpg', 'M5zKbMPDN5x8ltq.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '817442', NULL, 1, 112277, '2023-08-11 09:52:48', '2023-08-11 09:52:48'),
	(1061, '242b0004-488c-4785-984e-f45bb15bd2a2', 388, 'LOGO-HUT-KOTA-JAMBI_622_fix.png', 'hKMe5mjW04DOh4A-1.png', '2023/08/cover_multi/', 'image/png', 'png', '255342', NULL, 1, 112277, '2023-08-11 09:52:48', '2023-08-11 09:52:48'),
	(1062, '242b0004-488c-4785-984e-f45bb15bd2a2', 388, '12-SIPADUKO-MAINTANANCE-1.jpg', 'hKMe5mjW04DOh4A-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1094401', NULL, 2, 112277, '2023-08-11 09:52:49', '2023-08-11 09:52:49'),
	(1063, 'd1610e2b-e593-40c4-9df6-eabe134f61e9', 389, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'BFrjLshRuUmgWXH.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '103306', NULL, 1, 112277, '2023-08-11 09:54:19', '2023-08-11 09:54:19'),
	(1064, 'fea8b4a9-0961-4e64-8abe-d3bd7bfcf511', 389, 'BARCODE-REAKSI-CEPAT-150x150.jpg', '0lG36szVtNyQWVd-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '10786', NULL, 1, 112277, '2023-08-11 09:54:19', '2023-08-11 09:54:19'),
	(1065, 'fea8b4a9-0961-4e64-8abe-d3bd7bfcf511', 389, 'HUT-KOTA-1200x600.jpg', '0lG36szVtNyQWVd-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '94854', NULL, 2, 112277, '2023-08-11 09:54:19', '2023-08-11 09:54:19'),
	(1067, '91e1e0ba-57e3-4a60-8ef8-48fb2723923d', 390, '12-SIPADUKO-MAINTANANCE-1.jpg', 'zCZxyKenOd5baqW-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1094401', NULL, 1, 112277, '2023-08-11 09:55:46', '2023-08-11 09:55:46'),
	(1071, '1e7c4ef9-2f44-451e-8ab1-aeaa7dda066f', 390, 'HUT-KOTA-600x400.jpg', 'vp105LnKGxolpQ7.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '51532', NULL, 1, 112277, '2023-08-11 10:25:37', '2023-08-11 10:25:37'),
	(1072, '91e1e0ba-57e3-4a60-8ef8-48fb2723923d', 390, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'X2qrLfkYVeM6Bav-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '75309', NULL, 1, 112277, '2023-08-11 12:10:34', '2023-08-11 12:10:34'),
	(1073, '91e1e0ba-57e3-4a60-8ef8-48fb2723923d', 390, '12-SIPADUKO-MAINTANANCE-1-600x600.jpg', 'pRZMvtcSMLcJWSC-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '92670', NULL, 1, 112277, '2023-08-11 12:10:58', '2023-08-11 12:10:58'),
	(1078, '87a45f7c-b4ca-4b2f-b21c-6283ea3ff32a', 390, 'SK-DAN-SP.pdf', 'YcK1SXiFvckPsoC-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-11 13:07:49', '2023-08-11 13:07:49'),
	(1079, '87a45f7c-b4ca-4b2f-b21c-6283ea3ff32a', 390, 'PEMBAHARUAN-SP-29.pdf', 'YcK1SXiFvckPsoC-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 2, 112277, '2023-08-11 13:07:49', '2023-08-11 13:07:49'),
	(1080, '87a45f7c-b4ca-4b2f-b21c-6283ea3ff32a', 390, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'YcK1SXiFvckPsoC-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 3, 112277, '2023-08-11 13:07:49', '2023-08-11 13:07:49'),
	(1081, '87a45f7c-b4ca-4b2f-b21c-6283ea3ff32a', 390, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'YcK1SXiFvckPsoC-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-11 13:07:49', '2023-08-11 13:07:49'),
	(1094, '9fffb284-7498-4173-91b4-f3d1ae1c8bb7', 401, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'wjEIAqImfGDB8JU-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 1, 112277, '2023-08-11 13:14:41', '2023-08-11 13:14:41'),
	(1095, '9fffb284-7498-4173-91b4-f3d1ae1c8bb7', 401, 'PEMBAHARUAN-SP-29.pdf', 'wjEIAqImfGDB8JU-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 2, 112277, '2023-08-11 13:14:41', '2023-08-11 13:14:41'),
	(1096, '9fffb284-7498-4173-91b4-f3d1ae1c8bb7', 401, 'SK-DAN-SP.pdf', 'wjEIAqImfGDB8JU-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 3, 112277, '2023-08-11 13:14:41', '2023-08-11 13:14:41'),
	(1097, '9fffb284-7498-4173-91b4-f3d1ae1c8bb7', 401, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'wjEIAqImfGDB8JU-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-11 13:14:41', '2023-08-11 13:14:41'),
	(1098, '17012d78-22c8-439f-901f-7f684ac28d32', 403, 'SK-DAN-SP.pdf', 'k2OYzKYYrs9LI4c-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1099, '17012d78-22c8-439f-901f-7f684ac28d32', 403, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'k2OYzKYYrs9LI4c-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 2, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1100, '17012d78-22c8-439f-901f-7f684ac28d32', 403, 'PEMBAHARUAN-SP-29.pdf', 'k2OYzKYYrs9LI4c-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 3, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1101, '17012d78-22c8-439f-901f-7f684ac28d32', 403, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'k2OYzKYYrs9LI4c-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1102, '77354263-7efc-4908-ace6-4758f0956891', 403, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'LPG2oBs4bZzpWVp-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '151970', NULL, 1, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1103, '77354263-7efc-4908-ace6-4758f0956891', 403, 'HUT-KOTA-1200x600.jpg', 'LPG2oBs4bZzpWVp-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '94854', NULL, 2, 112277, '2023-08-11 13:16:12', '2023-08-11 13:16:12'),
	(1104, '77354263-7efc-4908-ace6-4758f0956891', 403, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'LPG2oBs4bZzpWVp-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '149541', NULL, 3, 112277, '2023-08-11 13:16:13', '2023-08-11 13:16:13'),
	(1105, '1dce6efc-9cb9-43d8-bab6-4b02f4a03f87', 403, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'f8zoo1acYG7IT9B.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '75309', NULL, 1, 112277, '2023-08-11 13:16:13', '2023-08-11 13:16:13'),
	(1109, '6c1b394e-93e6-4e13-9e27-45f4a567ef06', 404, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'jiTsDpPKUJOdKjU-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-11 13:18:34', '2023-08-11 13:18:34'),
	(1113, 'f0e720f9-2f73-4a35-b535-8ba6aceabad8', 404, 'BARCODE-REAKSI-CEPAT.jpg', 'MpDEnSIHYANYwVU-4.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 4, 112277, '2023-08-11 13:18:35', '2023-08-11 13:18:35'),
	(1114, 'fc9a416d-69e8-46f3-899a-322e19b0702b', 404, 'IKM-SM2-2022-300x212.jpg', 'FSGMAG0dCE4JEAZ.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '18531', NULL, 1, 112277, '2023-08-11 13:18:35', '2023-08-11 13:18:35'),
	(1117, '2e2243d7-6aa7-4278-8a3e-a7c65e3950bb', 405, 'SK-Pelaksana-Pengaduan.pdf', 'Ka1gbGoqaEJxTS4-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '317806', NULL, 1, 112277, '2023-08-11 16:40:10', '2023-08-11 16:40:10'),
	(1118, '2e2243d7-6aa7-4278-8a3e-a7c65e3950bb', 405, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'Ka1gbGoqaEJxTS4-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '208090', NULL, 2, 112277, '2023-08-11 16:40:10', '2023-08-11 16:40:10'),
	(1119, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'IKM-SM2-2022-150x106.jpg', '6dTOaGzuAZDRhVs-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '6120', NULL, 1, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1120, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'LOGO-HUT-KOTA-JAMBI_622_fix-150x115.png', '6dTOaGzuAZDRhVs-2.png', '2023/08/cover_multi/', 'image/png', 'png', '14016', NULL, 2, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1121, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'SOSIALISASI-SIPADUKO-300x300.jpg', '6dTOaGzuAZDRhVs-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '24362', NULL, 3, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1122, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'HUT-KOTA-1200x1200.jpg', '6dTOaGzuAZDRhVs-4.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '202230', NULL, 4, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1123, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', '6dTOaGzuAZDRhVs-5.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '151970', NULL, 5, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1124, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'IKM-ig-1200x600.jpg', '6dTOaGzuAZDRhVs-6.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '142309', NULL, 6, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1125, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, '12-SIPADUKO-MAINTANANCE-1-1024x1024.jpg', '6dTOaGzuAZDRhVs-7.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '189680', NULL, 7, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1126, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'WEBSITE-BANNER-2-600x374.jpg', '6dTOaGzuAZDRhVs-8.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '73987', NULL, 8, 112277, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
	(1127, '3fa41d38-2994-4be4-8ea6-291425f0f94d', 405, 'alur-1-768x543.jpg', '6dTOaGzuAZDRhVs-9.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '51148', NULL, 9, 112277, '2023-08-11 16:40:12', '2023-08-11 16:40:12'),
	(1128, 'ca6b6b1a-297a-41cf-9e76-12007d4914ef', 405, 'HUT-KOTA-1200x1200.jpg', 'UrE8zOt7JZPJlxe.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '202230', NULL, 1, 112277, '2023-08-11 16:40:12', '2023-08-11 16:40:12'),
	(1129, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-Pelaksana-Pengaduan.pdf', 't0lZZPSnldAppbY-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '317806', NULL, 1, 112277, '2023-08-11 16:42:14', '2023-08-11 16:42:14'),
	(1136, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'IMG_4848-600x600.jpg', 'eITqWbCEbfty0RJ-6.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '75113', NULL, 6, 112277, '2023-08-11 16:42:14', '2023-08-11 16:42:14'),
	(1137, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'IMG_4798-1024x578.jpg', 'eITqWbCEbfty0RJ-7.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '152822', NULL, 7, 112277, '2023-08-11 16:42:15', '2023-08-11 16:42:15'),
	(1139, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'IMG_4798.jpg', 'eITqWbCEbfty0RJ-9.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '2272656', NULL, 9, 112277, '2023-08-11 16:42:16', '2023-08-11 16:42:16'),
	(1142, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'IMG_4848-1200x600.jpg', '5tNExRqYUdsq6sz-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '137658', NULL, 1, 112277, '2023-08-11 16:47:17', '2023-08-11 16:47:17'),
	(1143, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-Pelaksana-Pengaduan.pdf', 'ZmcHorJAvFBV7xA-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '317806', NULL, 1, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1144, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'ZmcHorJAvFBV7xA-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '208090', NULL, 2, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1145, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'ZmcHorJAvFBV7xA-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 3, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1146, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-DAN-SP.pdf', 'ZmcHorJAvFBV7xA-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 4, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1147, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'ZmcHorJAvFBV7xA-5.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 5, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1148, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'PEMBAHARUAN-SP-29.pdf', 'ZmcHorJAvFBV7xA-6.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 6, 112277, '2023-08-11 16:47:48', '2023-08-11 16:47:48'),
	(1153, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'HUT-KOTA-600x400.jpg', 'jv1OzKcqhLzSIk7-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '51532', NULL, 1, 112277, '2023-08-11 18:02:30', '2023-08-11 18:02:30'),
	(1166, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'HUT-KOTA-1200x600.jpg', 'dBcZtJedOJtRJLM-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '94854', NULL, 1, 112277, '2023-08-11 18:59:55', '2023-08-11 18:59:55'),
	(1167, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'dBcZtJedOJtRJLM-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '103306', NULL, 2, 112277, '2023-08-11 18:59:55', '2023-08-11 18:59:55'),
	(1168, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'PEMBAHARUAN-SP-29.pdf', 'OulA4vi0w2nVEH6-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-11 21:20:36', '2023-08-11 21:20:36'),
	(1169, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'PEMBAHARUAN-SP-29.pdf', 'RvmGTmpr7OaNylh-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 06:04:11', '2023-08-12 06:04:11'),
	(1170, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-DAN-SP.pdf', 'YW64XQgDQmfQu7F-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 06:04:46', '2023-08-12 06:04:46'),
	(1171, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-DAN-SP.pdf', 'H1praNfCx0RgfXf-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 06:11:27', '2023-08-12 06:11:27'),
	(1172, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'BARCODE-REAKSI-CEPAT-300x300.jpg', 'AfavWMeHvIy8pJA-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '34637', NULL, 1, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1173, '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', 407, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'AfavWMeHvIy8pJA-2.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '384439', NULL, 2, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1174, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'l0t1jjXFGjNebTg-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 1, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1175, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'SK-DAN-SP.pdf', 'l0t1jjXFGjNebTg-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 2, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1176, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'PEMBAHARUAN-SP-29.pdf', 'l0t1jjXFGjNebTg-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 3, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1177, '19a1f81b-48ae-46c6-a544-83ef5e7465b1', 407, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'l0t1jjXFGjNebTg-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-12 06:11:57', '2023-08-12 06:11:57'),
	(1178, 'd1d3f276-f228-4c38-ba9d-615bb078b177', 407, 'LOGO-HUT-KOTA-JAMBI_622_fix.png', '0H4nPv74faTH4Rj.png', '2023/08/cover/', 'image/png', 'png', '255342', NULL, 1, 112277, '2023-08-12 06:11:58', '2023-08-12 06:11:58'),
	(1179, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'WrVtBV6jJ6kk4n6-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 06:12:42', '2023-08-12 06:12:42'),
	(1180, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'WrVtBV6jJ6kk4n6-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 2, 112277, '2023-08-12 06:12:42', '2023-08-12 06:12:42'),
	(1185, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'Qv7ghgnxHFmeSXn-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 1, 112277, '2023-08-12 06:13:29', '2023-08-12 06:13:29'),
	(1186, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'Qv7ghgnxHFmeSXn-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 2, 112277, '2023-08-12 06:13:29', '2023-08-12 06:13:29'),
	(1189, '65e9c8da-1401-4286-925e-18e6769e4efc', 408, '12-SIPADUKO-MAINTANANCE-1-1024x1024.jpg', 'oZbf3dNrxQGnWrt.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '189680', NULL, 1, 112277, '2023-08-12 06:13:45', '2023-08-12 06:13:45'),
	(1191, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'ssLObir9IxrJ9Ei-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 06:14:08', '2023-08-12 06:14:08'),
	(1208, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'dAjzhn8nrrRoIbj-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 06:35:12', '2023-08-12 06:35:12'),
	(1209, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'fUiM1dAJmlvNSov-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 1, 112277, '2023-08-12 06:35:29', '2023-08-12 06:35:29'),
	(1210, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'fUiM1dAJmlvNSov-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 2, 112277, '2023-08-12 06:35:29', '2023-08-12 06:35:29'),
	(1211, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'kpB19JSdziH1xbY-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 06:43:16', '2023-08-12 06:43:16'),
	(1212, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'sY53bKF8BH0Sbzt-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 06:46:18', '2023-08-12 06:46:18'),
	(1213, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'SQh71EoG9VZQOy0-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 1, 112277, '2023-08-12 06:46:32', '2023-08-12 06:46:32'),
	(1214, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'SQh71EoG9VZQOy0-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 2, 112277, '2023-08-12 06:46:32', '2023-08-12 06:46:32'),
	(1215, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'SQh71EoG9VZQOy0-3.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 3, 112277, '2023-08-12 06:46:32', '2023-08-12 06:46:32'),
	(1216, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'SQh71EoG9VZQOy0-4.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1914777', NULL, 4, 112277, '2023-08-12 06:46:32', '2023-08-12 06:46:32'),
	(1217, '7f0fcb5b-d0c9-4ca8-a31e-46e604fd5b01', 408, 'BARCODE-REAKSI-CEPAT.jpg', 'MMWrrzsXafyTVlg-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-12 06:47:02', '2023-08-12 06:47:02'),
	(1218, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'xN5CQK0Hn8O5Ubq-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 07:49:18', '2023-08-12 07:49:18'),
	(1219, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'SK-DAN-SP.pdf', 'JgvAVG5v91SkYIG-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1304449', NULL, 1, 112277, '2023-08-12 08:11:30', '2023-08-12 08:11:30'),
	(1221, 'f3cca5af-a1c0-48c4-8ac4-0aa3f253ae31', 408, 'PEMBAHARUAN-SP-29.pdf', 'xn1F8GFenvWLYLt-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 08:19:56', '2023-08-12 08:19:56'),
	(1223, 'f9270e42-963f-4c11-8561-9fe747bde982', 409, 'PEMBAHARUAN-SP-29.pdf', 'oPpmMNgQTnsxTlv-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 1, 112277, '2023-08-12 20:23:42', '2023-08-12 20:23:42'),
	(1226, 'c27b25c1-8bb2-4b37-9eb6-6480b0b49b54', 409, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'TJtnNdMWc9X7ME0-3.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '384439', NULL, 3, 112277, '2023-08-12 20:23:43', '2023-08-12 20:23:43'),
	(1227, '568c2aaa-a392-4773-ba0d-d53b0b057f93', 409, 'BARCODE-REAKSI-CEPAT.jpg', 'sGowNpy5MqrpB2f.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '1547994', NULL, 1, 112277, '2023-08-12 20:23:43', '2023-08-12 20:23:43'),
	(1228, 'f9270e42-963f-4c11-8561-9fe747bde982', 409, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'dKlAQz86jb2TCoJ-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '657618', NULL, 1, 112277, '2023-08-12 20:24:19', '2023-08-12 20:24:19'),
	(1229, 'f9270e42-963f-4c11-8561-9fe747bde982', 409, 'PEMBAHARUAN-SP-29.pdf', 'dKlAQz86jb2TCoJ-2.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '1522495', NULL, 2, 112277, '2023-08-12 20:24:19', '2023-08-12 20:24:19'),
	(1230, 'c27b25c1-8bb2-4b37-9eb6-6480b0b49b54', 409, 'LOGO-HUT-KOTA-JAMBI_622_fix-1200x600.png', 'r3zNtPsOHiQm6T2-1.png', '2023/08/cover_multi/', 'image/png', 'png', '191717', NULL, 1, 112277, '2023-08-12 23:35:14', '2023-08-12 23:35:14'),
	(1232, '6a987b57-0f55-4cdf-ac95-fb0c84771c0a', 408, 'file-corupt.pdf', 'qCp8G7xqnHIiSMj-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '63073', NULL, 1, 112277, '2023-08-16 09:23:24', '2023-08-16 09:23:24'),
	(1233, 'e67b2cb6-0802-4c1d-a85a-8f3fa2932c41', 408, '4_V2_Inspektorat-Kota-Jambi-removebg-preview.png', 'Er4gXE9qnfk8Mbw-1.png', '2023/08/cover_multi/', 'image/png', 'png', '26475', NULL, 1, 112277, '2023-08-16 09:23:25', '2023-08-16 09:23:25'),
	(1234, 'e67b2cb6-0802-4c1d-a85a-8f3fa2932c41', 408, 'New Project (1).png', 'Er4gXE9qnfk8Mbw-2.png', '2023/08/cover_multi/', 'image/png', 'png', '124556', NULL, 2, 112277, '2023-08-16 09:23:25', '2023-08-16 09:23:25'),
	(1235, '041b6871-1679-48f7-a151-fdc2d884a0e4', 408, '4wdMoB4QQXZC31L.jpg', 'v0TRAvoG54mdQ1L.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '99352', NULL, 1, 112277, '2023-08-16 09:23:25', '2023-08-16 09:23:25'),
	(1238, '6eaabe6f-6413-4a69-b9e6-60053bf969e9', 410, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'pqhVjgDclLj1l19-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '208090', NULL, 1, 112277, '2023-08-23 11:33:45', '2023-08-23 11:33:45'),
	(1239, '96aa8ccb-88a4-4c06-be79-16234d30ef56', 410, 'WEBSITE-BANNER-2-768x205.jpg', '8wPLNG4OSZ4e0ob-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '52900', NULL, 1, 112277, '2023-08-23 11:33:45', '2023-08-23 11:33:45'),
	(1240, '535bdfb6-8fb8-46fc-b9ad-a03fdbd7223a', 410, 'WEBSITE-BANNER-2-1200x374.jpg', 'w5cXtYQqFIWjMxL.jpg', '2023/08/cover/', 'image/jpeg', 'jpg', '139414', NULL, 1, 112277, '2023-08-23 11:33:45', '2023-08-23 11:33:45'),
	(1241, 'f7c30fa1-7cbb-4c48-b412-191a174e1a7d', 411, 'IXJOG-20232308-30247-1692754466 (1).pdf', 'PUw2nPXTmgO5KbG-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '34781', NULL, 1, 112277, '2023-08-23 11:39:40', '2023-08-23 11:39:40'),
	(1242, '01970d19-6d6d-46e9-a93f-f8fa88748564', 411, 'gambar_1-800x600.jpg', 'jaW3GYYZ2LpbzKZ-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '37349', NULL, 1, 112277, '2023-08-23 11:39:40', '2023-08-23 11:39:40'),
	(1243, 'c0ed482d-22fa-44cb-b09c-cd86c7ca4dbf', 411, 'file_birthday.jpeg', 'qY8KJ4L5iHrgZu5.jpeg', '2023/08/cover/', 'image/jpeg', 'jpeg', '34718', NULL, 1, 112277, '2023-08-23 11:39:40', '2023-08-23 11:39:40'),
	(1244, '0a85f282-11a1-46dc-b769-979b9c3dbfed', 412, 'IXJOG-20232308-30247-1692754466 (1).pdf', '9hedIoWVaxGSt0T-1.pdf', '2023/08/file_pdf/', 'application/pdf', 'pdf', '34781', NULL, 1, 112277, '2023-08-23 11:40:38', '2023-08-23 11:40:38'),
	(1245, 'cc88f56a-f4de-456c-a3c2-53bf713b17e0', 412, 'gambar_1-800x600.jpg', '7oZLHF2DC5x2xrX-1.jpg', '2023/08/cover_multi/', 'image/jpeg', 'jpg', '37349', NULL, 1, 112277, '2023-08-23 11:40:38', '2023-08-23 11:40:38'),
	(1246, '96fa26ca-917b-4fd1-89fe-9d40b7785ed1', 412, 'file_birthday.jpeg', 'FJJQwIxJrXTGOF1.jpeg', '2023/08/cover/', 'image/jpeg', 'jpeg', '34718', NULL, 1, 112277, '2023-08-23 11:40:38', '2023-08-23 11:40:38'),
	(1247, 'adb830fe-a863-481b-849e-eba8715da241', 112277, 'avatar2.png', 'rxUP8DZ8XsnlpO9.png', '2023/12/foto/', 'image/png', 'png', '26852', NULL, 1, 112277, '2023-12-05 10:00:03', '2023-12-05 10:00:03'),
	(1248, '596adb02-0f7c-43e9-96b4-db26435f847e', 5, '29. JAMBI (JAMBI) JADWAL IMSAKIYAH 2024.pdf', 'uXRolLmJgl3ljhO.pdf', '2024/04/file_modul/', 'application/pdf', 'pdf', '1202493', NULL, 1, 112277, '2024-04-06 22:31:47', '2024-04-06 22:31:47'),
	(1249, 'cbfeccc4-279e-4432-8391-f8f6a492a588', 5, 'struktur organisasi.jpg', 'LiUdyS4oqUHbQn5.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '115483', NULL, 1, 112277, '2024-04-06 22:31:47', '2024-04-06 22:31:47'),
	(1250, '4f07af73-7045-4ee3-ac47-f76875258521', 6, 'Surat Pernyataan Tidak sedang Menjalani Pendidikan hingga Level S1 Peserta.pdf', 'R26crpfD8HyWlfV.pdf', '2024/04/file_modul/', 'application/pdf', 'pdf', '61217', NULL, 1, 112277, '2024-04-06 22:52:33', '2024-04-06 22:52:33'),
	(1251, '6e92c80d-c91e-4154-84e6-89ee9f485afc', 6, '222.jpg', 'dMURnihuBgD6vvJ.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '3409135', NULL, 1, 112277, '2024-04-06 22:52:35', '2024-04-06 22:52:35'),
	(1252, 'a1852172-b549-4440-b5ab-ebd76bd5c43d', 7, 'PP Nomor 14 Tahun 2024.pdf', 'Au3bpojcYswzqQO.pdf', '2024/04/file_modul/', 'application/pdf', 'pdf', '3751073', NULL, 1, 112277, '2024-04-08 02:50:42', '2024-04-08 02:50:42'),
	(1253, '4b4cd1d7-3922-4e91-bc41-5d566eee9bf9', 7, 'Screenshot (1).png', 'GBjbnFDlJT4OU7O.png', '2024/04/cover/', 'image/png', 'png', '738822', NULL, 1, 112277, '2024-04-08 02:50:44', '2024-04-08 02:50:44'),
	(1258, '90edc9bb-88b2-4855-9cbc-9cf14e8c94a4', 8, 'Screenshot (1).png', 'H7i4frBrVrJkJqP.png', '2024/04/cover/', 'image/png', 'png', '738822', NULL, 1, 112277, '2024-04-08 08:37:34', '2024-04-08 08:37:34'),
	(1266, '57630f78-541f-4576-a038-aaa0f1464d76', 1, 'RHzvArQ6NLZiZWk (1).jpg', 'ivOvgEa8UkPG4Eh.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '40937', NULL, 1, 112277, '2024-04-08 11:30:42', '2024-04-08 11:30:42'),
	(1270, '8b31daef-b82a-4094-a1b4-b59cb8b0760e', 8, 'UU 19 Tahun 2016.pdf', 'sPlDSlIVJqFDQB9.pdf', '2024/04/file_modul/', 'application/pdf', 'pdf', '709687', NULL, 1, 112277, '2024-04-08 15:07:54', '2024-04-08 15:07:54'),
	(1274, 'dqwd', 3, 'IMG_4106.png', 'YdIxCn5chvKkiCP.png', '2024/04/file_cover/', 'image/png', 'png', '127980', NULL, 1, 112277, '2024-04-08 15:09:06', '2024-04-08 15:09:06'),
	(1275, '9fd7d5dc-04bc-4292-8fc8-ab821df46526', 3, 'Pemanggilan Orientasi PPPK Gelombang 4 Tahun 2024 (3).pdf', '4pm2qkIM3V5OLXG.pdf', '2024/04/file_modul/', 'application/pdf', 'pdf', '337462', NULL, 1, 112277, '2024-04-08 15:10:26', '2024-04-08 15:10:26'),
	(1276, 'a8510f12-2da3-431d-9067-06a762347ae8', 3, 'IMG_4106.png', 'mnGGGvOcKiM88vo.png', '2024/04/file_cover/', 'image/png', 'png', '127980', NULL, 1, 112277, '2024-04-08 15:10:26', '2024-04-08 15:10:26'),
	(1277, 'a3680967-88c8-4309-81b8-44712232c1c8', 14, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'N2fL2K54EYt2uXD.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '535595', NULL, 1, 112277, '2024-04-08 19:25:28', '2024-04-08 19:25:28'),
	(1278, '3693b6a6-26cb-4352-9c48-fe4c0bec0e3c', 15, 'Untitled-1-01.jpg', '5NGvCbg7SIYVAwW.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '503239', NULL, 1, 112277, '2024-04-08 22:16:30', '2024-04-08 22:16:30'),
	(1279, 'bd266a92-ac14-4d30-a67c-9fb125218c76', 16, 'alat_kesehatan_banner.jpg', 'wI5hEZ8zUVQ3Yzl.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '225069', NULL, 1, 112277, '2024-04-08 22:19:28', '2024-04-08 22:19:28'),
	(1280, 'b056b87e-448f-4df2-896b-0c708066ec71', 17, 'gambar_1.jpg', 'MME3CgsdLtFWeMM.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '102117', NULL, 1, 112277, '2024-04-08 22:59:54', '2024-04-08 22:59:54'),
	(1281, '1f020ba7-3810-4724-8afa-16561935e904', 18, 'gambar_2.jpg', 'AmhLgNC60NiFfUZ.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '35581', NULL, 1, 112277, '2024-04-08 23:18:17', '2024-04-08 23:18:17'),
	(1282, '626c52df-5314-44e4-a596-fd5d43edac1b', 19, 'gambar_2.jpg', 'YieSDjJrsBaTRyy.jpg', '2024/04/cover/', 'image/jpeg', 'jpg', '35581', NULL, 1, 112277, '2024-04-08 23:19:03', '2024-04-08 23:19:03'),
	(1283, '3a996d32-eca1-4bc8-9fb1-26d813ba9b87', 3, 'Screenshot (1).png', 'vkpGz3bPXQUMvxE.png', '2024/05/cover/', 'image/png', 'png', '738822', NULL, 1, 112277, '2024-05-14 20:41:26', '2024-05-14 20:41:26'),
	(1285, '3ba3a649-5d4c-4d96-acac-fd96a16acca6', 413, 'Screenshot (7).png', 'juPApL0VUdjqfGD-1.png', '2024/05/cover_multi/', 'image/png', 'png', '519980', NULL, 1, 112277, '2024-05-15 09:20:25', '2024-05-15 09:20:25'),
	(1286, '3ba3a649-5d4c-4d96-acac-fd96a16acca6', 413, 'Screenshot (2).png', 'juPApL0VUdjqfGD-2.png', '2024/05/cover_multi/', 'image/png', 'png', '580402', NULL, 2, 112277, '2024-05-15 09:20:27', '2024-05-15 09:20:27'),
	(1297, '7d39cc94-8e23-4aee-a54a-567ba3f96b7a', 413, 'sample_ttd.png', 'zvNjHBb9PpSpWhy.png', '2024/05/cover/', 'image/png', 'png', '927577', NULL, 1, 112277, '2024-05-15 12:34:49', '2024-05-15 12:34:49'),
	(1299, '3ba3a649-5d4c-4d96-acac-fd96a16acca6', 413, 'banner-depan.jpg', '2W7Gip0Ep2a3bpP-1.jpg', '2024/05/cover_multi/', 'image/jpeg', 'jpg', '256321', NULL, 1, 112277, '2024-05-15 12:38:29', '2024-05-15 12:38:29'),
	(1305, 'bfe5a9fc-735b-42ab-abf8-f1bcbf2c3246', 413, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', '9BH5UFBIN8YjH3T-1.pdf', '2024/05/file_pdf/', 'application/pdf', 'pdf', '76217', NULL, 1, 112277, '2024-05-15 13:55:25', '2024-05-15 13:55:25'),
	(1306, 'f88ce508-6efa-43ed-960a-7e4bb58767ff', 112309, '3237447.png', 'nwfPMdlYoj9v2NZ.png', '2024/05/foto/', 'image/png', 'png', '33278', NULL, 1, 112309, '2024-05-24 20:00:52', '2024-05-24 20:00:52'),
	(1307, 'f52ccc0a-1883-4e23-9cd0-a15130273ecc', 112310, 'user-account-icon-1704x2048-og4pdftt.png', 'XJhncrDV7aZKDog.png', '2024/05/foto/', 'image/png', 'png', '517785', NULL, 1, 112310, '2024-05-24 20:01:48', '2024-05-24 20:01:48');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.fileponds
CREATE TABLE IF NOT EXISTS `fileponds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimetypes` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `disk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.fileponds: ~378 rows (lebih kurang)
/*!40000 ALTER TABLE `fileponds` DISABLE KEYS */;
INSERT INTO `fileponds` (`id`, `filename`, `filepath`, `extension`, `mimetypes`, `size`, `disk`, `created_by`, `expires_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(970, 'SK-DAN-SP.pdf', 'filepond/temp/sPEYleKfP51z9bvpwm80p3mkC4G9hdNcvNOhgNca.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:33:47', NULL, '2023-08-11 13:03:47', '2023-08-11 13:03:47'),
	(971, 'SK-DAN-SP.pdf', 'filepond/temp/rndiA6b84eN5vuCMCkfpJfD89p43VxkCgvb1O8oy.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:34:12', NULL, '2023-08-11 13:04:12', '2023-08-11 13:04:12'),
	(972, 'SK-DAN-SP.pdf', 'filepond/temp/GuW1QLK562BuvEbDVKNUhhKFuT41SUySzc253vmZ.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:36:05', NULL, '2023-08-11 13:06:05', '2023-08-11 13:06:05'),
	(973, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/J4AUBxrGEIe72HqGmxq0QtuVEGCmGfi53MA605lt.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:37:09', '2023-08-11 13:07:11', '2023-08-11 13:07:09', '2023-08-11 13:07:11'),
	(974, 'SK-DAN-SP.pdf', 'filepond/temp/iIdl08zS60ZYKxe0eesuQLZaok6JkV9wrwv551ur.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:37:20', '2023-08-11 13:07:22', '2023-08-11 13:07:20', '2023-08-11 13:07:22'),
	(975, 'SK-DAN-SP.pdf', 'filepond/temp/efntr7BiQSKadgc5ndSZeTMUuoD0hqj7keYS8XnR.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:37:44', '2023-08-11 13:07:49', '2023-08-11 13:07:44', '2023-08-11 13:07:49'),
	(976, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/qTpE95Xfqoe1v4yVKQhxoMTNyKoEFBRy5DEP8Czr.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:37:44', '2023-08-11 13:07:49', '2023-08-11 13:07:44', '2023-08-11 13:07:49'),
	(977, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/lJr3gYdEZnxzovY7XslJwYmumHupOGV2s1qSEc2V.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:37:46', '2023-08-11 13:07:49', '2023-08-11 13:07:46', '2023-08-11 13:07:49'),
	(978, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/H6VyWtrIgNybTWo6LGg0VcQInHGs2k9PdQgk3N30.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 13:37:46', '2023-08-11 13:07:49', '2023-08-11 13:07:46', '2023-08-11 13:07:49'),
	(979, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/h978X18zekP3wkW8YJe8O82c0rLEeyqXZVwcZFRY.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 13:39:57', NULL, '2023-08-11 13:09:57', '2023-08-11 13:09:57'),
	(980, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/Lo5kj1qdHRsCRFJGNkEo6tFkwKNguonboepD98Xu.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:40:00', '2023-08-11 13:10:06', '2023-08-11 13:10:00', '2023-08-11 13:10:06'),
	(981, 'LOGO-HUT-KOTA-JAMBI_622_fix-1024x783.png', 'filepond/temp/DmV94X2l19NsJGqjLD9XGuw3so97hNGtqtjlYoZD.png', 'png', 'image/png', 190010, 'public', 112277, '2023-08-11 13:40:13', NULL, '2023-08-11 13:10:13', '2023-08-11 13:10:13'),
	(982, 'SK-DAN-SP.pdf', 'filepond/temp/hNmF2eRWyI36b76EKf6EfaT5yl55SwJ2dX4YhbTA.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:40:19', NULL, '2023-08-11 13:10:19', '2023-08-11 13:10:19'),
	(983, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/T9LHgfSdoL9r0jSUz6G02j1j4Q0nPhTlWTlunA24.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 13:41:37', NULL, '2023-08-11 13:11:37', '2023-08-11 13:11:37'),
	(984, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/o1izFasXbHEnZXsoe0ZJGOeNPQpvjjZ4rdfaIwgX.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:41:39', '2023-08-11 13:12:00', '2023-08-11 13:11:39', '2023-08-11 13:12:00'),
	(985, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/XYn6icXSJG8OnWY9tAaQ5JrLKopTlq6xrZry0C3c.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:41:44', '2023-08-11 13:11:50', '2023-08-11 13:11:44', '2023-08-11 13:11:50'),
	(986, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/2TODfM6p56uGGCTcdbV3qSsdKonDoCzFQc37GooX.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:41:49', '2023-08-11 13:14:41', '2023-08-11 13:11:49', '2023-08-11 13:14:41'),
	(987, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/cgVunPEcu5AakipQvrKMKLm9UmrUORskDzENLkci.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:41:49', '2023-08-11 13:14:41', '2023-08-11 13:11:49', '2023-08-11 13:14:41'),
	(988, 'SK-DAN-SP.pdf', 'filepond/temp/X0QrMGXQcCj89m5GuMMVDeWY9rg5vL9Ao0fexElW.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:41:51', '2023-08-11 13:14:41', '2023-08-11 13:11:51', '2023-08-11 13:14:41'),
	(989, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/BvYHGR2LW6xLTslXxRNeyyIKP36QWmD3S2jZOcVU.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 13:41:51', '2023-08-11 13:14:41', '2023-08-11 13:11:51', '2023-08-11 13:14:41'),
	(990, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/PisYoXQPwsezVcga5DJEIsvK03DV8fceq1e5zrGM.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 13:42:11', NULL, '2023-08-11 13:12:11', '2023-08-11 13:12:11'),
	(991, '12-SIPADUKO-MAINTANANCE-1-300x300.jpg', 'filepond/temp/AjtFwYwhqOtR2oSUPrBE4vtDkX9zwRaQQCM2jsSo.jpg', 'jpg', 'image/jpeg', 32599, 'public', 112277, '2023-08-11 13:42:15', NULL, '2023-08-11 13:12:15', '2023-08-11 13:12:15'),
	(992, 'SOSIALISASI-SIPADUKO-300x300.jpg', 'filepond/temp/OOiQJDvqng2BIJ0DD2qcljmxFH40cOcF8cWXU7rd.jpg', 'jpg', 'image/jpeg', 24362, 'public', 112277, '2023-08-11 13:42:19', NULL, '2023-08-11 13:12:19', '2023-08-11 13:12:19'),
	(993, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/uO4AtkT7OtBcTFBJowIvq9hD2PU9llSdL30IRK6R.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 13:45:13', '2023-08-11 13:16:13', '2023-08-11 13:15:13', '2023-08-11 13:16:13'),
	(994, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'filepond/temp/u4kWEes2QnbFp7TW6pdFPRtlMPfN43453n686bkt.jpg', 'jpg', 'image/jpeg', 151970, 'public', 112277, '2023-08-11 13:45:17', '2023-08-11 13:16:12', '2023-08-11 13:15:17', '2023-08-11 13:16:12'),
	(995, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/cz6y8coNXEbgqqlaNmNokoabiA775wZULIT8Ziav.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-11 13:45:17', '2023-08-11 13:16:12', '2023-08-11 13:15:17', '2023-08-11 13:16:12'),
	(996, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'filepond/temp/KNpYA4VE16ooRlRVEqDCgYiZe7wsjJQtw4wPZGLh.jpg', 'jpg', 'image/jpeg', 149541, 'public', 112277, '2023-08-11 13:45:19', '2023-08-11 13:16:12', '2023-08-11 13:15:19', '2023-08-11 13:16:12'),
	(997, 'SK-DAN-SP.pdf', 'filepond/temp/PCkwkaYmBrObNeMpYh5xH9JNy164TIqrM2vVu8NX.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:45:20', '2023-08-11 13:16:12', '2023-08-11 13:15:20', '2023-08-11 13:16:12'),
	(998, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/2uDQO6xfaLroUSVjymdefQV9f5ggWskY3QCwc2oX.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:45:20', '2023-08-11 13:16:12', '2023-08-11 13:15:20', '2023-08-11 13:16:12'),
	(999, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/sMLJqoj35psMiTYJQa9c9pmWsZuwz90T1Z9bVQqG.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:45:21', '2023-08-11 13:16:12', '2023-08-11 13:15:21', '2023-08-11 13:16:12'),
	(1000, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/4hkswai9JxaS4ep6TBm42a3j9a8CpK0hAlve3PCY.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 13:45:21', '2023-08-11 13:16:12', '2023-08-11 13:15:21', '2023-08-11 13:16:12'),
	(1001, 'IKM-SM2-2022-300x212.jpg', 'filepond/temp/InumNv1EF9tkgviFwWOYRREnWUHsIGTFmenw28RE.jpg', 'jpg', 'image/jpeg', 18531, 'public', 112277, '2023-08-11 13:47:16', '2023-08-11 13:18:35', '2023-08-11 13:17:16', '2023-08-11 13:18:35'),
	(1002, 'BARCODE-REAKSI-CEPAT-150x150.jpg', 'filepond/temp/MKsvKZLgcDqBoWftRDQ3IjBo9bJOrXd7gxdzHOFy.jpg', 'jpg', 'image/jpeg', 10786, 'public', 112277, '2023-08-11 13:47:49', '2023-08-11 13:18:34', '2023-08-11 13:17:49', '2023-08-11 13:18:34'),
	(1003, 'BARCODE-REAKSI-CEPAT-1200x1200.jpg', 'filepond/temp/CvruQFbMJiBq1uiMEKCkjQ4QunF5pwWxoAvUySVC.jpg', 'jpg', 'image/jpeg', 276375, 'public', 112277, '2023-08-11 13:47:57', '2023-08-11 13:18:34', '2023-08-11 13:17:57', '2023-08-11 13:18:34'),
	(1004, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'filepond/temp/jRFbPSjRh0b6ZkzaGIftRVjPpeil9pgBUSqkzfRF.jpg', 'jpg', 'image/jpeg', 151970, 'public', 112277, '2023-08-11 13:47:57', '2023-08-11 13:18:34', '2023-08-11 13:17:57', '2023-08-11 13:18:34'),
	(1005, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/l99YMDA2poprcTuaes32Pdd4FIlISNgGbamb0rff.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-11 13:47:59', '2023-08-11 13:18:34', '2023-08-11 13:17:59', '2023-08-11 13:18:34'),
	(1006, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/9Ypg4ssfqiu7UVc0M7x3h1SmxDpA7GNNcU96RuE1.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:48:01', '2023-08-11 13:18:32', '2023-08-11 13:18:01', '2023-08-11 13:18:32'),
	(1007, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/hpovF8WQXyxQ2BLWebTIuNrXVZvXcBOEd0PsHRFq.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 13:48:03', '2023-08-11 13:18:34', '2023-08-11 13:18:03', '2023-08-11 13:18:34'),
	(1008, 'SK-DAN-SP.pdf', 'filepond/temp/W8IeMSgP1ZUh3MZXj1KmLMbjrtQ56uJ5bLLryHGu.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 13:48:03', '2023-08-11 13:18:34', '2023-08-11 13:18:03', '2023-08-11 13:18:34'),
	(1009, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/vNx2XQfMGTFfbsv3ddmj02zch75nqIe8e3EXWp1N.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 13:48:05', '2023-08-11 13:18:34', '2023-08-11 13:18:05', '2023-08-11 13:18:34'),
	(1010, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/FCUyMjmsXHJSFNmBoMjl9kLDyAC1Ts2AOipIyIf7.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 13:48:05', '2023-08-11 13:18:34', '2023-08-11 13:18:05', '2023-08-11 13:18:34'),
	(1011, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/RaaHGNJ2jbw4Q8brJW4f3h3MIdW105rTUdrlSPsR.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-11 13:49:21', '2023-08-11 13:19:24', '2023-08-11 13:19:21', '2023-08-11 13:19:24'),
	(1012, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/j9bvjJeqQaPe4eXn8Nth4R1hixfZCHSdd5ApfTWt.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-11 13:50:27', '2023-08-11 13:20:29', '2023-08-11 13:20:27', '2023-08-11 13:20:29'),
	(1013, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/5LWUR0JdX9kl2KCTX7JTSbJ03xlJ7fycNb0oXpOf.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 17:09:16', '2023-08-11 16:40:12', '2023-08-11 16:39:16', '2023-08-11 16:40:12'),
	(1014, 'IKM-SM2-2022-150x106.jpg', 'filepond/temp/8TBSeupZ6E8wE9cqnbYkuhYbYLqgpX4SM1FAKYPc.jpg', 'jpg', 'image/jpeg', 6120, 'public', 112277, '2023-08-11 17:09:34', '2023-08-11 16:40:11', '2023-08-11 16:39:34', '2023-08-11 16:40:11'),
	(1015, 'LOGO-HUT-KOTA-JAMBI_622_fix-150x115.png', 'filepond/temp/yKfk9iC0cd5FKcJ24WYIKHcoxWBTpPh58LCkEWhV.png', 'png', 'image/png', 14016, 'public', 112277, '2023-08-11 17:09:34', '2023-08-11 16:40:11', '2023-08-11 16:39:34', '2023-08-11 16:40:11'),
	(1016, 'SOSIALISASI-SIPADUKO-300x300.jpg', 'filepond/temp/RN3uXFq2uqz8xaH7qANQmHzXQu7FtVxJEuotxVnO.jpg', 'jpg', 'image/jpeg', 24362, 'public', 112277, '2023-08-11 17:09:36', '2023-08-11 16:40:11', '2023-08-11 16:39:36', '2023-08-11 16:40:11'),
	(1017, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/12mFJglsrsJucYt4KRHeoV8V9gnuVz1XSpTQRHrH.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 17:09:36', '2023-08-11 16:40:11', '2023-08-11 16:39:36', '2023-08-11 16:40:11'),
	(1018, 'BARCODE-REAKSI-CEPAT-1200x600.jpg', 'filepond/temp/sFTwuRHodyUW33oYLVTTMjoEk3zMNmu2XXNodeVu.jpg', 'jpg', 'image/jpeg', 151970, 'public', 112277, '2023-08-11 17:09:38', '2023-08-11 16:40:11', '2023-08-11 16:39:38', '2023-08-11 16:40:11'),
	(1019, 'IKM-ig-1200x600.jpg', 'filepond/temp/2v7d7Uidt85Pia0dWIx9slWfsVpNDMv0eQIPrbjq.jpg', 'jpg', 'image/jpeg', 142309, 'public', 112277, '2023-08-11 17:09:38', '2023-08-11 16:40:11', '2023-08-11 16:39:38', '2023-08-11 16:40:11'),
	(1020, '12-SIPADUKO-MAINTANANCE-1-1024x1024.jpg', 'filepond/temp/3AEanaRo0NPBg4mOihHQuLyYkQv4BnfEo1Rbedl9.jpg', 'jpg', 'image/jpeg', 189680, 'public', 112277, '2023-08-11 17:09:40', '2023-08-11 16:40:11', '2023-08-11 16:39:40', '2023-08-11 16:40:11'),
	(1021, 'WEBSITE-BANNER-2-600x374.jpg', 'filepond/temp/ptawSzp4Jv1b8rQBixxvUahSSIWaKq590mbqfwvD.jpg', 'jpg', 'image/jpeg', 73987, 'public', 112277, '2023-08-11 17:09:51', '2023-08-11 16:40:11', '2023-08-11 16:39:51', '2023-08-11 16:40:11'),
	(1022, 'alur-1-768x543.jpg', 'filepond/temp/5I8u4IjkWgzWfsD8ujVR8OnPvcvF9XtEHofhxnSl.jpg', 'jpg', 'image/jpeg', 51148, 'public', 112277, '2023-08-11 17:09:56', '2023-08-11 16:40:11', '2023-08-11 16:39:56', '2023-08-11 16:40:11'),
	(1023, 'SK-Pelaksana-Pengaduan.pdf', 'filepond/temp/ZhyPOLoJBAcZwXWreDUIIyv2I8ZXjYs6Qzr2TLOr.pdf', 'pdf', 'application/pdf', 317806, 'public', 112277, '2023-08-11 17:10:07', '2023-08-11 16:40:10', '2023-08-11 16:40:07', '2023-08-11 16:40:10'),
	(1024, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'filepond/temp/JQYEuqcgyYVUdHCA7UIiTQDbuPdV94f2J8fbgyzw.pdf', 'pdf', 'application/pdf', 208090, 'public', 112277, '2023-08-11 17:10:07', '2023-08-11 16:40:10', '2023-08-11 16:40:07', '2023-08-11 16:40:10'),
	(1025, 'alur-1-150x106.jpg', 'filepond/temp/vWCaAFzEobZVSlhV1b6mPwV5SNhD3UXlu5BMOg0L.jpg', 'jpg', 'image/jpeg', 4529, 'public', 112277, '2023-08-11 17:11:23', '2023-08-11 16:42:16', '2023-08-11 16:41:23', '2023-08-11 16:42:16'),
	(1026, 'WEBSITE-BANNER-1-600x374.jpg', 'filepond/temp/IL4UKCcP1rS4w8nclF06aSiANmYQMi7jG6yIAS6o.jpg', 'jpg', 'image/jpeg', 32113, 'public', 112277, '2023-08-11 17:11:44', '2023-08-11 16:42:14', '2023-08-11 16:41:44', '2023-08-11 16:42:14'),
	(1027, 'WEBSITE-BANNER-2-600x374.jpg', 'filepond/temp/A4T3pcwn35jcRZT6RgPiLdZF2vV1viBhev1bhGPy.jpg', 'jpg', 'image/jpeg', 73987, 'public', 112277, '2023-08-11 17:11:44', '2023-08-11 16:42:14', '2023-08-11 16:41:44', '2023-08-11 16:42:14'),
	(1028, 'alur-1-768x543.jpg', 'filepond/temp/o0Nu6hWdGtBy5JGP9UMhWR2GMyW0f5NOrbdWQycp.jpg', 'jpg', 'image/jpeg', 51148, 'public', 112277, '2023-08-11 17:11:46', '2023-08-11 16:42:14', '2023-08-11 16:41:46', '2023-08-11 16:42:14'),
	(1029, 'maklumat-peyanan1s-600x600.jpg', 'filepond/temp/yMKtz3S9u1t1jLIbFcrgSz5i25FSZEvS8iayB4uy.jpg', 'jpg', 'image/jpeg', 92956, 'public', 112277, '2023-08-11 17:11:46', '2023-08-11 16:42:14', '2023-08-11 16:41:46', '2023-08-11 16:42:14'),
	(1030, 'PENGESAHAN-ANAK-1200x1200.jpg', 'filepond/temp/oNmPCi7dUK0DyVpngzrjlYtjbeC2ND4spi5STqDR.jpg', 'jpg', 'image/jpeg', 165130, 'public', 112277, '2023-08-11 17:11:48', '2023-08-11 16:42:14', '2023-08-11 16:41:48', '2023-08-11 16:42:14'),
	(1031, 'IMG_4848-600x600.jpg', 'filepond/temp/QC7t3xi1Y4AaNklRcvTgC2lF6xR5qFDCTgoDZ9l3.jpg', 'jpg', 'image/jpeg', 75113, 'public', 112277, '2023-08-11 17:12:01', '2023-08-11 16:42:14', '2023-08-11 16:42:01', '2023-08-11 16:42:14'),
	(1032, 'IMG_4798-1024x578.jpg', 'filepond/temp/FW7KtIzzdeKNkRS8amRKW3KVCniaGnZjrLehmM8h.jpg', 'jpg', 'image/jpeg', 152822, 'public', 112277, '2023-08-11 17:12:01', '2023-08-11 16:42:14', '2023-08-11 16:42:01', '2023-08-11 16:42:14'),
	(1033, 'COVER-150x150.jpg', 'filepond/temp/NJ8LQWxlKWTcjMDV65QYioz3V5qdcvWje9IwVg54.jpg', 'jpg', 'image/jpeg', 9599, 'public', 112277, '2023-08-11 17:12:03', '2023-08-11 16:42:14', '2023-08-11 16:42:03', '2023-08-11 16:42:14'),
	(1034, 'IMG_4798.jpg', 'filepond/temp/peqTvkc2DFQGbB1OT67LubHz0rJPZZv750wIrmRk.jpg', 'jpg', 'image/jpeg', 2272656, 'public', 112277, '2023-08-11 17:12:03', '2023-08-11 16:42:14', '2023-08-11 16:42:03', '2023-08-11 16:42:14'),
	(1035, 'SK-Pelaksana-Pengaduan.pdf', 'filepond/temp/7CelNSk5eGQNf1VKCJJgP2W0XUDP3gf0bWBsFbtP.pdf', 'pdf', 'application/pdf', 317806, 'public', 112277, '2023-08-11 17:12:06', '2023-08-11 16:42:14', '2023-08-11 16:42:06', '2023-08-11 16:42:14'),
	(1036, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'filepond/temp/YL9Te823jk5avlxDyJ3yPmZvqohcfYBvnvDbBMUP.pdf', 'pdf', 'application/pdf', 208090, 'public', 112277, '2023-08-11 17:12:06', '2023-08-11 16:42:14', '2023-08-11 16:42:06', '2023-08-11 16:42:14'),
	(1037, '01-RAPAT-KERJASAMA-300x300.jpg', 'filepond/temp/vMxhm9kOXsWQLosg4ayVUetCQfbQziQQEu9TOKly.jpg', 'jpg', 'image/jpeg', 29428, 'public', 112277, '2023-08-11 17:16:56', '2023-08-11 16:47:00', '2023-08-11 16:46:56', '2023-08-11 16:47:00'),
	(1038, 'IMG_4848-1200x600.jpg', 'filepond/temp/9TfwCSvqBD4KPEbow06a1Dbr6FMPRgGfd1hQSXQH.jpg', 'jpg', 'image/jpeg', 137658, 'public', 112277, '2023-08-11 17:17:15', '2023-08-11 16:47:17', '2023-08-11 16:47:15', '2023-08-11 16:47:17'),
	(1039, 'SK-Pelaksana-Pengaduan.pdf', 'filepond/temp/2bfISFQcNXEcwr0kNhbAOMqpZjhhKpXNZMVgHvOU.pdf', 'pdf', 'application/pdf', 317806, 'public', 112277, '2023-08-11 17:17:34', '2023-08-11 16:47:48', '2023-08-11 16:47:34', '2023-08-11 16:47:48'),
	(1040, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'filepond/temp/Ky7GqziIppf7yt6jpFcdAvD2ZPmvBvRWozISju3v.pdf', 'pdf', 'application/pdf', 208090, 'public', 112277, '2023-08-11 17:17:34', '2023-08-11 16:47:48', '2023-08-11 16:47:34', '2023-08-11 16:47:48'),
	(1041, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/QRnD5uQl2IUvX3jlVkevde6PmGcxSe0fVDU8Dj8x.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-11 17:17:43', '2023-08-11 16:47:48', '2023-08-11 16:47:43', '2023-08-11 16:47:48'),
	(1042, 'SK-DAN-SP.pdf', 'filepond/temp/WlC634nljF2JnyE3BVkvWKzA09haTwqsqj6y7arL.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-11 17:17:43', '2023-08-11 16:47:48', '2023-08-11 16:47:43', '2023-08-11 16:47:48'),
	(1043, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/lygjrYbruC5r2XOjXU4pWx3pOpbxDRKntPm5Ldl0.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 17:17:45', '2023-08-11 16:47:48', '2023-08-11 16:47:45', '2023-08-11 16:47:48'),
	(1044, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/uNh7HZmVPQ9LZTIpkLtdpgAKfoA9WSjBilPoUehp.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 17:17:45', '2023-08-11 16:47:48', '2023-08-11 16:47:45', '2023-08-11 16:47:48'),
	(1045, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/mBAfyqi9nctVbQ8pEX9s6cXl2WDJ7UZgDmgiFET7.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 17:56:11', NULL, '2023-08-11 17:26:11', '2023-08-11 17:26:11'),
	(1046, 'BARCODE-REAKSI-CEPAT-1200x1200.jpg', 'filepond/temp/f5IMbdBL0lBjzrtidTrGavn5OGebn1Jd2xAAYTP0.jpg', 'jpg', 'image/jpeg', 276375, 'public', 112277, '2023-08-11 18:01:58', NULL, '2023-08-11 17:31:58', '2023-08-11 17:31:58'),
	(1047, 'HUT-KOTA-600x400.jpg', 'filepond/temp/Lh7RoqF5kKkQDnejvw6e1XQ44eYi670aKpUXIMy8.jpg', 'jpg', 'image/jpeg', 51532, 'public', 112277, '2023-08-11 18:02:02', NULL, '2023-08-11 17:32:02', '2023-08-11 17:32:02'),
	(1048, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/f1t8g1bX7BA3PntC4swlR9cUjjDmRK3HCJAp8Tbx.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 18:02:15', NULL, '2023-08-11 17:32:15', '2023-08-11 17:32:15'),
	(1049, 'HUT-KOTA-1024x1024.jpg', 'filepond/temp/6WfdNoLy6eOIEjYUASNujVB3Sbd5uF57j94l3RfP.jpg', 'jpg', 'image/jpeg', 163957, 'public', 112277, '2023-08-11 18:06:13', '2023-08-11 17:36:21', '2023-08-11 17:36:13', '2023-08-11 17:36:21'),
	(1050, 'LOGO-HUT-KOTA-JAMBI_622_fix.png', 'filepond/temp/D5YdfUlNWxOJiABy4MZPgOnInwBBhtMNRgkGtkfL.png', 'png', 'image/png', 255342, 'public', 112277, '2023-08-11 18:06:19', '2023-08-11 17:36:21', '2023-08-11 17:36:19', '2023-08-11 17:36:21'),
	(1051, 'HUT-KOTA-600x600.jpg', 'filepond/temp/Bqm1psFW60KmD6DVDWws59e8hNdpSFdxlwhpwW1p.jpg', 'jpg', 'image/jpeg', 80356, 'public', 112277, '2023-08-11 18:06:48', '2023-08-11 17:36:51', '2023-08-11 17:36:48', '2023-08-11 17:36:51'),
	(1052, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/SkJ0PNlM9mkXKst1AsHg3wpXpDKOVjFZNFd4P746.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-11 18:06:48', '2023-08-11 17:36:51', '2023-08-11 17:36:48', '2023-08-11 17:36:51'),
	(1053, 'HUT-KOTA-600x400.jpg', 'filepond/temp/wsNMuNYjZDHx5nUtCXz3KhNUhpODkGGb8Dym3BCf.jpg', 'jpg', 'image/jpeg', 51532, 'public', 112277, '2023-08-11 18:11:19', '2023-08-11 18:02:30', '2023-08-11 17:41:19', '2023-08-11 18:02:30'),
	(1054, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/y045dA5lZ9bbgUoBlt6FpchMCIARi3LsqAwbXOY7.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-11 18:32:42', NULL, '2023-08-11 18:02:42', '2023-08-11 18:02:42'),
	(1055, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'filepond/temp/L7O119hB7a3cU2YphWE37LuaLT0hHQfRRpNrMp7X.jpg', 'jpg', 'image/jpeg', 149541, 'public', 112277, '2023-08-11 18:32:42', NULL, '2023-08-11 18:02:42', '2023-08-11 18:02:42'),
	(1056, 'LOGO-HUT-KOTA-JAMBI_622_fix-1200x600.png', 'filepond/temp/nV8S5nsFdvFbMHN9zbS8zukIObvoBV2KgOr5eNAx.png', 'png', 'image/png', 191717, 'public', 112277, '2023-08-11 18:32:44', NULL, '2023-08-11 18:02:44', '2023-08-11 18:02:44'),
	(1057, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'filepond/temp/mYGTlpqhmnlMToJUgy88PHtgpnpmj7UGwlWdNKGD.jpg', 'jpg', 'image/jpeg', 384439, 'public', 112277, '2023-08-11 18:33:24', NULL, '2023-08-11 18:03:24', '2023-08-11 18:03:24'),
	(1058, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'filepond/temp/DRS4Iv7zqva6G9AoQJVHBHUOiWi4isctuMkvbCkJ.jpg', 'jpg', 'image/jpeg', 103306, 'public', 112277, '2023-08-11 18:33:24', NULL, '2023-08-11 18:03:24', '2023-08-11 18:03:24'),
	(1059, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/vWSuOrSPpSUXmrOZDRmiHOYB46H4kLlidpsKxVZZ.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 18:34:08', NULL, '2023-08-11 18:04:08', '2023-08-11 18:04:08'),
	(1060, 'BARCODE-REAKSI-CEPAT-768x768.jpg', 'filepond/temp/xf8Cr3DEiekevSpYSnPpnSdsYpEQsIJiaESbKsjA.jpg', 'jpg', 'image/jpeg', 149541, 'public', 112277, '2023-08-11 18:34:08', NULL, '2023-08-11 18:04:08', '2023-08-11 18:04:08'),
	(1061, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/2oagmkLXI0XIEBH8JBORmCEkyWAG95IfBbcIc3ok.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 18:35:34', NULL, '2023-08-11 18:05:34', '2023-08-11 18:05:34'),
	(1062, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/YjgcB9Xm9jZ4di9eYQKFcprQz6ekE4gpT8YKd46V.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 18:35:34', NULL, '2023-08-11 18:05:34', '2023-08-11 18:05:34'),
	(1063, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/RDarrbrZ96Jm0QfgZskdNu2Q4TATRDebKsWntdDn.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-11 18:49:49', NULL, '2023-08-11 18:19:49', '2023-08-11 18:19:49'),
	(1064, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/gsrK7MX5SgoZ9ZeN3DBIbyFSo4cP23mSQzXgIjV1.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-11 19:13:16', '2023-08-11 18:44:05', '2023-08-11 18:43:16', '2023-08-11 18:44:05'),
	(1065, 'BARCODE-REAKSI-CEPAT-150x150.jpg', 'filepond/temp/ny4FESiphJBEGsstEGvnW87K6sapr2Ji4QESMMVW.jpg', 'jpg', 'image/jpeg', 10786, 'public', 112277, '2023-08-11 19:14:09', '2023-08-11 18:55:49', '2023-08-11 18:44:09', '2023-08-11 18:55:49'),
	(1066, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/n0Ib8lTy0NyyHaS7zwfPTI1NdX5AI42X3t9yVwFc.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-11 19:29:51', '2023-08-11 18:59:54', '2023-08-11 18:59:51', '2023-08-11 18:59:54'),
	(1067, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'filepond/temp/OSFXoQ8YhGo4vYSbS1AdwbzZSnsbSGZOz2XZHPNf.jpg', 'jpg', 'image/jpeg', 103306, 'public', 112277, '2023-08-11 19:29:51', '2023-08-11 18:59:54', '2023-08-11 18:59:51', '2023-08-11 18:59:54'),
	(1068, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/AiVVAdCaQdTmh5bRykMtY92wqlYpwTTbuDw0Rr06.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-11 21:49:34', NULL, '2023-08-11 21:19:34', '2023-08-11 21:19:34'),
	(1069, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/0AodoAzoHKR7N5c7Dr55jw4PcoGwKZZKeO6SN7Ml.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 21:50:01', '2023-08-11 21:20:36', '2023-08-11 21:20:01', '2023-08-11 21:20:36'),
	(1070, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/ctJ5eKurXo4QIzdHLQCLjm7KbhMdIGPhDOFC30Gc.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-11 21:50:48', NULL, '2023-08-11 21:20:48', '2023-08-11 21:20:48'),
	(1071, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/6CwDEv9QtdRZbarwZLoHoQJ37VdRuDnFJniyTFqi.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 06:30:03', '2023-08-12 06:04:11', '2023-08-12 06:00:03', '2023-08-12 06:04:11'),
	(1072, 'SK-DAN-SP.pdf', 'filepond/temp/dhkXhpKoPEMJcbfj88Kw6QXZEW7iHVkh6kOddP1H.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:34:44', '2023-08-12 06:04:46', '2023-08-12 06:04:44', '2023-08-12 06:04:46'),
	(1073, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/nw1ef6D9jUccJparkCRb2dfZWJ72V9s7On8kPCPa.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 06:34:57', NULL, '2023-08-12 06:04:57', '2023-08-12 06:04:57'),
	(1074, 'SK-DAN-SP.pdf', 'filepond/temp/FbAGiwbfXe2yh6kaqhFXPZ9u6rFpBPptTHnLI5qm.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:35:08', NULL, '2023-08-12 06:05:08', '2023-08-12 06:05:08'),
	(1075, 'SK-DAN-SP.pdf', 'filepond/temp/602r3djhkeLMyX1X1ea5nBSMx6qCWSINpgkJPrFM.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:37:53', NULL, '2023-08-12 06:07:53', '2023-08-12 06:07:53'),
	(1076, 'SK-DAN-SP.pdf', 'filepond/temp/NrQ0PhW3Yz6TumZTU9d3lpWK8ywguX4FDuhRc3pL.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:39:10', '2023-08-12 06:11:27', '2023-08-12 06:09:10', '2023-08-12 06:11:27'),
	(1077, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/Ci1NoFsVbfNU3Te56hmmUMvYLcLoeYRHGSASsSdL.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-12 06:41:39', '2023-08-12 06:11:57', '2023-08-12 06:11:39', '2023-08-12 06:11:57'),
	(1078, 'SK-DAN-SP.pdf', 'filepond/temp/HMONV8Ng1nxxAz2C645kPBqY9wEpWjNwz3pviaXm.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:41:39', '2023-08-12 06:11:57', '2023-08-12 06:11:39', '2023-08-12 06:11:57'),
	(1079, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/4FDq5HFhAoMQ4CXxVWIPRokoFK5sIb7wgZo4DqjL.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 06:41:42', '2023-08-12 06:11:57', '2023-08-12 06:11:42', '2023-08-12 06:11:57'),
	(1080, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/U94CNKXw5snNBERzUbUVxEK7aJNdu1qjW2PIlxwI.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 06:41:42', '2023-08-12 06:11:57', '2023-08-12 06:11:42', '2023-08-12 06:11:57'),
	(1081, 'BARCODE-REAKSI-CEPAT-300x300.jpg', 'filepond/temp/ewtNHO7SlSV9WrR9HbYaNOeikqKUCq9fn7NNqDvY.jpg', 'jpg', 'image/jpeg', 34637, 'public', 112277, '2023-08-12 06:41:48', '2023-08-12 06:11:57', '2023-08-12 06:11:48', '2023-08-12 06:11:57'),
	(1082, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'filepond/temp/Y2fbafiVjdZL0qTwIjAXpdWZkZoh9o2wIsnqYUl5.jpg', 'jpg', 'image/jpeg', 384439, 'public', 112277, '2023-08-12 06:41:48', '2023-08-12 06:11:57', '2023-08-12 06:11:48', '2023-08-12 06:11:57'),
	(1083, 'LOGO-HUT-KOTA-JAMBI_622_fix.png', 'filepond/temp/jyUszz3QXK2mMw8VuVmvbTX8SHOma9D0v4iRiWPq.png', 'png', 'image/png', 255342, 'public', 112277, '2023-08-12 06:41:54', '2023-08-12 06:11:57', '2023-08-12 06:11:54', '2023-08-12 06:11:57'),
	(1084, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'filepond/temp/rXwdjRSqO9YMJiIJQO9zvt8NpyDUoDMc7hq6kHj6.jpg', 'jpg', 'image/jpeg', 103306, 'public', 112277, '2023-08-12 06:42:28', '2023-08-12 06:12:43', '2023-08-12 06:12:28', '2023-08-12 06:12:43'),
	(1085, 'BARCODE-REAKSI-CEPAT-600x400.jpg', 'filepond/temp/76RcgHUU2QwZbo4SUQ8xUM6ZeapJpjSCo2ufWyNI.jpg', 'jpg', 'image/jpeg', 75309, 'public', 112277, '2023-08-12 06:42:30', '2023-08-12 06:12:42', '2023-08-12 06:12:30', '2023-08-12 06:12:42'),
	(1086, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/gQ6PWBfGmKD6qCdF63ShG1vvM3iksyfva8VRf69X.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 06:42:34', '2023-08-12 06:12:42', '2023-08-12 06:12:34', '2023-08-12 06:12:42'),
	(1087, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/GNHwDngytj7gEA31SjeG7bhQNNrTDqqahARdDJlt.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-12 06:42:38', '2023-08-12 06:12:42', '2023-08-12 06:12:38', '2023-08-12 06:12:42'),
	(1088, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/7Mp5VRoyBbaHJJFooxQepz8Q8P5wl4EabCV02pvV.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 06:42:40', '2023-08-12 06:12:42', '2023-08-12 06:12:40', '2023-08-12 06:12:42'),
	(1089, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/WaG1KQE8B83z4AmmYvwARM7xFDAtgVBWzmt6OBG2.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-12 06:43:17', '2023-08-12 06:13:29', '2023-08-12 06:13:17', '2023-08-12 06:13:29'),
	(1090, 'SK-DAN-SP.pdf', 'filepond/temp/mMnl0CsMbsz2mIDk3OiUYTz7oXU0JhJf9RLmqDqW.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:43:17', '2023-08-12 06:13:29', '2023-08-12 06:13:17', '2023-08-12 06:13:29'),
	(1091, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/XGpFWpS7ivG8p8oF0fsrOVVhnUmWaWOKggcNmVtI.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 06:43:19', '2023-08-12 06:13:29', '2023-08-12 06:13:19', '2023-08-12 06:13:29'),
	(1092, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/1O5DUkr6VXYBMlskjARDV80YwUGF7MwAvJDenUpT.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 06:43:19', '2023-08-12 06:13:29', '2023-08-12 06:13:19', '2023-08-12 06:13:29'),
	(1093, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'filepond/temp/6oGcQMKvIVNN5NTEXIt9m0pNP6OIcK10NBrHYwSJ.jpg', 'jpg', 'image/jpeg', 384439, 'public', 112277, '2023-08-12 06:43:21', '2023-08-12 06:13:29', '2023-08-12 06:13:21', '2023-08-12 06:13:29'),
	(1094, 'LOGO-HUT-KOTA-JAMBI_622_fix-1200x600.png', 'filepond/temp/EaehpY0ROdPYIg8p1oufDTmPDiHAqYBCtEeGk4on.png', 'png', 'image/png', 191717, 'public', 112277, '2023-08-12 06:43:25', '2023-08-12 06:13:25', '2023-08-12 06:13:25', '2023-08-12 06:13:25'),
	(1095, '12-SIPADUKO-MAINTANANCE-1-1024x1024.jpg', 'filepond/temp/tRsLF8IggnnRQFVAHHndq3wScuO8EVQhCAJ5ajRS.jpg', 'jpg', 'image/jpeg', 189680, 'public', 112277, '2023-08-12 06:43:42', '2023-08-12 06:13:44', '2023-08-12 06:13:42', '2023-08-12 06:13:44'),
	(1096, 'BARCODE-REAKSI-CEPAT-1024x1024.jpg', 'filepond/temp/sC4yOgge9kNtjxYHbMixTl9t5IjH2gh7qLmkASjV.jpg', 'jpg', 'image/jpeg', 221685, 'public', 112277, '2023-08-12 06:43:58', '2023-08-12 06:14:08', '2023-08-12 06:13:58', '2023-08-12 06:14:08'),
	(1097, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/2VJKKiKEQV1HDa49t6H79Xlf3elGYjbLa18GQHq2.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-12 06:44:00', '2023-08-12 06:14:01', '2023-08-12 06:14:00', '2023-08-12 06:14:01'),
	(1098, 'SK-DAN-SP.pdf', 'filepond/temp/0Q5mv02PgteFn5i4P7a5YMUDJJGd3Dulas4UDcgK.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 06:44:06', '2023-08-12 06:14:08', '2023-08-12 06:14:06', '2023-08-12 06:14:08'),
	(1099, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'filepond/temp/K5oEmXFEvLFr5UgNm7xpIYAqTUAya3xaxN2kuto8.jpg', 'jpg', 'image/jpeg', 103306, 'public', 112277, '2023-08-12 06:45:42', NULL, '2023-08-12 06:15:42', '2023-08-12 06:15:42'),
	(1100, 'HUT-KOTA-600x400.jpg', 'filepond/temp/UZwWbG2MfPzeYJ2mGmTUuV3cMaXqtTX6DaNfbUBQ.jpg', 'jpg', 'image/jpeg', 51532, 'public', 112277, '2023-08-12 06:54:17', '2023-08-12 06:24:22', '2023-08-12 06:24:17', '2023-08-12 06:24:22'),
	(1101, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'filepond/temp/32gUEUBuK15lsNmFxxQlTgxWtthGzKwtn6dyzKth.jpg', 'jpg', 'image/jpeg', 384439, 'public', 112277, '2023-08-12 06:54:20', '2023-08-12 06:24:22', '2023-08-12 06:24:20', '2023-08-12 06:24:22'),
	(1102, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/gT3KhXqKfo7JDWxeNzP9w8wU9dktQr4MZUW4o2jk.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 06:54:33', '2023-08-12 06:24:41', '2023-08-12 06:24:33', '2023-08-12 06:24:41'),
	(1103, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/cgosX3H7YMjrfShFGwyvxAStXWGPOC8lXXu68lHe.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 06:55:32', '2023-08-12 06:25:54', '2023-08-12 06:25:32', '2023-08-12 06:25:54'),
	(1104, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/kI9KGR0yug2kXhRntMVwqJKu3OIdZeZ5Axs1kfXj.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 06:56:04', '2023-08-12 06:27:05', '2023-08-12 06:26:05', '2023-08-12 06:27:05'),
	(1105, 'HUT-KOTA-1200x1200.jpg', 'filepond/temp/AkshYvy8w4VTEbJ2hFioXpMMYqgBYMHu4B3mRqTu.jpg', 'jpg', 'image/jpeg', 202230, 'public', 112277, '2023-08-12 06:57:40', '2023-08-12 06:28:03', '2023-08-12 06:27:40', '2023-08-12 06:28:03'),
	(1106, '12-SIPADUKO-MAINTANANCE.jpg', 'filepond/temp/hq0rm9kq8cmzC7zDwMry3Bc9DhdIgT9cxIFpdPGV.jpg', 'jpg', 'image/jpeg', 1081545, 'public', 112277, '2023-08-12 06:57:48', '2023-08-12 06:28:03', '2023-08-12 06:27:48', '2023-08-12 06:28:03'),
	(1107, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/4cmmkTzt9QvmOJPEutGRJgVJOPSKOeu8rzx5DY49.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 06:59:07', '2023-08-12 06:29:09', '2023-08-12 06:29:07', '2023-08-12 06:29:09'),
	(1108, 'BARCODE-REAKSI-CEPAT-300x300.jpg', 'filepond/temp/jbeLZWsKyWSgxPR9kvtxTuRooYuy8SsnWOkGERRC.jpg', 'jpg', 'image/jpeg', 34637, 'public', 112277, '2023-08-12 06:59:28', '2023-08-12 06:29:35', '2023-08-12 06:29:28', '2023-08-12 06:29:35'),
	(1109, '12-SIPADUKO-MAINTANANCE.jpg', 'filepond/temp/ihoUazYmTMWrbh6V7WxancKIDyXL1jKopLN6P1Pa.jpg', 'jpg', 'image/jpeg', 1081545, 'public', 112277, '2023-08-12 06:59:33', '2023-08-12 06:29:35', '2023-08-12 06:29:33', '2023-08-12 06:29:35'),
	(1110, 'HUT-KOTA.jpg', 'filepond/temp/8RDozoXtBmXmJM202KKUA4iRn0hc9RGAIDEmeEoE.jpg', 'jpg', 'image/jpeg', 817442, 'public', 112277, '2023-08-12 07:00:25', '2023-08-12 06:30:27', '2023-08-12 06:30:26', '2023-08-12 06:30:27'),
	(1111, 'BARCODE-REAKSI-CEPAT-600x600.jpg', 'filepond/temp/0nDUHgziiied1srpucvOhyPoJCLMWq1ldEcWwAO3.jpg', 'jpg', 'image/jpeg', 103306, 'public', 112277, '2023-08-12 07:00:57', '2023-08-12 06:31:20', '2023-08-12 06:30:57', '2023-08-12 06:31:20'),
	(1112, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/T6IkuozVLM0fUF2Br2WYacWmh3jdPO4IE50SMm6w.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 07:02:03', '2023-08-12 06:32:05', '2023-08-12 06:32:03', '2023-08-12 06:32:05'),
	(1113, 'BARCODE-REAKSI-CEPAT-150x150.jpg', 'filepond/temp/6Z9tUx4Vl1iIJ3GmOvASzSollphfUrDlWWv2qGve.jpg', 'jpg', 'image/jpeg', 10786, 'public', 112277, '2023-08-12 07:02:24', NULL, '2023-08-12 06:32:24', '2023-08-12 06:32:24'),
	(1114, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/0hOHgU45g3EtSR6yV8D1aS41X5CAapzjykiP3AaT.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 07:03:13', '2023-08-12 06:33:31', '2023-08-12 06:33:13', '2023-08-12 06:33:31'),
	(1115, '12-SIPADUKO-MAINTANANCE.jpg', 'filepond/temp/boPHTg6XRM95E3X0kft0uWsecsWc2cwT1raPdfX0.jpg', 'jpg', 'image/jpeg', 1081545, 'public', 112277, '2023-08-12 07:03:18', '2023-08-12 06:33:31', '2023-08-12 06:33:18', '2023-08-12 06:33:31'),
	(1116, 'IKM-ig.jpg', 'filepond/temp/rgn6w007EJ26jZRhBqzsKZBNqhufsGtJ8IJnvhC7.jpg', 'jpg', 'image/jpeg', 1696793, 'public', 112277, '2023-08-12 07:03:22', '2023-08-12 06:33:31', '2023-08-12 06:33:22', '2023-08-12 06:33:31'),
	(1117, '12-SIPADUKO-MAINTANANCE.jpg', 'filepond/temp/DitZMZSXdXoz4q4GMjeWAPTIKsiTGbtxtKw0RJOK.jpg', 'jpg', 'image/jpeg', 1081545, 'public', 112277, '2023-08-12 07:03:53', NULL, '2023-08-12 06:33:53', '2023-08-12 06:33:53'),
	(1118, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/C4fwpFT8CSdJezuSOF4sR2EqSRF0LoKnqAsWrdUe.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:03:56', NULL, '2023-08-12 06:33:56', '2023-08-12 06:33:56'),
	(1119, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/5HIlNxZA3taTnhQhUHisdDZhNOQR9eDvzaUBk1eb.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:04:38', '2023-08-12 06:35:12', '2023-08-12 06:34:38', '2023-08-12 06:35:12'),
	(1120, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/DLL23IOXxqLOg21v3bk32CxV2d8ggVweMjqOzLzh.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 07:05:21', '2023-08-12 06:35:29', '2023-08-12 06:35:21', '2023-08-12 06:35:29'),
	(1121, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/UJcwQ2E6rIZ12RnHja43xrMQZsixh35ew4JhIgQ8.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:05:23', '2023-08-12 06:35:29', '2023-08-12 06:35:23', '2023-08-12 06:35:29'),
	(1122, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/qZwUQKRMmIQc87dVsv0hkmmGGNppuryLuaXeDuPW.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:05:43', NULL, '2023-08-12 06:35:43', '2023-08-12 06:35:43'),
	(1123, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/E4TCbjADmvgL7a1oMd7biWDEWLwDrwJKlj2QQtDj.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:12:56', '2023-08-12 06:43:16', '2023-08-12 06:42:56', '2023-08-12 06:43:16'),
	(1124, 'SK-DAN-SP.pdf', 'filepond/temp/QyvUYQqY6D6EMhOEaJ6hI95dDhzIpS4cHcNsUzPa.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 07:16:16', '2023-08-12 06:46:18', '2023-08-12 06:46:16', '2023-08-12 06:46:18'),
	(1125, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/slqphEC1BJ5bpMVPK8ex3bLRiT9nJbhp1h9JPxJL.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-12 07:16:27', '2023-08-12 06:46:32', '2023-08-12 06:46:27', '2023-08-12 06:46:32'),
	(1126, 'SK-DAN-SP.pdf', 'filepond/temp/ObpIAOTMS9g5KMfjWCNH34gBjo9kk6E7OVWAmZOi.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 07:16:27', '2023-08-12 06:46:32', '2023-08-12 06:46:27', '2023-08-12 06:46:32'),
	(1127, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/RUqoK8elEafedDQDiUjAGG2O2yUGtSDIkoWVVKIS.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:16:29', '2023-08-12 06:46:32', '2023-08-12 06:46:29', '2023-08-12 06:46:32'),
	(1128, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/jBzhzJBRgSfVvdmpW4tUGcMXG7Nh1vmArQwL4FaF.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 07:16:29', '2023-08-12 06:46:32', '2023-08-12 06:46:29', '2023-08-12 06:46:32'),
	(1129, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/yl5JqnUtSiWuv01SddWZxetw9NuhJNoVyVAEuDGP.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 07:16:59', '2023-08-12 06:47:01', '2023-08-12 06:46:59', '2023-08-12 06:47:01'),
	(1130, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/60igomdK8LNeltT6ZL5pkH5THD9Wmlyov3X8JRSh.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 07:52:38', NULL, '2023-08-12 07:22:38', '2023-08-12 07:22:38'),
	(1131, 'SK-DAN-SP.pdf', 'filepond/temp/xcjy64oo1xt2vLjJaCQvRoFi7FcrO0DukmKb4dsN.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 08:19:16', '2023-08-12 07:49:18', '2023-08-12 07:49:16', '2023-08-12 07:49:18'),
	(1132, 'SK-DAN-SP.pdf', 'filepond/temp/f7K6EJ5wObP9SOrQIyuUtMbOKDFWR441UTixN9Js.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 08:19:45', '2023-08-12 08:11:30', '2023-08-12 07:49:45', '2023-08-12 08:11:30'),
	(1133, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/rCP1npD3Wis5HNsPidyhivMcriPbGB8AeM7YHWxU.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 08:46:38', '2023-08-12 08:16:45', '2023-08-12 08:16:38', '2023-08-12 08:16:45'),
	(1134, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/OaoTpX4IQSJEEK7UhaL00Jm38jHfgmknqsGGF4kE.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 08:49:53', '2023-08-12 08:19:56', '2023-08-12 08:19:53', '2023-08-12 08:19:56'),
	(1135, 'BUKU-PANDUAN-LAYANAN-ADMINDUK-ONLINE-SIPADUKO-JAMBI.pdf', 'filepond/temp/j4al1C5kVC1gClV4fYgWTmLO07pGyJYKFdF9Eniq.pdf', 'pdf', 'application/pdf', 1914777, 'public', 112277, '2023-08-12 11:07:01', '2023-08-12 10:41:29', '2023-08-12 10:37:01', '2023-08-12 10:41:29'),
	(1136, 'SK-DAN-SP.pdf', 'filepond/temp/acN6ifLIx8yBhcpPhsBF2FT8Jftk4wIRvAQPlgNb.pdf', 'pdf', 'application/pdf', 1304449, 'public', 112277, '2023-08-12 11:12:03', NULL, '2023-08-12 10:42:03', '2023-08-12 10:42:03'),
	(1137, 'BARCODE-REAKSI-CEPAT.jpg', 'filepond/temp/ZUljGjKYIhUuqGkmapdes1akwHaMRww6C0Kx3o0e.jpg', 'jpg', 'image/jpeg', 1547994, 'public', 112277, '2023-08-12 20:53:29', '2023-08-12 20:23:43', '2023-08-12 20:23:29', '2023-08-12 20:23:43'),
	(1138, 'LOGO-HUT-KOTA-JAMBI_622_fix-600x600.png', 'filepond/temp/gzi8hBrQcZ29sp7q9G6TeLyokgYaneY0V8kQvNrK.png', 'png', 'image/png', 113968, 'public', 112277, '2023-08-12 20:53:36', '2023-08-12 20:23:42', '2023-08-12 20:23:36', '2023-08-12 20:23:42'),
	(1139, 'HUT-KOTA-1200x600.jpg', 'filepond/temp/O3wUnfgFA1NKOXfUBcSbbM5LobppEeZbPALfesTS.jpg', 'jpg', 'image/jpeg', 94854, 'public', 112277, '2023-08-12 20:53:36', '2023-08-12 20:23:42', '2023-08-12 20:23:36', '2023-08-12 20:23:42'),
	(1140, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/VFU3jnKKVkjrCTvT1uRtnrEUkcT1RFJ6pVcbrS8C.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 20:53:38', '2023-08-12 20:23:42', '2023-08-12 20:23:38', '2023-08-12 20:23:42'),
	(1141, 'BARCODE-REAKSI-CEPAT-1536x1536.jpg', 'filepond/temp/s0WhtbasfLbtOpUrpjtfZs3TEDwyp9lvi3FukJ0P.jpg', 'jpg', 'image/jpeg', 384439, 'public', 112277, '2023-08-12 20:53:39', '2023-08-12 20:23:42', '2023-08-12 20:23:39', '2023-08-12 20:23:42'),
	(1142, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/B7DjjHiZqSQlksMomFW4sbDJQ84oiTI7LOBOnCfA.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-12 20:54:14', '2023-08-12 20:24:19', '2023-08-12 20:24:14', '2023-08-12 20:24:19'),
	(1143, 'PEMBAHARUAN-SP-29.pdf', 'filepond/temp/j4q66rgl2oJIqaxwhC9J2glPTiYytYtZaqJVoWBa.pdf', 'pdf', 'application/pdf', 1522495, 'public', 112277, '2023-08-12 20:54:17', '2023-08-12 20:24:19', '2023-08-12 20:24:17', '2023-08-12 20:24:19'),
	(1144, 'LOGO-HUT-KOTA-JAMBI_622_fix-1200x600.png', 'filepond/temp/Z3BUBFCPTs8tKoUQO6vEzX8MEs9QN5GZWLBWyeMY.png', 'png', 'image/png', 191717, 'public', 112277, '2023-08-13 00:05:10', '2023-08-12 23:35:14', '2023-08-12 23:35:10', '2023-08-12 23:35:14'),
	(1145, '3-KERJASAMA.jpg', 'filepond/temp/IijtxaiQoYjdq8SAO3SFAviZHOXqYIFsKJNjQZ7U.jpg', 'jpg', 'image/jpeg', 1007721, 'public', 112277, '2023-08-13 01:27:01', '2023-08-13 00:57:03', '2023-08-13 00:57:01', '2023-08-13 00:57:03'),
	(1146, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/BYGJn130fOulj8HgV72iQO8ViAMg2622WNOiGFTv.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:08:07', NULL, '2023-08-15 11:38:07', '2023-08-15 11:38:07'),
	(1147, 'BUKU-PANDUAN-REAKSI-CEPAT-f50227ed-72be-4fb9-a2df-4a5002d7e8cd-7veMVqwH9w5P79Eo35pU7ZcprIDFODIKeYPyHt9ijXvLGSL7St.pdf', 'filepond/temp/KviKuSpl8iHubltbmfgBvqCmNWbVwd9NLpc3vbq5.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:08:25', '2023-08-15 11:38:30', '2023-08-15 11:38:25', '2023-08-15 11:38:30'),
	(1148, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/HEdSeKPqZsbx1DVaT9MyxbjMYgnvuHPO0AqF5n3I.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:10:01', NULL, '2023-08-15 11:40:01', '2023-08-15 11:40:01'),
	(1149, 'Starter-Dev (5).pdf', 'filepond/temp/4kIYPjIl8lOxnD5uV4Bjhh7svg29w5pEeUTrXEUT.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 12:10:01', NULL, '2023-08-15 11:40:01', '2023-08-15 11:40:01'),
	(1150, 'Starter-Dev (5).pdf', 'filepond/temp/zTTPnq7zn4EHTQAZynMzgvvzPL9j4yGSi0wPGglH.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 12:14:43', NULL, '2023-08-15 11:44:43', '2023-08-15 11:44:43'),
	(1151, 'BUKU-PANDUAN-REAKSI-CEPAT-f50227ed-72be-4fb9-a2df-4a5002d7e8cd-7veMVqwH9w5P79Eo35pU7ZcprIDFODIKeYPyHt9ijXvLGSL7St.pdf', 'filepond/temp/hjIdoHbjeMM90O3W3HXIfD4DHxArlFgIZQkaqHBc.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:14:43', NULL, '2023-08-15 11:44:43', '2023-08-15 11:44:43'),
	(1152, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/9S5kylcpiEMGvMJer85JEbUXJM2UkN6qWQeQ6zKK.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:14:45', NULL, '2023-08-15 11:44:45', '2023-08-15 11:44:45'),
	(1153, 'Starter-Dev (5).pdf', 'filepond/temp/EJoB5a0VaQxYbzO1cZDfQSTTcXXh7M9gtFoP9z3L.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 12:15:25', NULL, '2023-08-15 11:45:25', '2023-08-15 11:45:25'),
	(1154, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/aeyxiQ4soTXdhJzZilzCQPx61bQeVB1qdt4OHXbr.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:15:25', NULL, '2023-08-15 11:45:25', '2023-08-15 11:45:25'),
	(1155, 'BUKU-PANDUAN-REAKSI-CEPAT-f50227ed-72be-4fb9-a2df-4a5002d7e8cd-7veMVqwH9w5P79Eo35pU7ZcprIDFODIKeYPyHt9ijXvLGSL7St.pdf', 'filepond/temp/hyALbiZdWqHE5JiOSk10hqnqEY8PbfVFxxjCx2YA.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:15:27', NULL, '2023-08-15 11:45:27', '2023-08-15 11:45:27'),
	(1156, 'Starter-Dev (5).pdf', 'filepond/temp/SXttMPbVBap2iMG6sgthOskzEL9eHnwOxR7196cZ.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 12:15:56', NULL, '2023-08-15 11:45:56', '2023-08-15 11:45:56'),
	(1157, 'BUKU-PANDUAN-REAKSI-CEPAT.pdf', 'filepond/temp/EvDzcOYrg9odg7kqxC0CVgd8edpzAwQznHok9QlZ.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 12:15:56', NULL, '2023-08-15 11:45:56', '2023-08-15 11:45:56'),
	(1158, 'Starter-Dev (5).pdf', 'filepond/temp/hQpNUGlh7qDpFlBSSuxzjGQMppoE4SZE12mV9nZG.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 12:16:50', NULL, '2023-08-15 11:46:50', '2023-08-15 11:46:50'),
	(1159, 'BUKU-PANDUAN-REAKSI-CEPAT-f50227ed-72be-4fb9-a2df-4a5002d7e8cd-7veMVqwH9w5P79Eo35pU7ZcprIDFODIKeYPyHt9ijXvLGSL7St.pdf', 'filepond/temp/UfEd0WgPBsTwh1nU0Xtud300qWTGUPzdU72NqDzx.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 15:21:57', NULL, '2023-08-15 14:51:57', '2023-08-15 14:51:57'),
	(1160, 'Starter-Dev (3).pdf', 'filepond/temp/8ghcVtSV3bd2DyhDBVGlLv2aKEuwjk0FTpkhg4Px.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:22:31', NULL, '2023-08-15 14:52:31', '2023-08-15 14:52:31'),
	(1161, 'Starter-Dev (4).pdf', 'filepond/temp/lvdb5Mp6bXcFjruzT4izbhfDwEXeFegdjpAo5Bdf.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:22:31', NULL, '2023-08-15 14:52:31', '2023-08-15 14:52:31'),
	(1162, 'Starter-Dev (2).pdf', 'filepond/temp/Gly1FsbK993YyZVtm8i5fJ1aCpGHaMbSZE6haTmr.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:22:33', NULL, '2023-08-15 14:52:33', '2023-08-15 14:52:33'),
	(1163, 'Starter-Dev (1).pdf', 'filepond/temp/GLIDOht6YVQyBkwEyKahPfMgPOGP58GDQjU8wl94.pdf', 'pdf', 'application/pdf', 13579, 'public', 112277, '2023-08-15 15:22:33', NULL, '2023-08-15 14:52:33', '2023-08-15 14:52:33'),
	(1164, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (2).pdf', 'filepond/temp/5VwSObvk70JWRBdJBizWlPVe7yf5dWQOGt3Ux9v6.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:22:34', NULL, '2023-08-15 14:52:34', '2023-08-15 14:52:34'),
	(1165, 'Starter-Dev.pdf', 'filepond/temp/exWWqqlvSCnbQz8wzEuEsLaSKzshSJQx0bWEkWT5.pdf', 'pdf', 'application/pdf', 17691, 'public', 112277, '2023-08-15 15:22:34', NULL, '2023-08-15 14:52:34', '2023-08-15 14:52:34'),
	(1166, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2 (1).pdf', 'filepond/temp/ODX8mNJaKPvUbKviVVFInqqNfLsfgZfnUXJ8XDtZ.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:22:36', NULL, '2023-08-15 14:52:36', '2023-08-15 14:52:36'),
	(1167, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2 (1) (1).pdf', 'filepond/temp/vmmYdQPVUdv7iFa5ZJ42rNxezCP0L6FcUkBbcxq8.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:22:36', NULL, '2023-08-15 14:52:36', '2023-08-15 14:52:36'),
	(1168, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/up5OhVydpvlXj82lFZkb2jRlCVvs7oxGagQyDqCL.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:22:38', NULL, '2023-08-15 14:52:38', '2023-08-15 14:52:38'),
	(1169, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (1).pdf', 'filepond/temp/SHJRxd4Y0nVXb4nUIWnJKeiVP6kZtnJRLwOp4NZc.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:22:38', NULL, '2023-08-15 14:52:38', '2023-08-15 14:52:38'),
	(1170, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (3).pdf', 'filepond/temp/Km0ZD81J5oohS4EpgzrX3d9LALr4T8IFm3iJlIKc.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:22:40', NULL, '2023-08-15 14:52:40', '2023-08-15 14:52:40'),
	(1171, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2.pdf', 'filepond/temp/KjXybWuHOwAnqhDtnknEXGPTVTJIMdkpaqrZlOiS.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:22:40', NULL, '2023-08-15 14:52:40', '2023-08-15 14:52:40'),
	(1172, 'Starter-Dev (3).pdf', 'filepond/temp/PgB8dLMPhQN8Vx2fjyF0hOSBzsv2WzailnHmNp50.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:23:41', NULL, '2023-08-15 14:53:41', '2023-08-15 14:53:41'),
	(1173, 'Starter-Dev (4).pdf', 'filepond/temp/hltylG42T5a0wBIaMd89kZr8VxaPejqPazOpGJRk.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:23:41', NULL, '2023-08-15 14:53:41', '2023-08-15 14:53:41'),
	(1174, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/9KpFxW7VYxIK787smzFe9nKEtupkb9S5tpBs9RRU.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:23:43', NULL, '2023-08-15 14:53:43', '2023-08-15 14:53:43'),
	(1175, 'Starter-Dev (2).pdf', 'filepond/temp/OMWCbkzk7WIDg7gq8XHCISgO2mR0l7sMuNVkGk91.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:23:43', NULL, '2023-08-15 14:53:43', '2023-08-15 14:53:43'),
	(1176, 'BUKU-PANDUAN-REAKSI-CEPAT-f50227ed-72be-4fb9-a2df-4a5002d7e8cd-7veMVqwH9w5P79Eo35pU7ZcprIDFODIKeYPyHt9ijXvLGSL7St.pdf', 'filepond/temp/3Zfc3Iiv6Kfhjd3BqJyaOMlzHVhm6EZNr0LpuaCF.pdf', 'pdf', 'application/pdf', 657618, 'public', 112277, '2023-08-15 15:23:55', NULL, '2023-08-15 14:53:55', '2023-08-15 14:53:55'),
	(1177, 'Starter-Dev (4).pdf', 'filepond/temp/AAqvyNRdrrerAMWcPUHLx5Dt9I2NnH8uawGLXRrF.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:25:46', NULL, '2023-08-15 14:55:46', '2023-08-15 14:55:46'),
	(1178, 'Starter-Dev (3).pdf', 'filepond/temp/4rose3H94TeMAUfjBq4iODdES01Te5dePCaZmgsK.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:25:46', NULL, '2023-08-15 14:55:46', '2023-08-15 14:55:46'),
	(1179, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/twIT3OQ1RPkWxTgdcau0AvGSN8PL1niQemnsR7Tr.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:25:48', NULL, '2023-08-15 14:55:48', '2023-08-15 14:55:48'),
	(1180, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/IkW0T7wDbl6DeLCtFTdTQLXjjoNrgBQpPkv2u6wO.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:13', NULL, '2023-08-15 14:56:13', '2023-08-15 14:56:13'),
	(1181, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (3).pdf', 'filepond/temp/vRzFyiluvWuEMCONWQcWVStqTFyK9Sek1m64stLV.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:13', NULL, '2023-08-15 14:56:13', '2023-08-15 14:56:13'),
	(1182, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (1).pdf', 'filepond/temp/FhYHrxOOqUPGPACDuBNFZFsOM3yUCIdxADwLSzxO.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:14', NULL, '2023-08-15 14:56:14', '2023-08-15 14:56:14'),
	(1183, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (2).pdf', 'filepond/temp/FhWPZShBfzqFRBw6kfAKDCiX7MQs6xFSHitVIUx3.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:14', NULL, '2023-08-15 14:56:14', '2023-08-15 14:56:14'),
	(1184, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2.pdf', 'filepond/temp/FdtfV0TPoX6DBHClK2hTbhNohxyKv9fm4ruZMO4d.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:26:40', NULL, '2023-08-15 14:56:40', '2023-08-15 14:56:40'),
	(1185, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (3).pdf', 'filepond/temp/fb8ww6XLGDphPCdjFNzixFumwKDsCX2SZ86Y31Bi.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:40', NULL, '2023-08-15 14:56:40', '2023-08-15 14:56:40'),
	(1186, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (1).pdf', 'filepond/temp/qoAuA1axnuxNFkel6DFvQ3MGQ6fDurCulYbHuSVP.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:26:42', NULL, '2023-08-15 14:56:42', '2023-08-15 14:56:42'),
	(1187, 'Starter-Dev (5).pdf', 'filepond/temp/PeAkQfJ6mvigWotcMJBWI6hAdq63KuiesPRnBL2B.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:28:24', NULL, '2023-08-15 14:58:24', '2023-08-15 14:58:24'),
	(1188, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2.pdf', 'filepond/temp/g15tYsrK4pcMkuZCVx91IHysMMErXqJ7T26P2153.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:28:31', NULL, '2023-08-15 14:58:31', '2023-08-15 14:58:31'),
	(1189, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (3).pdf', 'filepond/temp/ths7BNZwLP4J2Jf3qBEVMMtkzMLm3Fv4D9ITbka1.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:28:31', NULL, '2023-08-15 14:58:31', '2023-08-15 14:58:31'),
	(1190, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (1).pdf', 'filepond/temp/7jaJu9eWHyymZUoWV6ORSEdL8Qa4ugwuVFH8ypc0.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:29:48', NULL, '2023-08-15 14:59:48', '2023-08-15 14:59:48'),
	(1191, 'SURAT KETERANGAN PENELITIAN An. Novita Jumiasari, dkk 2.pdf', 'filepond/temp/T2idXGlyewSbazWkwXp4SeOdYwWdpXo4uTRHgNen.pdf', 'pdf', 'application/pdf', 242527, 'public', 112277, '2023-08-15 15:29:48', NULL, '2023-08-15 14:59:48', '2023-08-15 14:59:48'),
	(1192, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (3).pdf', 'filepond/temp/Z5yB5bHWjpOJRZ0I7CgSCNjhOQNdsIlDLkx41fKP.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:29:50', NULL, '2023-08-15 14:59:50', '2023-08-15 14:59:50'),
	(1193, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (2).pdf', 'filepond/temp/pzd4fKdH0fP2CWbBYfLKBm0DWOyM2ahHXlpkBltB.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:30:02', NULL, '2023-08-15 15:00:02', '2023-08-15 15:00:02'),
	(1194, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/erjYwiOMx0jsMsyX2c9sSHuhtYJrsl6YIvCquiKU.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:30:02', NULL, '2023-08-15 15:00:02', '2023-08-15 15:00:02'),
	(1195, 'Starter-Dev (4).pdf', 'filepond/temp/J4OUIqhB4mDDE2QKkWmMfTZx7y9qzjR0wDoz9jYz.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:30:04', NULL, '2023-08-15 15:00:04', '2023-08-15 15:00:04'),
	(1196, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk (2).pdf', 'filepond/temp/AqMDBP4kCkybE7pA3NtvctKB4UhKzfLpggPH5hU3.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:30:23', NULL, '2023-08-15 15:00:23', '2023-08-15 15:00:23'),
	(1197, 'SURAT KETERANGAN PENELITIAN an.Novita Jumiasari dkk.pdf', 'filepond/temp/7xdpEVF4kdtiwLtco9MdZJ2jucwIbnjeEr5rXppQ.pdf', 'pdf', 'application/pdf', 241958, 'public', 112277, '2023-08-15 15:30:23', NULL, '2023-08-15 15:00:23', '2023-08-15 15:00:23'),
	(1198, 'Starter-Dev (4).pdf', 'filepond/temp/VdZOD3QBhlOb3LWRXghCtgdhUE4Jauf2zPFQYkF5.pdf', 'pdf', 'application/pdf', 14675, 'public', 112277, '2023-08-15 15:30:25', NULL, '2023-08-15 15:00:25', '2023-08-15 15:00:25'),
	(1199, 'file-corupt.pdf', 'filepond/temp/YP0duQUCCAkU1DV1ZXfZkIU1bUGaWMFMRu3HWZEs.bin', 'pdf', 'application/pdf', 63073, 'public', 112277, '2023-08-16 09:37:42', '2023-08-16 09:11:36', '2023-08-16 09:07:42', '2023-08-16 09:11:36'),
	(1200, '4wdMoB4QQXZC31L.jpg', 'filepond/temp/cERmFMW8pmauki3sj1L4UnxT8tJV1UxeE8ve2DCr.jpg', 'jpg', 'image/jpeg', 99352, 'public', 112277, '2023-08-16 09:47:53', '2023-08-16 09:23:25', '2023-08-16 09:17:53', '2023-08-16 09:23:25'),
	(1201, '4_V2_Inspektorat-Kota-Jambi-removebg-preview.png', 'filepond/temp/DHceqEGm2ggdnOFhV7viYGQgz362dqYoll2BBrJF.png', 'png', 'image/png', 26475, 'public', 112277, '2023-08-16 09:47:58', '2023-08-16 09:23:24', '2023-08-16 09:17:58', '2023-08-16 09:23:24'),
	(1202, 'New Project (1).png', 'filepond/temp/VwLkky9qMD45gXypF14LEBcQw9jxL0lfqWuybyPd.png', 'png', 'image/png', 124556, 'public', 112277, '2023-08-16 09:47:58', '2023-08-16 09:23:24', '2023-08-16 09:17:58', '2023-08-16 09:23:24'),
	(1203, 'file-corupt.pdf', 'filepond/temp/jjGJ8wQ8eulladGuRnwVRsB3A08EIopPg6qDPyOn.bin', 'pdf', 'application/pdf', 63073, 'public', 112277, '2023-08-16 09:48:10', '2023-08-16 09:22:27', '2023-08-16 09:18:10', '2023-08-16 09:22:27'),
	(1204, 'Starter-Dev (6).pdf', 'filepond/temp/6QcklZz0Ej0cSiWPwZKgrKSauw5u23buug01PHfN.pdf', 'pdf', 'application/pdf', 16772, 'public', 112277, '2023-08-16 09:52:31', '2023-08-16 09:22:42', '2023-08-16 09:22:31', '2023-08-16 09:22:42'),
	(1205, 'file-corupt.pdf', 'filepond/temp/49kcZYBysZUNfKp7XRe8Tu7iAiaMEMGyPCdymi31.bin', 'pdf', 'application/pdf', 63073, 'public', 112277, '2023-08-16 09:52:33', '2023-08-16 09:23:24', '2023-08-16 09:22:33', '2023-08-16 09:23:24'),
	(1206, 'file-corupt.pdf', 'filepond/temp/tvMQdJQxLTcWLPOsTMCeiv6bP9atqoPmKlbcmYKQ.bin', 'pdf', 'application/pdf', 63073, 'public', 112277, '2023-08-16 09:52:52', '2023-08-16 09:23:11', '2023-08-16 09:22:52', '2023-08-16 09:23:11'),
	(1207, 'Starter-Dev (6).pdf', 'filepond/temp/0EWFoxD0g7v8gMit8DwVuLjvf6V69G5PLGGgeaEo.pdf', 'pdf', 'application/pdf', 16772, 'public', 112277, '2023-08-16 09:53:00', '2023-08-16 09:23:23', '2023-08-16 09:23:00', '2023-08-16 09:23:23'),
	(1208, 'file_birthday.jpeg', 'filepond/temp/uo6JxiRsHUKeWrGszBSllLBHpFZxijbQ4KK46WcM.webp', 'jpeg', 'image/jpeg', 34718, 'public', 112277, '2023-08-23 12:02:35', '2023-08-23 11:33:35', '2023-08-23 11:32:35', '2023-08-23 11:33:35'),
	(1209, 'WEBSITE-BANNER-2-768x205.jpg', 'filepond/temp/XIMOXI7qlEQieOi1bfGfoGgF1qQL1nAbhAeu5yzU.jpg', 'jpg', 'image/jpeg', 52900, 'public', 112277, '2023-08-23 12:03:02', '2023-08-23 11:33:45', '2023-08-23 11:33:02', '2023-08-23 11:33:45'),
	(1210, 'SK-PELAYANAN-JAM-KERJA-CAPIL-ASLI.pdf', 'filepond/temp/Sl2i266rw9PKlNtVNv5uuL0cQ8xIEkaWxNPYu6GQ.pdf', 'pdf', 'application/pdf', 208090, 'public', 112277, '2023-08-23 12:03:14', '2023-08-23 11:33:45', '2023-08-23 11:33:14', '2023-08-23 11:33:45'),
	(1211, 'WEBSITE-BANNER-2-1200x374.jpg', 'filepond/temp/HE6PnqJwE5YQF5mEN765QQKDRsm3Fx2qdLeRgma8.jpg', 'jpg', 'image/jpeg', 139414, 'public', 112277, '2023-08-23 12:03:41', '2023-08-23 11:33:45', '2023-08-23 11:33:41', '2023-08-23 11:33:45'),
	(1212, 'sharingan.gif', 'filepond/temp/0QR5DMaSXROH2THY9ItcnvRMjCRTIzsdrMVXZzHQ.gif', 'gif', 'image/gif', 9166, 'public', 112277, '2023-08-23 12:07:20', NULL, '2023-08-23 11:37:20', '2023-08-23 11:37:20'),
	(1213, 'file_birthday.jpeg', 'filepond/temp/GuryFclUQ2MSDeQRZE2G2SrJIVIIv5QxQnrkO7mP.webp', 'jpeg', 'image/jpeg', 34718, 'public', 112277, '2023-08-23 12:09:29', '2023-08-23 11:39:40', '2023-08-23 11:39:29', '2023-08-23 11:39:40'),
	(1214, 'gambar_1-800x600.jpg', 'filepond/temp/9fege5cWhKNmIDhsipfb2MAyGjDPtYlqBNAIyKhI.jpg', 'jpg', 'image/jpeg', 37349, 'public', 112277, '2023-08-23 12:09:36', '2023-08-23 11:39:40', '2023-08-23 11:39:36', '2023-08-23 11:39:40'),
	(1215, 'IXJOG-20232308-30247-1692754466 (1).pdf', 'filepond/temp/POfrFCM6MvN2i82iNIpgO6V1ASNHYrVU62t0kxXn.pdf', 'pdf', 'application/pdf', 34781, 'public', 112277, '2023-08-23 12:09:37', '2023-08-23 11:39:40', '2023-08-23 11:39:37', '2023-08-23 11:39:40'),
	(1216, 'file_birthday.jpeg', 'filepond/temp/jZp4lsVzMSiTIMkos5CO0GNwLl290duSmStsrnIE.webp', 'jpeg', 'image/jpeg', 34718, 'public', 112277, '2023-08-23 12:10:29', '2023-08-23 11:40:38', '2023-08-23 11:40:29', '2023-08-23 11:40:38'),
	(1217, 'gambar_1-800x600.jpg', 'filepond/temp/aDuNhM4myauYkX6WbUIriDeLPu8VtsY0tOcuXrM5.jpg', 'jpg', 'image/jpeg', 37349, 'public', 112277, '2023-08-23 12:10:33', '2023-08-23 11:40:38', '2023-08-23 11:40:33', '2023-08-23 11:40:38'),
	(1218, 'IXJOG-20232308-30247-1692754466 (1).pdf', 'filepond/temp/iAETqjYMtKYN266k1SKpP0ClNT2anhr3ZOIcX5bT.pdf', 'pdf', 'application/pdf', 34781, 'public', 112277, '2023-08-23 12:10:35', '2023-08-23 11:40:38', '2023-08-23 11:40:35', '2023-08-23 11:40:38'),
	(1219, 'file_birthday.jpeg', 'filepond/temp/1ZDFjYL5Iyd30N109a2iohwXhL3SApmHdzU7oCH2.webp', 'jpeg', 'image/jpeg', 34718, 'public', 112277, '2023-08-23 12:11:26', NULL, '2023-08-23 11:41:26', '2023-08-23 11:41:26'),
	(1220, '4wdMoB4QQXZC31L (1).jpg', 'filepond/temp/l2eJVTQYvfdhYcSSYlaDngzoQ13Gl9musSoSHGCY.jpg', 'jpg', 'image/jpeg', 99352, 'public', 112277, '2023-08-23 12:11:30', NULL, '2023-08-23 11:41:30', '2023-08-23 11:41:30'),
	(1221, 'IXJOG-20232308-30247-1692754466 (2).pdf', 'filepond/temp/gdR4Q1sFjjLfwpBd87i8pMPhyDESI5iqSR9YeFpi.pdf', 'pdf', 'application/pdf', 34781, 'public', 112277, '2023-08-23 12:11:31', NULL, '2023-08-23 11:41:31', '2023-08-23 11:41:31'),
	(1222, 'avatar2.png', 'filepond/temp/xnYQnVCzHze6zJr2rYYLl1s9oybpxQ5gmVzq9P7U.png', 'png', 'image/png', 26852, 'public', 112277, '2023-12-05 10:30:01', '2023-12-05 10:00:03', '2023-12-05 10:00:01', '2023-12-05 10:00:03'),
	(1223, 'avatar1.jpg', 'filepond/temp/ZvO93GfJbxJyxfd8kWUG2qGFF2dKwzdHoJD4JDys.jpg', 'jpg', 'image/jpeg', 360699, 'public', 112277, '2023-12-05 10:31:03', NULL, '2023-12-05 10:01:03', '2023-12-05 10:01:03'),
	(1224, 'gambar1.jpg', 'filepond/temp/8ZAqmqBVH9m3s7XjYCzONmdZcZB3yyJO1qIp9PQ1.jpg', 'jpg', 'image/jpeg', 370627, 'public', 112277, '2023-12-05 10:31:06', NULL, '2023-12-05 10:01:06', '2023-12-05 10:01:06'),
	(1225, 'file-1.pdf', 'filepond/temp/6Sn0HsCtYV6VoH3R9TQLQgb3fo7EPkBCJHJeD5xL.pdf', 'pdf', 'application/pdf', 41783, 'public', 112277, '2023-12-05 10:31:13', NULL, '2023-12-05 10:01:13', '2023-12-05 10:01:13'),
	(1226, 'avatar1.jpg', 'filepond/temp/aUpyMSTQSaXbToUjgEH04AD0gio68iI3uRL7R9ya.jpg', 'jpg', 'image/jpeg', 360699, 'public', 112277, '2023-12-05 10:31:24', NULL, '2023-12-05 10:01:24', '2023-12-05 10:01:24'),
	(1227, '2023permenpanrb014.pdf', 'filepond/temp/Krm7XcXbaLjhjiPYtNlUgz16cCysmSAmHBa9avP7.pdf', 'pdf', 'application/pdf', 309995, 'public', 112277, '2024-02-11 21:27:27', NULL, '2024-02-11 20:57:27', '2024-02-11 20:57:27'),
	(1228, 'struktur organisasi.jpg', 'filepond/temp/pjwFU3kxesCnFEH2WNGHo1I0dByWmLpMcHDBhhE9.jpg', 'jpg', 'image/jpeg', 115483, 'public', 112277, '2024-04-06 22:58:00', '2024-04-06 22:31:47', '2024-04-06 22:28:00', '2024-04-06 22:31:47'),
	(1229, 'Perpres Nomor 136 Tahun 2018-1.pdf', 'filepond/temp/N3Y5Pm7opKyH76l1kdnhnETTrJcWywHQvTlPG07G.pdf', 'pdf', 'application/pdf', 851027, 'public', 112277, '2024-04-06 22:58:04', '2024-04-06 22:28:25', '2024-04-06 22:28:04', '2024-04-06 22:28:25'),
	(1230, '29. JAMBI (JAMBI) JADWAL IMSAKIYAH 2024.pdf', 'filepond/temp/1GMgnln5vMRyly9M4GHFBeVyt7CaQMjrQQ115NH0.pdf', 'pdf', 'application/pdf', 1202493, 'public', 112277, '2024-04-06 22:59:38', '2024-04-06 22:31:47', '2024-04-06 22:29:38', '2024-04-06 22:31:47'),
	(1231, 'New Project (1).png', 'filepond/temp/TmIvMzYZJH9BU86tLRGQCtk6EkNXGD8UAtAr5cKM.png', 'png', 'image/png', 98504, 'public', 112277, '2024-04-06 23:21:04', NULL, '2024-04-06 22:51:04', '2024-04-06 22:51:04'),
	(1232, '222.jpg', 'filepond/temp/BOIoON8ZFxu3BSyskRw3XmtxmP8DsKNypopaCgXf.jpg', 'jpg', 'image/jpeg', 3409135, 'public', 112277, '2024-04-06 23:22:21', '2024-04-06 22:52:33', '2024-04-06 22:52:21', '2024-04-06 22:52:33'),
	(1233, 'Surat Pernyataan Tidak sedang Menjalani Pendidikan hingga Level S1 Peserta.pdf', 'filepond/temp/WjGFFKJowYUehkgVywfojTQYtp1aEX9jmw7cUZZX.pdf', 'pdf', 'application/pdf', 61217, 'public', 112277, '2024-04-06 23:22:30', '2024-04-06 22:52:33', '2024-04-06 22:52:30', '2024-04-06 22:52:33'),
	(1234, 'Screenshot (1).png', 'filepond/temp/zUTUGDZBu678bZC5qiPAN0itJWGIi6AwCvGfI1CW.png', 'png', 'image/png', 738822, 'public', 112277, '2024-04-08 03:20:24', '2024-04-08 02:50:42', '2024-04-08 02:50:24', '2024-04-08 02:50:42'),
	(1235, 'PP Nomor 14 Tahun 2024.pdf', 'filepond/temp/oa82r01uVJ8du5YBAXl9swE6Dknp3rgfV7sVUpGk.pdf', 'pdf', 'application/pdf', 3751073, 'public', 112277, '2024-04-08 03:20:28', '2024-04-08 02:50:42', '2024-04-08 02:50:28', '2024-04-08 02:50:42'),
	(1236, 'struktur organisasi.jpg', 'filepond/temp/Lo8gmx5nZQVcR6OyLeK4F1PxJFh1o73YqiDnFMrm.jpg', 'jpg', 'image/jpeg', 115483, 'public', 112277, '2024-04-08 03:42:20', '2024-04-08 03:12:40', '2024-04-08 03:12:20', '2024-04-08 03:12:40'),
	(1237, 'PP Nomor 14 Tahun 2024.pdf', 'filepond/temp/JhzhEJ80acRcnmkTCyyGaBcLDxO4RVN00IvKmmO4.pdf', 'pdf', 'application/pdf', 3751073, 'public', 112277, '2024-04-08 03:42:24', '2024-04-08 03:12:40', '2024-04-08 03:12:24', '2024-04-08 03:12:40'),
	(1238, 'Perpres Nomor 136 Tahun 2018.pdf', 'filepond/temp/kvVAtmZ665ESMs8iUGXyuypwdTJP6Qgl1AYX4bDz.pdf', 'pdf', 'application/pdf', 851027, 'public', 112277, '2024-04-08 08:30:51', '2024-04-08 08:00:55', '2024-04-08 08:00:51', '2024-04-08 08:00:55'),
	(1239, 'sPhuTpIZJIXyOil.pdf', 'filepond/temp/rKqGY0voAhaAVVSUJT1Qw1vVpSm6MhX6lZ6jVwu9.pdf', 'pdf', 'application/pdf', 851027, 'public', 112277, '2024-04-08 08:52:26', NULL, '2024-04-08 08:22:26', '2024-04-08 08:22:26'),
	(1240, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/wqgvYstceq1hyfmgwh61gIgIatHJAhINl66t6EhR.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 08:52:28', NULL, '2024-04-08 08:22:28', '2024-04-08 08:22:28'),
	(1241, 'sPhuTpIZJIXyOil.pdf', 'filepond/temp/3pJe93zMac3nu7vO04lhrkrpjd97iAn1JGxc8QB4.pdf', 'pdf', 'application/pdf', 851027, 'public', 112277, '2024-04-08 08:52:31', NULL, '2024-04-08 08:22:31', '2024-04-08 08:22:31'),
	(1242, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/hbesQJcFW0knfuOosm0CPzW8fwUT6MShf6cVACJa.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 08:52:33', NULL, '2024-04-08 08:22:33', '2024-04-08 08:22:33'),
	(1243, 'New Project (1).png', 'filepond/temp/hdkEVpNcd7L28jZwzbDLNK4f31V9Z59sumcOtOHG.png', 'png', 'image/png', 98504, 'public', 112277, '2024-04-08 08:59:38', '2024-04-08 08:29:40', '2024-04-08 08:29:38', '2024-04-08 08:29:40'),
	(1244, 'Screenshot (1).png', 'filepond/temp/BkdWDHiRhvOvxw6pI3265CJCoetDYBW7YNEAcbRM.png', 'png', 'image/png', 738822, 'public', 112277, '2024-04-08 09:07:31', '2024-04-08 08:37:33', '2024-04-08 08:37:31', '2024-04-08 08:37:33'),
	(1245, 'Screenshot (1).png', 'filepond/temp/yaLZ0ra49Pi4pG9BSjJbeVXmLvEgCkn7rajgJqzV.png', 'png', 'image/png', 738822, 'public', 112277, '2024-04-08 09:09:59', '2024-04-08 08:40:07', '2024-04-08 08:39:59', '2024-04-08 08:40:07'),
	(1246, 'Bukti Pendaftaran_LIAN MAFUTRA_Malware Analysis.pdf', 'filepond/temp/O4DaK4furjpsAXnGMgGQtiliRDlmdy7t0tYDOuNi.pdf', 'pdf', 'application/pdf', 223492, 'public', 112277, '2024-04-08 09:10:05', '2024-04-08 08:40:07', '2024-04-08 08:40:05', '2024-04-08 08:40:07'),
	(1247, 'https __jdih.kemdikbud.go.id_sjdih_siperpu_dokumen_salinan_salinan_20231002_103721_SE MENTERI NOMOR 5 TAHUN 2023.pdf', 'filepond/temp/nKFmNd3fs5ayTZGbGKlNCMrXrwfnQr6hwFvGSUuu.pdf', 'pdf', 'application/pdf', 579407, 'public', 112277, '2024-04-08 09:10:33', '2024-04-08 08:40:35', '2024-04-08 08:40:33', '2024-04-08 08:40:35'),
	(1248, 'https __jdih.kemdikbud.go.id_sjdih_siperpu_dokumen_salinan_salinan_20231002_103721_SE MENTERI NOMOR 5 TAHUN 2023 kjkjkjkjkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjbhbhbhbhbhbhbhbhbhbhbuyijo.pdf', 'filepond/temp/nNLXJFKE9GFrLANx95pVncjcGuVqsiFwlPCGZg7s.pdf', 'pdf', 'application/pdf', 579407, 'public', 112277, '2024-04-08 11:15:46', '2024-04-08 10:45:50', '2024-04-08 10:45:46', '2024-04-08 10:45:50'),
	(1249, 'https __jdih.kemdikbud.go.id_sjdih_siperpu_dokumen_salinan_salinan_20231002_103721_SE MENTERI NOMOR 5 TAHUN 2023 kjkjkjkjkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjbhbhbhbhbhbhbhbhbhbhbuyijo.pdf', 'filepond/temp/CFqoSD8bT9T6gjBYjNuEChF7tZS0s4VQcD799E13.pdf', 'pdf', 'application/pdf', 579407, 'public', 112277, '2024-04-08 11:21:54', '2024-04-08 10:51:56', '2024-04-08 10:51:54', '2024-04-08 10:51:56'),
	(1250, 'widget.png', 'filepond/temp/6NfCJOk6aPDAjrFtV93zkTbxAOWfKfvFbeCp37ig.png', 'png', 'image/png', 384513, 'public', 112277, '2024-04-08 11:48:27', '2024-04-08 11:18:41', '2024-04-08 11:18:27', '2024-04-08 11:18:41'),
	(1251, 'hgA1RqXbkowwTwI (2).pdf', 'filepond/temp/9cS5JhrEkghs5yb8ZEEUw8SwCWRA98dC7YI7jht6.pdf', 'pdf', 'application/pdf', 3751073, 'public', 112277, '2024-04-08 11:50:54', '2024-04-08 11:20:57', '2024-04-08 11:20:54', '2024-04-08 11:20:57'),
	(1252, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/NGVMZOvzswIkszGSr2AniXB5T9nfTvhnPvLm64w7.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 11:51:10', NULL, '2024-04-08 11:21:10', '2024-04-08 11:21:10'),
	(1253, 'hgA1RqXbkowwTwI (1).pdf', 'filepond/temp/GvVpTPZAsjARhCea3y3a9NiP24iKf7mkJKKScZCC.pdf', 'pdf', 'application/pdf', 3751073, 'public', 112277, '2024-04-08 11:53:24', NULL, '2024-04-08 11:23:24', '2024-04-08 11:23:24'),
	(1254, 'hgA1RqXbkowwTwI (1).pdf', 'filepond/temp/NXP1kQkstVh8ELbDEP8vKGDT42nlV9U1pIO38kpU.pdf', 'pdf', 'application/pdf', 3751073, 'public', 112277, '2024-04-08 11:55:36', NULL, '2024-04-08 11:25:36', '2024-04-08 11:25:36'),
	(1255, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/OpsQGIh72Fb6DDsdo5eZnBkrs1864VN6Ms12nCy8.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 11:55:46', NULL, '2024-04-08 11:25:46', '2024-04-08 11:25:46'),
	(1256, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/HuxQf93xmJSfQMZJ5KmUQp9H2e2jbtSRskfRsQlS.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 11:56:14', NULL, '2024-04-08 11:26:14', '2024-04-08 11:26:14'),
	(1257, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/dw3V1CmJ7yEjC8GguBXBQ4vXtU2BSwnkEnyXYZcq.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:00:38', '2024-04-08 11:30:42', '2024-04-08 11:30:38', '2024-04-08 11:30:42'),
	(1258, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/Y0sxnDkNRLaGfvkFv34J4pw8piEywoELijEOQM07.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:01:14', NULL, '2024-04-08 11:31:14', '2024-04-08 11:31:14'),
	(1259, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/Q4Jqiu1rGcDCNh6OjjXdo4Z8SFLsaemNwqEJ3WxV.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:04:03', NULL, '2024-04-08 11:34:03', '2024-04-08 11:34:03'),
	(1260, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/BgqOeZ2Tbe8DtwVwS10nzJXMvSY06sjdpwKFbkgw.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:04:47', NULL, '2024-04-08 11:34:47', '2024-04-08 11:34:47'),
	(1261, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/3V0QsYVrZJp7S9gCNLigWctSN96bAcN1jrsOwi3E.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:05:08', NULL, '2024-04-08 11:35:08', '2024-04-08 11:35:08'),
	(1262, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/7u8zkP7zoYYwCFQUchdqXJOGHpxGhCaWPy9tI588.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:06:58', NULL, '2024-04-08 11:36:58', '2024-04-08 11:36:58'),
	(1263, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/pOIRZs0cglkdF5Z5NhF2RhZeWa8pidyPrxNlaEal.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:09:30', '2024-04-08 11:39:39', '2024-04-08 11:39:30', '2024-04-08 11:39:39'),
	(1264, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/fsr4Ga06P3p2cWsmUHKDvSrCBiKGublDxEW26lfn.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:09:45', '2024-04-08 11:39:50', '2024-04-08 11:39:45', '2024-04-08 11:39:50'),
	(1265, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/UbqHbXBVkwbNRvzM2zyFjJKvrdYK5OKJZUHy1Zkd.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:09:56', NULL, '2024-04-08 11:39:56', '2024-04-08 11:39:56'),
	(1266, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/hcA23iWmuIK5NJvX3HYPyvVQOrMcMjqIO5SQWwrA.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:10:45', NULL, '2024-04-08 11:40:45', '2024-04-08 11:40:45'),
	(1267, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/UqsdomoJPOrCKYBYZw8SVvmacHrFDaGYlTBoMaGm.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:11:04', NULL, '2024-04-08 11:41:04', '2024-04-08 11:41:04'),
	(1268, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/cJyoOliZ6rHY1qUT5ZmNettD76iVAKg72tAd4tv9.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:12:01', NULL, '2024-04-08 11:42:01', '2024-04-08 11:42:01'),
	(1269, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/XVJanupdrnN6D2a9ZLtPcBUc7BCi4F5R8jIOCfPt.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:12:27', '2024-04-08 11:42:27', '2024-04-08 11:42:27', '2024-04-08 11:42:27'),
	(1270, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/XFPd64doZoqeqkvENtGaFh16qQMF9qbqJ8yolJsR.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:12:34', '2024-04-08 11:42:40', '2024-04-08 11:42:34', '2024-04-08 11:42:40'),
	(1271, 'https __jdih.kemdikbud.go.id_sjdih_siperpu_dokumen_salinan_salinan_20231002_103721_SE MENTERI NOMOR 5 TAHUN 2023 kjkjkjkjkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjbhbhbhbhbhbhbhbhbhbhbuyijo.pdf', 'filepond/temp/tmQhexq9PUiic76wo3idi4gRJVpXclqrmx0sNmzz.pdf', 'pdf', 'application/pdf', 579407, 'public', 112277, '2024-04-08 12:12:51', NULL, '2024-04-08 11:42:51', '2024-04-08 11:42:51'),
	(1272, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/DSRJqOU47Ig9C9qM1vdnwlGMpIYoqGpwxNXqzsLK.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:13:00', '2024-04-08 11:43:01', '2024-04-08 11:43:00', '2024-04-08 11:43:01'),
	(1273, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/6DlNALsoqJGhRZ0JncvMgkIIxSfHClKnxpsprex9.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:13:06', NULL, '2024-04-08 11:43:06', '2024-04-08 11:43:06'),
	(1274, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/cqsk2lhmMIm9B0DHoixHO2chKifPsd1kScA6XkpM.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:14:00', NULL, '2024-04-08 11:44:00', '2024-04-08 11:44:00'),
	(1275, 'RHzvArQ6NLZiZWk (1).jpg', 'filepond/temp/uug29QyK98rnhZkUP4nfEIl8GHqaxO7ONf6aNtfU.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:14:29', '2024-04-08 11:44:34', '2024-04-08 11:44:29', '2024-04-08 11:44:34'),
	(1276, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/gwK0QHBtuFPXHbiQbdOS71ppQQNZ0SKIKzfMTDHC.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:14:40', NULL, '2024-04-08 11:44:40', '2024-04-08 11:44:40'),
	(1277, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/wUzCK6vDTbm1wWEgYGh6jxdI9E52QUlplBK7UMAl.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:15:08', '2024-04-08 11:45:14', '2024-04-08 11:45:08', '2024-04-08 11:45:14'),
	(1278, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/AmrAqGNgFSCUk2kWDWxudTi8NhCY88mih4lzDnne.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:15:29', NULL, '2024-04-08 11:45:29', '2024-04-08 11:45:29'),
	(1279, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/oJDopNFmyKTdaRBFi9xTISCN8ia0BgKsRPAnahwj.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:17:06', NULL, '2024-04-08 11:47:06', '2024-04-08 11:47:06'),
	(1280, 'RHzvArQ6NLZiZWk (3).jpg', 'filepond/temp/wemIU1tcXWEuaq6a9o728uICMLNSTHXkMhwmY6oW.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:17:57', NULL, '2024-04-08 11:47:57', '2024-04-08 11:47:57'),
	(1281, 'RHzvArQ6NLZiZWk.jpg', 'filepond/temp/3QW7QDwJ0O4aKmrhlQs608hXdVwT0C6jUyUvIpS5.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:19:48', '2024-04-08 11:50:00', '2024-04-08 11:49:48', '2024-04-08 11:50:00'),
	(1282, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/8mRPpJytaC1q1j25HiAfqZStzIgNDbCbUgtixm6r.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:20:06', NULL, '2024-04-08 11:50:06', '2024-04-08 11:50:06'),
	(1283, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/RLahSpBOlICSkAJSBOwHxR9IXdHPECMJIbtqA9wC.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:21:24', NULL, '2024-04-08 11:51:24', '2024-04-08 11:51:24'),
	(1284, 'RHzvArQ6NLZiZWk (2).jpg', 'filepond/temp/p97pZXM1WaNvtsC5mgx3rZoVpt9zdZ64fLm1cg9r.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:22:02', NULL, '2024-04-08 11:52:02', '2024-04-08 11:52:02'),
	(1285, 'RHzvArQ6NLZiZWk (4).jpg', 'filepond/temp/xAVQVFaSoUwB5y264adfybYk0qm0zbw12V1DlXmT.jpg', 'jpg', 'image/jpeg', 40937, 'public', 112277, '2024-04-08 12:22:24', NULL, '2024-04-08 11:52:24', '2024-04-08 11:52:24'),
	(1286, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'filepond/temp/wPvzJJqY86Dm45WWcflKdA3lrdsp6NYbV47xxV84.jpg', 'jpg', 'image/jpeg', 535595, 'public', 112277, '2024-04-08 12:25:03', NULL, '2024-04-08 11:55:03', '2024-04-08 11:55:03'),
	(1287, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'filepond/temp/Hdd7kIDySnQOThpUuRBo8tfxfSLQTDrqclZj3lmV.jpg', 'jpg', 'image/jpeg', 535595, 'public', 112277, '2024-04-08 12:25:23', NULL, '2024-04-08 11:55:23', '2024-04-08 11:55:23'),
	(1288, 'IMG_4106.png', 'filepond/temp/ctAjd24Gala8i0XLoGUG7qd07ojWvblTtMK2Y58H.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 12:25:52', '2024-04-08 11:56:04', '2024-04-08 11:55:52', '2024-04-08 11:56:04'),
	(1289, 'IMG_4106.png', 'filepond/temp/cleMABgS7QelZvnW9QR9n3VrKhysau3VYz2cme6d.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 12:27:17', NULL, '2024-04-08 11:57:17', '2024-04-08 11:57:17'),
	(1290, 'IMG_4106.png', 'filepond/temp/UJ97SQcdVMhaYKQaU4tip9Ee6DCldSE8XWig93AH.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 12:28:05', '2024-04-08 11:58:20', '2024-04-08 11:58:05', '2024-04-08 11:58:20'),
	(1291, 'IMG_4106.png', 'filepond/temp/WLiCjcC0pNcinIyZBJnCYD2WLR7wx57IMxcXInR6.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 12:28:29', NULL, '2024-04-08 11:58:29', '2024-04-08 11:58:29'),
	(1292, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'filepond/temp/ugPTmmToOEwXpZb5J0H0ljODvNGkiY3J4M4B04eC.jpg', 'jpg', 'image/jpeg', 535595, 'public', 112277, '2024-04-08 12:30:28', NULL, '2024-04-08 12:00:28', '2024-04-08 12:00:28'),
	(1293, 'IMG_4106.png', 'filepond/temp/MQ2MQYpvRnNMPPzdIIBeESSDuw6yjnR1l7BHFFrm.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 12:33:33', NULL, '2024-04-08 12:03:33', '2024-04-08 12:03:33'),
	(1294, 'IMG_4106.png', 'filepond/temp/l9Lu1gE2q5Wwjud4cjEuPuDrVPc31oaltjVl8WVM.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 15:34:17', '2024-04-08 15:04:34', '2024-04-08 15:04:17', '2024-04-08 15:04:34'),
	(1295, 'UU 19 Tahun 2016.pdf', 'filepond/temp/BsnrUWHOXJ0oSlu6sMtJND9fEukple6pQUIamzAG.pdf', 'pdf', 'application/pdf', 709687, 'public', 112277, '2024-04-08 15:34:18', '2024-04-08 15:04:34', '2024-04-08 15:04:18', '2024-04-08 15:04:34'),
	(1296, 'Pemanggilan Orientasi PPPK Gelombang 4 Tahun 2024 (3).pdf', 'filepond/temp/T5aP2YV1DKreEMc2ewXcrpwBvKFOsn0XebzRFNC6.pdf', 'pdf', 'application/pdf', 337462, 'public', 112277, '2024-04-08 15:35:00', '2024-04-08 15:05:02', '2024-04-08 15:05:00', '2024-04-08 15:05:02'),
	(1297, 'UU 19 Tahun 2016.pdf', 'filepond/temp/IoUAVXkwVF60u6YKvhGULGlIwkOB53bISKQG3647.pdf', 'pdf', 'application/pdf', 709687, 'public', 112277, '2024-04-08 15:37:52', '2024-04-08 15:07:54', '2024-04-08 15:07:52', '2024-04-08 15:07:54'),
	(1298, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'filepond/temp/nBncigMzh5dzwqUwzWj44VrgHpni9s1YdYqrb3h5.jpg', 'jpg', 'image/jpeg', 535595, 'public', 112277, '2024-04-08 15:38:17', '2024-04-08 15:08:19', '2024-04-08 15:08:17', '2024-04-08 15:08:19'),
	(1299, 'Salinan UU Nomor 27 Tahun 2022.pdf', 'filepond/temp/CfxZG1Kip5O0QXzTuOKNFQ4GCbJcsLCVAbinZMT7.pdf', 'pdf', 'application/pdf', 2977828, 'public', 112277, '2024-04-08 15:38:38', '2024-04-08 15:08:40', '2024-04-08 15:08:38', '2024-04-08 15:08:40'),
	(1300, 'IMG_4106.png', 'filepond/temp/pzmNXxpIoFBKynZN69aZS2i3Dp7dYZZhW7yJb99a.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 15:38:56', '2024-04-08 15:09:05', '2024-04-08 15:08:56', '2024-04-08 15:09:05'),
	(1301, 'downloadfile(2).pdf', 'filepond/temp/3QYOZX3fTOevWYK7uLkXRdNeYnJS2W0vNI98VLyd.pdf', 'pdf', 'application/pdf', 606866, 'public', 112277, '2024-04-08 15:38:57', '2024-04-08 15:09:05', '2024-04-08 15:08:57', '2024-04-08 15:09:05'),
	(1302, 'IMG_4106.png', 'filepond/temp/4w6fxlMTfJ4RrAq4nQilCPTnVTw9XU7L1FEZ2vwb.jpg', 'png', 'image/png', 127980, 'public', 112277, '2024-04-08 15:40:22', '2024-04-08 15:10:26', '2024-04-08 15:10:22', '2024-04-08 15:10:26'),
	(1303, 'Pemanggilan Orientasi PPPK Gelombang 4 Tahun 2024 (3).pdf', 'filepond/temp/pKnl83hEgsrVJp8RLk2ntnM6HNjOKCOy7QGJ3hFA.pdf', 'pdf', 'application/pdf', 337462, 'public', 112277, '2024-04-08 15:40:23', '2024-04-08 15:10:26', '2024-04-08 15:10:23', '2024-04-08 15:10:26'),
	(1304, 'Screenshot_2023-08-16-08-59-49-77.jpg', 'filepond/temp/Uzaj6Y5JQMPM29xpppLYobq1rk7Jug5EGIaR0KND.jpg', 'jpg', 'image/jpeg', 535595, 'public', 112277, '2024-04-08 19:54:50', '2024-04-08 19:25:27', '2024-04-08 19:24:50', '2024-04-08 19:25:27'),
	(1305, 'Untitled-1-01.jpg', 'filepond/temp/eu9FXTBL9AENDwAoy6MweyvB9kRgpn9UypBF9oYC.jpg', 'jpg', 'image/jpeg', 503239, 'public', 112277, '2024-04-08 22:46:26', '2024-04-08 22:16:29', '2024-04-08 22:16:26', '2024-04-08 22:16:29'),
	(1306, 'alat_kesehatan_banner.jpg', 'filepond/temp/El8m69d4xD6bKFtZIUwThnkSQhKutusmL411UrbZ.jpg', 'jpg', 'image/jpeg', 225069, 'public', 112277, '2024-04-08 22:49:25', '2024-04-08 22:19:28', '2024-04-08 22:19:25', '2024-04-08 22:19:28'),
	(1307, 'gambar_1.jpg', 'filepond/temp/q2DcipSs3gzMC22nGSU5M3DrxPPCVIpOYzc0NtyE.jpg', 'jpg', 'image/jpeg', 102117, 'public', 112277, '2024-04-08 23:29:52', '2024-04-08 22:59:54', '2024-04-08 22:59:52', '2024-04-08 22:59:54'),
	(1308, 'gambar_2.jpg', 'filepond/temp/mEsfFu9iNEO4n8bED7S6eb2GkD14t3bOvDvMpgL5.jpg', 'jpg', 'image/jpeg', 35581, 'public', 112277, '2024-04-08 23:46:41', '2024-04-08 23:18:17', '2024-04-08 23:16:41', '2024-04-08 23:18:17'),
	(1309, 'gambar_2.jpg', 'filepond/temp/U4S3pA2IZPEWRL2nMlHtJGne1CWAn6FQ8OAQaVXE.jpg', 'jpg', 'image/jpeg', 35581, 'public', 112277, '2024-04-08 23:49:01', '2024-04-08 23:19:03', '2024-04-08 23:19:01', '2024-04-08 23:19:03'),
	(1310, 'Surat Tag TTE.pdf', 'filepond/temp/bQytKeSoBgEa5V2uqOjD3tm2CwYEY7CAVhqBTNMh.pdf', 'pdf', 'application/pdf', 182365, 'public', 112277, '2024-05-14 21:07:54', NULL, '2024-05-14 20:37:54', '2024-05-14 20:37:54'),
	(1311, 'Screenshot (1).png', 'filepond/temp/2SaJGsRiCnCSDr9SCuka2YRo3zR5W00MoAEy5jBY.png', 'png', 'image/png', 738822, 'public', 112277, '2024-05-14 21:08:09', NULL, '2024-05-14 20:38:09', '2024-05-14 20:38:09'),
	(1312, 'Screenshot (1).png', 'filepond/temp/bYKHsWYJukoEh0oOGYX2ZIHPHUXNl2vAzUavSik2.png', 'png', 'image/png', 738822, 'public', 112277, '2024-05-14 21:11:16', '2024-05-14 20:41:24', '2024-05-14 20:41:16', '2024-05-14 20:41:24'),
	(1313, 'Screenshot (1).png', 'filepond/temp/M7wSYOk7gq25JPqeahXWp2dRB5uO37gycuDxCIoj.png', 'png', 'image/png', 738822, 'public', 112277, '2024-05-14 21:25:58', NULL, '2024-05-14 20:55:58', '2024-05-14 20:55:58'),
	(1314, 'Screenshot (6).png', 'filepond/temp/DJYme4zdXmxCAl7rjF9H0oqvgIYfUw41BcgoVerk.png', 'png', 'image/png', 782756, 'public', 112277, '2024-05-15 09:47:45', '2024-05-15 09:17:50', '2024-05-15 09:17:45', '2024-05-15 09:17:50'),
	(1315, 'Screenshot (7).png', 'filepond/temp/CWP3LuypxwxRzpJyEtuqsmRnQe1yCWORiaotJhq3.png', 'png', 'image/png', 519980, 'public', 112277, '2024-05-15 09:47:59', '2024-05-15 09:20:27', '2024-05-15 09:17:59', '2024-05-15 09:20:27'),
	(1316, 'Screenshot (7).png', 'filepond/temp/7C9Bs3vvu45jALsdl8PgBFjOEryOEAHwpfFY8Xyq.png', 'png', 'image/png', 519980, 'public', 112277, '2024-05-15 09:48:06', '2024-05-15 09:20:23', '2024-05-15 09:18:06', '2024-05-15 09:20:23'),
	(1317, 'Screenshot (2).png', 'filepond/temp/ta2oa8NYxoFiVeTP8c4Gfz5lel96rdNiVa4HBInR.png', 'png', 'image/png', 580402, 'public', 112277, '2024-05-15 09:48:17', '2024-05-15 09:20:23', '2024-05-15 09:18:17', '2024-05-15 09:20:23'),
	(1318, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/QhAwGGIG9WRFiw4fZvDGDKPWHMrcl9tvT9ieAqXT.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 09:48:27', '2024-05-15 09:20:23', '2024-05-15 09:18:27', '2024-05-15 09:20:23'),
	(1319, 'Screenshot (3).png', 'filepond/temp/OZJmIfCLS1pmNmKojTUExCJhKgtnlp5jGRBCyQ6c.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 10:18:37', NULL, '2024-05-15 09:48:37', '2024-05-15 09:48:37'),
	(1320, 'Screenshot (3).png', 'filepond/temp/C7k04DWITH4Uts2AmycWKLnGivyj0kkXYs2CmBQ7.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 10:19:46', NULL, '2024-05-15 09:49:46', '2024-05-15 09:49:46'),
	(1321, 'Screenshot (5).png', 'filepond/temp/3lrYvA2dqCzPsqLa6LaRwMs0oV4hocstE70SwiuR.png', 'png', 'image/png', 573481, 'public', 112277, '2024-05-15 10:23:22', NULL, '2024-05-15 09:53:22', '2024-05-15 09:53:22'),
	(1322, 'Screenshot (3).png', 'filepond/temp/mm45LGlRK9G45Ximi2dwT0IBrRSM5uRdlOOEoPYm.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 12:28:32', NULL, '2024-05-15 11:58:32', '2024-05-15 11:58:32'),
	(1323, 'Screenshot (3).png', 'filepond/temp/mJKQNcViRdyzF73NMMVicGSkVjdzZJ9vIMJov4Oy.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 12:33:03', NULL, '2024-05-15 12:03:03', '2024-05-15 12:03:03'),
	(1324, 'Screenshot (1).png', 'filepond/temp/rX9DORCkHWPwPn7LxzycWEMCIMvr4nr3m88KVK8c.png', 'png', 'image/png', 738822, 'public', 112277, '2024-05-15 12:57:57', NULL, '2024-05-15 12:27:57', '2024-05-15 12:27:57'),
	(1325, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/25AseZSgAV5k1tyUVWVsGAwovahSSBTt4MeAolnj.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 12:58:11', NULL, '2024-05-15 12:28:11', '2024-05-15 12:28:11'),
	(1326, 'Screenshot (3) (1).png', 'filepond/temp/h3DayC3mgm3Ol5oDkrTzbEvXxVrLxvIEpNQeQnae.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 13:02:17', NULL, '2024-05-15 12:32:17', '2024-05-15 12:32:17'),
	(1327, 'juPApL0VUdjqfGD-2 (4).png', 'filepond/temp/U37Ck0BLxhukpR0u2Z4fY5fZbOo2Y3mcJEtaY4GS.png', 'png', 'image/png', 189769, 'public', 112277, '2024-05-15 13:03:03', NULL, '2024-05-15 12:33:03', '2024-05-15 12:33:03'),
	(1328, 'juPApL0VUdjqfGD-1 (5).png', 'filepond/temp/aux0MVPbR4V6DMFLO3sD0ICyxG6EBh6J3phGhKfg.png', 'png', 'image/png', 194243, 'public', 112277, '2024-05-15 13:03:18', NULL, '2024-05-15 12:33:18', '2024-05-15 12:33:18'),
	(1329, 'Screenshot (3) (1).png', 'filepond/temp/0xqjCVzOU9gXhwNvseCpuC4c5mz9VTM9IgbmhFSI.png', 'png', 'image/png', 937659, 'public', 112277, '2024-05-15 13:03:49', NULL, '2024-05-15 12:33:49', '2024-05-15 12:33:49'),
	(1330, 'sample_ttd.png', 'filepond/temp/G6IdWEtQUFDNlokqAs3j6LMaUqOwJaJaQBd6qzwa.png', 'png', 'image/png', 927577, 'public', 112277, '2024-05-15 13:04:33', '2024-05-15 12:34:49', '2024-05-15 12:34:33', '2024-05-15 12:34:49'),
	(1331, 'Surat Pernyataan Tidak sedang Menjalani Pendidikan hingga Level S1 Peserta.pdf', 'filepond/temp/AcNt7bRgHriXSCKuaPG0QW1wnx2RUc2liaKvL2SJ.pdf', 'pdf', 'application/pdf', 61217, 'public', 112277, '2024-05-15 13:04:47', '2024-05-15 12:34:49', '2024-05-15 12:34:47', '2024-05-15 12:34:49'),
	(1332, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/80G8kbpKpBYbERU2498gRVdiHQteqeAIizilJkTL.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 13:05:39', '2024-05-15 12:35:41', '2024-05-15 12:35:39', '2024-05-15 12:35:41'),
	(1333, 'banner-depan.jpg', 'filepond/temp/RKFG4ODNhrBr6E4AsCIrmwTZQ7lvxrMvZJIjDLnP.jpg', 'jpg', 'image/jpeg', 256321, 'public', 112277, '2024-05-15 13:08:26', '2024-05-15 12:38:29', '2024-05-15 12:38:26', '2024-05-15 12:38:29'),
	(1334, 'Screenshot_9.png', 'filepond/temp/7zNHsWecU0UhJf5t83AZNOnHBaA8fMzyfb4rh5We.png', 'png', 'image/png', 257499, 'public', 112277, '2024-05-15 13:09:25', '2024-05-15 12:39:29', '2024-05-15 12:39:25', '2024-05-15 12:39:29'),
	(1335, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/4H73sfI8CyGd7vjzryodbgG8SKTMHLc0EWW4ZQnm.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 13:09:50', '2024-05-15 12:39:54', '2024-05-15 12:39:50', '2024-05-15 12:39:54'),
	(1336, 'Surat Pernyataan Tidak sedang Menjalani Pendidikan hingga Level S1 Peserta.pdf', 'filepond/temp/1hAeXenNNXPZuWOkD29az74AaZGtoVNPx6oLE0R4.pdf', 'pdf', 'application/pdf', 61217, 'public', 112277, '2024-05-15 13:11:56', '2024-05-15 12:41:58', '2024-05-15 12:41:56', '2024-05-15 12:41:58'),
	(1337, '5JO2lnsEREiSqNd-1.pdf', 'filepond/temp/bnmOYjAeLGONdolnuFnLO0Zzpbdwo3IsQ4ky2oHr', 'pdf', 'text/xml', 0, 'public', 112277, '2024-05-15 13:54:47', NULL, '2024-05-15 13:24:47', '2024-05-15 13:24:47'),
	(1338, '5JO2lnsEREiSqNd-1.pdf', 'filepond/temp/HSGsJjjNTGEQJObWZnCjxR9PpmWH8BeevBd8FQX3', 'pdf', 'text/xml', 0, 'public', 112277, '2024-05-15 13:54:54', NULL, '2024-05-15 13:24:54', '2024-05-15 13:24:54'),
	(1339, '5JO2lnsEREiSqNd-1.pdf', 'filepond/temp/jkIyQYFefdC4saiIWIQ4a37ZwNFz4HEMSZSuJhho', 'pdf', 'text/xml', 0, 'public', 112277, '2024-05-15 13:58:11', '2024-05-15 13:28:15', '2024-05-15 13:28:11', '2024-05-15 13:28:15'),
	(1340, '5JO2lnsEREiSqNd-1.pdf', 'filepond/temp/qubHhHodjHm38upI4j4lqEFBR4SUgCvWT8L105d1', 'pdf', 'text/xml', 0, 'public', 112277, '2024-05-15 13:59:04', NULL, '2024-05-15 13:29:04', '2024-05-15 13:29:04'),
	(1341, '5JO2lnsEREiSqNd-1.pdf', 'filepond/temp/BWhNHp5JQq1cKh9ioIGcb9AOmzPCxHG79ZtIjjRZ', 'pdf', 'text/xml', 0, 'public', 112277, '2024-05-15 13:59:10', NULL, '2024-05-15 13:29:10', '2024-05-15 13:29:10'),
	(1342, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/Pe1QmAdvMIgvHHRaCdN4d4gu9IYa0YrsdP0AtDiE.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 14:13:04', '2024-05-15 13:43:27', '2024-05-15 13:43:04', '2024-05-15 13:43:27'),
	(1343, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/e0ScgwfxUjGlkWsb3ROXTUTX6xPycDXd6nVYyb6G.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 14:13:06', '2024-05-15 13:43:27', '2024-05-15 13:43:06', '2024-05-15 13:43:27'),
	(1344, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/SbzGEUVaOJYhykKKKGVRCamtvEQGsj5LCsPXeNao.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 14:13:25', '2024-05-15 13:43:27', '2024-05-15 13:43:25', '2024-05-15 13:43:27'),
	(1345, 'Surat Pernyataan Pekerjaan Peserta Professional Academy .pdf', 'filepond/temp/BA2TIpffNkgY2mzcBJFerhEFU9vQ5jOXw9lWP0OZ.pdf', 'pdf', 'application/pdf', 76217, 'public', 112277, '2024-05-15 14:25:23', '2024-05-15 13:55:25', '2024-05-15 13:55:23', '2024-05-15 13:55:25'),
	(1346, '3237447.png', 'filepond/temp/bEKTbCvzVRSPr2CGC6bkXMcVQ1gfZuD0rwLeFONL.png', 'png', 'image/png', 33278, 'public', 112309, '2024-05-24 20:30:48', '2024-05-24 20:00:51', '2024-05-24 20:00:48', '2024-05-24 20:00:51'),
	(1347, 'user-account-icon-1704x2048-og4pdftt.png', 'filepond/temp/p2DLZrlrIt0araSLqFNA6YHxyDmijazuRcLHYb3R.png', 'png', 'image/png', 517785, 'public', 112310, '2024-05-24 20:31:44', '2024-05-24 20:01:46', '2024-05-24 20:01:44', '2024-05-24 20:01:46');
/*!40000 ALTER TABLE `fileponds` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.gerobak
CREATE TABLE IF NOT EXISTS `gerobak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barista_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=112328 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.gerobak: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `gerobak` DISABLE KEYS */;
INSERT INTO `gerobak` (`id`, `barista_id`, `nama`, `created_at`, `updated_at`) VALUES
	(1, 5, 'GRB-1', '2024-09-07 07:42:43', '2024-09-07 17:32:16'),
	(2, 2, 'GRB-2', '2024-09-07 07:42:43', '2024-09-08 17:00:13'),
	(3, 3, 'GRB-3', '2024-09-07 07:42:43', '2024-09-07 07:42:43'),
	(5, 5, 'GRB-5', '2024-09-07 07:42:43', '2024-09-07 07:42:43'),
	(112327, 2, 'GRB-6', '2024-09-07 16:49:07', '2024-09-07 16:49:07');
/*!40000 ALTER TABLE `gerobak` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.gerobak_stok
CREATE TABLE IF NOT EXISTS `gerobak_stok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gerobak_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gerobak_id_produk_id` (`gerobak_id`,`produk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112357 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.gerobak_stok: ~13 rows (lebih kurang)
/*!40000 ALTER TABLE `gerobak_stok` DISABLE KEYS */;
INSERT INTO `gerobak_stok` (`id`, `gerobak_id`, `produk_id`, `jumlah_stok`, `created_at`, `updated_at`) VALUES
	(112342, 1, 1, 10, '2024-09-08 14:49:30', '2024-09-08 14:49:32'),
	(112343, 1, 2, 20, '2024-09-08 14:49:34', '2024-09-08 14:49:36'),
	(112344, 1, 3, 22, '2024-09-08 14:49:38', '2024-09-08 14:49:39'),
	(112345, 1, 4, 1, '2024-09-08 14:49:41', '2024-09-08 14:49:44'),
	(112346, 1, 5, 5, '2024-09-08 14:49:45', '2024-09-08 14:49:47'),
	(112347, 2, 1, 10, '2024-09-08 14:50:11', '2024-09-08 14:50:13'),
	(112348, 2, 2, 25, '2024-09-08 14:50:15', '2024-09-08 14:50:17'),
	(112349, 2, 3, 22, '2024-09-08 14:50:18', '2024-09-08 14:50:20'),
	(112350, 2, 4, 12, '2024-09-08 14:50:22', '2024-09-08 14:50:24'),
	(112351, 2, 5, 10, '2024-09-08 14:50:25', '2024-09-08 14:50:28'),
	(112352, 3, 1, 1, '2024-09-08 14:54:24', '2024-09-08 14:54:26'),
	(112353, 3, 2, 2, '2024-09-08 14:54:28', '2024-09-08 14:54:30'),
	(112354, 3, 3, 2, '2024-09-08 14:54:31', '2024-09-08 14:54:33'),
	(112355, 3, 4, 2, '2024-09-08 14:54:35', '2024-09-08 14:54:37'),
	(112356, 3, 5, 3, '2024-09-08 14:54:38', '2024-09-08 14:54:42');
/*!40000 ALTER TABLE `gerobak_stok` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.konsumen
CREATE TABLE IF NOT EXISTS `konsumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tgl_registrasi` date NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112330 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.konsumen: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `konsumen` DISABLE KEYS */;
INSERT INTO `konsumen` (`id`, `users_id`, `tgl_lahir`, `tgl_registrasi`, `alamat`, `email`, `created_at`, `updated_at`) VALUES
	(112329, 7, '2024-09-08', '2024-09-08', 'Jambi ', 'lianmafutra@gmail.com', '2024-09-08 15:03:23', '2024-09-08 15:03:24');
/*!40000 ALTER TABLE `konsumen` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.migrations: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(30, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(31, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(32, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(33, '2016_06_01_000004_create_oauth_clients_table', 1),
	(34, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(35, '2019_12_14_000001_create_personal_access_tokens_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.model_has_permissions: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.model_has_roles: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 112277),
	(14, 'App\\Models\\User', 112310);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.oauth_access_tokens: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('2ee2d0f6e942517e58b3b259bcd1f3ab4d32dfb70a162f4c80598816f1564aa9029bc519078866f9', 112363, '9cf8bde6-339c-47aa-9254-04b736eb7379', 'loka-api', '[]', 0, '2024-09-10 07:27:34', '2024-09-10 07:27:34', '2025-09-10 07:27:34'),
	('804e771f0da6cc2ef8ed304aa081ba6ddb77df7e9cd66b3b34a6ade069b54b3fcfe9fd4514307d52', 112351, '9cf8bde6-339c-47aa-9254-04b736eb7379', 'loka-api', '[]', 0, '2024-09-10 05:41:26', '2024-09-10 05:41:26', '2025-09-10 05:41:26'),
	('de643da1714e75d78dbfbfc2381919aa7e5e84ce51ca0f13348ce3b27ea4516184f8fe5beafc5912', 112364, '9cf8bde6-339c-47aa-9254-04b736eb7379', 'loka-api', '[]', 0, '2024-09-10 07:30:37', '2024-09-10 07:30:37', '2025-09-10 07:30:37');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.oauth_auth_codes: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.oauth_clients: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	('9cf8bdd9-0031-4990-bc06-b52595181e50', NULL, ' Personal Access Client', 'NYWMVNPJTgSwbrtRcapRQeGDOraxFbmIidcYFnLC', NULL, 'http://localhost', 1, 0, 0, '2024-09-10 05:38:29', '2024-09-10 05:38:29'),
	('9cf8bdd9-0672-498b-a141-676b13f64aab', NULL, ' Password Grant Client', 'Q9budBdvf2OOK9J3iCUM2i67bQpWvFtJCJiUBxOE', 'users', 'http://localhost', 0, 1, 0, '2024-09-10 05:38:29', '2024-09-10 05:38:29'),
	('9cf8bde6-339c-47aa-9254-04b736eb7379', NULL, ' Personal Access Client', 'XyBET1KNydGztN8mvT5SwaeEQiCcmx15saSUT9ch', NULL, 'http://localhost', 1, 0, 0, '2024-09-10 05:38:38', '2024-09-10 05:38:38'),
	('9cf8bde6-3aaa-4481-a9a1-69a50131ed84', NULL, ' Password Grant Client', 'SpnlnmevwOnOokF7z4DsJgHnV8SzmcMmMZjcpB7a', 'users', 'http://localhost', 0, 1, 0, '2024-09-10 05:38:38', '2024-09-10 05:38:38');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.oauth_personal_access_clients: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, '9cf8bdd9-0031-4990-bc06-b52595181e50', '2024-09-10 05:38:29', '2024-09-10 05:38:29'),
	(2, '9cf8bde6-339c-47aa-9254-04b736eb7379', '2024-09-10 05:38:38', '2024-09-10 05:38:38');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.oauth_refresh_tokens: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.password_resets: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` int(11) NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  KEY `FK_permissions_permission_group` (`permission_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.permissions: ~16 rows (lebih kurang)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `permission_group_id`, `desc`, `guard_name`, `created_at`, `updated_at`) VALUES
	(11, 'delete role', 2, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(12, 'update role', 2, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(13, 'read role', 2, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(14, 'create role', 2, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(15, 'delete permission', 3, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(16, 'update permission', 3, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(17, 'read permission', 3, '', 'web', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(18, 'create permission', 3, NULL, 'web', '2022-11-18 10:50:20', '2023-07-19 13:18:45'),
	(113, 'reset user', 29, NULL, 'web', '2023-07-18 15:13:36', '2023-07-18 15:13:36'),
	(159, 'role-admin', 29, 'untuk hak akses admin', 'web', '2024-05-24 19:55:08', '2024-05-24 19:55:08'),
	(160, 'master-user-create', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53'),
	(161, 'master-user-show', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53'),
	(162, 'master-user-edit', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53'),
	(163, 'master-user-delete', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53'),
	(164, 'master-user-list', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53'),
	(165, 'master-user-manage', 31, NULL, 'web', '2024-05-24 19:57:53', '2024-05-24 19:57:53');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.permission_group
CREATE TABLE IF NOT EXISTS `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` text,
  `name` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_loka.permission_group: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
INSERT INTO `permission_group` (`id`, `desc`, `name`, `created_at`, `updated_at`) VALUES
	(2, 'Master Data User Management', 'Role', '2023-07-14 23:58:20', '2023-07-14 23:58:20'),
	(3, 'Permissions Management Super Admin', 'Permissions', '2023-07-14 23:58:20', '2023-07-14 23:58:20'),
	(29, 'Permission dont without group', 'ungroup', '2023-07-18 15:10:51', '2023-07-18 15:10:51'),
	(31, 'master-user admin', 'master-user', '2024-05-24 19:57:27', '2024-05-24 19:57:27');
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.personal_access_tokens: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `foto` varchar(255) DEFAULT NULL,
  `desc_short` text,
  `desc_long` text,
  `harga` int(11) NOT NULL DEFAULT '0',
  `stok` int(11) DEFAULT '0',
  `komposisi` text,
  `promo` varchar(500) DEFAULT NULL,
  `diskon` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.produk: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` (`id`, `nama`, `foto`, `desc_short`, `desc_long`, `harga`, `stok`, `komposisi`, `promo`, `diskon`, `created_at`, `updated_at`) VALUES
	(1, 'Kopi Arabika', 'Loca Coffe_1725752364.png', 'Kopi Arabika premium', '<p><em>Kopi </em><strong><em>Arabika </em>premium </strong>dengan rasa lembut dan aroma yang kaya. Ideal untuk penyeduhan <strong>pagi</strong>.</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li>dokwqokd</li>\r\n<li>qwdkoqwkd</li>\r\n<li>qwkdokqwod</li>\r\n<li>qwdokoqwd</li>\r\n</ol>', 12000, 100, '100% Arabika; 200% susu; \r\nmocca;', 'Diskon 10%', 10, '2024-09-07 09:57:14', '2024-09-08 06:39:24'),
	(2, 'Kopi Robusta', '', 'Kopi Robusta kuat', '<p>Kopi Robusta dengan rasa kuat dan pahit,</p>\r\n<p><strong>cocok </strong>untuk pencinta kopi yang menyukai intensitas.</p>', 100000, 75, '100% Robusta', 'Diskon 15%', 15, '2024-09-07 09:57:14', '2024-09-08 05:31:52'),
	(3, 'Kopi Blend', '', 'Kopi Blend campuran', 'Kopi Blend dengan campuran Arabika dan Robusta untuk rasa yang seimbang dan kaya.', 130000, 50, 'Blend Arabika;Robusta', 'Diskon 5%', 5, '2024-09-07 09:57:14', '2024-09-07 09:57:14'),
	(4, 'Kopi Mocha', '', 'Kopi Mocha cokelat', '<p>Kopi Mocha dengan tambahan rasa cokelat yang creamy, ideal untuk pencinta kopi manis.</p>', 25000, 30, 'Campuran kopi;   cokelat', 'Diskon 20%', 20, '2024-09-07 09:57:14', '2024-09-08 06:48:06'),
	(5, 'Kopi Latte', '', 'Kopi Latte susu', 'Kopi Latte dengan campuran susu yang lembut, sempurna untuk menikmati kopi dengan sentuhan manis.', 140000, 60, 'Kopi;susu', 'Diskon 25%', 25, '2024-09-07 09:57:14', '2024-09-07 09:57:14');
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.roles: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `slug`, `guard_name`, `desc`, `created_at`, `updated_at`) VALUES
	(1, 'superadmin', '1', 'web', 'Super Admin App', '2022-11-18 10:50:20', '2022-11-18 10:50:20'),
	(14, 'admin', 'admin', 'web', 'admin aplikasi (kelola : pasien, obat, user dll)', '2024-05-16 01:47:36', '2024-05-19 06:33:04'),
	(15, 'pimpinan', 'pimpinan', 'web', 'pimpinan', '2024-05-16 01:47:50', '2024-05-16 01:47:50'),
	(16, 'personil', 'personil', 'web', 'Personil', '2024-06-08 15:18:12', '2024-06-08 15:18:12');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.role_has_permissions: ~7 rows (lebih kurang)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(159, 14),
	(160, 14),
	(161, 14),
	(162, 14),
	(163, 14),
	(164, 14),
	(165, 14);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.sample
CREATE TABLE IF NOT EXISTS `sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `category_id` varchar(200) NOT NULL,
  `category_multi_id` varchar(200) NOT NULL,
  `days` varchar(200) NOT NULL,
  `month` varchar(200) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `date_publisher` datetime NOT NULL,
  `date_range_start` datetime NOT NULL,
  `date_range_end` datetime NOT NULL,
  `time` time NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `password` varchar(50) NOT NULL,
  `contact` char(13) NOT NULL,
  `check` char(13) NOT NULL,
  `radio` char(13) NOT NULL,
  `file_cover` varchar(200) DEFAULT NULL,
  `file_cover_multi` varchar(200) DEFAULT NULL,
  `file_pdf` varchar(200) DEFAULT NULL,
  `summernote` text NOT NULL,
  `uuid` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_loka.sample: ~35 rows (lebih kurang)
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` (`id`, `title`, `desc`, `category_id`, `category_multi_id`, `days`, `month`, `start_date`, `end_date`, `date_publisher`, `date_range_start`, `date_range_end`, `time`, `price`, `password`, `contact`, `check`, `radio`, `file_cover`, `file_cover_multi`, `file_pdf`, `summernote`, `uuid`, `created_at`, `updated_at`) VALUES
	(323, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', '172efa83-5a85-4938-836b-66f89a52896d', '4239ddf4-c0f0-4f56-b224-833991c2f7f0', 'bf4077ee-ce78-4c0c-bd80-b6d1aa4f392b', '<p><b>ok ini text editor</b></p>', 'samplecrud_v3Z4KJB59V0yljqgQDPX8GdmoQxnYe', '2023-08-11 06:09:12', '2023-08-11 06:09:12'),
	(324, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, 'fa9650a0-dfd6-4a80-a980-2471624eef33', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_oReLqBO8n5xdPjlmAzQkp9Zmy2vgYV', '2023-08-11 06:10:25', '2023-08-11 06:10:25'),
	(325, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, '5185e0d7-badb-4ff8-8ad9-b981dc538780', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_PrNW4v0ByMlRZ7NBv7Y32d6pQw5Km8', '2023-08-11 06:11:05', '2023-08-11 06:11:05'),
	(333, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, 'fe56c1b7-95db-4351-bcf5-bc649c5ff51f', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_wL2xGA9M5dQXJjkkWjBrey3gRE40lk', '2023-08-11 06:17:17', '2023-08-11 06:17:17'),
	(335, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, 'f6b65bc5-f248-4440-b57d-25b00f087c29', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_E8BRn6QOq5Pd2Dg4d7veJ90Xk4KNwZ', '2023-08-11 06:18:13', '2023-08-11 06:18:13'),
	(336, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, '759a8a4e-cc8a-404c-910f-bf826e5042e8', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_5P2ElqLwvNAeX73vvDRgZdB9rn3KJY', '2023-08-11 06:18:33', '2023-08-11 06:18:33'),
	(345, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, '773ae080-edb1-49d0-8402-af95674dcfd9', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_Jp8dGYoyqZwEND9oQjLvVQXRPM6kmO', '2023-08-11 06:22:24', '2023-08-11 06:22:24'),
	(346, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 293029323.000000, '123456', '928392183', 'on', 'on', NULL, 'a6b1fec5-1bb1-48c2-ba1c-e1abc6970f51', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_XwkLrPexlW94MjvAM7mpdN2Zq38oAO', '2023-08-11 06:22:35', '2023-08-11 06:22:35'),
	(347, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '74ca7b64-3877-4845-8b95-62f55db6e1a9', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_xWBZqA9rgd5OPjM3yDyeQX8pnlvoN6', '2023-08-11 06:23:12', '2023-08-11 06:23:12'),
	(348, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, 'af888b59-06f9-4e6a-bbd5-fba9398eb0b0', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_6ERQXOwPv85dBzY8lj4qnp2LyZlrKA', '2023-08-11 06:23:17', '2023-08-11 06:23:17'),
	(349, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '1c302992-b06f-4091-a747-5d36223137d5', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_4pqR0YOL3Eyvw7rQkD8nxWgP5kdJeM', '2023-08-11 06:23:49', '2023-08-11 06:23:49'),
	(353, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '750df43b-3a32-4003-a44e-ff24550ee796', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_vVe6WGXp0xJBPzx5dDAyYLm5klNdQO', '2023-08-11 06:27:13', '2023-08-11 06:27:13'),
	(354, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, 'c9667289-7f5c-4ebc-81ac-2438f2bc3b66', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_KA9okBReO3rLxzOEB7YqWNpQV5M0yw', '2023-08-11 06:27:33', '2023-08-11 06:27:33'),
	(355, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '9bb8a637-f3ae-43a0-812d-993a391d3831', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_vmEgM9Vo3Z45AjEVGzOXye2BqWQnlK', '2023-08-11 06:29:13', '2023-08-11 06:29:13'),
	(362, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '73bca5cb-b1d1-446f-bad7-95987c3e6c16', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_JoqV2XgE3G9dLzoxvDKZY8NmvwWpx0', '2023-08-11 06:31:21', '2023-08-11 06:31:21'),
	(363, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '61068334-5e67-4f89-9b93-57825912ea75', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_Ppyw6keMNELV9jAV4z34AmKRnqXBG0', '2023-08-11 06:31:32', '2023-08-11 06:31:32'),
	(364, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, '3fa6158d-e5fa-4840-a166-b2963e573909', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_v3Z4KJB59V0ylzqkQ7PX8GdmoQxnYe', '2023-08-11 06:31:46', '2023-08-11 06:31:46'),
	(365, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 1.000000, '123456', '928392183', 'on', 'on', NULL, 'be3a7b2c-d4a3-4dd6-8ce5-0610e177b2e7', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_oReLqBO8n5xdPzlkAjQkp9Zmy2vgYV', '2023-08-11 09:22:36', '2023-08-11 09:22:36'),
	(368, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 3233.000000, '123456', '928392183', 'on', 'on', NULL, '3f4cc8b3-b140-4fcf-b5d2-409b8d431bde', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_QMyVpk5Bnv8O3z5YGzXKdxeqZ0r26Y', '2023-08-11 09:42:33', '2023-08-11 09:42:33'),
	(381, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 210000.000000, '123456', '928392183', 'on', 'on', NULL, '5532d73e-2449-4bbe-891a-9b729f6c0e61', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_eXJOZG9WxABQl7J32jk2Kg4qnMVom3', '2023-08-11 09:49:19', '2023-08-11 09:49:19'),
	(382, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 23213.000000, '123456', '928392183', 'on', 'on', 'aee20d72-89e6-40c0-8977-0f9dad392bc0', '7fa7c351-74bf-4987-bb86-9dc33d9e1727', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_xoBXrLvPlW820jRPnDVmQ6NEn5wyMO', '2023-08-11 09:50:01', '2023-08-11 09:50:01'),
	(387, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 23213.000000, '123456', '928392183', 'on', 'on', '46c138a6-43e6-437e-b8bc-971cafbac188', '966ff223-982f-4b89-8852-28e0a35fe51c', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_XwkLrPexlW94MzvVMzmpdN2Zq38oAO', '2023-08-11 09:52:08', '2023-08-11 09:52:08'),
	(388, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 321312.000000, '123456', '928392183', 'on', 'on', 'ca17ad5f-1557-4349-a3b4-76aa4b2ca669', '242b0004-488c-4785-984e-f45bb15bd2a2', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_xWBZqA9rgd5OPzMky7yeQX8pnlvoN6', '2023-08-11 09:52:47', '2023-08-11 09:52:48'),
	(389, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 3213213.000000, '123456', '928392183', 'on', 'on', 'd1610e2b-e593-40c4-9df6-eabe134f61e9', 'fea8b4a9-0961-4e64-8abe-d3bd7bfcf511', NULL, '<p><b>ok ini text editor</b></p>', 'samplecrud_6ERQXOwPv85dBDY9lD4qnp2LyZlrKA', '2023-08-11 09:54:19', '2023-08-11 09:54:19'),
	(390, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '23:00:00', 3233.000000, '123456', '928392183', 'on', 'on', '1e7c4ef9-2f44-451e-8ab1-aeaa7dda066f', '91e1e0ba-57e3-4a60-8ef8-48fb2723923d', '87a45f7c-b4ca-4b2f-b21c-6283ea3ff32a', '<p><b>ok ini text editor</b></p>', 'samplecrud_4pqR0YOL3Eyvwjrokz8nxWgP5kdJeM', '2023-08-11 09:55:45', '2023-08-11 13:07:49'),
	(401, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 3123123.000000, '123456', '928392183', 'on', 'on', NULL, NULL, '9fffb284-7498-4173-91b4-f3d1ae1c8bb7', '<p><b>ok ini text editor</b></p>', 'samplecrud_3KpWkqYZeLgoNjwKNjE0MBX2APQv6R', '2023-08-11 13:14:41', '2023-08-11 13:14:41'),
	(403, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '03:00:00', 211.000000, '123456', '928392183', 'on', 'on', '1dce6efc-9cb9-43d8-bab6-4b02f4a03f87', '77354263-7efc-4908-ace6-4758f0956891', '17012d78-22c8-439f-901f-7f684ac28d32', '<p><b>ok ini text editor</b></p>', 'samplecrud_LP9Ox5B8MqNmdDWZgzQk4Av3RXwpWl', '2023-08-11 13:16:12', '2023-08-11 13:16:13'),
	(404, 'Story Of Huda Ganteng12312313', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '23:00:00', 8989.000000, '123456', '928392183', 'on', 'on', 'fc9a416d-69e8-46f3-899a-322e19b0702b', 'f0e720f9-2f73-4a35-b535-8ba6aceabad8', '6c1b394e-93e6-4e13-9e27-45f4a567ef06', '<p><b>ok ini text editor</b></p>', 'samplecrud_Jp8dGYoyqZwENz98KjLvVQXRPM6kmO', '2023-08-11 13:18:34', '2023-08-11 13:25:14'),
	(405, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 9090000.000000, '123456', '928392183', 'on', 'on', 'ca6b6b1a-297a-41cf-9e76-12007d4914ef', '3fa41d38-2994-4be4-8ea6-291425f0f94d', '2e2243d7-6aa7-4278-8a3e-a7c65e3950bb', '<p><b>ok ini text editor</b></p>', 'samplecrud_XwkLrPexlW94M7vVB7mpdN2Zq38oAO', '2023-08-11 16:40:10', '2023-08-11 16:40:12'),
	(407, 'Story Of Huda Ganteng 6666', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '23:00:00', 910390131.000000, '123456', '928392183', 'on', 'on', 'd1d3f276-f228-4c38-ba9d-615bb078b177', '2b4c8294-00f2-4c1c-9b76-b57cf4e2069c', '19a1f81b-48ae-46c6-a544-83ef5e7465b1', '<p><b>ok ini text editor</b></p>', 'samplecrud_6ERQXOwPv85dBjY9nj4qnp2LyZlrKA', '2023-08-11 16:42:14', '2023-08-12 10:41:56'),
	(408, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 22313123.000000, '123456', '928392183', 'on', 'on', '041b6871-1679-48f7-a151-fdc2d884a0e4', 'e67b2cb6-0802-4c1d-a85a-8f3fa2932c41', '6a987b57-0f55-4cdf-ac95-fb0c84771c0a', '<p><b>ok ini text editor</b></p>', 'samplecrud_4pqR0YOL3EyvwDroM78nxWgP5kdJeM', '2023-08-16 09:23:24', '2023-08-16 09:23:25'),
	(410, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 232323.000000, '123456', '928392183', 'on', 'on', '535bdfb6-8fb8-46fc-b9ad-a03fdbd7223a', '96aa8ccb-88a4-4c06-be79-16234d30ef56', '6eaabe6f-6413-4a69-b9e6-60053bf969e9', '<p><b>ok ini text editor</b></p>', 'samplecrud_3R0Ydn6EAWNyv7Qwmzq25XmoglMrBK', '2023-08-23 11:33:45', '2023-08-23 11:33:45'),
	(411, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 213213.000000, '123456', '928392183', 'on', 'on', 'c0ed482d-22fa-44cb-b09c-cd86c7ca4dbf', '01970d19-6d6d-46e9-a93f-f8fa88748564', 'f7c30fa1-7cbb-4c48-b412-191a174e1a7d', '<p><b>ok ini text editor</b></p>', 'samplecrud_Ndg4o56pOVvRP7pZrzrnG0WLJM3eYk', '2023-08-23 11:39:40', '2023-08-23 11:39:40'),
	(412, 'Story Of Huda Ganteng', 'Lorem Ipsum kkaldka', 'fiction', '["fiction","biography"]', 'rabu', '3', '2023-08-05 00:00:00', '2023-08-06 00:00:00', '2023-08-27 00:00:00', '2023-08-03 00:00:00', '2023-08-26 00:00:00', '23:00:00', 213213213.000000, '123456', '928392183', 'on', 'on', '96fa26ca-917b-4fd1-89fe-9d40b7785ed1', 'cc88f56a-f4de-456c-a3c2-53bf713b17e0', '0a85f282-11a1-46dc-b769-979b9c3dbfed', '<p><b>ok ini text editor</b></p>', 'samplecrud_vVe6WGXp0xJBPjx8QjAyYLm5klNdQO', '2023-08-23 11:40:38', '2023-08-23 11:40:38'),
	(413, 'dkmwkdmqklmd', 'mdkmqwklmdklq', 'fiction', '["fiction"]', 'rabu', '1', '2024-05-15 00:00:00', '2024-05-24 00:00:00', '2024-05-24 00:00:00', '2024-05-15 00:00:00', '2024-05-24 00:00:00', '12:00:00', 90000.000000, '123456', '0120312030213', 'on', 'on', '7d39cc94-8e23-4aee-a54a-567ba3f96b7a', '3ba3a649-5d4c-4d96-acac-fd96a16acca6', 'bfe5a9fc-735b-42ab-abf8-f1bcbf2c3246', ',wdl,qwld,l;q,d', '032c08a6-c847-491a-8258-46eae4062a26', '2024-05-15 09:20:23', '2024-05-15 13:55:25');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('information','contact','payment','email','api') COLLATE utf8mb4_unicode_ci DEFAULT 'information',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_loka.settings: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `value`, `name`, `type`, `ext`, `category`, `created_at`, `updated_at`) VALUES
	(1, 'app_name', '', 'Application Short Name', 'text', NULL, 'information', '2022-11-18 10:50:20', '2023-02-16 08:24:47'),
	(2, 'app_short_name', '', 'Application Name', 'text', NULL, 'information', '2022-11-18 10:50:20', '2023-02-16 08:24:47'),
	(3, 'app_logo', '', 'Application Logo', 'file', 'png', 'information', '2022-11-18 10:50:20', '2023-02-16 08:24:47'),
	(4, 'app_favicon', '', 'Application Favicon', 'file', 'png', 'information', '2022-11-18 10:50:20', '2023-02-16 08:24:47'),
	(5, 'app_loading_gif', '', 'Application Loading Image', 'file', 'gif', 'information', '2022-11-18 10:50:20', '2023-02-16 08:24:47'),
	(6, 'app_map_loaction', 'none', 'Application Map Location', 'textarea', NULL, 'contact', '2022-11-18 10:50:20', '2023-01-18 10:51:15');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.styles
CREATE TABLE IF NOT EXISTS `styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_loka.styles: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `styles` DISABLE KEYS */;
INSERT INTO `styles` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'sidebar_color', '#673de6', '2023-07-18 23:05:24', '2023-07-18 23:05:25'),
	(2, 'sidebar_bg_color', '#ffffff', '2023-07-18 23:05:24', '2023-07-18 23:05:25'),
	(3, 'sidebar_header_bg', '#ffffff', '2023-07-18 23:05:24', '2023-07-18 23:05:25');
/*!40000 ALTER TABLE `styles` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text NOT NULL,
  `barista_id` text,
  `barista_nama` text,
  `barista_username` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.transaksi: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.transaksi_produk
CREATE TABLE IF NOT EXISTS `transaksi_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text NOT NULL,
  `barista_id` text,
  `barista_nama` text,
  `barista_username` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Membuang data untuk tabel db_loka.transaksi_produk: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `transaksi_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi_produk` ENABLE KEYS */;

-- membuang struktur untuk table db_loka.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `status` enum('AKTIF','NONAKTIF') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'AKTIF',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `jenkel` enum('L','P') DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=112365 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_loka.users: ~12 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `name`, `status`, `password`, `remember_token`, `foto`, `last_login_at`, `kontak`, `jenkel`, `last_login_ip`, `created_at`, `updated_at`) VALUES
	(1, 'andi123', 'Andi Saputra1', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, 'foto1.jpg', '2024-09-07 10:00:00', '08123456789', 'P', '192.168.1.1', '2024-09-07 07:49:24', '2024-09-07 09:06:40'),
	(2, 'siti456', 'Siti Nurhaliza', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, 'foto2.jpg', '2024-09-07 11:00:00', '08234567890', 'P', '192.168.1.2', '2024-09-07 07:49:24', '2024-09-07 07:49:24'),
	(3, 'budi789', 'Budi Santoso', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, NULL, '2024-09-07 12:00:00', '08345678901', 'L', '192.168.1.3', '2024-09-07 07:49:24', '2024-09-07 07:49:24'),
	(4, 'ayu123', 'Ayu Lestari', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, 'foto3.jpg', NULL, '08456789012', 'P', '192.168.1.4', '2024-09-07 07:49:24', '2024-09-07 07:49:24'),
	(5, 'rudi321', 'Rudi Hartono', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, NULL, '2024-09-07 13:00:00', '08567890123', 'L', '192.168.1.5', '2024-09-07 07:49:24', '2024-09-07 07:49:24'),
	(7, 'lm', 'Lian Mafutra Konsumen', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', NULL, NULL, '2024-09-07 13:00:00', '08567890123', 'L', '192.168.1.5', '2024-09-07 07:49:24', '2024-09-08 16:58:12'),
	(112277, 'superadmin', 'SuperAdmin Dev', 'AKTIF', '$2y$10$5D0BGqhoXbeq5wU2raO.guuguGtDlKtBveoTgQIUfc/m5OAOGg7Oy', 'zRvk16miIgDRe2WL1TsuxGSNit4785xIKKi2tu7lC0wi0bImIvMTyznSE860', 'adb830fe-a863-481b-849e-eba8715da241', '2024-09-10 07:26:59', NULL, NULL, '127.0.0.1', '2023-07-06 11:28:03', '2024-09-10 07:26:59'),
	(112310, 'admin', 'Admin Loka', 'AKTIF', '$2y$10$.kJUqBJKUatHQR8Ci8NWjeVwlZPmH8utdtf1TsIIN6TyRPww5SAci', 'mpu101ewHCMz8vuQaxndHwqFV6hDPGmOs7zk6p0kw9at3OJOhsjZcrBG7Yu5', 'f52ccc0a-1883-4e23-9cd0-a15130273ecc', '2024-07-07 16:35:07', NULL, NULL, '127.0.0.1', '2024-05-24 18:46:41', '2024-07-07 16:35:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
