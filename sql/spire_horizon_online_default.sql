-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.4.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for spire_horizon_online
DROP DATABASE IF EXISTS `spire_horizon_online`;
CREATE DATABASE IF NOT EXISTS `spire_horizon_online` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `spire_horizon_online`;

-- Dumping structure for table spire_horizon_online.mailbox
CREATE TABLE IF NOT EXISTS `mailbox` (
  `mail_id` varchar(28) NOT NULL DEFAULT '',
  `uid` varchar(28) DEFAULT '',
  `title` tinytext DEFAULT '',
  `status` tinyint(1) DEFAULT 0 COMMENT '0: UNUSE 1: USED',
  `item_details` longtext DEFAULT '',
  `recieve_time` bigint(20) DEFAULT 0,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.mailbox: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.player
CREATE TABLE IF NOT EXISTS `player` (
  `uid` varchar(28) NOT NULL DEFAULT '0000000000000000000000000000',
  `currencies` longtext DEFAULT '',
  `experiences` longtext DEFAULT '',
  `player_info` longtext DEFAULT '',
  `stats` longtext DEFAULT '',
  `inventory_bank` longtext DEFAULT '',
  `inventory_equipment` longtext DEFAULT '',
  `inventory_main` longtext DEFAULT '',
  `quests` longtext DEFAULT '',
  `collections` longtext DEFAULT '',
  `rank_level` tinyint(4) DEFAULT 0,
  `rank_damage` smallint(6) DEFAULT 0,
  `rank_defeated_monster` int(11) DEFAULT 0,
  `rank_defeated_player` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.player: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.redeem
CREATE TABLE IF NOT EXISTS `redeem` (
  `code` varchar(16) NOT NULL DEFAULT '',
  `create_at` bigint(20) DEFAULT 0,
  `expire_in` smallint(6) DEFAULT 0,
  `item_details` longtext DEFAULT '',
  `reusable` tinyint(1) DEFAULT 1 COMMENT '0: NO 1: YES',
  `owner` varchar(28) DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.redeem: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.redeemed
CREATE TABLE IF NOT EXISTS `redeemed` (
  `code` varchar(16) NOT NULL DEFAULT '',
  `uid` varchar(28) DEFAULT '',
  `redeem_time` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.redeemed: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` varchar(28) NOT NULL DEFAULT '',
  `report_time` bigint(20) DEFAULT 0,
  `details` text DEFAULT '',
  `reporter_uid` varchar(28) DEFAULT '',
  `reported_uid` varchar(28) DEFAULT '',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.reports: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.security
CREATE TABLE IF NOT EXISTS `security` (
  `uid` varchar(28) NOT NULL DEFAULT '0000000000000000000000000000',
  `security` longtext DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.security: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.server
CREATE TABLE IF NOT EXISTS `server` (
  `address` varchar(50) NOT NULL DEFAULT '127.0.0.1:7772',
  `amount` smallint(6) DEFAULT 0,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.server: ~0 rows (approximately)

-- Dumping structure for table spire_horizon_online.server_info
CREATE TABLE IF NOT EXISTS `server_info` (
  `max_channel` smallint(6) DEFAULT NULL,
  `max_player` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.server_info: ~1 rows (approximately)
REPLACE INTO `server_info` (`max_channel`, `max_player`) VALUES
	(15, 30);

-- Dumping structure for table spire_horizon_online.tnx_steam
CREATE TABLE IF NOT EXISTS `tnx_steam` (
  `order_id` varchar(50) DEFAULT NULL,
  `uid` varchar(28) DEFAULT NULL,
  `trans_id` text DEFAULT NULL,
  `steam_id` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `currency` text DEFAULT NULL,
  `time` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `us_state` text DEFAULT NULL,
  `time_created` text DEFAULT NULL,
  `item_id` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `item_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table spire_horizon_online.tnx_steam: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
