/*
 Navicat Premium Dump SQL

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : finance

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 09/11/2025 08:06:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for hutang
-- ----------------------------
DROP TABLE IF EXISTS `hutang`;
CREATE TABLE `hutang`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `tipe` enum('Hutang','Piutang') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nama_relasi` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nominal` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `status` enum('Lunas','Belum Lunas') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT 'Belum Lunas',
  `tanggal_jatuh_tempo` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hutang
-- ----------------------------

-- ----------------------------
-- Table structure for jenis_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penerimaan`;
CREATE TABLE `jenis_penerimaan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_penerimaan` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_penerimaan
-- ----------------------------
INSERT INTO `jenis_penerimaan` VALUES (1, 'Gaji', 'Gaji Perusahaan', 1, '2025-11-03 20:34:23', '2025-11-03 20:34:23');
INSERT INTO `jenis_penerimaan` VALUES (2, 'Transfer', 'Gaji Perusahaan', 1, '2025-11-03 20:35:42', '2025-11-03 20:35:42');
INSERT INTO `jenis_penerimaan` VALUES (3, 'Bonus', 'Bonus Perusahaan', 1, '2025-11-03 20:35:58', '2025-11-03 20:38:27');
INSERT INTO `jenis_penerimaan` VALUES (4, 'Hibah', 'Hibah', 1, '2025-11-03 20:36:17', '2025-11-03 20:39:05');

-- ----------------------------
-- Table structure for jenis_pengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pengeluaran`;
CREATE TABLE `jenis_pengeluaran`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_pengeluaran` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_pengeluaran
-- ----------------------------
INSERT INTO `jenis_pengeluaran` VALUES (1, 'Belanja', 'Belanja', 1, '2025-11-03 20:44:18', '2025-11-03 20:51:11');
INSERT INTO `jenis_pengeluaran` VALUES (2, 'Cicilan', 'Cicilan rumah', 1, '2025-11-03 20:52:33', '2025-11-03 20:52:55');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `penerimaan`;
CREATE TABLE `penerimaan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `wallet_id` bigint UNSIGNED NOT NULL,
  `jenis_penerimaan_id` bigint UNSIGNED NOT NULL,
  `nominal` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wallet_id`(`wallet_id` ASC) USING BTREE,
  INDEX `jenis_penerimaan_id`(`jenis_penerimaan_id` ASC) USING BTREE,
  CONSTRAINT `penerimaan_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penerimaan_ibfk_2` FOREIGN KEY (`jenis_penerimaan_id`) REFERENCES `jenis_penerimaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penerimaan
-- ----------------------------

-- ----------------------------
-- Table structure for pengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran`;
CREATE TABLE `pengeluaran`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `wallet_id` bigint UNSIGNED NOT NULL,
  `jenis_pengeluaran_id` bigint UNSIGNED NOT NULL,
  `nominal` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wallet_id`(`wallet_id` ASC) USING BTREE,
  INDEX `jenis_pengeluaran_id`(`jenis_pengeluaran_id` ASC) USING BTREE,
  CONSTRAINT `pengeluaran_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`jenis_pengeluaran_id`) REFERENCES `jenis_pengeluaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengeluaran
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'api_token', 'ec9824ea2483cb364421ace70e997876c982daabfaa308b7394216a062dfbd5b', '[\"*\"]', NULL, NULL, '2025-11-03 12:37:16', '2025-11-03 12:37:16');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Bubun', 'bubun@gmail.com', NULL, '$2y$12$oJ1iH6qYxJNPSJArMJ8nAORcXIBdZ.CcqV2hHm5OlJeDOus9phweG', NULL, '2025-11-03 12:37:16', '2025-11-03 12:37:16');
INSERT INTO `users` VALUES (2, 'Bubuy', 'bubuy@gmail.com', NULL, '$2y$12$duaBUXlwVxLDxS3ZDBjQe.AmmEHneYLPFPvdfCXI9eAv2vLmIapjK', NULL, '2025-11-03 12:47:02', '2025-11-03 12:47:02');

-- ----------------------------
-- Table structure for wallets
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `saldo_awal` decimal(15, 2) NULL DEFAULT 0.00,
  `saldo_terkini` decimal(15, 2) NULL DEFAULT 0.00,
  `keterangan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallets
-- ----------------------------
INSERT INTO `wallets` VALUES (1, 'BRI', 1500000.00, 1500000.00, 'Gaji', 1, '2025-11-03 13:03:22', '2025-11-03 13:12:44');
INSERT INTO `wallets` VALUES (3, 'BSI', 15000000.00, 15000000.00, 'Tabungan', 1, '2025-11-03 13:16:20', '2025-11-03 13:16:20');

SET FOREIGN_KEY_CHECKS = 1;
