--
-- Table structure for table `erro_messages`
--

CREATE TABLE IF NOT EXISTS `erro_messages` (
  `id` int(11) NOT NULL,
  `type` enum('memo','message','message sent','note','watchlist entry') NOT NULL,
  `targetckey` varchar(32) NOT NULL,
  `adminckey` varchar(32) NOT NULL,
  `text` varchar(2048) NOT NULL,
  `timestamp` datetime NOT NULL,
  `server` varchar(32) DEFAULT NULL,
  `secret` tinyint(1) DEFAULT 0,
  `lasteditor` varchar(32) DEFAULT NULL,
  `edits` text,
  PRIMARY KEY (`id`),
  KEY `idx_msg_ckey_time` (`targetckey`,`timestamp`, `deleted`),
  KEY `idx_msg_type_ckeys_time` (`type`,`targetckey`,`adminckey`,`timestamp`, `deleted`),
  KEY `idx_msg_type_ckey_time_odr` (`type`,`targetckey`,`timestamp`, `deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `online_score`
--

DROP TABLE IF EXISTS `online_score`;
CREATE TABLE `online_score` (
  `ckey` varchar(32),
  `year` int(11) DEFAULT 0,
  `month` int(11) DEFAULT 0,
  `day` int(11) DEFAULT 0,
  `sum` int(11) DEFAULT 0,
  PRIMARY KEY (`ckey`, `year`, `month`, `day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `erro_admin_tickets`
--

DROP TABLE IF EXISTS `erro_admin_tickets`;
CREATE TABLE `erro_admin_tickets` (
  `id` int(11) AUTO_INCREMENT,
  `assignee` text DEFAULT NULL,
  `ckey` varchar(32) NOT NULL,
  `text` text DEFAULT NULL,
  `status` enum('OPEN','CLOSED','SOLVED','TIMED_OUT') NOT NULL,
  `round` varchar(32),
  `inround_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
