-- Létrehozás ideje: 2009. dec. 28. 22:39

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- Tábla szerkezet: `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `acct` int(5) NOT NULL auto_increment,
  `login` varchar(32) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `SessionKey` varchar(255) NOT NULL default '',
  `gm` varchar(10) NOT NULL default '0',
  `flags` int(11) NOT NULL default '24',
  `banned` int(11) NOT NULL default '0',
  `banreason` varchar(512) default NULL,
  `lastlogin` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `lastip` varchar(15) NOT NULL default '',
  `forceLanguage` varchar(5) NOT NULL default 'enUS',
  `email` varchar(32) default NULL,
  `muted` int(30) NOT NULL default '0',
  PRIMARY KEY  (`acct`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet: `ipbans`
--

CREATE TABLE IF NOT EXISTS `ipbans` (
  `ip` varchar(128) NOT NULL,
  `time` int(30) NOT NULL default '0',
  `expire` int(30) NOT NULL default '0',
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
