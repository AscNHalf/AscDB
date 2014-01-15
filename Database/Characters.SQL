-- Létrehozás ideje: 2009. dec. 29. 11:56

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- Tábla szerkezet: `account_data`
--

CREATE TABLE IF NOT EXISTS `account_data` (
  `acct` int(30) NOT NULL,
  `uiconfig0` blob,
  `uiconfig1` blob,
  `uiconfig2` blob,
  `uiconfig3` blob,
  `uiconfig4` blob,
  `uiconfig5` blob,
  `uiconfig6` blob,
  `uiconfig7` blob,
  `uiconfig8` blob,
  PRIMARY KEY  (`acct`),
  UNIQUE KEY `a` (`acct`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `account_data`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `account_forced_permissions`
--

CREATE TABLE IF NOT EXISTS `account_forced_permissions` (
  `login` varchar(50) NOT NULL,
  `permissions` varchar(100) NOT NULL,
  PRIMARY KEY  (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `account_forced_permissions`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
  `player` int(11) NOT NULL,
  `achievementid` int(11) NOT NULL default '0',
  `progress` varchar(256) default NULL,
  `completed` int(11) NOT NULL default '0',
  PRIMARY KEY  (`player`,`achievementid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `achievements`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `arenateams`
--

CREATE TABLE IF NOT EXISTS `arenateams` (
  `id` int(10) unsigned NOT NULL default '0',
  `type` int(10) unsigned NOT NULL default '0',
  `leader` int(10) unsigned NOT NULL default '0',
  `name` varchar(24) NOT NULL,
  `emblemstyle` int(10) unsigned NOT NULL default '0',
  `emblemcolour` int(10) unsigned NOT NULL default '0',
  `borderstyle` int(10) unsigned NOT NULL default '0',
  `bordercolor` int(10) unsigned NOT NULL default '0',
  `backgroundcolor` int(10) unsigned NOT NULL default '0',
  `rating` int(10) unsigned NOT NULL default '0',
  `data` varchar(24) NOT NULL,
  `ranking` int(10) unsigned NOT NULL,
  `player_data1` varchar(32) NOT NULL,
  `player_data2` varchar(32) NOT NULL,
  `player_data3` varchar(32) NOT NULL,
  `player_data4` varchar(32) NOT NULL,
  `player_data5` varchar(32) NOT NULL,
  `player_data6` varchar(32) NOT NULL,
  `player_data7` varchar(32) NOT NULL,
  `player_data8` varchar(32) NOT NULL,
  `player_data9` varchar(32) NOT NULL,
  `player_data10` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `arenateams`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `auctions`
--

CREATE TABLE IF NOT EXISTS `auctions` (
  `auctionId` int(10) unsigned NOT NULL auto_increment,
  `auctionHouse` int(32) unsigned NOT NULL default '1',
  `item` bigint(10) unsigned NOT NULL,
  `owner` bigint(10) unsigned NOT NULL,
  `buyout` int(32) unsigned NOT NULL,
  `time` int(32) unsigned NOT NULL,
  `bidder` bigint(10) unsigned NOT NULL,
  `bid` int(32) NOT NULL,
  `deposit` int(32) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auctionId`),
  KEY `auctionHouse` (`auctionHouse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `auctions`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `banned_names`
--

CREATE TABLE IF NOT EXISTS `banned_names` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `banned_names`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `guid` int(10) unsigned NOT NULL auto_increment,
  `acct` int(10) unsigned NOT NULL,
  `name` varchar(21) NOT NULL default '',
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `custom_faction` int(10) unsigned NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL,
  `xp` int(10) unsigned NOT NULL,
  `exploration_data` longtext NOT NULL,
  `skills` longtext NOT NULL,
  `watched_faction_index` bigint(30) NOT NULL default '0',
  `selected_pvp_title` int(10) unsigned NOT NULL default '0',
  `available_pvp_titles1` bigint(30) unsigned NOT NULL default '0',
  `available_pvp_titles2` bigint(30) unsigned NOT NULL,
  `gold` int(10) unsigned NOT NULL default '0',
  `ammo_id` int(10) unsigned NOT NULL default '0',
  `available_prof_points` tinyint(3) unsigned NOT NULL default '0',
  `total_talent_points` int(30) NOT NULL,
  `current_hp` int(10) unsigned NOT NULL default '0',
  `current_power` int(10) unsigned NOT NULL default '0',
  `pvprank` int(10) unsigned NOT NULL default '0',
  `bytes` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `player_flags` int(10) unsigned NOT NULL default '0',
  `player_bytes` int(10) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `mapId` int(10) unsigned NOT NULL default '0',
  `zoneId` int(10) unsigned NOT NULL default '0',
  `taximask` longtext NOT NULL,
  `banned` int(40) NOT NULL,
  `banReason` varchar(50) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL default '0',
  `online` tinyint(3) unsigned NOT NULL default '0',
  `bindpositionX` float NOT NULL default '0',
  `bindpositionY` float NOT NULL default '0',
  `bindpositionZ` float NOT NULL default '0',
  `bindmapId` int(10) unsigned NOT NULL default '0',
  `bindzoneId` int(10) unsigned NOT NULL default '0',
  `isResting` tinyint(3) unsigned NOT NULL default '0',
  `restState` tinyint(3) unsigned NOT NULL default '0',
  `restTime` int(10) unsigned NOT NULL default '0',
  `playedtime` longtext NOT NULL,
  `deathstate` tinyint(3) unsigned NOT NULL default '0',
  `TalentResetTimes` int(10) unsigned NOT NULL default '0',
  `first_login` tinyint(3) unsigned NOT NULL default '0',
  `forced_rename_pending` tinyint(3) unsigned NOT NULL default '0',
  `arenaPoints` int(10) unsigned NOT NULL default '0',
  `totalstableslots` int(10) unsigned NOT NULL default '0',
  `instance_id` int(10) unsigned NOT NULL default '0',
  `entrypointmap` int(10) unsigned NOT NULL default '0',
  `entrypointx` float NOT NULL default '0',
  `entrypointy` float NOT NULL default '0',
  `entrypointz` float NOT NULL default '0',
  `entrypointo` float NOT NULL default '0',
  `entrypointinstance` int(10) unsigned NOT NULL default '0',
  `taxi_path` int(10) unsigned NOT NULL default '0',
  `taxi_lastnode` int(10) unsigned NOT NULL default '0',
  `taxi_mountid` int(10) unsigned NOT NULL default '0',
  `transporter` int(10) unsigned NOT NULL default '0',
  `transporter_xdiff` float NOT NULL default '0',
  `transporter_ydiff` float NOT NULL default '0',
  `transporter_zdiff` float NOT NULL default '0',
  `deleted_spells` longtext NOT NULL,
  `reputation` longtext NOT NULL,
  `actions` longtext NOT NULL,
  `auras` longtext NOT NULL,
  `finished_quests` longtext NOT NULL,
  `finished_daily_quests` longtext NOT NULL,
  `honorRolloverTime` int(30) NOT NULL default '0',
  `killsToday` int(10) unsigned NOT NULL default '0',
  `killsYesterday` int(10) unsigned NOT NULL default '0',
  `killsLifeTime` int(10) unsigned NOT NULL default '0',
  `honorToday` int(10) unsigned NOT NULL default '0',
  `honorYesterday` int(10) unsigned NOT NULL default '0',
  `honorPoints` int(10) unsigned NOT NULL default '0',
  `difficulty` int(10) unsigned NOT NULL default '0',
  `active_spec` tinyint(3) unsigned NOT NULL default '0',
  `specs_count` tinyint(3) unsigned NOT NULL default '1',
  `need_talent_reset` int(3) NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `characters`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `characters_insert_queue`
--

CREATE TABLE IF NOT EXISTS `characters_insert_queue` (
  `guid` int(10) unsigned NOT NULL auto_increment,
  `acct` int(10) unsigned NOT NULL,
  `name` varchar(21) NOT NULL default '',
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `custom_faction` int(10) unsigned NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL,
  `xp` int(10) unsigned NOT NULL,
  `exploration_data` longtext NOT NULL,
  `skills` longtext NOT NULL,
  `watched_faction_index` bigint(30) NOT NULL default '0',
  `selected_pvp_title` int(10) unsigned NOT NULL default '0',
  `available_pvp_titles1` bigint(30) unsigned NOT NULL default '0',
  `available_pvp_titles2` bigint(30) unsigned NOT NULL,
  `gold` int(10) unsigned NOT NULL default '0',
  `ammo_id` int(10) unsigned NOT NULL default '0',
  `available_prof_points` tinyint(3) unsigned NOT NULL default '0',
  `available_talent_points` int(3) unsigned NOT NULL default '0',
  `current_hp` int(10) unsigned NOT NULL default '0',
  `current_power` int(10) unsigned NOT NULL default '0',
  `pvprank` int(10) unsigned NOT NULL default '0',
  `bytes` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `player_flags` int(10) unsigned NOT NULL default '0',
  `player_bytes` int(10) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `mapId` int(10) unsigned NOT NULL default '0',
  `zoneId` int(10) unsigned NOT NULL default '0',
  `taximask` longtext NOT NULL,
  `banned` int(40) NOT NULL,
  `banReason` varchar(50) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL default '0',
  `online` tinyint(3) unsigned NOT NULL default '0',
  `bindpositionX` float NOT NULL default '0',
  `bindpositionY` float NOT NULL default '0',
  `bindpositionZ` float NOT NULL default '0',
  `bindmapId` int(10) unsigned NOT NULL default '0',
  `bindzoneId` int(10) unsigned NOT NULL default '0',
  `isResting` tinyint(3) unsigned NOT NULL default '0',
  `restState` tinyint(3) unsigned NOT NULL default '0',
  `restTime` int(10) unsigned NOT NULL default '0',
  `playedtime` longtext NOT NULL,
  `deathstate` tinyint(3) unsigned NOT NULL default '0',
  `TalentResetTimes` int(10) unsigned NOT NULL default '0',
  `first_login` tinyint(3) unsigned NOT NULL default '0',
  `forced_rename_pending` tinyint(3) unsigned NOT NULL default '0',
  `arenaPoints` int(10) unsigned NOT NULL default '0',
  `totalstableslots` int(10) unsigned NOT NULL default '0',
  `instance_id` int(10) unsigned NOT NULL default '0',
  `entrypointmap` int(10) unsigned NOT NULL default '0',
  `entrypointx` float NOT NULL default '0',
  `entrypointy` float NOT NULL default '0',
  `entrypointz` float NOT NULL default '0',
  `entrypointo` float NOT NULL default '0',
  `entrypointinstance` int(10) unsigned NOT NULL default '0',
  `taxi_path` int(10) unsigned NOT NULL default '0',
  `taxi_lastnode` int(10) unsigned NOT NULL default '0',
  `taxi_mountid` int(10) unsigned NOT NULL default '0',
  `transporter` int(10) unsigned NOT NULL default '0',
  `transporter_xdiff` float NOT NULL default '0',
  `transporter_ydiff` float NOT NULL default '0',
  `transporter_zdiff` float NOT NULL default '0',
  `spells` longtext NOT NULL,
  `deleted_spells` longtext NOT NULL,
  `reputation` longtext NOT NULL,
  `actions` longtext NOT NULL,
  `auras` longtext NOT NULL,
  `finished_quests` longtext NOT NULL,
  `finished_daily_quests` longtext NOT NULL,
  `honorRolloverTime` int(30) NOT NULL default '0',
  `killsToday` int(10) unsigned NOT NULL default '0',
  `killsYesterday` int(10) unsigned NOT NULL default '0',
  `killsLifeTime` int(10) unsigned NOT NULL default '0',
  `honorToday` int(10) unsigned NOT NULL default '0',
  `honorYesterday` int(10) unsigned NOT NULL default '0',
  `honorPoints` int(10) unsigned NOT NULL default '0',
  `difficulty` int(10) unsigned NOT NULL default '0',
  `Glyphs` longtext NOT NULL,
  `need_talent_reset` int(3) NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `characters_insert_queue`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `charters`
--

CREATE TABLE IF NOT EXISTS `charters` (
  `charterId` int(10) unsigned NOT NULL,
  `chartertype` int(10) NOT NULL default '0',
  `leaderGuid` int(20) unsigned NOT NULL default '0',
  `guildName` varchar(32) NOT NULL default '',
  `itemGuid` bigint(40) unsigned NOT NULL default '0',
  `signer1` int(10) unsigned NOT NULL default '0',
  `signer2` int(10) unsigned NOT NULL default '0',
  `signer3` int(10) unsigned NOT NULL default '0',
  `signer4` int(10) unsigned NOT NULL default '0',
  `signer5` int(10) unsigned NOT NULL default '0',
  `signer6` int(10) unsigned NOT NULL default '0',
  `signer7` int(10) unsigned NOT NULL default '0',
  `signer8` int(10) unsigned NOT NULL default '0',
  `signer9` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`charterId`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`),
  UNIQUE KEY `guildName` (`guildName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 18432 kB';

--
-- A tábla adatainak kiíratása `charters`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `clientaddons`
--

CREATE TABLE IF NOT EXISTS `clientaddons` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `crc` bigint(50) default NULL,
  `banned` int(1) NOT NULL default '0',
  `showinlist` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `index` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `clientaddons`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `command_overrides`
--

CREATE TABLE IF NOT EXISTS `command_overrides` (
  `command_name` varchar(100) NOT NULL,
  `access_level` varchar(10) NOT NULL,
  PRIMARY KEY  (`command_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `command_overrides`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `corpses`
--

CREATE TABLE IF NOT EXISTS `corpses` (
  `guid` bigint(20) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `zoneId` int(11) NOT NULL default '38',
  `mapId` int(11) NOT NULL default '0',
  `instanceId` int(11) NOT NULL default '0',
  `data` longtext NOT NULL,
  PRIMARY KEY  (`guid`),
  KEY `b` (`mapId`),
  KEY `c` (`instanceId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `corpses`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `events_settings`
--

CREATE TABLE IF NOT EXISTS `events_settings` (
  `eventid` tinyint(2) unsigned NOT NULL,
  `lastactivated` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `events_settings`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `gm_tickets`
--

CREATE TABLE IF NOT EXISTS `gm_tickets` (
  `guid` int(6) NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `level` int(6) NOT NULL default '0',
  `type` int(2) NOT NULL default '0',
  `posX` float NOT NULL default '0',
  `posY` float NOT NULL default '0',
  `posZ` float NOT NULL default '0',
  `message` text NOT NULL,
  `timestamp` text,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `gm_tickets`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(30) NOT NULL,
  `group_type` tinyint(2) NOT NULL,
  `subgroup_count` tinyint(2) NOT NULL,
  `loot_method` tinyint(2) NOT NULL,
  `loot_threshold` tinyint(2) NOT NULL,
  `difficulty` int(30) NOT NULL default '0',
  `assistant_leader` int(30) NOT NULL default '0',
  `main_tank` int(30) NOT NULL default '0',
  `main_assist` int(30) NOT NULL default '0',
  `group1member1` int(50) NOT NULL,
  `group1member2` int(50) NOT NULL,
  `group1member3` int(50) NOT NULL,
  `group1member4` int(50) NOT NULL,
  `group1member5` int(50) NOT NULL,
  `group2member1` int(50) NOT NULL,
  `group2member2` int(50) NOT NULL,
  `group2member3` int(50) NOT NULL,
  `group2member4` int(50) NOT NULL,
  `group2member5` int(50) NOT NULL,
  `group3member1` int(50) NOT NULL,
  `group3member2` int(50) NOT NULL,
  `group3member3` int(50) NOT NULL,
  `group3member4` int(50) NOT NULL,
  `group3member5` int(50) NOT NULL,
  `group4member1` int(50) NOT NULL,
  `group4member2` int(50) NOT NULL,
  `group4member3` int(50) NOT NULL,
  `group4member4` int(50) NOT NULL,
  `group4member5` int(50) NOT NULL,
  `group5member1` int(50) NOT NULL,
  `group5member2` int(50) NOT NULL,
  `group5member3` int(50) NOT NULL,
  `group5member4` int(50) NOT NULL,
  `group5member5` int(50) NOT NULL,
  `group6member1` int(50) NOT NULL,
  `group6member2` int(50) NOT NULL,
  `group6member3` int(50) NOT NULL,
  `group6member4` int(50) NOT NULL,
  `group6member5` int(50) NOT NULL,
  `group7member1` int(50) NOT NULL,
  `group7member2` int(50) NOT NULL,
  `group7member3` int(50) NOT NULL,
  `group7member4` int(50) NOT NULL,
  `group7member5` int(50) NOT NULL,
  `group8member1` int(50) NOT NULL,
  `group8member2` int(50) NOT NULL,
  `group8member3` int(50) NOT NULL,
  `group8member4` int(50) NOT NULL,
  `group8member5` int(50) NOT NULL,
  `timestamp` int(30) NOT NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `groups`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `guildId` bigint(20) NOT NULL auto_increment,
  `guildName` varchar(32) NOT NULL default '',
  `leaderGuid` bigint(20) NOT NULL default '0',
  `emblemStyle` int(10) NOT NULL default '0',
  `emblemColor` int(10) NOT NULL default '0',
  `borderStyle` int(10) NOT NULL default '0',
  `borderColor` int(10) NOT NULL default '0',
  `backgroundColor` int(10) NOT NULL default '0',
  `guildInfo` varchar(1024) NOT NULL,
  `motd` varchar(1024) NOT NULL,
  `createdate` int(30) NOT NULL default '0',
  `bankTabCount` int(30) NOT NULL default '0',
  `bankBalance` int(30) NOT NULL default '0',
  PRIMARY KEY  (`guildId`),
  UNIQUE KEY `guildName` (`guildName`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `guilds`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_bankitems`
--

CREATE TABLE IF NOT EXISTS `guild_bankitems` (
  `guildId` int(30) NOT NULL,
  `tabId` int(30) NOT NULL,
  `slotId` int(30) NOT NULL,
  `itemGuid` int(30) NOT NULL,
  PRIMARY KEY  (`guildId`,`tabId`,`slotId`),
  KEY `a` (`guildId`),
  KEY `b` (`tabId`),
  KEY `c` (`slotId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_bankitems`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_banklogs`
--

CREATE TABLE IF NOT EXISTS `guild_banklogs` (
  `log_id` int(30) NOT NULL,
  `guildid` int(30) NOT NULL,
  `tabid` bigint(30) NOT NULL,
  `action` bigint(30) NOT NULL,
  `player_guid` bigint(30) NOT NULL,
  `item_entry` bigint(30) NOT NULL,
  `stack_count` bigint(30) NOT NULL,
  `timestamp` bigint(30) NOT NULL,
  PRIMARY KEY  (`log_id`,`guildid`),
  KEY `a` (`log_id`),
  KEY `b` (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_banklogs`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_banktabs`
--

CREATE TABLE IF NOT EXISTS `guild_banktabs` (
  `guildId` int(30) NOT NULL,
  `tabId` int(30) NOT NULL,
  `tabName` varchar(200) NOT NULL,
  `tabIcon` varchar(200) NOT NULL,
  PRIMARY KEY  (`guildId`,`tabId`),
  KEY `a` (`guildId`),
  KEY `b` (`tabId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_banktabs`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_data`
--

CREATE TABLE IF NOT EXISTS `guild_data` (
  `guildid` int(30) NOT NULL,
  `playerid` int(30) NOT NULL,
  `guildRank` int(30) NOT NULL,
  `publicNote` varchar(300) NOT NULL,
  `officerNote` varchar(300) NOT NULL,
  `lastWithdrawReset` int(30) NOT NULL default '0',
  `withdrawlsSinceLastReset` int(30) NOT NULL default '0',
  `lastItemWithdrawReset0` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset0` int(30) NOT NULL default '0',
  `lastItemWithdrawReset1` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset1` int(30) NOT NULL default '0',
  `lastItemWithdrawReset2` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset2` int(30) NOT NULL default '0',
  `lastItemWithdrawReset3` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset3` int(30) NOT NULL default '0',
  `lastItemWithdrawReset4` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset4` int(30) NOT NULL default '0',
  `lastItemWithdrawReset5` int(30) NOT NULL default '0',
  `itemWithdrawlsSinceLastReset5` int(30) NOT NULL default '0',
  PRIMARY KEY  (`playerid`,`guildRank`),
  UNIQUE KEY `guildid` (`guildid`,`playerid`),
  KEY `a` (`guildid`),
  KEY `b` (`playerid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_data`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_logs`
--

CREATE TABLE IF NOT EXISTS `guild_logs` (
  `log_id` int(30) NOT NULL,
  `guildid` int(30) NOT NULL,
  `timestamp` int(30) NOT NULL,
  `event_type` int(30) NOT NULL,
  `misc1` int(30) NOT NULL,
  `misc2` int(30) NOT NULL,
  `misc3` int(30) NOT NULL,
  PRIMARY KEY  (`log_id`,`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_logs`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `guildId` int(6) unsigned NOT NULL,
  `rankId` int(1) NOT NULL default '0',
  `rankName` varchar(255) NOT NULL default '',
  `rankRights` int(3) unsigned NOT NULL default '0',
  `goldLimitPerDay` int(30) NOT NULL default '0',
  `bankTabFlags0` int(30) NOT NULL default '0',
  `itemStacksPerDay0` int(30) NOT NULL default '0',
  `bankTabFlags1` int(30) NOT NULL default '0',
  `itemStacksPerDay1` int(30) NOT NULL default '0',
  `bankTabFlags2` int(30) NOT NULL default '0',
  `itemStacksPerDay2` int(30) NOT NULL default '0',
  `bankTabFlags3` int(30) NOT NULL default '0',
  `itemStacksPerDay3` int(30) NOT NULL default '0',
  `bankTabFlags4` int(30) NOT NULL default '0',
  `itemStacksPerDay4` int(30) NOT NULL default '0',
  `bankTabFlags5` int(30) NOT NULL default '0',
  `itemStacksPerDay5` int(30) NOT NULL default '0',
  PRIMARY KEY  (`guildId`,`rankId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `guild_ranks`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `instances`
--

CREATE TABLE IF NOT EXISTS `instances` (
  `id` int(30) NOT NULL,
  `mapid` int(30) NOT NULL,
  `creation` int(30) NOT NULL,
  `expiration` int(30) NOT NULL,
  `killed_npc_guids` text NOT NULL,
  `difficulty` int(30) NOT NULL,
  `creator_group` int(30) NOT NULL,
  `creator_guid` int(30) NOT NULL,
  `active_members` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `a` (`mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `instances`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `mailbox`
--

CREATE TABLE IF NOT EXISTS `mailbox` (
  `message_id` int(30) NOT NULL auto_increment,
  `message_type` int(30) NOT NULL default '0',
  `player_guid` int(30) NOT NULL default '0',
  `sender_guid` int(30) NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `body` varchar(4096) NOT NULL,
  `money` int(30) NOT NULL default '0',
  `attached_item_guids` varchar(200) NOT NULL default '',
  `cod` int(30) NOT NULL default '0',
  `stationary` int(30) NOT NULL default '0',
  `expiry_time` int(30) NOT NULL default '0',
  `delivery_time` int(30) NOT NULL default '0',
  `copy_made` int(30) NOT NULL default '0',
  `read_flag` int(30) NOT NULL default '0',
  `deleted_flag` int(30) NOT NULL default '0',
  `returned_flag` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`message_id`),
  KEY `b` (`player_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `mailbox`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `mailbox_insert_queue`
--

CREATE TABLE IF NOT EXISTS `mailbox_insert_queue` (
  `sender_guid` int(30) NOT NULL,
  `receiver_guid` int(30) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` varchar(500) NOT NULL,
  `stationary` int(30) NOT NULL,
  `money` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `item_stack` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `mailbox_insert_queue`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `news_timers`
--

CREATE TABLE IF NOT EXISTS `news_timers` (
  `id` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `news_timers`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercooldowns`
--

CREATE TABLE IF NOT EXISTS `playercooldowns` (
  `player_guid` int(30) NOT NULL,
  `cooldown_type` int(30) NOT NULL,
  `cooldown_misc` int(30) NOT NULL,
  `cooldown_expire_time` int(30) NOT NULL,
  `cooldown_spellid` int(30) NOT NULL,
  `cooldown_itemid` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `playercooldowns`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerglyphs`
--

CREATE TABLE IF NOT EXISTS `playerglyphs` (
  `guid` int(10) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL default '0',
  `glyph1` smallint(5) unsigned default NULL,
  `glyph2` smallint(5) unsigned default NULL,
  `glyph3` smallint(5) unsigned default NULL,
  `glyph4` smallint(5) unsigned default NULL,
  `glyph5` smallint(5) unsigned default NULL,
  `glyph6` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`guid`,`spec`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerglyphs`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playeritems`
--

CREATE TABLE IF NOT EXISTS `playeritems` (
  `ownerguid` int(10) unsigned NOT NULL default '0',
  `guid` bigint(10) NOT NULL auto_increment,
  `entry` int(10) unsigned NOT NULL default '0',
  `wrapped_item_id` int(30) NOT NULL default '0',
  `wrapped_creator` int(30) NOT NULL default '0',
  `creator` int(10) unsigned NOT NULL default '0',
  `count` int(10) unsigned NOT NULL default '0',
  `charges` int(10) unsigned NOT NULL default '0',
  `flags` int(10) unsigned NOT NULL default '0',
  `randomprop` int(10) unsigned NOT NULL default '0',
  `randomsuffix` int(30) default '0',
  `itemtext` int(10) unsigned NOT NULL default '0',
  `durability` int(10) unsigned NOT NULL default '0',
  `containerslot` int(11) default '-1',
  `slot` int(10) NOT NULL default '0',
  `enchantments` longtext NOT NULL,
  PRIMARY KEY  (`guid`),
  KEY `ownerguid` (`ownerguid`),
  KEY `itemtext` (`itemtext`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `playeritems`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playeritems_insert_queue`
--

CREATE TABLE IF NOT EXISTS `playeritems_insert_queue` (
  `ownerguid` int(10) unsigned NOT NULL default '0',
  `guid` bigint(10) NOT NULL default '0',
  `entry` int(10) unsigned NOT NULL default '0',
  `wrapped_item_id` int(30) NOT NULL default '0',
  `wrapped_creator` int(30) NOT NULL default '0',
  `creator` int(10) unsigned NOT NULL default '0',
  `count` int(10) unsigned NOT NULL default '0',
  `charges` int(10) unsigned NOT NULL default '0',
  `flags` int(10) unsigned NOT NULL default '0',
  `randomprop` int(10) unsigned NOT NULL default '0',
  `randomsuffix` int(30) default '0',
  `itemtext` int(10) unsigned NOT NULL default '0',
  `durability` int(10) unsigned NOT NULL default '0',
  `containerslot` int(11) default '-1',
  `slot` int(10) NOT NULL default '0',
  `enchantments` longtext character set latin1 NOT NULL,
  KEY `ownerguid` (`ownerguid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `playeritems_insert_queue`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerpetactionbar`
--

CREATE TABLE IF NOT EXISTS `playerpetactionbar` (
  `ownerguid` bigint(20) NOT NULL default '0',
  `petnumber` int(11) NOT NULL default '0',
  `spellid_1` int(11) unsigned NOT NULL default '0',
  `spellid_2` int(11) unsigned NOT NULL default '0',
  `spellid_3` int(11) unsigned NOT NULL default '0',
  `spellid_4` int(11) unsigned NOT NULL default '0',
  `spellid_5` int(11) unsigned NOT NULL default '0',
  `spellid_6` int(11) unsigned NOT NULL default '0',
  `spellid_7` int(11) unsigned NOT NULL default '0',
  `spellid_8` int(11) unsigned NOT NULL default '0',
  `spellid_9` int(11) unsigned NOT NULL default '0',
  `spellid_10` int(11) unsigned NOT NULL default '0',
  `spellstate_1` int(11) unsigned NOT NULL default '0',
  `spellstate_2` int(11) unsigned NOT NULL default '0',
  `spellstate_3` int(11) unsigned NOT NULL default '0',
  `spellstate_4` int(11) unsigned NOT NULL default '0',
  `spellstate_5` int(11) unsigned NOT NULL default '0',
  `spellstate_6` int(11) unsigned NOT NULL default '0',
  `spellstate_7` int(11) unsigned NOT NULL default '0',
  `spellstate_8` int(11) unsigned NOT NULL default '0',
  `spellstate_9` int(11) unsigned NOT NULL default '0',
  `spellstate_10` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ownerguid`,`petnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `playerpetactionbar`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerpets`
--

CREATE TABLE IF NOT EXISTS `playerpets` (
  `ownerguid` bigint(20) NOT NULL default '0',
  `petnumber` int(11) NOT NULL default '0',
  `name` varchar(21) NOT NULL default '',
  `entry` bigint(20) NOT NULL default '0',
  `fields` longtext NOT NULL,
  `xp` int(11) NOT NULL default '0',
  `active` tinyint(1) NOT NULL default '1',
  `level` int(11) NOT NULL default '0',
  `happiness` int(11) NOT NULL default '0',
  `happinessupdate` int(11) NOT NULL default '0',
  `summon` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ownerguid`,`petnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerpets`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerpetspells`
--

CREATE TABLE IF NOT EXISTS `playerpetspells` (
  `ownerguid` bigint(100) NOT NULL default '0',
  `petnumber` int(100) NOT NULL default '0',
  `spellid` int(100) NOT NULL default '0',
  `flags` int(4) NOT NULL default '0',
  KEY `a` (`ownerguid`),
  KEY `b` (`petnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerpetspells`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerpettalents`
--

CREATE TABLE IF NOT EXISTS `playerpettalents` (
  `ownerguid` bigint(20) NOT NULL default '0',
  `petnumber` int(4) NOT NULL default '0',
  `talentid` int(11) NOT NULL default '0',
  `rank` tinyint(4) NOT NULL default '0',
  KEY `a` (`ownerguid`),
  KEY `b` (`petnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerpettalents`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerskills`
--

CREATE TABLE IF NOT EXISTS `playerskills` (
  `player_guid` int(11) NOT NULL default '0',
  `skill_id` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL,
  `currentlvl` int(11) NOT NULL default '1',
  `maxlvl` int(11) NOT NULL default '1',
  PRIMARY KEY  (`player_guid`,`skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerskills`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerskills_insert_queue`
--

CREATE TABLE IF NOT EXISTS `playerskills_insert_queue` (
  `player_guid` int(11) unsigned NOT NULL default '0',
  `skill_id` int(11) unsigned NOT NULL default '0',
  `type` int(11) unsigned NOT NULL,
  `currentlvl` int(11) unsigned NOT NULL default '1',
  `maxlvl` int(11) unsigned NOT NULL default '1',
  KEY `player_guid` (`player_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `playerskills_insert_queue`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playerspells`
--

CREATE TABLE IF NOT EXISTS `playerspells` (
  `guid` int(10) unsigned NOT NULL,
  `spellid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`guid`,`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playerspells`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playersummonspells`
--

CREATE TABLE IF NOT EXISTS `playersummonspells` (
  `ownerguid` bigint(20) NOT NULL default '0',
  `entryid` bigint(4) NOT NULL default '0',
  `spellid` int(4) NOT NULL default '0',
  KEY `a` (`ownerguid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playersummonspells`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `playertalents`
--

CREATE TABLE IF NOT EXISTS `playertalents` (
  `guid` int(10) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL default '0',
  `tid` smallint(5) unsigned NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`guid`,`spec`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `playertalents`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `prestartqueries`
--

CREATE TABLE IF NOT EXISTS `prestartqueries` (
  `Query` varchar(8192) NOT NULL,
  `SingleShot` int(1) unsigned NOT NULL default '1',
  `Seq` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Seq`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- A tábla adatainak kiíratása `prestartqueries`
--

INSERT INTO `prestartqueries` (`Query`, `SingleShot`, `Seq`) VALUES
('DELETE FROM T1 USING corpses T1 LEFT JOIN instances As T2 ON T1.instanceid = T2.id WHERE  T2.id IS NULL;', 0, 1),
('UPDATE characters SET banned=0,banReason='''' WHERE banned > 100 AND banned < UNIX_TIMESTAMP();', 0, 2),
('DELETE FROM guild_logs WHERE timestamp < (UNIX_TIMESTAMP()-1209600);', 0, 3),
('DELETE FROM guild_banklogs WHERE timestamp < (UNIX_TIMESTAMP()-1209600);', 0, 4),
('DELETE from playeritems WHERE count = 0;', 0, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `questlog`
--

CREATE TABLE IF NOT EXISTS `questlog` (
  `player_guid` int(11) unsigned NOT NULL default '0',
  `quest_id` int(10) unsigned NOT NULL default '0',
  `slot` int(20) unsigned NOT NULL default '0',
  `time_left` int(10) NOT NULL default '0',
  `explored_area1` int(20) unsigned NOT NULL default '0',
  `explored_area2` int(20) NOT NULL default '0',
  `explored_area3` int(20) unsigned NOT NULL default '0',
  `explored_area4` int(20) unsigned NOT NULL default '0',
  `mob_kill1` int(20) NOT NULL default '0',
  `mob_kill2` int(20) NOT NULL default '0',
  `mob_kill3` int(20) NOT NULL default '0',
  `mob_kill4` int(20) NOT NULL default '0',
  `slain` int(20) NOT NULL default '0',
  PRIMARY KEY  (`player_guid`,`quest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `questlog`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `questlog_insert_queue`
--

CREATE TABLE IF NOT EXISTS `questlog_insert_queue` (
  `player_guid` int(11) unsigned NOT NULL default '0',
  `quest_id` int(10) unsigned NOT NULL default '0',
  `slot` int(20) unsigned NOT NULL default '0',
  `time_left` int(10) NOT NULL default '0',
  `explored_area1` int(20) unsigned NOT NULL default '0',
  `explored_area2` int(20) NOT NULL default '0',
  `explored_area3` int(20) unsigned NOT NULL default '0',
  `explored_area4` int(20) unsigned NOT NULL default '0',
  `mob_kill1` int(20) unsigned NOT NULL default '0',
  `mob_kill2` int(20) unsigned NOT NULL default '0',
  `mob_kill3` int(20) unsigned NOT NULL default '0',
  `mob_kill4` int(20) unsigned NOT NULL default '0',
  `slain` int(20) unsigned NOT NULL default '0',
  KEY `player_guid` (`player_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `questlog_insert_queue`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `server_settings`
--

CREATE TABLE IF NOT EXISTS `server_settings` (
  `setting_id` varchar(200) NOT NULL,
  `setting_value` bigint(50) NOT NULL,
  PRIMARY KEY  (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `server_settings`
--

INSERT INTO `server_settings` (`setting_id`, `setting_value`) VALUES
('expansionupdate', 2564468),
('last_arena_update_time', 1262083096),
('last_dailies_reset_time', 1262083097),
('last_eventid_time', 1262083097);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `social_friends`
--

CREATE TABLE IF NOT EXISTS `social_friends` (
  `character_guid` int(30) NOT NULL,
  `friend_guid` int(30) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY  (`character_guid`,`friend_guid`),
  KEY `a` (`character_guid`),
  KEY `b` (`friend_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `social_friends`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `social_ignores`
--

CREATE TABLE IF NOT EXISTS `social_ignores` (
  `character_guid` int(30) NOT NULL,
  `ignore_guid` int(30) NOT NULL,
  PRIMARY KEY  (`character_guid`,`ignore_guid`),
  KEY `a` (`character_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `social_ignores`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `tutorials`
--

CREATE TABLE IF NOT EXISTS `tutorials` (
  `playerId` bigint(20) unsigned NOT NULL default '0',
  `tut0` bigint(20) unsigned NOT NULL default '0',
  `tut1` bigint(20) unsigned NOT NULL default '0',
  `tut2` bigint(20) unsigned NOT NULL default '0',
  `tut3` bigint(20) unsigned NOT NULL default '0',
  `tut4` bigint(20) unsigned NOT NULL default '0',
  `tut5` bigint(20) unsigned NOT NULL default '0',
  `tut6` bigint(20) unsigned NOT NULL default '0',
  `tut7` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`playerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `tutorials`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `worldstate_save_data`
--

CREATE TABLE IF NOT EXISTS `worldstate_save_data` (
  `setting_id` varchar(50) NOT NULL,
  `setting_value` varchar(200) NOT NULL,
  PRIMARY KEY  (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `worldstate_save_data`
--

