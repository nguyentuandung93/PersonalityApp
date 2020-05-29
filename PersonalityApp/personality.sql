-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for prj_db
CREATE DATABASE IF NOT EXISTS `prj_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prj_db`;

-- Dumping structure for table prj_db.m_user
CREATE TABLE IF NOT EXISTS `m_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ユーザー名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'パスワード',
  `introduction` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自己紹介',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名前',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'メール',
  `image_real_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '画像実名',
  `image_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '画像名',
  `facebook` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'フェイスブック',
  `twitter` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ツイッター',
  `instagram` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'インスタグラム',
  `last_login` datetime DEFAULT NULL COMMENT '前回のログイン時間',
  `this_login` datetime DEFAULT NULL COMMENT '今回のログイン時間',
  `regist_date` datetime NOT NULL COMMENT '登録日時',
  `update_user_id` int DEFAULT NULL COMMENT '更新ユーザーID',
  `update_date` datetime DEFAULT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ユーザーテーブル';

-- Data exporting was unselected.

-- Dumping structure for table prj_db.t_diary
CREATE TABLE IF NOT EXISTS `t_diary` (
  `diary_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'ユーザーID',
  `title` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '日記タイトル',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '日記内容',
  `save_date` date DEFAULT NULL COMMENT '保存日',
  `place` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '場所',
  `emotion` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '感情',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `regist_date` datetime NOT NULL COMMENT '登録日時',
  `update_date` datetime DEFAULT NULL COMMENT '更新日時',
  PRIMARY KEY (`diary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='日記テーブル';

-- Data exporting was unselected.

-- Dumping structure for table prj_db.t_todos
CREATE TABLE IF NOT EXISTS `t_todos` (
  `todo_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'ユーザーID',
  `title` varchar(2048) DEFAULT NULL,
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `status` tinyint(1) unsigned zerofill NOT NULL COMMENT 'ステータス:0:予定期間前, 1:予定期間中, 2:予定期間過ぎ,3:解決済',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `del_flg` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_user_id` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user_id` int DEFAULT NULL,
  PRIMARY KEY (`todo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Todoテーブル';

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
