SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `ff_admin` (
  `admin_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_pwd` char(32) NOT NULL,
  `admin_count` smallint(6) NOT NULL,
  `admin_ok` varchar(50) NOT NULL,
  `admin_del` bigint(1) NOT NULL,
  `admin_ip` varchar(40) NOT NULL,
  `admin_email` varchar(40) NOT NULL,
  `admin_logintime` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_admin` (`admin_id`, `admin_name`, `admin_pwd`, `admin_count`, `admin_ok`, `admin_del`, `admin_ip`, `admin_email`, `admin_logintime`) VALUES
(1, 'admin', '7fef6171469e80d32c0559f88b377245', 61, '1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1', 0, '127.0.0.1', 'admin@qq.com', 1480516503);


CREATE TABLE IF NOT EXISTS `ff_ads` (
  `ads_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `ads_name` varchar(50) NOT NULL,
  `ads_content` text NOT NULL,
  PRIMARY KEY (`ads_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

INSERT INTO `ff_ads` (`ads_id`, `ads_name`, `ads_content`) VALUES
(1, 'play', 'tool>Website ad management Adaptive template play page ads'),
(2, 'footer', 'tool>Website ad management Adaptive template at the bottom of the ad'),
(3, 'header', 'tool>Website ad management Adaptive template top ad'),
(4, 'play-m', 'tool>Website ad management  Mobile-only ad (play page banner)'),
(5, 'footer-m', 'tool>Website ad management Mobile-specific ads (bottom bannner)'),
(6, 'header-m', 'tool>Website ad management Mobile-specific ads (top bannner)');

CREATE TABLE IF NOT EXISTS `ff_cj` (
  `cj_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cj_name` varchar(255) NOT NULL,
  `cj_url` varchar(255) NOT NULL,
  PRIMARY KEY (`cj_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_cj` (`cj_id`, `cj_name`, `cj_url`) VALUES
(1, 'Film and television polymerization', 'http://union.feifeicms.com/v3/api/hao123/'),
(2, 'Video vanguard', 'http://union.feifeicms.com/v3/api/xfplay/'),
(3, 'Film and television polymerization', 'http://union.feifeicms.com/v3/api/2345/');

CREATE TABLE IF NOT EXISTS `ff_forum` (
  `forum_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `forum_cid` mediumint(9) NOT NULL,
  `forum_sid` tinyint(1) NOT NULL DEFAULT '1',
  `forum_uid` mediumint(9) NOT NULL DEFAULT '1',
  `forum_pid` mediumint(9) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) NOT NULL,
  `forum_content` text NOT NULL,
  `forum_up` mediumint(9) NOT NULL DEFAULT '0',
  `forum_down` mediumint(9) NOT NULL DEFAULT '0',
  `forum_reply` mediumint(9) NOT NULL DEFAULT '0',
  `forum_report` mediumint(9) NOT NULL DEFAULT '0',
  `forum_ip` varchar(20) NOT NULL,
  `forum_addtime` int(11) NOT NULL,
  `forum_status` tinyint(1) NOT NULL DEFAULT '0',
  `forum_istop` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_link` (
  `link_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL,
  `link_logo` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `link_order` tinyint(4) NOT NULL,
  `link_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_link` (`link_id`, `link_name`, `link_logo`, `link_url`, `link_order`, `link_type`) VALUES
(1, 'Feifei video navigation system', '', 'http://www.feifeicms.com', 1, 1),
(2, 'Do those things on the site', '', 'http://www.daicuo.cc', 2, 1);

CREATE TABLE IF NOT EXISTS `ff_list` (
  `list_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `list_pid` smallint(3) NOT NULL,
  `list_oid` smallint(3) NOT NULL,
  `list_sid` tinyint(1) NOT NULL,
  `list_name` char(20) NOT NULL,
  `list_skin` char(20) NOT NULL,
  `list_skin_detail` varchar(20) NOT NULL DEFAULT 'pp_vod',
  `list_skin_play` varchar(20) NOT NULL DEFAULT 'pp_play',
  `list_skin_type` varchar(20) NOT NULL DEFAULT 'pp_vodtype',
  `list_dir` varchar(90) NOT NULL,
  `list_status` tinyint(1) NOT NULL DEFAULT '1',
  `list_keywords` varchar(255) NOT NULL,
  `list_title` varchar(50) NOT NULL,
  `list_description` varchar(255) NOT NULL,
  `list_copyright` smallint(3) NOT NULL,
  `list_extend` text,
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_list` (`list_id`, `list_pid`, `list_oid`, `list_sid`, `list_name`, `list_skin`, `list_skin_detail`, `list_skin_play`, `list_skin_type`, `list_dir`, `list_status`, `list_keywords`, `list_title`, `list_description`, `list_copyright`, `list_extend`) VALUES
(1, 0, 1, 1, 'the film', 'vod_channel_dy', 'vod_detail', 'vod_play', 'vod_type', 'dianying', 1, 'the film,Movie Daquan,Movie heaven,New Movies,Good movies,Movie charts', '', 'To provide you with updated movies, nice movie charts and movie Thunder download, free online watch ethical movies, action films, comedy, romance, funny movies and other new movies, more movies HD online watch', 0, '{"type":"\\u559c\\u5267,\\u7231\\u60c5,\\u6050\\u6016,\\u52a8\\u4f5c,\\u79d1\\u5e7b,\\u5267\\u60c5,\\u6218\\u4e89,\\u8b66\\u532a,\\u72af\\u7f6a,\\u52a8\\u753b,\\u5947\\u5e7b,\\u6b66\\u4fa0,\\u5192\\u9669,\\u67aa\\u6218,\\u6050\\u6016,\\u60ac\\u7591,\\u60ca\\u609a,\\u7ecf\\u5178,\\u9752\\u6625,\\u6587\\u827a,\\u5fae\\u7535\\u5f71,\\u53e4\\u88c5,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u519c\\u6751,\\u513f\\u7ae5,\\u7f51\\u7edc\\u7535\\u5f71","area":"\\u5185\\u5730,\\u7f8e\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u97e9\\u56fd,\\u65e5\\u672c,\\u6cd5\\u56fd,\\u82f1\\u56fd,\\u5fb7\\u56fd,\\u6cf0\\u56fd,\\u5370\\u5ea6","year":"2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625","state":"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e,\\u4ed8\\u8d39\\u6b63\\u7247","language":"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83","version":"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248"}'),
(2, 0, 2, 1, 'TV series', 'vod_channel_ds', 'vod_detail', 'vod_play', 'vod_type', 'dianshiju', 1, 'TV series,Latest drama,Good-looking TV series,Hit TV series,TV series online watch', '', 'To provide you with 2016 new TV series, Korean TV series, Thai TV series, Hong Kong TVB new TV series, good-looking TV series and other hit TV series, and provide free high-definition TV drama download and online watch, online watching TV series', 0, '{"type":"\\u8a00\\u60c5,\\u5076\\u50cf,\\u90fd\\u5e02,\\u6218\\u4e89,\\u60ac\\u7591,\\u4f26\\u7406,\\u60ca\\u609a,\\u7f51\\u7edc\\u5267,\\u8b66\\u532a,\\u53e4\\u88c5,\\u6b66\\u4fa0,\\u795e\\u8bdd,\\u5386\\u53f2,\\u52a8\\u4f5c,\\u8c0d\\u6218,\\u559c\\u5267,\\u6297\\u65e5,\\u5bb6\\u5ead,\\u5267\\u60c5,\\u52b1\\u5fd7,\\u519c\\u6751,\\u79d1\\u5e7b,\\u5947\\u5e7b,\\u5176\\u5b83","area":"\\u5185\\u5730,\\u53f0\\u6e7e,\\u9999\\u6e2f,\\u97e9\\u56fd,\\u7f8e\\u56fd,\\u6cf0\\u56fd,\\u65e5\\u672c,\\u82f1\\u56fd,\\u65b0\\u52a0\\u5761,\\u5176\\u5b83","year":"2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"\\u738b\\u5b9d\\u5f3a,\\u80e1\\u6b4c,\\u970d\\u5efa\\u534e,\\u8d75\\u4e3d\\u9896,\\u5218\\u6d9b,\\u5218\\u8bd7\\u8bd7,\\u9648\\u4f1f\\u9706,\\u5434\\u5947\\u9686,\\u9646\\u6bc5,\\u5510\\u5ae3,\\u5173\\u6653\\u5f64,\\u5b59\\u4fea,\\u674e\\u6613\\u5cf0,\\u5f20\\u7ff0,\\u674e\\u6668,\\u8303\\u51b0\\u51b0,\\u6797\\u5fc3\\u5982,\\u6587\\u7ae0,\\u9a6c\\u4f0a\\u740d,\\u4f5f\\u5927\\u4e3a,\\u5b59\\u7ea2\\u96f7,\\u9648\\u5efa\\u658c,\\u674e\\u5c0f\\u7490","state":"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e,\\u4ed8\\u8d39\\u7247","language":"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83","version":"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248"}'),
(3, 0, 3, 1, 'Anime', 'vod_channel_dm', 'vod_detail', 'vod_play', 'vod_type', 'dongman', 1, 'Anime,Animation,Latest animation,Good-looking anime,Japanese anime,Anime charts', '', 'To provide you with new animation, good-looking animation charts, free high-definition online watch blood anime, cartoon anime, new animation, lily anime, funny animation, domestic animation, animation movies and other popular animation, more animation HD online watch', 0, '{"type":"\\u70ed\\u8840,\\u7231\\u60c5,\\u641e\\u7b11,\\u7f8e\\u5973,\\u5c11\\u513f,\\u4eb2\\u5b50,\\u9b54\\u6cd5,\\u8fd0\\u52a8,\\u673a\\u6218,\\u79d1\\u5e7b,\\u6821\\u56ed,\\u52a8\\u7269,\\u5192\\u9669,\\u795e\\u8bdd,\\u63a8\\u7406,\\u5267\\u60c5,\\u5386\\u53f2,\\u6218\\u4e89,\\u7ecf\\u5178,\\u5176\\u5b83","area":"\\u5185\\u5730,\\u65e5\\u672c,\\u7f8e\\u56fd,\\u97e9\\u56fd,\\u53f0\\u6e7e,\\u9999\\u6e2f","year":"2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"","state":"","language":"","version":""}'),
(4, 0, 4, 1, 'Variety', 'vod_channel_zy', 'vod_detail', 'vod_play', 'vod_type', 'zongyi', 1, 'Variety,variety show,The latest variety show,Variety show list', '', 'To provide you with new variety show, nice variety show, free high-definition online watch draft, emotion, interviews, funny, reality show, talk show and other popular variety show, More variety show high-definition online watch', 0, '{"type":"\\u8131\\u53e3\\u79c0,\\u771f\\u4eba\\u79c0,\\u9009\\u79c0,\\u7f8e\\u98df,\\u65c5\\u6e38,\\u6c7d\\u8f66,\\u8bbf\\u8c08,\\u7eaa\\u5b9e,\\u641e\\u7b11,\\u60c5\\u611f,\\u6e38\\u620f,\\u804c\\u573a,\\u5a31\\u4e50,\\u8d44\\u8baf,\\u97f3\\u4e50,\\u751f\\u6d3b,\\u65f6\\u5c1a","area":"\\u9999\\u6e2f,\\u7f8e\\u56fd,\\u5927\\u9646,\\u97e9\\u56fd,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u5176\\u4ed6","year":"2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"\\u4f55\\u7085,\\u6c6a\\u6db5,\\u8c22\\u5a1c,\\u5468\\u7acb\\u6ce2,\\u9648\\u9c81\\u8c6b,\\u5b5f\\u975e,\\u674e\\u9759,\\u6731\\u519b,\\u6731\\u4e39,\\u534e\\u5c11,\\u90ed\\u5fb7\\u7eb2,\\u6768\\u6f9c","state":"","language":"","version":""}'),
(5, 0, 5, 1, 'Short video', 'vod_list', 'vod_detail', 'vod_play', 'vod_type', 'duanshipin', 1, '', '', '', 0, '{"type":"","area":"","year":"","star":"","state":"","language":"","version":""}'),
(6, 0, 6, 2, 'Information', 'news_list', 'news_detail', '', 'news_type', 'zixun', 1, '', '', '', 0, '{"type":"","area":"","year":"","star":"","state":"","language":"","version":""}');

CREATE TABLE IF NOT EXISTS `ff_nav` (
  `nav_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Channel ID',
  `nav_pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nav_oid` tinyint(3) NOT NULL DEFAULT '1',
  `nav_title` varchar(50) NOT NULL DEFAULT '',
  `nav_tips` varchar(50) NOT NULL DEFAULT '',
  `nav_link` varchar(255) NOT NULL DEFAULT '',
  `nav_status` tinyint(1) NOT NULL DEFAULT '1',
  `nav_target` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

INSERT INTO `ff_nav` (`nav_id`, `nav_pid`, `nav_oid`, `nav_title`, `nav_tips`, `nav_link`, `nav_status`, `nav_target`) VALUES
(1, 0, 1, 'Home', 'index', '/', 1, 0),
(2, 0, 2, 'TV series', 'tv', '/?s=vod-show-id-2.html', 1, 0),
(3, 0, 3, 'the film', 'dianying', '/?s=vod-show-id-1.html', 1, 0),
(4, 0, 4, 'Anime', 'dongman', '/?s=vod-show-id-3.html', 1, 0),
(5, 0, 5, 'Variety', 'zongyi', '/?s=vod-show-id-4.html', 1, 0),
(6, 0, 6, 'Short video', 'gaoxiao', '/?s=vod-show-id-5.html', 1, 0),
(7, 0, 7, 'Topic', 'special', '/?s=special-show-p-1.html', 1, 0),
(8, 0, 8, 'Information', 'news', '/?s=news-show-id-6.html', 1, 0),
(9, 0, 9, 'leave a message', 'guestbook', '/?s=forum-guestbook.html', 1, 0);

CREATE TABLE IF NOT EXISTS `ff_news` (
  `news_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `news_cid` smallint(6) NOT NULL DEFAULT '0',
  `news_name` varchar(255) NOT NULL,
  `news_ename` varchar(255) DEFAULT NULL,
  `news_keywords` varchar(255) NOT NULL,
  `news_type` varchar(255) DEFAULT '',
  `news_color` char(8) NOT NULL,
  `news_pic` varchar(255) NOT NULL,
  `news_pic_bg` varchar(255) DEFAULT NULL,
  `news_pic_slide` varchar(255) DEFAULT NULL,
  `news_inputer` varchar(50) NOT NULL,
  `news_reurl` varchar(255) NOT NULL,
  `news_remark` text NOT NULL,
  `news_content` text NOT NULL,
  `news_hits` mediumint(8) NOT NULL,
  `news_hits_day` mediumint(8) NOT NULL,
  `news_hits_week` mediumint(8) NOT NULL,
  `news_hits_month` mediumint(8) NOT NULL,
  `news_hits_lasttime` int(11) NOT NULL,
  `news_stars` tinyint(1) NOT NULL,
  `news_status` tinyint(1) NOT NULL DEFAULT '1',
  `news_up` mediumint(8) NOT NULL,
  `news_down` mediumint(8) NOT NULL,
  `news_jumpurl` varchar(255) NOT NULL,
  `news_letter` char(2) NOT NULL,
  `news_addtime` int(8) NOT NULL,
  `news_skin` varchar(30) NOT NULL,
  `news_gold` decimal(3,1) NOT NULL,
  `news_golder` smallint(6) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_cid` (`news_cid`),
  KEY `news_up` (`news_up`),
  KEY `news_down` (`news_down`),
  KEY `news_gold` (`news_gold`),
  KEY `news_hits` (`news_hits`,`news_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_player` (
  `player_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `player_name_zh` varchar(128) NOT NULL,
  `player_name_en` varchar(128) NOT NULL,
  `player_info` varchar(250) NOT NULL,
  `player_order` smallint(3) NOT NULL DEFAULT '0',
  `player_status` tinyint(1) NOT NULL DEFAULT '1',
  `player_copyright` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`player_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_player` (`player_id`, `player_name_zh`, `player_name_en`, `player_info`, `player_order`, `player_status`, `player_copyright`) VALUES
(1, 'Video vanguard', 'xfplay', 'Need to download and install video vanguard', 1, 1, 0),
(2, 'Watermelon video', 'xigua', 'Need to download and install the watermelon player', 2, 1, 0),
(3, 'Gigi', 'jjvod', 'Need to download and install Gigi audio and video player', 3, 1, 0),
(4, 'Extraordinary video', 'ffhd', 'Need to download and install the extraordinary audio and video player', 4, 1, 0),
(5, 'Frame reference', 'iframe', 'Iframe references any page', 5, 1, 0),
(6, 'Youku', 'youku', 'youku', 6, 1, 0),
(7, 'Tencent video', 'qq', 'qq', 11, 1, 0),
(8, 'IQIYI', 'iqiyi', 'iqiyi', 10, 1, 0),
(9, 'Letv', 'letv', 'letv', 18, 1, 3),
(10, 'Sohu', 'sohu', 'sohu', 9, 1, 0),
(11, 'Tudou', 'tudou', 'tudou', 8, 1, 0),
(12, 'PPTV', 'pptv', 'pptv', 13, 1, 0),
(13, 'Mango TV', 'mgtv', 'mgtv', 14, 1, 0),
(14, 'Number of TV', 'wasu', 'wasu', 15, 1, 0),
(15, 'Listen to the nest', 'kankan', 'kankan', 16, 1, 0),
(16, 'CKPLAYER', 'ckplayer', 'ckplayer', 17, 1, 0),
(18, 'Youku cloud', 'ykyun', 'youkuyun', 7, 1, 0),
(19, 'download', 'down', 'down', 12, 1, 0),
(20, 'acfun', 'acfun', 'acfun', 19, 1, 0),
(21, 'Popular', 'fun', 'fun', 26, 1, 0),
(22, 'tv189', 'tv189', 'tv189', 21, 1, 0),
(23, 'baofeng', 'baofeng', 'baofeng', 22, 1, 0),
(24, 'xunlei', 'xunlei', 'xunlei', 23, 1, 0),
(25, 'M1905', 'm1905', 'm1905', 24, 1, 0),
(26, 'CNTV', 'cntv', 'cntv', 25, 1, 0),
(27, 'bilibili', 'bilibili', 'bilibili', 20, 1, 0),
(28, 'Customize the player', 'video', 'Customize the video tag of the player html5', 27, 1, 0),
(29, 'm3u8', 'm3u8', 'M3u8 format playback', 28, 1, 0),
(30, '58', '58', '58值', 29, 1, 0),
(31, 'daum', 'daum', 'daum', 30, 1, 0),
(32, 'toutiao', 'toutiao', 'toutiao', 31, 1, 0),
(33, 'mmsid', 'mmsid', 'mmsid', 32, 1, 0);

CREATE TABLE IF NOT EXISTS `ff_slide` (
  `slide_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `slide_oid` tinyint(3) NOT NULL,
  `slide_cid` tinyint(3) NOT NULL DEFAULT '1',
  `slide_name` varchar(255) NOT NULL,
  `slide_logo` varchar(255) NOT NULL,
  `slide_pic` varchar(255) NOT NULL,
  `slide_url` varchar(255) NOT NULL,
  `slide_content` varchar(255) NOT NULL,
  `slide_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_special` (
  `special_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `special_banner` varchar(150) NOT NULL,
  `special_logo` varchar(150) NOT NULL,
  `special_name` varchar(150) NOT NULL,
  `special_type` varchar(255) NOT NULL,
  `special_ename` varchar(255) DEFAULT NULL,
  `special_tag_name` varchar(255) NOT NULL,
  `special_ids_vod` varchar(255) DEFAULT NULL,
  `special_ids_news` varchar(255) DEFAULT NULL,
  `special_title` varchar(150) DEFAULT NULL,
  `special_keywords` varchar(150) NOT NULL,
  `special_description` varchar(255) NOT NULL,
  `special_color` char(8) NOT NULL,
  `special_skin` varchar(50) NOT NULL,
  `special_addtime` int(11) NOT NULL,
  `special_hits` mediumint(8) NOT NULL,
  `special_hits_day` mediumint(8) NOT NULL,
  `special_hits_week` mediumint(8) NOT NULL,
  `special_hits_month` mediumint(8) NOT NULL,
  `special_hits_lasttime` int(11) NOT NULL,
  `special_stars` tinyint(1) NOT NULL DEFAULT '1',
  `special_status` tinyint(1) NOT NULL,
  `special_content` text NOT NULL,
  `special_up` mediumint(8) NOT NULL,
  `special_down` mediumint(8) NOT NULL,
  `special_gold` decimal(3,1) NOT NULL,
  `special_golder` smallint(6) NOT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_tag` (
  `tag_id` mediumint(8) NOT NULL,
  `tag_cid` tinyint(2) DEFAULT '0',
  `tag_name` varchar(50) NOT NULL,
  `tag_list` varchar(32) DEFAULT 'vod_tag' COMMENT 'vod_tag|news_tag|vod_type|news_type',
  `tag_ename` varchar(255) DEFAULT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `tag_cid` (`tag_cid`),
  KEY `tag_list` (`tag_list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `ff_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pwd` char(32) NOT NULL,
  `user_money` mediumint(9) NOT NULL,
  `user_staus` tinyint(1) NOT NULL DEFAULT '1',
  `user_pay` tinyint(1) NOT NULL,
  `user_question` varchar(50) NOT NULL,
  `user_answer` varchar(50) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_logip` varchar(16) NOT NULL,
  `user_lognum` smallint(5) NOT NULL DEFAULT '1',
  `user_logtime` int(10) NOT NULL,
  `user_joinip` varchar(16) NOT NULL,
  `user_jointime` int(10) NOT NULL,
  `user_duetime` int(10) NOT NULL,
  `user_qq` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_face` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_user` (`user_id`, `user_name`, `user_pwd`, `user_money`, `user_staus`, `user_pay`, `user_question`, `user_answer`, `user_type`, `user_logip`, `user_lognum`, `user_logtime`, `user_joinip`, `user_jointime`, `user_duetime`, `user_qq`, `user_email`, `user_face`) VALUES
(1, '游客', 'bdadsfsaewtgsdgfdsghdsafsa', 1, 1, 1, '1', '1', 1, '127.0.0.1', 1, 1, '127.0.0.1', 12345678, 12345678, '10000', '10000@qq.com', '');

CREATE TABLE IF NOT EXISTS `ff_vod` (
  `vod_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vod_cid` smallint(6) NOT NULL DEFAULT '0',
  `vod_name` varchar(255) NOT NULL,
  `vod_ename` varchar(255) DEFAULT NULL,
  `vod_title` varchar(255) DEFAULT '',
  `vod_keywords` varchar(255) DEFAULT '',
  `vod_type` varchar(255) DEFAULT '',
  `vod_color` char(8) DEFAULT '',
  `vod_actor` varchar(255) DEFAULT '',
  `vod_director` varchar(255) DEFAULT '',
  `vod_content` text,
  `vod_pic` varchar(255) DEFAULT '',
  `vod_pic_bg` varchar(255) DEFAULT '',
  `vod_pic_slide` varchar(255) DEFAULT '',
  `vod_area` char(10) DEFAULT '',
  `vod_language` char(10) DEFAULT '',
  `vod_year` smallint(4) DEFAULT '0',
  `vod_continu` varchar(20) NOT NULL DEFAULT '0',
  `vod_total` mediumint(9) NOT NULL DEFAULT '0',
  `vod_isend` tinyint(1) DEFAULT '1',
  `vod_addtime` int(11) NOT NULL DEFAULT '0',
  `vod_filmtime` int(11) NOT NULL DEFAULT '0',
  `vod_hits` mediumint(8) NOT NULL DEFAULT '0',
  `vod_hits_day` mediumint(8) DEFAULT '0',
  `vod_hits_week` mediumint(8) DEFAULT '0',
  `vod_hits_month` mediumint(8) DEFAULT '0',
  `vod_hits_lasttime` int(11) NOT NULL DEFAULT '0',
  `vod_stars` tinyint(1) NOT NULL DEFAULT '1',
  `vod_status` tinyint(1) NOT NULL DEFAULT '1',
  `vod_up` mediumint(8) NOT NULL DEFAULT '0',
  `vod_down` mediumint(8) NOT NULL DEFAULT '0',
  `vod_play` varchar(255) DEFAULT '',
  `vod_server` varchar(255) DEFAULT '',
  `vod_url` longtext,
  `vod_inputer` varchar(30) DEFAULT '',
  `vod_reurl` varchar(255) DEFAULT '',
  `vod_jumpurl` varchar(150) DEFAULT '',
  `vod_letter` char(2) DEFAULT '',
  `vod_skin` varchar(30) DEFAULT '',
  `vod_gold` decimal(3,1) NOT NULL DEFAULT '0.0',
  `vod_golder` smallint(6) NOT NULL DEFAULT '0',
  `vod_length` smallint(3) DEFAULT NULL,
  `vod_weekday` varchar(60) DEFAULT NULL,
  `vod_series` varchar(120) DEFAULT '',
  `vod_copyright` smallint(3) DEFAULT '0',
  `vod_state` varchar(30) DEFAULT '正片',
  `vod_version` varchar(30) DEFAULT '',
  `vod_tv` varchar(30) DEFAULT '',
  `vod_douban_id` int(11) DEFAULT '0',
  `vod_douban_score` decimal(3,1) DEFAULT '0.0',
  `vod_scenario` longtext,
  `vod_extend` text,
  PRIMARY KEY (`vod_id`),
  KEY `vod_cid` (`vod_cid`),
  KEY `vod_up` (`vod_up`),
  KEY `vod_down` (`vod_down`),
  KEY `vod_addtime` (`vod_addtime`,`vod_cid`),
  KEY `vod_hits` (`vod_hits`,`vod_cid`),
  KEY `vod_gold` (`vod_gold`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;