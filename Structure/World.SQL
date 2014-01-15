-- Létrehozás ideje: 2009. dec. 28. 22:27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- Tábla szerkezet: `achievement_rewards`
--

CREATE TABLE IF NOT EXISTS `achievement_rewards` (
  `achievementid` int(10) unsigned NOT NULL,
  `title_alliance` int(10) unsigned NOT NULL,
  `title_horde` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`achievementid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `ai_agents`
--

CREATE TABLE IF NOT EXISTS `ai_agents` (
  `entry` int(11) unsigned NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `cooldown` int(8) NOT NULL default '0',
  `chance` int(11) unsigned NOT NULL default '0',
  `maxcount` int(11) unsigned NOT NULL default '0',
  `spell` int(11) unsigned NOT NULL default '0',
  `spelltype` enum('ROOT','DAMAGE','AOEDAMAGE','INTERRUPT','FEAR','STUN','BUFF','DEBUFF','SUMMON','HEAL') NOT NULL default 'ROOT',
  `targettype_overwrite` int(11) NOT NULL default '-1',
  `cooldown_overwrite` int(11) NOT NULL default '-1',
  `floatMisc1` float NOT NULL default '0',
  `Misc2` int(11) unsigned NOT NULL default '0',
  `targettype` enum('RANDOMTARGET','TARGETLOCATION','CREATURELOCATION','SELF','OWNER') NOT NULL default 'RANDOMTARGET',
  PRIMARY KEY  (`entry`,`type`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='AI System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `ai_threattospellid`
--

CREATE TABLE IF NOT EXISTS `ai_threattospellid` (
  `spell` int(11) unsigned NOT NULL default '0',
  `mod` int(11) NOT NULL default '0',
  PRIMARY KEY  (`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='AI System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `areatriggers`
--

CREATE TABLE IF NOT EXISTS `areatriggers` (
  `entry` int(11) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned default '0',
  `map` int(11) unsigned default NULL,
  `screen` int(11) unsigned default NULL,
  `name` varchar(100) default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `required_honor_rank` int(11) unsigned NOT NULL default '0',
  `required_level` tinyint(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `auctionhouse`
--

CREATE TABLE IF NOT EXISTS `auctionhouse` (
  `id` int(32) NOT NULL auto_increment,
  `creature_entry` bigint(64) unsigned NOT NULL default '0',
  `group` int(32) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Auction House' AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `banned_names`
--

CREATE TABLE IF NOT EXISTS `banned_names` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Banned character names';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `clientaddons`
--

CREATE TABLE IF NOT EXISTS `clientaddons` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) character set utf8 collate utf8_unicode_ci default NULL,
  `crc` bigint(20) unsigned default NULL,
  `banned` int(10) unsigned NOT NULL default '0',
  `showinlist` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Client Addons' AUTO_INCREMENT=153 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `command_overrides`
--

CREATE TABLE IF NOT EXISTS `command_overrides` (
  `command_name` varchar(100) NOT NULL,
  `access_level` varchar(10) NOT NULL,
  PRIMARY KEY  (`command_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Commands System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creatureloot`
--

CREATE TABLE IF NOT EXISTS `creatureloot` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) NOT NULL default '1',
  `maxcount` int(11) NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creatureloot_gathering`
--

CREATE TABLE IF NOT EXISTS `creatureloot_gathering` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_formations`
--

CREATE TABLE IF NOT EXISTS `creature_formations` (
  `spawn_id` int(30) NOT NULL,
  `target_spawn_id` int(30) NOT NULL,
  `follow_angle` float NOT NULL default '0',
  `follow_dist` float NOT NULL default '0',
  PRIMARY KEY  (`spawn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_names`
--

CREATE TABLE IF NOT EXISTS `creature_names` (
  `entry` int(20) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `subname` varchar(100) NOT NULL default ' ',
  `info_str` varchar(500) NOT NULL,
  `Flags1` int(30) unsigned NOT NULL default '0',
  `type` int(30) NOT NULL default '0',
  `loot_skill_type` int(10) NOT NULL default '1',
  `family` int(30) NOT NULL default '0',
  `rank` int(30) NOT NULL default '0',
  `unk4` int(30) NOT NULL default '0',
  `spelldataid` int(30) NOT NULL default '0',
  `male_displayid` int(30) NOT NULL,
  `female_displayid` int(30) NOT NULL,
  `male_displayid2` int(30) NOT NULL default '0',
  `female_displayid2` int(30) NOT NULL default '0',
  `unknown_float1` float NOT NULL default '0',
  `unknown_float2` float NOT NULL default '0',
  `civilian` tinyint(30) NOT NULL default '0',
  `leader` tinyint(30) NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_names_localized`
--

CREATE TABLE IF NOT EXISTS `creature_names_localized` (
  `id` int(30) unsigned NOT NULL,
  `language_code` varchar(5) character set latin1 NOT NULL,
  `name` varchar(100) collate utf8_unicode_ci NOT NULL,
  `subname` varchar(100) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_proto`
--

CREATE TABLE IF NOT EXISTS `creature_proto` (
  `entry` int(30) unsigned NOT NULL default '0',
  `minlevel` int(30) unsigned NOT NULL,
  `maxlevel` int(30) unsigned NOT NULL,
  `faction` int(30) unsigned NOT NULL default '0',
  `minhealth` int(30) unsigned NOT NULL,
  `maxhealth` int(30) unsigned NOT NULL,
  `mana` int(30) unsigned NOT NULL default '0',
  `scale` float NOT NULL default '0',
  `npcflags` int(30) unsigned NOT NULL default '0',
  `attacktime` int(30) unsigned NOT NULL default '0',
  `attacktype` int(4) unsigned NOT NULL default '0',
  `mindamage` float NOT NULL default '0',
  `maxdamage` float NOT NULL default '0',
  `rangedattacktime` int(30) unsigned NOT NULL default '0',
  `rangedmindamage` float unsigned NOT NULL default '0',
  `rangedmaxdamage` float unsigned NOT NULL default '0',
  `Item1` int(30) unsigned NOT NULL default '0',
  `Item2` int(30) unsigned NOT NULL default '0',
  `Item3` int(30) unsigned NOT NULL default '0',
  `RespawnTime` int(30) unsigned NOT NULL default '0',
  `resistance1` int(30) unsigned NOT NULL default '0',
  `resistance2` int(30) unsigned NOT NULL default '0',
  `resistance3` int(30) unsigned NOT NULL default '0',
  `resistance4` int(30) unsigned NOT NULL default '0',
  `resistance5` int(30) unsigned NOT NULL default '0',
  `resistance6` int(30) unsigned NOT NULL default '0',
  `resistance7` int(30) NOT NULL default '0',
  `combat_reach` float NOT NULL default '1',
  `bounding_radius` float NOT NULL default '1',
  `auras` longtext NOT NULL,
  `boss` int(11) unsigned NOT NULL default '0',
  `minmoney` int(30) unsigned NOT NULL default '0',
  `maxmoney` int(30) default '0',
  `no_XP` int(11) NOT NULL default '0',
  `invisibility_type` int(30) unsigned NOT NULL default '0',
  `death_state` int(30) unsigned NOT NULL default '0',
  `walk_speed` float NOT NULL default '2.5',
  `run_speed` float NOT NULL default '8',
  `fly_speed` float NOT NULL default '14',
  `extra_a9_flags` int(30) unsigned NOT NULL default '0',
  `auraimmune_flag` int(10) unsigned NOT NULL default '0',
  `vehicle_entry` int(11) NOT NULL default '-1',
  `CanMove` int(11) NOT NULL default '7',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_proto_heroic`
--

CREATE TABLE IF NOT EXISTS `creature_proto_heroic` (
  `entry` int(10) NOT NULL,
  `minlevel` int(10) unsigned NOT NULL default '1',
  `maxlevel` int(10) unsigned NOT NULL default '1',
  `minhealth` int(10) NOT NULL default '1',
  `maxhealth` int(10) NOT NULL default '1',
  `mindmg` float NOT NULL default '1',
  `maxdmg` float NOT NULL default '1',
  `mana` int(10) NOT NULL default '1',
  `resistance1` int(10) NOT NULL default '0',
  `resistance2` int(10) NOT NULL default '0',
  `resistance3` int(10) NOT NULL default '0',
  `resistance4` int(10) NOT NULL default '0',
  `resistance5` int(10) NOT NULL default '0',
  `resistance6` int(10) NOT NULL default '0',
  `resistance7` int(10) NOT NULL default '0',
  `auras` longtext NOT NULL,
  `auraimmune_flag` int(10) NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_quest_finisher`
--

CREATE TABLE IF NOT EXISTS `creature_quest_finisher` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_quest_starter`
--

CREATE TABLE IF NOT EXISTS `creature_quest_starter` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_spawns`
--

CREATE TABLE IF NOT EXISTS `creature_spawns` (
  `id` int(30) NOT NULL auto_increment,
  `entry` int(10) unsigned NOT NULL,
  `map` int(10) unsigned NOT NULL,
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `orientation` float NOT NULL,
  `movetype` int(10) unsigned NOT NULL default '0',
  `displayid` int(10) unsigned NOT NULL default '0',
  `faction` int(10) unsigned NOT NULL default '14',
  `flags` int(10) unsigned NOT NULL default '0',
  `bytes` int(30) NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote_state` int(10) unsigned NOT NULL default '0',
  `channel_spell` int(10) unsigned NOT NULL default '0',
  `channel_target_sqlid_go` int(30) unsigned NOT NULL default '0',
  `channel_target_sqlid_creature` int(10) unsigned NOT NULL default '0',
  `standstate` int(10) unsigned NOT NULL default '0',
  `MountedDisplayID` int(10) NOT NULL default '0',
  `phase` int(11) NOT NULL default '1',
  `vehicle` int(10) NOT NULL default '0',
  `eventid` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Relates to events table',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Spawn System' AUTO_INCREMENT=137043 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_spawns_brewfest`
--

CREATE TABLE IF NOT EXISTS `creature_spawns_brewfest` (
  `id` int(30) NOT NULL auto_increment,
  `entry` int(30) NOT NULL,
  `map` int(30) NOT NULL,
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `orientation` float NOT NULL,
  `movetype` int(30) NOT NULL default '0',
  `displayid` int(30) unsigned NOT NULL default '0',
  `faction` int(30) NOT NULL default '35',
  `flags` int(30) NOT NULL default '0',
  `bytes` int(30) NOT NULL default '0',
  `bytes1` int(30) NOT NULL default '0',
  `bytes2` int(30) NOT NULL default '0',
  `emote_state` int(30) NOT NULL default '0',
  `npc_respawn_link` int(30) NOT NULL default '0',
  `channel_spell` int(30) unsigned NOT NULL default '0',
  `channel_target_sqlid` int(30) NOT NULL default '0',
  `channel_target_sqlid_creature` int(30) NOT NULL default '0',
  `standstate` int(10) NOT NULL default '0',
  `MounteddisplayID` int(10) NOT NULL default '0',
  `Phase` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_staticspawns`
--

CREATE TABLE IF NOT EXISTS `creature_staticspawns` (
  `id` int(30) unsigned NOT NULL auto_increment,
  `entry` int(10) unsigned NOT NULL,
  `map` int(10) unsigned NOT NULL,
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `orientation` float NOT NULL,
  `movetype` int(10) unsigned NOT NULL default '0',
  `displayid` int(10) unsigned NOT NULL default '0',
  `faction` int(30) NOT NULL default '35',
  `flags` int(10) unsigned NOT NULL default '0',
  `bytes` int(30) NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote_state` int(10) unsigned NOT NULL default '0',
  `npc_respawn_link` int(10) unsigned NOT NULL default '0',
  `slot1item` int(10) unsigned NOT NULL default '0',
  `slot2item` int(10) unsigned NOT NULL default '0',
  `slot3item` int(10) unsigned NOT NULL default '0',
  `CanFly` tinyint(1) unsigned NOT NULL default '0',
  `channel_spell` int(30) unsigned NOT NULL default '0',
  `channel_target_sqlid` int(30) NOT NULL default '0',
  `channel_target_sqlid_creature` int(30) NOT NULL default '0',
  `standstate` int(10) NOT NULL default '0',
  `MounteddisplayID` int(10) NOT NULL default '0',
  `Phase` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spawn System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `creature_waypoints`
--

CREATE TABLE IF NOT EXISTS `creature_waypoints` (
  `spawnid` int(10) NOT NULL,
  `waypointid` int(10) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `waittime` int(6) NOT NULL default '0',
  `flags` int(10) unsigned NOT NULL default '0',
  `forwardemoteoneshot` int(1) NOT NULL default '0',
  `forwardemoteid` int(4) NOT NULL default '0',
  `backwardemoteoneshot` int(1) NOT NULL default '0',
  `backwardemoteid` int(4) NOT NULL default '0',
  `forwardskinid` int(10) unsigned NOT NULL default '0',
  `backwardskinid` int(10) unsigned NOT NULL default '0',
  `forwardStandState` int(11) NOT NULL default '0',
  `backwardStandState` int(11) NOT NULL default '0',
  `forwardSpellToCast` int(11) NOT NULL default '0',
  `backwardSpellToCast` int(11) NOT NULL default '0',
  `forwardSayText` varchar(1024) NOT NULL default '',
  `backwardSaytext` varchar(1024) NOT NULL default '',
  PRIMARY KEY  (`spawnid`,`waypointid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `db_version`
--

CREATE TABLE IF NOT EXISTS `db_version` (
  `db_name` varchar(255) collate latin1_general_ci NOT NULL COMMENT 'Name of the database',
  `revision` int(10) unsigned NOT NULL default '0' COMMENT 'svn revision number',
  `changeset` int(10) unsigned NOT NULL default '0' COMMENT 'changeset number',
  `game_version` varchar(255) collate latin1_general_ci NOT NULL,
  `AscNHalf_rev` int(10) unsigned NOT NULL,
  `latest_update` varchar(255) collate latin1_general_ci NOT NULL,
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `disenchantingloot`
--

CREATE TABLE IF NOT EXISTS `disenchantingloot` (
  `entryid` int(11) unsigned NOT NULL default '0',
  `itemid` int(11) unsigned NOT NULL default '25',
  `percentchance` float NOT NULL default '0',
  `heroicpercentchance` float default '0',
  `mincount` int(30) default '1',
  `maxcount` int(30) default '1',
  `ffa_loot` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `entryid` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `eventid` tinyint(3) unsigned NOT NULL COMMENT 'Id of event you want to trigger',
  `daynumber` tinyint(3) unsigned NOT NULL COMMENT '1 - 31 day of the month you want to trigger event',
  `monthnumber` tinyint(3) unsigned default '0' COMMENT '1 - 12 month of the year you want to trigger event',
  `eventname` varchar(255) collate utf8_unicode_ci default NULL COMMENT 'Just for human readable purposes, this is not used by the server at all',
  `activedays` tinyint(3) unsigned default NULL COMMENT 'Number of days the event will remain active',
  `ishourlyevent` tinyint(1) default NULL COMMENT 'Is this an hourly event? This cannot be used in conjunction with daily events',
  `starthour` tinyint(3) unsigned default NULL COMMENT '0 - 23 the hour that the event begins',
  `endhour` tinyint(3) unsigned default NULL COMMENT '0 - 23 the hour that the event ends, if this is smaller that the starthour, it will end on the next day',
  PRIMARY KEY  (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `events_creature`
--

CREATE TABLE IF NOT EXISTS `events_creature` (
  `eventid` tinyint(3) unsigned NOT NULL COMMENT 'Relates to creature_spawn eventid',
  `id` tinyint(3) unsigned NOT NULL COMMENT 'Relates to creature_spawn id',
  `changesflag` tinyint(1) NOT NULL default '0' COMMENT 'See enum in the core for permissable flags in World.h',
  `phase` tinyint(3) default NULL COMMENT 'This is the phase the creature is in when the event is active',
  `displayid` int(10) unsigned default NULL COMMENT 'This is the displayid to change to while the event is active',
  `item1` int(10) unsigned default NULL COMMENT 'This is the id of equip slot 1 to change while the event is active',
  `item2` int(10) unsigned default NULL COMMENT 'This is the id of equip slot 2 to change while the event is active',
  `item3` int(10) unsigned default NULL COMMENT 'This is the id of equip slot 3 to change while the event is active',
  PRIMARY KEY  (`eventid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `events_gameobject`
--

CREATE TABLE IF NOT EXISTS `events_gameobject` (
  `eventid` tinyint(3) unsigned NOT NULL COMMENT 'This relates to gameobject_spawns eventid',
  `id` int(11) unsigned NOT NULL COMMENT 'Relates to gameobject_spawn id',
  `changesflag` tinyint(1) NOT NULL default '0' COMMENT 'See enum in core for permissable flags in World.h',
  `phase` tinyint(3) default NULL COMMENT 'Phase the go is in when the event is active',
  `displayid` int(10) unsigned default NULL COMMENT 'This is the displayid to change to while the event is active',
  PRIMARY KEY  (`eventid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `fishing`
--

CREATE TABLE IF NOT EXISTS `fishing` (
  `Zone` int(11) unsigned NOT NULL default '0',
  `MinSkill` int(11) unsigned default NULL,
  `MaxSkill` int(11) unsigned default NULL,
  PRIMARY KEY  (`Zone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Fishing System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `fishingloot`
--

CREATE TABLE IF NOT EXISTS `fishingloot` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_names`
--

CREATE TABLE IF NOT EXISTS `gameobject_names` (
  `entry` int(20) unsigned NOT NULL,
  `Type` int(100) unsigned NOT NULL default '0',
  `DisplayID` int(100) unsigned NOT NULL default '0',
  `Name` varchar(100) NOT NULL default '0',
  `spellfocus` int(30) NOT NULL default '0',
  `sound1` int(30) NOT NULL default '0',
  `sound2` int(30) NOT NULL default '0',
  `sound3` int(30) NOT NULL default '0',
  `sound4` int(30) NOT NULL default '0',
  `sound5` int(30) NOT NULL default '0',
  `sound6` int(30) NOT NULL default '0',
  `sound7` int(30) NOT NULL default '0',
  `sound8` int(30) NOT NULL default '0',
  `sound9` int(30) NOT NULL default '0',
  `unknown1` int(30) NOT NULL default '0',
  `unknown2` int(30) NOT NULL default '0',
  `unknown3` int(30) NOT NULL default '0',
  `unknown4` int(30) NOT NULL default '0',
  `unknown5` int(30) NOT NULL default '0',
  `unknown6` int(30) NOT NULL default '0',
  `unknown7` int(30) NOT NULL default '0',
  `unknown8` int(30) NOT NULL default '0',
  `unknown9` int(30) NOT NULL default '0',
  `unknown10` int(30) NOT NULL default '0',
  `unknown11` int(30) NOT NULL default '0',
  `unknown12` int(30) NOT NULL default '0',
  `unknown13` int(30) NOT NULL default '0',
  `unknown14` int(30) NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Gameobject System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_names_localized`
--

CREATE TABLE IF NOT EXISTS `gameobject_names_localized` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) character set latin1 NOT NULL,
  `name` varchar(100) character set latin1 NOT NULL,
  PRIMARY KEY  (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_quest_finisher`
--

CREATE TABLE IF NOT EXISTS `gameobject_quest_finisher` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_quest_item_binding`
--

CREATE TABLE IF NOT EXISTS `gameobject_quest_item_binding` (
  `entry` int(10) unsigned NOT NULL default '0',
  `quest` int(10) unsigned NOT NULL default '0',
  `item` int(10) unsigned NOT NULL default '0',
  `item_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`quest`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_quest_pickup_binding`
--

CREATE TABLE IF NOT EXISTS `gameobject_quest_pickup_binding` (
  `entry` int(10) unsigned NOT NULL default '0',
  `quest` int(10) unsigned NOT NULL default '0',
  `required_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_quest_starter`
--

CREATE TABLE IF NOT EXISTS `gameobject_quest_starter` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_spawns`
--

CREATE TABLE IF NOT EXISTS `gameobject_spawns` (
  `ID` int(30) NOT NULL default '0',
  `Entry` int(10) unsigned NOT NULL default '0',
  `Map` int(30) NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `Facing` float NOT NULL default '0',
  `orientation1` float NOT NULL default '0',
  `orientation2` float NOT NULL default '0',
  `orientation3` float NOT NULL default '0',
  `orientation4` float NOT NULL default '0',
  `State` int(10) unsigned NOT NULL default '0',
  `Flags` int(10) unsigned NOT NULL default '0',
  `Faction` int(10) unsigned NOT NULL default '0',
  `Scale` float NOT NULL default '0',
  `phase` int(11) NOT NULL default '1',
  `eventid` tinyint(3) unsigned NOT NULL default '0' COMMENT 'relates to events table',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Spawn System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `gameobject_staticspawns`
--

CREATE TABLE IF NOT EXISTS `gameobject_staticspawns` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `entry` int(10) unsigned NOT NULL,
  `map` int(10) unsigned NOT NULL default '0',
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `Facing` float NOT NULL,
  `o1` float NOT NULL,
  `o2` float NOT NULL,
  `o3` float NOT NULL,
  `o4` float NOT NULL,
  `State` int(10) unsigned NOT NULL default '0',
  `Flags` int(10) unsigned NOT NULL default '0',
  `Faction` int(10) unsigned NOT NULL default '0',
  `scale` float NOT NULL,
  `phase` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spawn System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `graveyards`
--

CREATE TABLE IF NOT EXISTS `graveyards` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `zoneid` int(10) unsigned NOT NULL default '0',
  `adjacentzoneid` int(10) unsigned NOT NULL default '0',
  `mapid` int(10) unsigned NOT NULL default '0',
  `faction` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Graveyard System' AUTO_INCREMENT=2001 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `itemloot`
--

CREATE TABLE IF NOT EXISTS `itemloot` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `itempages`
--

CREATE TABLE IF NOT EXISTS `itempages` (
  `entry` int(10) unsigned NOT NULL default '0',
  `text` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `next_page` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `itempages_localized`
--

CREATE TABLE IF NOT EXISTS `itempages_localized` (
  `entry` int(10) unsigned NOT NULL,
  `language_code` varchar(5) character set latin1 NOT NULL,
  `text` text collate utf8_unicode_ci,
  PRIMARY KEY  (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `itempetfood`
--

CREATE TABLE IF NOT EXISTS `itempetfood` (
  `entry` int(10) unsigned NOT NULL,
  `food_type` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `entry` int(30) unsigned NOT NULL default '0',
  `class` int(10) unsigned NOT NULL default '0',
  `subclass` int(10) unsigned NOT NULL default '0',
  `field4` int(10) NOT NULL default '-1',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL default '',
  `name3` varchar(255) NOT NULL default '',
  `name4` varchar(255) NOT NULL default '',
  `displayid` int(10) unsigned NOT NULL default '0',
  `quality` int(10) unsigned NOT NULL default '0',
  `flags` int(10) unsigned NOT NULL default '0',
  `faction` int(10) unsigned NOT NULL default '0',
  `buyprice` int(30) NOT NULL default '0',
  `sellprice` int(10) unsigned NOT NULL default '0',
  `inventorytype` int(10) unsigned NOT NULL default '0',
  `allowableclass` int(10) NOT NULL default '0',
  `allowablerace` int(10) NOT NULL default '0',
  `itemlevel` int(10) unsigned NOT NULL default '0',
  `requiredlevel` int(10) unsigned NOT NULL default '0',
  `RequiredSkill` int(10) unsigned NOT NULL default '0',
  `RequiredSkillRank` int(10) unsigned NOT NULL default '0',
  `RequiredSpell` int(10) unsigned NOT NULL default '0',
  `RequiredPlayerRank1` int(10) unsigned NOT NULL default '0',
  `RequiredPlayerRank2` int(10) unsigned NOT NULL default '0',
  `RequiredFaction` int(10) unsigned NOT NULL default '0',
  `RequiredFactionStanding` int(10) unsigned NOT NULL default '0',
  `Unique` int(10) unsigned NOT NULL default '0',
  `maxcount` int(10) unsigned NOT NULL default '0',
  `ContainerSlots` int(10) unsigned NOT NULL default '0',
  `stat_type1` int(10) unsigned NOT NULL default '0',
  `stat_value1` int(10) NOT NULL default '0',
  `stat_type2` int(10) unsigned NOT NULL default '0',
  `stat_value2` int(10) NOT NULL default '0',
  `stat_type3` int(10) unsigned NOT NULL default '0',
  `stat_value3` int(10) NOT NULL default '0',
  `stat_type4` int(10) unsigned NOT NULL default '0',
  `stat_value4` int(10) NOT NULL default '0',
  `stat_type5` int(10) unsigned NOT NULL default '0',
  `stat_value5` int(10) NOT NULL default '0',
  `stat_type6` int(10) unsigned NOT NULL default '0',
  `stat_value6` int(10) NOT NULL default '0',
  `stat_type7` int(10) unsigned NOT NULL default '0',
  `stat_value7` int(10) NOT NULL default '0',
  `stat_type8` int(10) unsigned NOT NULL default '0',
  `stat_value8` int(10) NOT NULL default '0',
  `stat_type9` int(10) unsigned NOT NULL default '0',
  `stat_value9` int(10) NOT NULL default '0',
  `stat_type10` int(10) unsigned NOT NULL default '0',
  `stat_value10` int(10) NOT NULL default '0',
  `dmg_min1` float NOT NULL default '0',
  `dmg_max1` float NOT NULL default '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min2` float NOT NULL default '0',
  `dmg_max2` float NOT NULL default '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min3` float NOT NULL default '0',
  `dmg_max3` float NOT NULL default '0',
  `dmg_type3` int(30) NOT NULL default '0',
  `dmg_min4` float NOT NULL default '0',
  `dmg_max4` float NOT NULL default '0',
  `dmg_type4` int(30) NOT NULL default '0',
  `dmg_min5` float NOT NULL default '0',
  `dmg_max5` float NOT NULL default '0',
  `dmg_type5` int(30) NOT NULL default '0',
  `armor` int(10) unsigned NOT NULL default '0',
  `holy_res` int(10) unsigned NOT NULL default '0',
  `fire_res` int(10) unsigned NOT NULL default '0',
  `nature_res` int(10) unsigned NOT NULL default '0',
  `frost_res` int(10) unsigned NOT NULL default '0',
  `shadow_res` int(10) unsigned NOT NULL default '0',
  `arcane_res` int(10) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `ammo_type` int(10) unsigned NOT NULL default '0',
  `range` float NOT NULL default '0',
  `spellid_1` int(10) unsigned NOT NULL default '0',
  `spelltrigger_1` int(10) unsigned NOT NULL default '0',
  `spellcharges_1` int(10) NOT NULL default '0',
  `spellcooldown_1` int(10) NOT NULL default '0',
  `spellcategory_1` int(10) unsigned NOT NULL default '0',
  `spellcategorycooldown_1` int(10) NOT NULL default '0',
  `spellid_2` int(10) unsigned NOT NULL default '0',
  `spelltrigger_2` int(10) unsigned NOT NULL default '0',
  `spellcharges_2` int(10) NOT NULL default '0',
  `spellcooldown_2` int(10) NOT NULL default '0',
  `spellcategory_2` int(10) unsigned NOT NULL default '0',
  `spellcategorycooldown_2` int(10) NOT NULL default '0',
  `spellid_3` int(10) unsigned NOT NULL default '0',
  `spelltrigger_3` int(10) unsigned NOT NULL default '0',
  `spellcharges_3` int(10) NOT NULL default '0',
  `spellcooldown_3` int(10) NOT NULL default '0',
  `spellcategory_3` int(10) unsigned NOT NULL default '0',
  `spellcategorycooldown_3` int(10) NOT NULL default '0',
  `spellid_4` int(10) unsigned NOT NULL default '0',
  `spelltrigger_4` int(10) unsigned NOT NULL default '0',
  `spellcharges_4` int(10) NOT NULL default '0',
  `spellcooldown_4` int(10) NOT NULL default '0',
  `spellcategory_4` int(10) unsigned NOT NULL default '0',
  `spellcategorycooldown_4` int(10) NOT NULL default '0',
  `spellid_5` int(10) unsigned NOT NULL default '0',
  `spelltrigger_5` int(10) unsigned NOT NULL default '0',
  `spellcharges_5` int(10) NOT NULL default '0',
  `spellcooldown_5` int(10) NOT NULL default '0',
  `spellcategory_5` int(10) unsigned NOT NULL default '0',
  `spellcategorycooldown_5` int(10) NOT NULL default '0',
  `bonding` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `page_id` int(10) unsigned NOT NULL default '0',
  `page_language` int(10) unsigned NOT NULL default '0',
  `page_material` int(10) unsigned NOT NULL default '0',
  `quest_id` int(10) unsigned NOT NULL default '0',
  `lock_id` int(10) unsigned NOT NULL default '0',
  `lock_material` int(10) NOT NULL default '0',
  `sheathID` int(10) unsigned NOT NULL default '0',
  `randomprop` int(10) unsigned NOT NULL default '0',
  `RandomSuffixId` int(11) NOT NULL default '0',
  `block` int(10) unsigned NOT NULL default '0',
  `itemset` int(10) unsigned NOT NULL default '0',
  `MaxDurability` int(10) unsigned NOT NULL default '0',
  `ZoneNameID` int(10) unsigned NOT NULL default '0',
  `mapid` int(10) unsigned NOT NULL default '0',
  `bagfamily` int(10) unsigned NOT NULL default '0',
  `TotemCategory` int(10) unsigned NOT NULL default '0',
  `socket_color_1` int(10) unsigned NOT NULL default '0',
  `unk201_3` int(10) unsigned NOT NULL default '0',
  `socket_color_2` int(10) unsigned NOT NULL default '0',
  `unk201_5` int(10) unsigned NOT NULL default '0',
  `socket_color_3` int(10) unsigned NOT NULL default '0',
  `unk201_7` int(10) unsigned NOT NULL default '0',
  `socket_bonus` int(10) unsigned default '0',
  `GemProperties` int(10) unsigned default '0',
  `ReqDisenchantSkill` int(10) NOT NULL default '-1',
  `ArmorDamageModifier` int(10) NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `items_localized`
--

CREATE TABLE IF NOT EXISTS `items_localized` (
  `entry` int(10) unsigned NOT NULL,
  `language_code` varchar(5) character set utf8 NOT NULL,
  `name` varchar(255) character set utf8 NOT NULL,
  `description` varchar(255) character set utf8 NOT NULL,
  PRIMARY KEY  (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `item_quest_association`
--

CREATE TABLE IF NOT EXISTS `item_quest_association` (
  `item` int(10) unsigned NOT NULL default '0',
  `quest` int(10) unsigned NOT NULL default '0',
  `item_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `item_randomprop_groups`
--

CREATE TABLE IF NOT EXISTS `item_randomprop_groups` (
  `entry_id` int(10) unsigned NOT NULL,
  `randomprops_entryid` int(10) unsigned NOT NULL,
  `chance` float NOT NULL,
  PRIMARY KEY  (`entry_id`,`randomprops_entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `item_randomsuffix_groups`
--

CREATE TABLE IF NOT EXISTS `item_randomsuffix_groups` (
  `entry_id` int(10) unsigned NOT NULL,
  `randomsuffix_entryid` int(10) unsigned NOT NULL,
  `chance` float NOT NULL,
  PRIMARY KEY  (`entry_id`,`randomsuffix_entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `lootrandomprop`
--

CREATE TABLE IF NOT EXISTS `lootrandomprop` (
  `entryid` int(11) NOT NULL default '0',
  `propid` int(11) NOT NULL default '0',
  `percentchance` float NOT NULL,
  PRIMARY KEY  (`entryid`,`propid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `map_checkpoint`
--

CREATE TABLE IF NOT EXISTS `map_checkpoint` (
  `entry` int(30) NOT NULL,
  `prereq_checkpoint_id` int(30) NOT NULL,
  `creature_id` int(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Map System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `millingloot`
--

CREATE TABLE IF NOT EXISTS `millingloot` (
  `entryid` int(11) unsigned NOT NULL default '0',
  `itemid` int(11) unsigned NOT NULL default '0',
  `percentchance` float NOT NULL default '0',
  `heroicpercentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `entryid` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `news_announcements`
--

CREATE TABLE IF NOT EXISTS `news_announcements` (
  `id` int(30) unsigned NOT NULL auto_increment,
  `faction_mask` int(30) NOT NULL,
  `message_text` varchar(500) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `npc_gossip_textid`
--

CREATE TABLE IF NOT EXISTS `npc_gossip_textid` (
  `creatureid` int(10) unsigned NOT NULL default '0',
  `textid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`creatureid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `npc_monstersay`
--

CREATE TABLE IF NOT EXISTS `npc_monstersay` (
  `entry` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `chance` float NOT NULL,
  `language` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `monstername` longtext,
  `text0` longtext,
  `text1` longtext,
  `text2` longtext,
  `text3` longtext,
  `text4` longtext,
  UNIQUE KEY `entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `npc_text`
--

CREATE TABLE IF NOT EXISTS `npc_text` (
  `entry` int(10) unsigned NOT NULL default '0',
  `prob0` float NOT NULL default '0',
  `text0_0` longtext NOT NULL,
  `text0_1` longtext NOT NULL,
  `lang0` int(10) unsigned NOT NULL default '0',
  `em0_0` int(10) unsigned NOT NULL default '0',
  `em0_1` int(10) unsigned NOT NULL default '0',
  `em0_2` int(10) unsigned NOT NULL default '0',
  `em0_3` int(10) unsigned NOT NULL default '0',
  `em0_4` int(10) unsigned NOT NULL default '0',
  `em0_5` int(10) unsigned NOT NULL default '0',
  `prob1` float NOT NULL default '0',
  `text1_0` longtext NOT NULL,
  `text1_1` longtext NOT NULL,
  `lang1` int(10) unsigned NOT NULL default '0',
  `em1_0` int(10) unsigned NOT NULL default '0',
  `em1_1` int(10) unsigned NOT NULL default '0',
  `em1_2` int(10) unsigned NOT NULL default '0',
  `em1_3` int(10) unsigned NOT NULL default '0',
  `em1_4` int(10) unsigned NOT NULL default '0',
  `em1_5` int(10) unsigned NOT NULL default '0',
  `prob2` float NOT NULL default '0',
  `text2_0` longtext NOT NULL,
  `text2_1` longtext NOT NULL,
  `lang2` int(10) unsigned NOT NULL default '0',
  `em2_0` int(10) unsigned NOT NULL default '0',
  `em2_1` int(10) unsigned NOT NULL default '0',
  `em2_2` int(10) unsigned NOT NULL default '0',
  `em2_3` int(10) unsigned NOT NULL default '0',
  `em2_4` int(10) unsigned NOT NULL default '0',
  `em2_5` int(10) unsigned NOT NULL default '0',
  `prob3` float NOT NULL default '0',
  `text3_0` longtext NOT NULL,
  `text3_1` longtext NOT NULL,
  `lang3` int(10) unsigned NOT NULL default '0',
  `em3_0` int(10) unsigned NOT NULL default '0',
  `em3_1` int(10) unsigned NOT NULL default '0',
  `em3_2` int(10) unsigned NOT NULL default '0',
  `em3_3` int(10) unsigned NOT NULL default '0',
  `em3_4` int(10) unsigned NOT NULL default '0',
  `em3_5` int(10) unsigned NOT NULL default '0',
  `prob4` float NOT NULL default '0',
  `text4_0` longtext NOT NULL,
  `text4_1` longtext NOT NULL,
  `lang4` int(10) unsigned NOT NULL default '0',
  `em4_0` int(10) unsigned NOT NULL default '0',
  `em4_1` int(10) unsigned NOT NULL default '0',
  `em4_2` int(10) unsigned NOT NULL default '0',
  `em4_3` int(10) unsigned NOT NULL default '0',
  `em4_4` int(10) unsigned NOT NULL default '0',
  `em4_5` int(10) unsigned NOT NULL default '0',
  `prob5` float NOT NULL default '0',
  `text5_0` longtext NOT NULL,
  `text5_1` longtext NOT NULL,
  `lang5` int(10) unsigned NOT NULL default '0',
  `em5_0` int(10) unsigned NOT NULL default '0',
  `em5_1` int(10) unsigned NOT NULL default '0',
  `em5_2` int(10) unsigned NOT NULL default '0',
  `em5_3` int(10) unsigned NOT NULL default '0',
  `em5_4` int(10) unsigned NOT NULL default '0',
  `em5_5` int(10) unsigned NOT NULL default '0',
  `prob6` float NOT NULL default '0',
  `text6_0` longtext NOT NULL,
  `text6_1` longtext NOT NULL,
  `lang6` int(10) unsigned NOT NULL default '0',
  `em6_0` int(10) unsigned NOT NULL default '0',
  `em6_1` int(10) unsigned NOT NULL default '0',
  `em6_2` int(10) unsigned NOT NULL default '0',
  `em6_3` int(10) unsigned NOT NULL default '0',
  `em6_4` int(10) unsigned NOT NULL default '0',
  `em6_5` int(10) unsigned NOT NULL default '0',
  `prob7` float NOT NULL default '0',
  `text7_0` longtext NOT NULL,
  `text7_1` longtext NOT NULL,
  `lang7` int(10) unsigned NOT NULL default '0',
  `em7_0` int(10) unsigned NOT NULL default '0',
  `em7_1` int(10) unsigned NOT NULL default '0',
  `em7_2` int(10) unsigned NOT NULL default '0',
  `em7_3` int(10) unsigned NOT NULL default '0',
  `em7_4` int(10) unsigned NOT NULL default '0',
  `em7_5` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `npc_text_localized`
--

CREATE TABLE IF NOT EXISTS `npc_text_localized` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) collate utf8_unicode_ci NOT NULL,
  `text0` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text0_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text1_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text2` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text2_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text3` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text3_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text4` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text4_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text5` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text5_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text6` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text6_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text7` varchar(200) collate utf8_unicode_ci NOT NULL,
  `text7_1` varchar(200) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`entry`,`language_code`),
  KEY `lol` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `objectloot`
--

CREATE TABLE IF NOT EXISTS `objectloot` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `pickpocketingloot`
--

CREATE TABLE IF NOT EXISTS `pickpocketingloot` (
  `entryid` int(10) unsigned NOT NULL default '0',
  `itemid` int(10) unsigned NOT NULL default '0',
  `normal10percentchance` float NOT NULL default '0',
  `normal25percentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercreateinfo`
--

CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `Index` tinyint(3) unsigned NOT NULL auto_increment,
  `race` tinyint(3) unsigned NOT NULL default '0',
  `factiontemplate` int(5) NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `mapID` mediumint(8) unsigned NOT NULL default '0',
  `zoneID` mediumint(8) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `displayID` smallint(5) unsigned NOT NULL default '0',
  `BaseStrength` tinyint(3) unsigned NOT NULL default '0',
  `BaseAgility` tinyint(3) unsigned NOT NULL default '0',
  `BaseStamina` tinyint(3) unsigned NOT NULL default '0',
  `BaseIntellect` tinyint(3) unsigned NOT NULL default '0',
  `BaseSpirit` tinyint(3) unsigned NOT NULL default '0',
  `BaseHealth` mediumint(8) unsigned NOT NULL default '0',
  `BaseMana` mediumint(8) unsigned NOT NULL default '0',
  `BaseRage` mediumint(8) unsigned NOT NULL default '0',
  `BaseFocus` mediumint(8) unsigned NOT NULL default '0',
  `BaseEnergy` mediumint(8) unsigned NOT NULL default '0',
  `BaseRunic` int(10) unsigned NOT NULL default '0',
  `attackpower` mediumint(8) unsigned NOT NULL default '0',
  `mindmg` float NOT NULL default '0',
  `maxdmg` float NOT NULL default '0',
  PRIMARY KEY  (`Index`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Player System' AUTO_INCREMENT=66 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercreateinfo_bars`
--

CREATE TABLE IF NOT EXISTS `playercreateinfo_bars` (
  `race` tinyint(3) unsigned default NULL,
  `class` tinyint(3) unsigned default NULL,
  `button` int(10) unsigned default NULL,
  `action` int(10) unsigned default NULL,
  `type` int(10) unsigned default NULL,
  `misc` int(10) unsigned default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercreateinfo_items`
--

CREATE TABLE IF NOT EXISTS `playercreateinfo_items` (
  `indexid` int(4) NOT NULL,
  `protoid` int(4) NOT NULL,
  `slotid` int(10) NOT NULL,
  `amount` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercreateinfo_skills`
--

CREATE TABLE IF NOT EXISTS `playercreateinfo_skills` (
  `indexid` tinyint(3) unsigned NOT NULL default '0',
  `skillid` int(10) unsigned NOT NULL default '0',
  `level` int(10) unsigned NOT NULL default '0',
  `maxlevel` int(10) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `playercreateinfo_spells`
--

CREATE TABLE IF NOT EXISTS `playercreateinfo_spells` (
  `indexid` tinyint(3) unsigned NOT NULL default '0',
  `spellid` smallint(5) unsigned NOT NULL default '0',
  UNIQUE KEY `indexid` (`indexid`,`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `prestartqueries`
--

CREATE TABLE IF NOT EXISTS `prestartqueries` (
  `Query` varchar(1024) NOT NULL,
  `SingleShot` int(1) unsigned NOT NULL default '1',
  `Seq` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `professiondiscoveries`
--

CREATE TABLE IF NOT EXISTS `professiondiscoveries` (
  `SpellId` int(10) unsigned NOT NULL default '0',
  `SpellToDiscover` int(10) unsigned NOT NULL default '0',
  `SkillValue` int(10) unsigned NOT NULL default '0',
  `Chance` float NOT NULL default '0',
  PRIMARY KEY  (`SpellId`,`SpellToDiscover`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `prospectingloot`
--

CREATE TABLE IF NOT EXISTS `prospectingloot` (
  `entryid` int(11) unsigned NOT NULL default '0',
  `itemid` int(11) unsigned NOT NULL default '0',
  `percentchance` float NOT NULL default '0',
  `heroicpercentchance` float NOT NULL default '0',
  `mincount` int(11) unsigned NOT NULL default '1',
  `maxcount` int(11) unsigned NOT NULL default '1',
  `ffa_loot` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entryid`,`itemid`),
  UNIQUE KEY `entryid` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `entry` int(11) unsigned NOT NULL,
  `ZoneId` int(11) NOT NULL default '0',
  `sort` int(11) NOT NULL default '0',
  `flags` int(11) unsigned NOT NULL default '0',
  `MinLevel` int(11) unsigned NOT NULL default '0',
  `questlevel` int(11) unsigned NOT NULL default '0',
  `Type` int(11) NOT NULL default '0',
  `RequiredRaces` int(11) NOT NULL default '0',
  `RequiredClass` int(11) NOT NULL default '0',
  `RequiredTradeskill` int(11) NOT NULL default '0',
  `RequiredTradeskillValue` int(11) NOT NULL default '0',
  `RequiredRepFaction` int(11) NOT NULL default '0',
  `RequiredRepValue` int(11) NOT NULL default '0',
  `SuggestedPlayers` int(11) unsigned NOT NULL default '0',
  `LimitTime` int(11) NOT NULL default '0',
  `SpecialFlags` int(11) unsigned NOT NULL default '0',
  `PrevQuestId` int(11) unsigned NOT NULL default '0',
  `NextQuestId` int(11) unsigned NOT NULL default '0',
  `srcItem` int(11) unsigned NOT NULL default '0',
  `SrcItemCount` int(11) unsigned NOT NULL default '0',
  `Title` text NOT NULL,
  `Details` text NOT NULL,
  `Objectives` text NOT NULL,
  `CompletionText` text NOT NULL,
  `IncompleteText` text NOT NULL,
  `EndText` text NOT NULL,
  `ObjectiveText1` text NOT NULL,
  `ObjectiveText2` text NOT NULL,
  `ObjectiveText3` text NOT NULL,
  `ObjectiveText4` text NOT NULL,
  `ReqItemId1` int(11) unsigned NOT NULL default '0',
  `ReqItemId2` int(11) unsigned NOT NULL default '0',
  `ReqItemId3` int(11) unsigned NOT NULL default '0',
  `ReqItemId4` int(11) unsigned NOT NULL default '0',
  `ReqItemCount1` int(11) unsigned NOT NULL default '0',
  `ReqItemCount2` int(11) unsigned NOT NULL default '0',
  `ReqItemCount3` int(11) unsigned NOT NULL default '0',
  `ReqItemCount4` int(11) unsigned NOT NULL default '0',
  `ReqKillPlayer` int(10) unsigned NOT NULL default '0',
  `ReqKillMobOrGOId1` bigint(11) NOT NULL default '0',
  `ReqKillMobOrGOId2` bigint(11) NOT NULL default '0',
  `ReqKillMobOrGOId3` bigint(11) NOT NULL default '0',
  `ReqKillMobOrGOId4` bigint(11) NOT NULL default '0',
  `ReqKillMobOrGOCount1` int(11) unsigned NOT NULL default '0',
  `ReqKillMobOrGOCount2` int(11) unsigned NOT NULL default '0',
  `ReqKillMobOrGOCount3` int(11) unsigned NOT NULL default '0',
  `ReqKillMobOrGOCount4` int(11) unsigned NOT NULL default '0',
  `ReqCastSpellId1` int(11) NOT NULL default '0',
  `ReqCastSpellId2` int(11) NOT NULL default '0',
  `ReqCastSpellId3` int(11) NOT NULL default '0',
  `ReqCastSpellId4` int(11) NOT NULL default '0',
  `RewChoiceItemId1` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId2` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId3` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId4` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId5` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId6` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount1` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount2` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount3` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount4` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount5` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount6` int(11) unsigned NOT NULL default '0',
  `RewItemId1` int(10) unsigned NOT NULL default '0',
  `RewItemId2` int(10) unsigned NOT NULL default '0',
  `RewItemId3` int(10) unsigned NOT NULL default '0',
  `RewItemId4` int(10) unsigned NOT NULL default '0',
  `RewItemCount1` int(10) unsigned NOT NULL default '0',
  `RewItemCount2` int(10) unsigned NOT NULL default '0',
  `RewItemCount3` int(10) unsigned NOT NULL default '0',
  `RewItemCount4` int(10) unsigned NOT NULL default '0',
  `RewRepFaction1` int(10) unsigned NOT NULL default '0',
  `RewRepFaction2` int(10) unsigned NOT NULL default '0',
  `RewRepFaction3` int(11) NOT NULL default '0',
  `RewRepFaction4` int(11) NOT NULL default '0',
  `RewRepFaction5` int(11) NOT NULL default '0',
  `RewRepValue1` int(10) NOT NULL default '0',
  `RewRepValue2` int(10) NOT NULL default '0',
  `RewRepValue3` int(11) NOT NULL default '0',
  `RewRepValue4` int(11) NOT NULL default '0',
  `RewRepValue5` int(11) NOT NULL default '0',
  `RewRepLimit` int(10) NOT NULL default '0',
  `RewTitle` int(11) unsigned NOT NULL default '0',
  `RewMoney` int(10) NOT NULL default '0',
  `RewBonusHonor` int(10) unsigned NOT NULL default '0',
  `RewXP` int(10) unsigned NOT NULL default '0',
  `RewSpell` int(10) unsigned NOT NULL default '0',
  `RewTalent` int(11) unsigned NOT NULL default '0',
  `CastSpell` int(10) unsigned NOT NULL default '0',
  `PointMapId` int(10) unsigned NOT NULL default '0',
  `PointX` float NOT NULL default '0',
  `PointY` float NOT NULL default '0',
  `PointOpt` int(10) unsigned NOT NULL default '0',
  `RequiredMoney` int(11) unsigned NOT NULL default '0',
  `ExploreTrigger1` int(10) unsigned NOT NULL default '0',
  `ExploreTrigger2` int(10) unsigned NOT NULL default '0',
  `ExploreTrigger3` int(10) unsigned NOT NULL default '0',
  `ExploreTrigger4` int(10) unsigned NOT NULL default '0',
  `RequiredQuest1` int(10) unsigned NOT NULL default '0',
  `RequiredQuest2` int(10) unsigned NOT NULL default '0',
  `RequiredQuest3` int(10) unsigned NOT NULL default '0',
  `RequiredQuest4` int(10) unsigned NOT NULL default '0',
  `RequiredQuest_and_or` int(3) NOT NULL default '0',
  `ReceiveItemId1` int(10) unsigned NOT NULL default '0',
  `ReceiveItemId2` int(10) unsigned NOT NULL default '0',
  `ReceiveItemId3` int(10) unsigned NOT NULL default '0',
  `ReceiveItemId4` int(10) unsigned NOT NULL default '0',
  `ReceiveItemCount1` int(10) unsigned NOT NULL default '0',
  `ReceiveItemCount2` int(10) unsigned NOT NULL default '0',
  `ReceiveItemCount3` int(10) unsigned NOT NULL default '0',
  `ReceiveItemCount4` int(10) unsigned NOT NULL default '0',
  `IsRepeatable` int(11) NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quests System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `quests_localized`
--

CREATE TABLE IF NOT EXISTS `quests_localized` (
  `entry` mediumint(10) unsigned NOT NULL,
  `language_code` varchar(5) collate utf8_unicode_ci NOT NULL,
  `Title` text collate utf8_unicode_ci NOT NULL,
  `Details` text collate utf8_unicode_ci NOT NULL,
  `Objectives` text collate utf8_unicode_ci NOT NULL,
  `CompletionText` text collate utf8_unicode_ci NOT NULL,
  `IncompleteText` text collate utf8_unicode_ci NOT NULL,
  `EndText` text collate utf8_unicode_ci NOT NULL,
  `ObjectiveText1` text collate utf8_unicode_ci NOT NULL,
  `ObjectiveText2` text collate utf8_unicode_ci NOT NULL,
  `ObjectiveText3` text collate utf8_unicode_ci NOT NULL,
  `ObjectiveText4` text character set latin1 NOT NULL,
  PRIMARY KEY  (`entry`,`language_code`),
  KEY `lol` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `randomcardcreation`
--

CREATE TABLE IF NOT EXISTS `randomcardcreation` (
  `SpellId` int(10) unsigned NOT NULL default '0',
  `ItemId0` int(10) unsigned NOT NULL default '0',
  `ItemId1` int(10) unsigned NOT NULL default '0',
  `ItemId2` int(10) unsigned NOT NULL default '0',
  `ItemId3` int(10) unsigned NOT NULL default '0',
  `ItemId4` int(10) unsigned NOT NULL default '0',
  `ItemId5` int(10) unsigned NOT NULL default '0',
  `ItemId6` int(10) unsigned NOT NULL default '0',
  `ItemId7` int(10) unsigned NOT NULL default '0',
  `ItemId8` int(10) unsigned NOT NULL default '0',
  `ItemId9` int(10) unsigned NOT NULL default '0',
  `ItemId10` int(10) unsigned NOT NULL default '0',
  `ItemId11` int(10) unsigned NOT NULL default '0',
  `ItemId12` int(10) unsigned NOT NULL default '0',
  `ItemId13` int(10) unsigned NOT NULL default '0',
  `ItemId14` int(10) unsigned NOT NULL default '0',
  `ItemId15` int(10) unsigned NOT NULL default '0',
  `ItemId16` int(10) unsigned NOT NULL default '0',
  `ItemId17` int(10) unsigned NOT NULL default '0',
  `ItemId18` int(10) unsigned NOT NULL default '0',
  `ItemId19` int(10) unsigned NOT NULL default '0',
  `ItemId20` int(10) unsigned NOT NULL default '0',
  `ItemId21` int(10) unsigned NOT NULL default '0',
  `ItemId22` int(10) unsigned NOT NULL default '0',
  `ItemId23` int(10) unsigned NOT NULL default '0',
  `ItemId24` int(10) unsigned NOT NULL default '0',
  `ItemId25` int(10) unsigned NOT NULL default '0',
  `ItemId26` int(10) unsigned NOT NULL default '0',
  `ItemId27` int(10) unsigned NOT NULL default '0',
  `ItemId28` int(10) unsigned NOT NULL default '0',
  `ItemId29` int(10) unsigned NOT NULL default '0',
  `ItemId30` int(10) unsigned NOT NULL default '0',
  `ItemId31` int(10) unsigned NOT NULL default '0',
  `ItemCount` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `randomitemcreation`
--

CREATE TABLE IF NOT EXISTS `randomitemcreation` (
  `SpellId` int(10) unsigned NOT NULL default '0',
  `ItemToCreate` int(10) unsigned NOT NULL default '0',
  `Skill` int(10) unsigned NOT NULL default '0',
  `Chance` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ItemToCreate`,`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `recall`
--

CREATE TABLE IF NOT EXISTS `recall` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `MapId` int(10) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `Orientation` float unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tele Command' AUTO_INCREMENT=797 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `reputation_creature_onkill`
--

CREATE TABLE IF NOT EXISTS `reputation_creature_onkill` (
  `creature_id` mediumint(10) unsigned NOT NULL,
  `faction_change_alliance` smallint(5) unsigned NOT NULL,
  `faction_change_horde` smallint(5) unsigned NOT NULL,
  `change_value` mediumint(5) NOT NULL,
  `rep_limit` mediumint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `reputation_faction_onkill`
--

CREATE TABLE IF NOT EXISTS `reputation_faction_onkill` (
  `faction_id` smallint(5) unsigned NOT NULL,
  `change_factionid_alliance` smallint(5) unsigned NOT NULL default '0',
  `change_deltamin_alliance` mediumint(10) NOT NULL default '0',
  `change_deltamax_alliance` mediumint(10) NOT NULL default '0',
  `change_factionid_horde` smallint(5) unsigned NOT NULL default '0',
  `change_deltamin_horde` mediumint(10) NOT NULL default '0',
  `change_deltamax_horde` mediumint(10) NOT NULL default '0',
  KEY `factindex` (`faction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `reputation_instance_onkill`
--

CREATE TABLE IF NOT EXISTS `reputation_instance_onkill` (
  `mapid` smallint(5) unsigned NOT NULL,
  `mob_rep_reward` mediumint(10) NOT NULL default '0',
  `mob_rep_reward_heroic` int(30) NOT NULL,
  `mob_rep_limit` mediumint(10) NOT NULL default '0',
  `mob_rep_limit_heroic` int(30) NOT NULL,
  `boss_rep_reward` mediumint(10) NOT NULL default '0',
  `boss_rep_reward_heroic` int(30) NOT NULL,
  `boss_rep_limit` mediumint(10) NOT NULL default '0',
  `boss_rep_limit_heroic` int(30) NOT NULL,
  `faction_change_alliance` smallint(5) unsigned NOT NULL,
  `faction_change_horde` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`mapid`,`faction_change_alliance`,`faction_change_horde`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `scrollcreation`
--

CREATE TABLE IF NOT EXISTS `scrollcreation` (
  `SpellId` int(10) unsigned NOT NULL default '0',
  `ItemId` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`SpellId`,`ItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spellfixes`
--

CREATE TABLE IF NOT EXISTS `spellfixes` (
  `spellId` int(30) NOT NULL default '0',
  `procFlags` int(30) NOT NULL default '0',
  `procChance` int(30) NOT NULL default '0',
  `procCharges` int(30) NOT NULL default '0',
  `effect0ClassMask0` int(10) unsigned NOT NULL default '0',
  `effect0ClassMask1` int(10) unsigned NOT NULL default '0',
  `effect0ClassMask2` int(10) unsigned NOT NULL default '0',
  `effect1ClassMask0` int(10) unsigned NOT NULL default '0',
  `effect1ClassMask1` int(10) unsigned NOT NULL default '0',
  `effect1ClassMask2` int(10) unsigned NOT NULL default '0',
  `effect2ClassMask0` int(10) unsigned NOT NULL default '0',
  `effect2ClassMask1` int(10) unsigned NOT NULL default '0',
  `effect2ClassMask2` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spelloverride`
--

CREATE TABLE IF NOT EXISTS `spelloverride` (
  `overrideId` int(30) NOT NULL default '0',
  `spellId` int(30) NOT NULL default '0',
  PRIMARY KEY  (`overrideId`,`spellId`),
  UNIQUE KEY `overrideId` (`overrideId`,`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_coef_override`
--

CREATE TABLE IF NOT EXISTS `spell_coef_override` (
  `id` int(11) default '0',
  `Dspell_coef_override` float default '0',
  `OTspell_coef_override` float default '0',
  `AP_coef_override` float default '0',
  `RAP_coef_override` float default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_disable`
--

CREATE TABLE IF NOT EXISTS `spell_disable` (
  `spellid` mediumint(10) unsigned NOT NULL,
  `replacement_spellid` mediumint(10) unsigned NOT NULL,
  PRIMARY KEY  (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_disable_trainers`
--

CREATE TABLE IF NOT EXISTS `spell_disable_trainers` (
  `spellid` mediumint(10) unsigned NOT NULL,
  `replacement_spellid` mediumint(10) unsigned NOT NULL,
  PRIMARY KEY  (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Trainer System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_forced_targets`
--

CREATE TABLE IF NOT EXISTS `spell_forced_targets` (
  `spellid` int(8) unsigned NOT NULL,
  `target` int(8) unsigned NOT NULL default '0',
  UNIQUE KEY `entry_type_target` (`spellid`,`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_proc_override`
--

CREATE TABLE IF NOT EXISTS `spell_proc_override` (
  `ID` int(6) NOT NULL,
  `ProcFlags` int(32) NOT NULL default '0',
  `ExtraProc` int(32) NOT NULL default '0',
  `ProcChance` int(3) NOT NULL default '-1',
  `PPM` float(10,0) NOT NULL default '0',
  `ProcCharges` int(3) NOT NULL default '-1',
  `ProcInterval` int(10) NOT NULL default '0',
  `ProcModify` int(1) NOT NULL default '0',
  `SpellClassMask1_1` int(32) NOT NULL default '-1',
  `SpellClassMask1_2` int(32) NOT NULL default '-1',
  `SpellClassMask1_3` int(32) NOT NULL default '-1',
  `SpellClassMask2_1` int(32) NOT NULL default '-1',
  `SpellClassMask2_2` int(32) NOT NULL default '-1',
  `SpellClassMask2_3` int(32) NOT NULL default '-1',
  `SpellClassMask3_1` int(32) NOT NULL default '-1',
  `SpellClassMask3_2` int(32) NOT NULL default '-1',
  `SpellClassMask3_3` int(32) NOT NULL default '-1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `spell_unique_auras`
--

CREATE TABLE IF NOT EXISTS `spell_unique_auras` (
  `SpellId` int(30) NOT NULL,
  `AuraGroup` int(30) NOT NULL,
  `AuraGroup2` int(20) NOT NULL default '0',
  `UniqueType` int(30) NOT NULL,
  PRIMARY KEY  (`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `teleport_coords`
--

CREATE TABLE IF NOT EXISTS `teleport_coords` (
  `entry` int(16) NOT NULL,
  `name` char(255) character set utf8 collate utf8_unicode_ci NOT NULL,
  `mapId` int(16) NOT NULL,
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `totemspells`
--

CREATE TABLE IF NOT EXISTS `totemspells` (
  `spell` mediumint(10) unsigned NOT NULL default '0',
  `castspell1` mediumint(10) unsigned NOT NULL default '0',
  `castspell2` mediumint(10) unsigned NOT NULL default '0',
  `castspell3` mediumint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `trainerspelloverride`
--

CREATE TABLE IF NOT EXISTS `trainerspelloverride` (
  `spellid` int(10) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  `requiredspell` int(10) unsigned NOT NULL default '0',
  `deletespell` int(10) unsigned NOT NULL default '0',
  `requiredskill` int(10) unsigned NOT NULL default '0',
  `requiredskillvalue` int(10) unsigned NOT NULL default '0',
  `reqlevel` tinyint(3) unsigned NOT NULL default '0',
  `requiredclass` int(10) NOT NULL default '-1',
  PRIMARY KEY  (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Trainer System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `trainer_defs`
--

CREATE TABLE IF NOT EXISTS `trainer_defs` (
  `entry` mediumint(10) unsigned NOT NULL,
  `required_skill` smallint(5) unsigned NOT NULL default '0',
  `required_skillvalue` mediumint(10) unsigned default '0',
  `req_class` tinyint(3) unsigned NOT NULL default '0',
  `trainer_type` tinyint(3) unsigned NOT NULL default '0',
  `trainer_ui_window_message` text,
  `can_train_gossip_textid` smallint(5) unsigned NOT NULL default '0',
  `cannot_train_gossip_textid` smallint(5) unsigned NOT NULL default '0',
  UNIQUE KEY `entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trainer System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `trainer_spells`
--

CREATE TABLE IF NOT EXISTS `trainer_spells` (
  `entry` mediumint(10) unsigned NOT NULL,
  `cast_spell` mediumint(10) unsigned NOT NULL,
  `learn_spell` mediumint(10) unsigned NOT NULL,
  `spellcost` int(10) unsigned NOT NULL default '0',
  `reqspell` mediumint(10) unsigned NOT NULL default '0',
  `reqskill` smallint(5) unsigned NOT NULL default '0',
  `reqskillvalue` mediumint(10) unsigned NOT NULL default '0',
  `reqlevel` tinyint(3) unsigned NOT NULL default '0',
  `deletespell` mediumint(10) unsigned NOT NULL default '0',
  `is_prof` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`cast_spell`,`learn_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trainer System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `transport_creatures`
--

CREATE TABLE IF NOT EXISTS `transport_creatures` (
  `transport_entry` mediumint(10) unsigned NOT NULL,
  `creature_entry` mediumint(10) unsigned NOT NULL,
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `orientation` float NOT NULL,
  PRIMARY KEY  (`transport_entry`,`creature_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `entry` mediumint(10) unsigned NOT NULL,
  `item` mediumint(10) unsigned NOT NULL,
  `amount` smallint(5) NOT NULL default '0',
  `max_amount` smallint(5) NOT NULL default '0',
  `inctime` bigint(20) NOT NULL default '0',
  `extendedcost` int(11) NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `weather`
--

CREATE TABLE IF NOT EXISTS `weather` (
  `zoneId` smallint(5) unsigned NOT NULL default '0',
  `high_chance` tinyint(3) unsigned NOT NULL default '0',
  `high_type` tinyint(3) unsigned NOT NULL default '0',
  `med_chance` tinyint(3) unsigned NOT NULL default '0',
  `med_type` tinyint(3) unsigned NOT NULL default '0',
  `low_chance` tinyint(3) unsigned NOT NULL default '0',
  `low_type` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`zoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `wordfilter_character_names`
--

CREATE TABLE IF NOT EXISTS `wordfilter_character_names` (
  `regex_match` varchar(255) NOT NULL,
  `regex_ignore_if_matched` varchar(255) default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `wordfilter_chat`
--

CREATE TABLE IF NOT EXISTS `wordfilter_chat` (
  `regex_match` varchar(255) NOT NULL,
  `regex_ignore_if_matched` varchar(255) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `worldmap_info`
--

CREATE TABLE IF NOT EXISTS `worldmap_info` (
  `entry` smallint(5) unsigned NOT NULL,
  `screenid` smallint(5) unsigned default '0',
  `type` tinyint(3) unsigned default '0',
  `maxplayers` tinyint(3) unsigned default '0',
  `minlevel` tinyint(3) unsigned default '1',
  `repopx` float default '0',
  `repopy` float default '0',
  `repopz` float default '0',
  `repopentry` smallint(5) unsigned default '0',
  `area_name` varchar(100) default '0',
  `flags` smallint(5) unsigned NOT NULL default '0',
  `cooldown` mediumint(10) unsigned NOT NULL default '0',
  `required_quest` mediumint(10) unsigned NOT NULL default '0',
  `required_item` mediumint(10) unsigned NOT NULL default '0',
  `heroic_keyid_1` mediumint(10) unsigned NOT NULL default '0',
  `heroic_keyid_2` mediumint(10) unsigned NOT NULL default '0',
  `viewingDistance` float NOT NULL default '80',
  `required_checkpoint` smallint(10) unsigned NOT NULL default '0',
  `collision` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';

-- --------------------------------------------------------

--
-- Tábla szerkezet: `worldstate_template`
--

CREATE TABLE IF NOT EXISTS `worldstate_template` (
  `mapid` int(11) NOT NULL,
  `zone_mask` int(30) NOT NULL,
  `faction_mask` int(30) NOT NULL,
  `field_number` int(30) unsigned NOT NULL,
  `initial_value` int(30) NOT NULL,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY  (`field_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `zoneguards`
--

CREATE TABLE IF NOT EXISTS `zoneguards` (
  `zone` smallint(5) unsigned NOT NULL,
  `horde_entry` mediumint(10) unsigned NOT NULL default '0',
  `alliance_entry` mediumint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`zone`,`horde_entry`,`alliance_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';
