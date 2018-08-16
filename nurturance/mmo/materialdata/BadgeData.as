﻿package mmo.materialdata
{
	import mmo.framework.domain.honor.Badge;
	import mmo.framework.domain.honor.BadgeLv;

	/**
	 * 称号数据
	 * @author liyawei
	 */	
	
	public class BadgeData
	{
		public function BadgeData()
		{
		}
				
		public static const badgeLvData:Object = {
			"普通":new BadgeLv(1, 0xFFFF00, 0x660000),
			"杰出":new BadgeLv(2, 0x99FF00, 0x003300),
			"稀有":new BadgeLv(3, 0x0033CC, 0x65FFFF),
			"超稀有":new BadgeLv(4, 0xFF3232, 0xFFFF00),
			"神羽":new BadgeLv(5, 0xFF32CC, 0xFFFFFF),
			"荣誉段位":new BadgeLv(6, 0xFF3232, 0xFFFFFF)
		};
		
						
		/**
		 *  称号类 配置。 全工具配置。
		 * 	"{0}":new Badge({0}, "{1}", {2}, "{3}", "{4}"),
		 * --- tool: Db2As.exe
		 */	
		public static const data:Object = 
		{
			//exportData part begin

			"1":new Badge(1, "有钱的家伙", 0, "杰出", "文字"),
			"2":new Badge(2, "雪铃的好帮手", 0, "普通", "文字"),
			"3":new Badge(3, "剑术士", 0, "普通", "文字"),
			"4":new Badge(4, "十字军", 0, "普通", "文字"),
			"5":new Badge(5, "绯红法师", 0, "普通", "文字"),
			"6":new Badge(6, "苍蓝法师", 0, "普通", "文字"),
			"7":new Badge(7, "乐手", 0, "普通", "文字"),
			"8":new Badge(8, "艺师", 0, "普通", "文字"),
			"9":new Badge(9, "魔巢征服者", 0, "普通", "文字"),
			"10":new Badge(10, "冰宫盛宴征服者", 0, "杰出", "文字"),
			"11":new Badge(11, "竞技赛王者", 0, "超稀有", "文字"),
			"12":new Badge(12, "迷镜隧道是我家", 0, "杰出", "文字"),
			"13":new Badge(13, "受欢迎的人", 0, "普通", "文字"),
			"14":new Badge(14, "还有些嫩", 0, "普通", "文字"),
			"15":new Badge(15, "博学者", 0, "稀有", "文字"),
			"16":new Badge(16, "遗迹守护者", 0, "普通", "文字"),
			"17":new Badge(17, "热心人", 0, "杰出", "文字"),
			"18":new Badge(18, "金币清洁器", 0, "普通", "文字"),
			"19":new Badge(19, "联盟新星", 0, "普通", "文字"),
			"20":new Badge(20, "宠物收集家", 0, "杰出", "文字"),
			"21":new Badge(21, "我睡够了", 0, "普通", "文字"),
			"22":new Badge(22, "我讨厌拳套", 0, "普通", "文字"),
			"23":new Badge(23, "我比较傲娇", 0, "普通", "文字"),
			"24":new Badge(24, "我不怕冷", 0, "普通", "文字"),
			"25":new Badge(25, "闭着眼睛都能赢", 0, "杰出", "文字"),
			"26":new Badge(26, "主宰比赛", 0, "杰出", "文字"),
			"27":new Badge(27, "竞技强者", 0, "稀有", "文字"),
			"29":new Badge(29, "我的宠物很厉害", 0, "普通", "文字"),
			"30":new Badge(30, "万圣节之星", 0, "杰出", "文字"),
			"31":new Badge(31, "来打一场么", 0, "普通", "文字"),
			"32":new Badge(32, "巴伦的好徒儿", 0, "普通", "文字"),
			"33":new Badge(33, "帝兰看好我", 0, "普通", "文字"),
			"34":new Badge(34, "未来的英雄", 0, "普通", "文字"),
			"35":new Badge(35, "信翅膀就能飞", 0, "普通", "文字"),
			"36":new Badge(36, "圣诞精灵", 0, "杰出", "文字"),
			"37":new Badge(37, "守护者精英", 0, "杰出", "文字"),
			"38":new Badge(38, "手里剑？能吃吗？", 0, "普通", "文字"),
			"39":new Badge(39, "差点就熟了", 0, "普通", "文字"),
			"40":new Badge(40, "神羽骑士", 0, "神羽", "文字"),
			"41":new Badge(41, "神羽爵士", 0, "神羽", "文字"),
			"42":new Badge(42, "神羽子爵", 0, "神羽", "文字"),
			"43":new Badge(43, "神羽伯爵", 0, "神羽", "文字"),
			"44":new Badge(44, "神羽侯爵", 0, "神羽", "文字"),
			"45":new Badge(45, "神羽公爵", 0, "神羽", "文字"),
			"46":new Badge(46, "神羽亲王", 0, "神羽", "文字"),
			"47":new Badge(47, "爱吃大闸蟹", 0, "稀有", "文字"),
			"48":new Badge(48, "时空支配者", 0, "超稀有", "文字"),
			"49":new Badge(49, "怀表选中之人", 0, "杰出", "文字"),
			"50":new Badge(50, "脸冻僵了", 0, "普通", "文字"),
			"51":new Badge(51, "寒冰王座征服者", 0, "杰出", "文字"),
			"52":new Badge(52, "枕着年糕睡觉", 0, "普通", "文字"),
			"53":new Badge(53, "爱吃巧克力", 0, "普通", "文字"),
			"54":new Badge(54, "荣耀之星", 0, "杰出", "文字"),
			"55":new Badge(55, "绝代花魁", 0, "超稀有", "文字"),
			"56":new Badge(56, "百媚花仙", 0, "稀有", "文字"),
			"57":new Badge(57, "掌花精灵", 0, "杰出", "文字"),
			"58":new Badge(58, "傲视群芳", 0, "稀有", "文字"),
			"59":new Badge(59, "浪漫爱神", 0, "稀有", "文字"),
			"60":new Badge(60, "剑士", 0, "普通", "文字"),
			"61":new Badge(61, "法师", 0, "普通", "文字"),
			"62":new Badge(62, "艺人", 0, "普通", "文字"),
			"63":new Badge(63, "时空统帅", 0, "稀有", "文字"),
			"64":new Badge(64, "王者之剑", 0, "稀有", "文字"),
			"65":new Badge(65, "苍穹之冰", 0, "稀有", "文字"),
			"66":new Badge(66, "舞姬之魂", 0, "稀有", "文字"),
			"67":new Badge(67, "歌坛新星", 0, "稀有", "文字"),
			"68":new Badge(68, "阴阳师", 0, "普通", "文字"),
			"69":new Badge(69, "忍者", 0, "普通", "文字"),
			"70":new Badge(70, "天使", 0, "普通", "文字"),
			"71":new Badge(71, "恶魔", 0, "普通", "文字"),
			"72":new Badge(72, "虚空天使", 0, "普通", "文字"),
			"73":new Badge(73, "人偶师", 0, "普通", "文字"),
			"74":new Badge(74, "幽灵公主", 0, "超稀有", "文字"),
			"75":new Badge(75, "幽冥魔女", 0, "稀有", "文字"),
			"76":new Badge(76, "幽魂花灵", 0, "杰出", "文字"),
			"77":new Badge(77, "万圣夜狂欢者", 0, "杰出", "文字"),
			"78":new Badge(78, "神投手", 0, "杰出", "文字"),
			"79":new Badge(79, "吸血鬼", 0, "普通", "文字"),
			"80":new Badge(80, "钢铁之心", 0, "稀有", "文字"),
			"81":new Badge(81, "绯色流星", 0, "稀有", "文字"),
			"82":new Badge(82, "家园设计之王", 0, "超稀有", "文字"),
			"83":new Badge(83, "家园设计大师", 0, "稀有", "文字"),
			"84":new Badge(84, "家园设计达人", 0, "杰出", "文字"),
			"85":new Badge(85, "快乐的吃货", 0, "杰出", "文字"),
			"86":new Badge(86, "视力8.0", 0, "杰出", "文字"),
			"87":new Badge(87, "乾坤斗转", 0, "稀有", "文字"),
			"88":new Badge(88, "疾风迅影", 0, "稀有", "文字"),
			"89":new Badge(89, "光明天使", 0, "稀有", "文字"),
			"90":new Badge(90, "雪球大战终结者", 0, "杰出", "文字"),
			"91":new Badge(91, "极光法师", 0, "普通", "文字"),
			"92":new Badge(92, "魔界领主", 0, "稀有", "文字"),
			"93":new Badge(93, "神羽至尊骑士", 0, "超稀有", "文字"),
			"94":new Badge(94, "宝珠达人", 0, "稀有", "文字"),
			"95":new Badge(95, "千年前的好朋友", 0, "杰出", "文字"),
			"96":new Badge(96, "绮丽舞者", 0, "稀有", "文字"),
			"97":new Badge(97, "血之贵族", 0, "稀有", "文字"),
			"98":new Badge(98, "幻影骑士", 0, "普通", "文字"),
			"99":new Badge(99, "猜谜我最棒", 0, "杰出", "文字"),
			"100":new Badge(100, "花影公主", 0, "超稀有", "文字"),
			"101":new Badge(101, "花灯郡主", 0, "稀有", "文字"),
			"102":new Badge(102, "元宵仙子", 0, "杰出", "文字"),
			"103":new Badge(103, "炫彩极光", 0, "稀有", "文字"),
			"104":new Badge(104, "王者之枪", 0, "稀有", "文字"),
			"105":new Badge(105, "好朋友一辈子", 0, "杰出", "文字"),
			"106":new Badge(106, "百变公主", 0, "超稀有", "文字"),
			"107":new Badge(107, "华装仙子", 0, "稀有", "文字"),
			"108":new Badge(108, "变装精灵", 0, "杰出", "文字"),
			"109":new Badge(109, "百宝花神", 0, "超稀有", "文字"),
			"110":new Badge(110, "宝石精灵", 0, "稀有", "文字"),
			"111":new Badge(111, "寻宝达人", 0, "杰出", "文字"),
			"112":new Badge(112, "神一样的队友", 0, "杰出", "文字"),
			"113":new Badge(113, "精灵空间百科全书", 0, "杰出", "文字"),
			"114":new Badge(114, "红蔷薇骑士", 0, "超稀有", "文字"),
			"115":new Badge(115, "紫罗兰骑士", 0, "稀有", "文字"),
			"116":new Badge(116, "满天星骑士", 0, "杰出", "文字"),
			"117":new Badge(117, "木头中的大木头", 0, "稀有", "文字"),
			"118":new Badge(118, "史上最强弟子", 0, "超稀有", "文字"),
			"119":new Badge(119, "姥姥的2弟子", 0, "杰出", "文字"),
			"120":new Badge(120, "彩鳞皇女", 0, "超稀有", "文字"),
			"121":new Badge(121, "浪花仙子", 0, "稀有", "文字"),
			"122":new Badge(122, "碧波水灵", 0, "杰出", "文字"),
			"123":new Badge(123, "百分百守护者", 0, "杰出", "文字"),
			"124":new Badge(124, "联盟领导者", 0, "超稀有", "文字"),
			"125":new Badge(125, "凌风的认可", 0, "杰出", "文字"),
			"126":new Badge(126, "琳娜的认可", 0, "杰出", "文字"),
			"127":new Badge(127, "威恩的认可", 0, "杰出", "文字"),
			"128":new Badge(128, "奥罗拉的认可", 0, "杰出", "文字"),
			"129":new Badge(129, "塔莉亚的认可", 0, "杰出", "文字"),
			"130":new Badge(130, "战神的认可", 0, "超稀有", "文字"),
			"131":new Badge(131, "荣耀骑士", 0, "稀有", "文字"),
			"132":new Badge(132, "最强骑士团", 0, "超稀有", "文字"),
			"133":new Badge(133, "精英骑士团", 0, "稀有", "文字"),
			"134":new Badge(134, "优秀骑士团", 0, "杰出", "文字"),
			"135":new Badge(135, "最强大众评委", 0, "杰出", "文字"),
			"136":new Badge(136, "曙光公主", 0, "超稀有", "文字"),
			"137":new Badge(137, "永夜骑士", 0, "超稀有", "文字"),
			"138":new Badge(138, "光明郡主", 0, "超稀有", "文字"),
			"139":new Badge(139, "月光游侠", 0, "超稀有", "文字"),
			"140":new Badge(140, "破晓精灵", 0, "稀有", "文字"),
			"141":new Badge(141, "星辰卫士", 0, "稀有", "文字"),
			"142":new Badge(142, "万众偶像", 0, "普通", "文字"),
			"143":new Badge(143, "甜心擂台达人", 0, "杰出", "文字"),
			"144":new Badge(144, "罗莎大弟子", 0, "超稀有", "文字"),
			"145":new Badge(145, "罗莎小徒弟", 0, "稀有", "文字"),
			"146":new Badge(146, "未来设计新星", 0, "杰出", "文字"),
			"147":new Badge(147, "海之女王", 0, "超稀有", "文字"),
			"148":new Badge(148, "海浪公主", 0, "稀有", "文字"),
			"149":new Badge(149, "海风精灵", 0, "杰出", "文字"),
			"150":new Badge(150, "神羽大公", 0, "神羽", "文字"),
			"151":new Badge(151, "神羽君王", 0, "神羽", "文字"),
			"152":new Badge(152, "神羽帝王", 0, "神羽", "文字"),
			"153":new Badge(153, "单人赛英雄王", 0, "超稀有", "文字"),
			"154":new Badge(154, "单人赛英雄", 0, "稀有", "文字"),
			"155":new Badge(155, "单人赛精英", 0, "杰出", "文字"),
			"156":new Badge(156, "团队赛英雄王", 0, "超稀有", "文字"),
			"157":new Badge(157, "团队赛英雄", 0, "稀有", "文字"),
			"158":new Badge(158, "团队赛精英", 0, "杰出", "文字"),
			"159":new Badge(159, "甜心国度守护者", 0, "杰出", "文字"),
			"160":new Badge(160, "甜心国度之王", 0, "超稀有", "文字"),
			"161":new Badge(161, "月光小当家", 0, "杰出", "文字"),
			"162":new Badge(162, "月神的宠儿", 0, "杰出", "文字"),
			"163":new Badge(163, "❤Brave Heart❤", 0, "杰出", "文字"),
			"164":new Badge(164, "月光公主", 0, "超稀有", "文字"),
			"165":new Badge(165, "月亮仙子", 0, "稀有", "文字"),
			"166":new Badge(166, "满月精灵", 0, "杰出", "文字"),
			"167":new Badge(167, "魔法贵族", 0, "超稀有", "文字"),
			"168":new Badge(168, "魔法使者", 0, "稀有", "文字"),
			"169":new Badge(169, "魔法小鬼", 0, "杰出", "文字"),
			"170":new Badge(170, "魔女冰原统领", 0, "稀有", "文字"),
			"171":new Badge(171, "精灵偶像", 0, "杰出", "文字"),
			"172":new Badge(172, "皇家御用设计师", 0, "超稀有", "文字"),
			"173":new Badge(173, "首席设计师", 0, "稀有", "文字"),
			"174":new Badge(174, "高级设计师", 0, "杰出", "文字"),
			"175":new Badge(175, "华丽假面舞王", 0, "杰出", "文字"),
			"176":new Badge(176, "搞怪南瓜舞王", 0, "杰出", "文字"),
			"177":new Badge(177, "幽灵盛典之王", 0, "杰出", "文字"),
			"178":new Badge(178, "超级模特", 0, "超稀有", "文字"),
			"179":new Badge(179, "精英模特", 0, "稀有", "文字"),
			"180":new Badge(180, "新星模特", 0, "杰出", "文字"),
			"181":new Badge(181, "梦幻大天使", 0, "超稀有", "文字"),
			"182":new Badge(182, "梦幻天使", 0, "稀有", "文字"),
			"183":new Badge(183, "梦幻精灵", 0, "杰出", "文字"),
			"184":new Badge(184, "名媛望族", 0, "稀有", "文字"),
			"185":new Badge(185, "皇家优等生", 0, "杰出", "文字"),
			"186":new Badge(186, "绝对女主", 0, "杰出", "文字"),
			"187":new Badge(187, "学院女王", 0, "超稀有", "文字"),
			"188":new Badge(188, "学院之王", 0, "超稀有", "文字"),
			"189":new Badge(189, "学院特优生", 0, "稀有", "文字"),
			"190":new Badge(190, "学院精英", 0, "杰出", "文字"),
			"191":new Badge(191, "秀场之星", 0, "杰出", "文字"),
			"192":new Badge(192, "秀场之王", 0, "稀有", "文字"),
			"193":new Badge(193, "秀场之神", 0, "超稀有", "文字"),
			"194":new Badge(194, "学院天使", 0, "杰出", "文字"),
			"195":new Badge(195, "名媛", 0, "杰出", "文字"),
			"196":new Badge(196, "名士", 0, "杰出", "文字"),
			"197":new Badge(197, "圣星神羽骑士", 0, "神羽", "炫图"),
			"198":new Badge(198, "生日天使", 0, "杰出", "文字"),
			"199":new Badge(199, "我喂官网袋盐", 0, "普通", "文字"),
			"200":new Badge(200, "一颗红豆一个宇宙", 0, "杰出", "文字"),
			"201":new Badge(201, "绝对胜利者", 0, "普通", "文字"),
			"202":new Badge(202, "魅力粉丝队长", 0, "杰出", "文字"),
			"203":new Badge(203, "魅力超级粉丝", 0, "普通", "文字"),
			"204":new Badge(204, "魅力铁杆粉丝", 0, "普通", "文字"),
			"205":new Badge(205, "星辉之王", 0, "超稀有", "文字"),
			"206":new Badge(206, "极星小主", 0, "稀有", "文字"),
			"207":new Badge(207, "星光圣使", 0, "杰出", "文字"),
			"208":new Badge(208, "舞会装新星", 0, "稀有", "文字"),
			"209":new Badge(209, "舞会装达人", 0, "稀有", "炫图"),
			"210":new Badge(210, "百变舞会之王", 0, "超稀有", "炫图"),
			"211":new Badge(211, "年度小小编", 0, "稀有", "文字"),
			"212":new Badge(212, "梦幻设计之神", 0, "超稀有", "文字"),
			"213":new Badge(213, "梦幻设计大师", 0, "稀有", "文字"),
			"214":new Badge(214, "梦幻设计达人", 0, "杰出", "文字"),
			"215":new Badge(215, "梦幻设计新秀", 0, "杰出", "文字"),
			"216":new Badge(216, "最强星团之王", 0, "超稀有", "炫图"),
			"217":new Badge(217, "超级星团看我的", 0, "稀有", "炫图"),
			"218":new Badge(218, "明日之星就是我", 0, "杰出", "文字"),
			"219":new Badge(219, "耀眼新春舞王", 0, "杰出", "文字"),
			"220":new Badge(220, "绚丽星辉舞王", 0, "杰出", "文字"),
			"221":new Badge(221, "人偶回忆守护者", 0, "普通", "文字"),
			"222":new Badge(222, "奥雅观察家", 0, "普通", "文字"),
			"223":new Badge(223, "领主竞选者", 0, "普通", "文字"),
			"224":new Badge(224, "全民希望", 0, "杰出", "文字"),
			"225":new Badge(225, "奥雅名豪", 0, "稀有", "炫图"),
			"226":new Badge(226, "一代领主", 0, "超稀有", "炫图"),
			"227":new Badge(227, "炫舞粉丝队长", 0, "杰出", "文字"),
			"228":new Badge(228, "炫舞超级粉丝", 0, "普通", "文字"),
			"229":new Badge(229, "炫舞铁杆粉丝", 0, "普通", "文字"),
			"230":new Badge(230, "超越魔神", 0, "稀有", "文字"),
			"231":new Badge(231, "超越战神", 0, "稀有", "文字"),
			"232":new Badge(232, "2014单人竞技王", 0, "超稀有", "文字"),
			"233":new Badge(233, "2014单人竞技精英", 0, "稀有", "文字"),
			"234":new Badge(234, "2014单人竞技高手", 0, "杰出", "文字"),
			"235":new Badge(235, "2014小队竞技王", 0, "超稀有", "文字"),
			"236":new Badge(236, "2014小队竞技精英", 0, "稀有", "文字"),
			"237":new Badge(237, "2014小队竞技高手", 0, "杰出", "文字"),
			"238":new Badge(238, "新年小伙伴", 0, "杰出", "文字"),
			"239":new Badge(239, "炫音粉丝队长", 0, "杰出", "文字"),
			"240":new Badge(240, "炫音超级粉丝", 0, "普通", "文字"),
			"241":new Badge(241, "炫音铁杆粉丝", 0, "普通", "文字"),
			"242":new Badge(242, "爱之观察家", 0, "普通", "文字"),
			"243":new Badge(243, "爱之竞选人", 0, "普通", "文字"),
			"244":new Badge(244, "爱之守望者", 0, "杰出", "文字"),
			"245":new Badge(245, "爱之守护者", 90, "稀有", "炫图"),
			"246":new Badge(246, "爱之领主", 90, "超稀有", "炫图"),
			"247":new Badge(247, "巧克力花灯状元", 0, "杰出", "文字"),
			"248":new Badge(248, "水果王国的主人", 0, "超稀有", "炫图"),
			"249":new Badge(249, "炫光珠花秀主", 0, "普通", "文字"),
			"250":new Badge(250, "御用作词人", 14, "稀有", "炫图"),
			"251":new Badge(251, "破坏神克星", 0, "杰出", "文字"),
			"252":new Badge(252, "冥府神克星", 0, "杰出", "文字"),
			"253":new Badge(253, "复仇神克星", 0, "杰出", "文字"),
			"254":new Badge(254, "Girls Time最佳编导", 14, "稀有", "炫图"),
			"255":new Badge(255, "我是大明星", 14, "稀有", "炫图"),
			"256":new Badge(256, "雪奈尔贵族", 0, "稀有", "文字"),
			"257":new Badge(257, "白晶级贵族", 0, "稀有", "文字"),
			"258":new Badge(258, "粉晶级贵族", 0, "稀有", "炫图"),
			"259":new Badge(259, "紫晶级贵族", 0, "超稀有", "炫图"),
			"260":new Badge(260, "黄晶级贵族", 0, "超稀有", "炫图"),
			"261":new Badge(261, "雪奈尔品牌代言人", 7, "超稀有", "炫图"),
			"262":new Badge(262, "奥雅影帝", 0, "超稀有", "文字"),
			"263":new Badge(263, "奥雅影后", 0, "超稀有", "文字"),
			"264":new Badge(264, "最佳女主角", 0, "稀有", "文字"),
			"265":new Badge(265, "最佳男主角", 0, "稀有", "文字"),
			"266":new Badge(266, "影坛新星", 0, "杰出", "文字"),
			"267":new Badge(267, "女神的小可爱", 0, "杰出", "文字"),
			"268":new Badge(268, "女神护佑者", 14, "稀有", "炫图"),
			"269":new Badge(269, "女神继承者", 30, "超稀有", "炫图"),
			"270":new Badge(270, "人气爆棚", 0, "稀有", "炫图"),
			"271":new Badge(271, "友情达人", 0, "稀有", "炫图"),
			"272":new Badge(272, "天生一对", 0, "稀有", "炫图"),
			"273":new Badge(273, "最佳礼伴", 0, "普通", "文字"),
			"274":new Badge(274, "天生一对", 0, "稀有", "炫图"),
			"275":new Badge(275, "楼兰风云编曲人", 14, "杰出", "炫图"),
			"276":new Badge(276, "舞友好拍档", 0, "普通", "文字"),
			"277":new Badge(277, "楼兰星辉", 14, "杰出", "炫图"),
			"278":new Badge(278, "楼兰舞王", 0, "杰出", "文字"),
			"279":new Badge(279, "绚梦舞王", 0, "杰出", "文字"),
			"280":new Badge(280, "楼兰最佳编导", 14, "杰出", "炫图"),
			"281":new Badge(281, "派对女王", 0, "杰出", "炫图"),
			"282":new Badge(282, "派对公主", 0, "杰出", "炫图"),
			"283":new Badge(283, "玫瑰仙后", 0, "超稀有", "文字"),
			"284":new Badge(284, "芙蓉仙使", 0, "稀有", "文字"),
			"285":new Badge(285, "紫藤香君", 0, "杰出", "文字"),
			"286":new Badge(286, "叶之守护", 30, "普通", "文字"),
			"287":new Badge(287, "雨luo泪了", 30, "普通", "文字"),
			"288":new Badge(288, "霜月听雪", 30, "普通", "文字"),
			"289":new Badge(289, "白鹭霜华浓", 30, "超稀有", "文字"),
			"290":new Badge(290, "满天的行星", 30, "超稀有", "文字"),
			"291":new Badge(291, "呆呆小木头", 0, "稀有", "文字"),
			"292":new Badge(292, "梦想社长", 0, "超稀有", "文字"),
			"293":new Badge(293, "梦想部长", 0, "稀有", "文字"),
			"294":new Badge(294, "梦想小星星", 0, "杰出", "文字"),
			"295":new Badge(295, "黄金天才设计至尊", 14, "杰出", "文字"),
			"296":new Badge(296, "钻石天才设计王者", 14, "稀有", "文字"),
			"297":new Badge(297, "银光天才设计强人", 14, "杰出", "文字"),
			"298":new Badge(298, "青铜天才设计达人", 14, "普通", "文字"),
			"299":new Badge(299, "最美治愈梦之声", 0, "稀有", "炫图"),
			"300":new Badge(300, "最美重生梦之声", 0, "稀有", "炫图"),
			"301":new Badge(301, "最美噬魂梦之声", 0, "稀有", "炫图"),
			"302":new Badge(302, "最美童心梦之声", 0, "稀有", "炫图"),
			"303":new Badge(303, "美梦声优", 0, "普通", "文字"),
			"304":new Badge(304, "首席御用设计师", 90, "稀有", "炫图"),
			"305":new Badge(305, "尊贵御用设计师", 90, "稀有", "炫图"),
			"306":new Badge(306, "御用房屋设计师", 14, "稀有", "炫图"),
			"307":new Badge(307, "梦想社团NO.1", 0, "稀有", "文字"),
			"308":new Badge(308, "梦想社团小伙伴", 0, "杰出", "文字"),
			"309":new Badge(309, "贴标签达人", 0, "普通", "文字"),
			"310":new Badge(310, "打水仗最佳队友", 0, "杰出", "文字"),
			"311":new Badge(311, "3周年最炫小屋", 14, "超稀有", "炫图"),
			"312":new Badge(312, "3周年竞技之王", 14, "超稀有", "炫图"),
			"313":new Badge(313, "雪奈尔代言人", 14, "超稀有", "炫图"),
			"314":new Badge(314, "3周年绝代花魁", 14, "超稀有", "炫图"),
			"315":new Badge(315, "我的小屋美美哒", 14, "稀有", "炫图"),
			"316":new Badge(316, "幸运女神", 0, "超稀有", "文字"),
			"317":new Badge(317, "幸运天使", 0, "稀有", "文字"),
			"318":new Badge(318, "幸运小星星", 0, "杰出", "文字"),
			"319":new Badge(319, "挖宝大神", 30, "稀有", "文字"),
			"320":new Badge(320, "宝藏精灵", 30, "杰出", "文字"),
			"321":new Badge(321, "寻宝达人", 30, "普通", "文字"),
			"322":new Badge(322, "家园小达人", 14, "杰出", "文字"),
			"323":new Badge(323, "我喂梦境师袋盐", 0, "普通", "文字"),
			"324":new Badge(324, "超级竞拍家", 30, "稀有", "炫图"),
			"325":new Badge(325, "梦翼天皇", 30, "超稀有", "文字"),
			"326":new Badge(326, "梦翼之后", 30, "稀有", "文字"),
			"327":new Badge(327, "梦翼尊者", 30, "杰出", "文字"),
			"328":new Badge(328, "爱心天使", 0, "稀有", "文字"),
			"329":new Badge(329, "3周年竞技达人", 14, "稀有", "炫图"),
			"330":new Badge(330, "灵梦公主", 0, "超稀有", "文字"),
			"331":new Badge(331, "盗梦骑士", 0, "超稀有", "文字"),
			"332":new Badge(332, "造梦甜心", 0, "稀有", "文字"),
			"333":new Badge(333, "绮梦精灵", 0, "稀有", "文字"),
			"334":new Badge(334, "降梦花妖", 0, "杰出", "文字"),
			"335":new Badge(335, "托梦使者", 0, "杰出", "文字"),
			"336":new Badge(336, "最美毁灭梦之声", 0, "稀有", "炫图"),
			"337":new Badge(337, "最美轮回梦之声", 0, "稀有", "炫图"),
			"338":new Badge(338, "最美命运梦之声", 0, "稀有", "炫图"),
			"339":new Badge(339, "最美魅力梦之声", 0, "稀有", "炫图"),
			"340":new Badge(340, "爱心传递者", 0, "稀有", "文字"),
			"341":new Badge(341, "土豪爱人", 0, "超稀有", "文字"),
			"342":new Badge(342, "霸道情人", 0, "稀有", "文字"),
			"343":new Badge(343, "亲密恋人", 0, "稀有", "文字"),
			"345":new Badge(345, "庆典御用设计师", 0, "稀有", "文字"),
			"346":new Badge(346, "庆典精英设计师", 0, "杰出", "文字"),
			"347":new Badge(347, "庆典设计达人", 0, "杰出", "文字"),
			"348":new Badge(348, "庆典设计新秀", 0, "杰出", "文字"),
			"349":new Badge(349, "心心相印", 0, "杰出", "文字"),
			"350":new Badge(350, "三世情缘", 14, "杰出", "炫图"),
			"351":new Badge(351, "星月神话", 1, "稀有", "炫图"),
			"352":new Badge(352, "梦·金牌编剧", 14, "超稀有", "炫图"),
			"353":new Badge(353, "时尚之星", 0, "普通", "文字"),
			"354":new Badge(354, "勇士之星", 0, "普通", "文字"),
			"355":new Badge(355, "梦境作曲家", 14, "超稀有", "炫图"),
			"356":new Badge(356, "大明星萌萌哒", 14, "稀有", "炫图"),
			"357":new Badge(357, "月下须臾", 14, "稀有", "炫图"),
			"358":new Badge(358, "Renaissance", 14, "稀有", "炫图"),
			"359":new Badge(359, "梦花醉月宫主", 0, "杰出", "文字"),
			"360":new Badge(360, "神器最佳捕手", 0, "杰出", "文字"),
			"361":new Badge(361, "梦花醉月粉丝", 0, "普通", "文字"),
			"362":new Badge(362, "魔法女王", 0, "超稀有", "文字"),
			"363":new Badge(363, "魔法精灵", 0, "稀有", "文字"),
			"364":new Badge(364, "魔法使者", 0, "杰出", "文字"),
			"365":new Badge(365, "最美长夜梦之声", 0, "稀有", "炫图"),
			"366":new Badge(366, "最美幻想梦之声", 0, "稀有", "炫图"),
			"367":new Badge(367, "最美异能梦之声", 0, "稀有", "炫图"),
			"368":new Badge(368, "最美永无梦之声", 0, "稀有", "炫图"),
			"369":new Badge(369, "正在加载...99.9％", 30, "稀有", "文字"),
			"370":new Badge(370, "淡情淡意淡红尘-◢", 30, "稀有", "文字"),
			"371":new Badge(371, "春风拂栏", 30, "稀有", "文字"),
			"372":new Badge(372, "末年、流失的梦", 30, "稀有", "文字"),
			"373":new Badge(373, "逗比少年欢乐多", 30, "稀有", "文字"),
			"374":new Badge(374, "君临天下♠", 30, "稀有", "文字"),
			"375":new Badge(375, "我家宫主一米六", 30, "稀有", "文字"),
			"376":new Badge(376, "JX·极耀黎明", 30, "稀有", "文字"),
			"377":new Badge(377, "心亦凉i", 30, "稀有", "文字"),
			"378":new Badge(378, "执念丶魅影", 30, "稀有", "文字"),
			"379":new Badge(379, "自爆菊花爽歪歪", 30, "稀有", "文字"),
			"380":new Badge(380, "基光BABY", 30, "稀有", "文字"),
			"381":new Badge(381, "清风明月等闲人", 30, "稀有", "文字"),
			"382":new Badge(382, "初心者保护协会", 30, "稀有", "文字"),
			"383":new Badge(383, "血之契约", 30, "稀有", "文字"),
			"384":new Badge(384, "人不作死枉少年", 30, "稀有", "文字"),
			"385":new Badge(385, "✟---吾殇", 30, "稀有", "文字"),
			"386":new Badge(386, "执行者", 30, "稀有", "文字"),
			"387":new Badge(387, "羁绊灬一生", 30, "稀有", "文字"),
			"388":new Badge(388, "得见您君临天下", 30, "稀有", "文字"),
			"389":new Badge(389, "荣耀征途，十年如一", 30, "稀有", "文字"),
			"390":new Badge(390, "遗忘之森", 30, "稀有", "文字"),
			"391":new Badge(391, "醉红尘", 30, "稀有", "文字"),
			"392":new Badge(392, "红尘", 30, "稀有", "文字"),
			"393":new Badge(393, "斩·赤红之瞳", 30, "稀有", "文字"),
			"394":new Badge(394, "百田机密部", 30, "稀有", "文字"),
			"395":new Badge(395, "索克萨尔", 0, "超稀有", "文字"),
			"396":new Badge(396, "蛇之使徒", 0, "超稀有", "文字"),
			"397":new Badge(397, "葡萄萄萄萄萄￣～￣", 0, "超稀有", "文字"),
			"398":new Badge(398, "黄少天的男朋友", 0, "超稀有", "文字"),
			"399":new Badge(399, "百里屠鸽", 0, "超稀有", "文字"),
			"400":new Badge(400, "月之轮回", 0, "超稀有", "文字"),
			"401":new Badge(401, "身边皆我身下受", 0, "超稀有", "文字"),
			"402":new Badge(402, "萌萌哒萌萌萌萌", 0, "超稀有", "文字"),
			"403":new Badge(403, "蛇之使徒", 0, "超稀有", "文字"),
			"404":new Badge(404, "蛇之使徒", 0, "超稀有", "文字"),
			"405":new Badge(405, "玛丽苏推土机▔V▔", 0, "超稀有", "文字"),
			"406":new Badge(406, "夜雨声烦", 0, "超稀有", "文字"),
			"407":new Badge(407, "欧阳烧兔", 0, "超稀有", "文字"),
			"408":new Badge(408, "蛇之使徒", 0, "超稀有", "文字"),
			"409":new Badge(409, "伤潮溺亡", 0, "超稀有", "文字"),
			"410":new Badge(410, "栀染", 0, "超稀有", "文字"),
			"411":new Badge(411, "美丽第一人", 14, "超稀有", "炫图"),
			"412":new Badge(412, "美丽之星", 14, "超稀有", "炫图"),
			"413":new Badge(413, "梦幻蔷薇", 14, "超稀有", "炫图"),
			"414":new Badge(414, "萌神惊天动地", 0, "超稀有", "炫图"),
			"415":new Badge(415, "萌斗士", 0, "稀有", "炫图"),
			"416":new Badge(416, "呆呆萌萌", 0, "稀有", "炫图"),
			"417":new Badge(417, "呆萌呆萌大眼睛", 0, "杰出", "文字"),
			"418":new Badge(418, "武斗之皇", 14, "超稀有", "炫图"),
			"419":new Badge(419, "武斗达人", 14, "稀有", "炫图"),
			"420":new Badge(420, "苍之深渊", 0, "超稀有", "文字"),
			"421":new Badge(421, "未来城管", 0, "超稀有", "文字"),
			"422":new Badge(422, "七耀之理", 0, "超稀有", "文字"),
			"423":new Badge(423, "荣耀", 0, "超稀有", "文字"),
			"424":new Badge(424, "桃花依旧笑春风", 0, "超稀有", "文字"),
			"425":new Badge(425, "我是机长", 0, "超稀有", "文字"),
			"426":new Badge(426, "于今腐草无引火-◢", 0, "超稀有", "文字"),
			"427":new Badge(427, "无逗比不高冷", 0, "超稀有", "文字"),
			"428":new Badge(428, "奈何桥见愿你笑如当年", 0, "超稀有", "文字"),
			"429":new Badge(429, "红叶公主", 0, "超稀有", "文字"),
			"430":new Badge(430, "叶之精灵", 0, "稀有", "文字"),
			"431":new Badge(431, "月叶星星", 0, "杰出", "文字"),
			"432":new Badge(432, "万圣幽冥王", 0, "杰出", "文字"),
			"433":new Badge(433, "点灯能手", 7, "超稀有", "文字"),
			"434":new Badge(434, "优雅公主", 7, "超稀有", "文字"),
			"435":new Badge(435, "浪漫公主", 14, "超稀有", "炫图"),
			"436":new Badge(436, "浪漫精灵", 14, "稀有", "炫图"),
			"437":new Badge(437, "浪漫舞者", 14, "稀有", "炫图"),
			"438":new Badge(438, "浪漫使者", 14, "杰出", "炫图"),
			"439":new Badge(439, "我是初级收藏家", 0, "杰出", "文字"),
			"440":new Badge(440, "小小收藏家", 0, "杰出", "文字"),
			"441":new Badge(441, "我爱AOYA卡", 0, "稀有", "文字"),
			"442":new Badge(442, "天生收集控", 0, "稀有", "文字"),
			"443":new Badge(443, "海洋女神", 0, "超稀有", "文字"),
			"444":new Badge(444, "海之美人鱼", 0, "稀有", "文字"),
			"445":new Badge(445, "海之星辰", 0, "杰出", "文字"),
			"446":new Badge(446, "花儿天使星", 14, "稀有", "文字"),
			"447":new Badge(447, "抢优惠大神", 7, "稀有", "文字"),
			"448":new Badge(448, "冬日恋壕", 14, "稀有", "炫图"),
			"449":new Badge(449, "金闪闪", 14, "超稀有", "炫图"),
			"450":new Badge(450, "我是中级收藏家", 0, "杰出", "文字"),
			"451":new Badge(451, "收藏也疯狂", 0, "稀有", "文字"),
			"452":new Badge(452, "浪漫卓越设计师", 30, "超稀有", "炫图"),
			"453":new Badge(453, "浪漫精英设计师", 30, "稀有", "炫图"),
			"454":new Badge(454, "浪漫设计先锋", 30, "稀有", "炫图"),
			"455":new Badge(455, "浪漫设计达人", 30, "杰出", "炫图"),
			"456":new Badge(456, "我的账号很安全", 0, "普通", "文字"),
			"457":new Badge(457, "Empress", 0, "超稀有", "炫图"),
			"458":new Badge(458, "恨妹不成穹，恨穹不成妹", 0, "超稀有", "炫图"),
			"459":new Badge(459, "212蛋生回归", 0, "超稀有", "炫图"),
			"460":new Badge(460, "年费神羽棒棒哒！", 0, "超稀有", "炫图"),
			"461":new Badge(461, "2015年费加油", 0, "超稀有", "炫图"),
			"462":new Badge(462, "2015首拍之尊", 0, "超稀有", "文字"),
			"463":new Badge(463, "星际公主", 0, "超稀有", "文字"),
			"464":new Badge(464, "星际天使", 0, "稀有", "文字"),
			"465":new Badge(465, "星际宝贝", 0, "杰出", "文字"),
			"466":new Badge(466, "星之小公主", 0, "杰出", "文字"),
			"467":new Badge(467, "神一样的队友", 0, "杰出", "文字"),
			"468":new Badge(468, "最公主", 14, "超稀有", "炫图"),
			"469":new Badge(469, "双星·公主", 14, "稀有", "炫图"),
			"470":new Badge(470, "小公主", 14, "杰出", "文字"),
			"471":new Badge(471, "御女王", 14, "超稀有", "炫图"),
			"472":new Badge(472, "双星•女王", 14, "稀有", "炫图"),
			"473":new Badge(473, "小女王", 14, "杰出", "文字"),
			"474":new Badge(474, "女王的骑士", 14, "超稀有", "文字"),
			"475":new Badge(475, "女王的护卫", 14, "稀有", "文字"),
			"476":new Badge(476, "公主的骑士", 14, "超稀有", "文字"),
			"477":new Badge(477, "公主的护卫", 14, "稀有", "文字"),
			"478":new Badge(478, "荣耀世界总决赛冠军", 0, "超稀有", "文字"),
			"479":new Badge(479, "有钱就是辣么任性", 0, "超稀有", "文字"),
			"480":new Badge(480, "我是机长", 0, "超稀有", "文字"),
			"481":new Badge(481, "漆黑之牙", 0, "超稀有", "文字"),
			"482":new Badge(482, "菊色满园关不住", 0, "超稀有", "文字"),
			"483":new Badge(483, "太阳射♂鈤", 0, "超稀有", "文字"),
			"484":new Badge(484, "后宫三千", 0, "超稀有", "文字"),
			"485":new Badge(485, "弑神者", 0, "超稀有", "文字"),
			"486":new Badge(486, "一根黄瓜出墙来", 0, "超稀有", "文字"),
			"487":new Badge(487, "有药就是任性", 0, "超稀有", "文字"),
			"488":new Badge(488, "活跃小粉丝", 0, "杰出", "文字"),
			"489":new Badge(489, "拉票小能手", 0, "超稀有", "炫图"),
			"490":new Badge(490, "AOYA VOGUE封面首秀", 0, "超稀有", "文字"),
			"491":new Badge(491, "奥雅好声音", 0, "杰出", "文字"),
			"492":new Badge(492, "苍穹神羽骑士", 0, "超稀有", "炫图"),
			"493":new Badge(493, "梦中情人", 14, "超稀有", "炫图"),
			"494":new Badge(494, "任性恋人", 14, "稀有", "炫图"),
			"495":new Badge(495, "甜蜜伴侣", 14, "稀有", "炫图"),
			"496":new Badge(496, "AOYAJOY", 1, "稀有", "炫图"),
			"497":new Badge(497, "天籁之音", 0, "超稀有", "炫图"),
			"498":new Badge(498, "高山流水", 0, "超稀有", "炫图"),
			"499":new Badge(499, "绕梁三日", 0, "超稀有", "炫图"),
			"500":new Badge(500, "动人心弦", 0, "稀有", "炫图"),
			"501":new Badge(501, "情场高手TOP1", 7, "超稀有", "炫图"),
			"502":new Badge(502, "约会专家", 7, "稀有", "炫图"),
			"503":new Badge(503, "约会达人", 7, "稀有", "炫图"),
			"504":new Badge(504, "给你的情书", 7, "稀有", "文字"),
			"505":new Badge(505, "恋·梦天使", 0, "超稀有", "文字"),
			"506":new Badge(506, "唯·魅恶魔", 0, "超稀有", "文字"),
			"507":new Badge(507, "玫瑰侍者", 0, "稀有", "文字"),
			"508":new Badge(508, "玫瑰精灵", 0, "稀有", "文字"),
			"509":new Badge(509, "巧克力甜心", 0, "杰出", "文字"),
			"510":new Badge(510, "巧克力宝贝", 0, "杰出", "文字"),
			"511":new Badge(511, "岚林的最爱", 30, "稀有", "炫图"),
			"512":new Badge(512, "光咲的最爱", 30, "稀有", "炫图"),
			"513":new Badge(513, "Hyder的最爱", 30, "稀有", "炫图"),
			"514":new Badge(514, "智由的最爱", 30, "稀有", "炫图"),
			"515":new Badge(515, "梦想者", 0, "杰出", "文字"),
			"516":new Badge(516, "领主", 0, "杰出", "文字"),
			"517":new Badge(517, "子爵", 0, "杰出", "文字"),
			"518":new Badge(518, "伯爵", 0, "稀有", "文字"),
			"519":new Badge(519, "侯爵", 0, "稀有", "文字"),
			"520":new Badge(520, "公爵", 0, "稀有", "文字"),
			"521":new Badge(521, "王爵", 0, "超稀有", "文字"),
			"522":new Badge(522, "君临天下", 0, "超稀有", "文字"),
			"523":new Badge(523, "A Elbereth Glithoniel", 0, "超稀有", "炫图"),
			"524":new Badge(524, "月下须臾", 0, "超稀有", "炫图"),
			"525":new Badge(525, "Seraphim", 0, "超稀有", "炫图"),
			"526":new Badge(526, "魔法物语", 0, "超稀有", "炫图"),
			"527":new Badge(527, "Maroon5", 0, "超稀有", "炫图"),
			"528":new Badge(528, "One Piece", 0, "超稀有", "炫图"),
			"529":new Badge(529, "联盟战神", 7, "超稀有", "文字"),
			"530":new Badge(530, "整蛊之王", 7, "超稀有", "文字"),
			"531":new Badge(531, "你开心就好", 7, "超稀有", "文字"),
			"532":new Badge(532, "苍蓝女神", 0, "超稀有", "文字"),
			"533":new Badge(533, "苍绯花灵", 0, "稀有", "文字"),
			"534":new Badge(534, "苍语歌姬", 0, "杰出", "文字"),
			"535":new Badge(535, "种族大使", 0, "杰出", "文字"),
			"536":new Badge(536, "精灵功臣", 14, "稀有", "文字"),
			"537":new Badge(537, "精灵爱戴者", 14, "杰出", "文字"),
			"538":new Badge(538, "精灵拥护者", 14, "普通", "文字"),
			"539":new Badge(539, "王国功臣", 14, "稀有", "文字"),
			"540":new Badge(540, "王国爱戴者", 14, "杰出", "文字"),
			"541":new Badge(541, "王国拥护者", 14, "普通", "文字"),
			"542":new Badge(542, "远古·风语遗民", 1, "稀有", "炫图"),
			"543":new Badge(543, "风语领主", 7, "杰出", "文字"),
			"544":new Badge(544, "魅力T台QUEEN", 0, "稀有", "文字"),
			"545":new Badge(545, "盛夏避暑山庄", 14, "超稀有", "炫图"),
			"546":new Badge(546, "清凉小屋设计师", 14, "稀有", "炫图"),
			"547":new Badge(547, "小屋装扮小能手", 0, "杰出", "文字"),
			"548":new Badge(548, "大电影代言人", 7, "普通", "文字"),
			"549":new Badge(549, "蝶恋公主", 0, "超稀有", "炫图"),
			"550":new Badge(550, "梦蝶仙子", 0, "超稀有", "炫图"),
			"551":new Badge(551, "xxx", 0, "超稀有", "炫图"),
			"552":new Badge(552, "夏日烟火祭大富豪", 0, "超稀有", "炫图"),
			"553":new Badge(553, "夏日烟火祭小富翁", 0, "普通", "文字"),
			"554":new Badge(554, "夏日烟火祭理财高手", 7, "普通", "文字"),
			"555":new Badge(555, "奥雅神枪手", 0, "稀有", "文字"),
			"556":new Badge(556, "魔法贵族学园新秀", 0, "普通", "文字"),
			"557":new Badge(557, "闪瞎单身汪", 0, "稀有", "文字"),
			"558":new Badge(558, "时尚梦幻女王", 7, "稀有", "炫图"),
			"559":new Badge(559, "执事QUEEN", 0, "杰出", "文字"),
			"560":new Badge(560, "才貌双全皇贵妃", 0, "普通", "文字"),
			"561":new Badge(561, "奥雅赞助商", 1, "超稀有", "炫图"),
			"562":new Badge(562, "奥雅赞助商", 0, "超稀有", "炫图"),
			"563":new Badge(563, "超模亲卫队", 1, "超稀有", "炫图"),
			"564":new Badge(564, "超模亲卫队", 90, "超稀有", "炫图"),
			"565":new Badge(565, "豌豆公举", 0, "超稀有", "炫图"),
			"566":new Badge(566, "欧洲皇族", 0, "超稀有", "文字"),
			"567":new Badge(567, "瓶邪王道", 0, "超稀有", "文字"),
			"568":new Badge(568, "非洲酋长", 0, "超稀有", "文字"),
			"569":new Badge(569, "一夕浮生梦", 0, "超稀有", "文字"),
			"570":new Badge(570, "蓝桥春雪", 0, "超稀有", "文字"),
			"571":new Badge(571, "萌娘❤料理师", 0, "杰出", "文字"),
			"572":new Badge(572, "吸血鬼心魂猎手", 0, "杰出", "文字"),
			"573":new Badge(573, "最佳密友", 0, "稀有", "炫图"),
			"574":new Badge(574, "最佳密友", 0, "稀有", "炫图"),
			"575":new Badge(575, "暖心小天使", 0, "杰出", "文字"),
			"576":new Badge(576, "暖心小天使", 30, "稀有", "炫图"),
			"577":new Badge(577, "千面女王", 14, "超稀有", "炫图"),
			"578":new Badge(578, "千面女王", 0, "超稀有", "文字"),
			"579":new Badge(579, "社交名媛", 0, "稀有", "文字"),
			"580":new Badge(580, "2015风云人物", 0, "杰出", "文字"),
			"581":new Badge(581, "战无不胜", 0, "普通", "文字"),
			"582":new Badge(582, "运筹帷幄", 0, "普通", "文字"),
			"583":new Badge(583, "帝兰赐我考神", 0, "普通", "文字"),
			"584":new Badge(584, "全民偶像", 0, "杰出", "文字"),
			"585":new Badge(585, "PRINCESS SUE", 0, "普通", "文字"),
			"586":new Badge(586, "QUEEN SUE", 0, "杰出", "文字"),
			"587":new Badge(587, "百变影后", 0, "普通", "文字"),
			"588":new Badge(588, "金牌经纪人", 0, "普通", "文字"),
			"589":new Badge(589, "猴赛雷", 0, "普通", "文字"),
			"590":new Badge(590, "我是大导演", 0, "普通", "文字"),
			"591":new Badge(591, "最佳品鉴大师", 0, "普通", "文字"),
			"592":new Badge(592, "奥雅新春财神", 0, "杰出", "文字"),
			"593":new Badge(593, "绚梦星金牌影片", 0, "杰出", "文字"),
			"594":new Badge(594, "绚梦星佳作", 0, "普通", "文字"),
			"595":new Badge(595, "恋•月光公主", 0, "超稀有", "炫图"),
			"596":new Badge(596, "恋•月光公主", 0, "超稀有", "文字"),
			"597":new Badge(597, "心•星夜女王", 0, "超稀有", "炫图"),
			"598":new Badge(598, "心•星夜女王", 0, "超稀有", "文字"),
			"599":new Badge(599, "月光小天使", 30, "稀有", "炫图"),
			"600":new Badge(600, "月光小天使", 0, "稀有", "文字"),
			"601":new Badge(601, "星夜小天使", 30, "稀有", "炫图"),
			"602":new Badge(602, "星夜小天使", 0, "稀有", "文字"),
			"603":new Badge(603, "月光舞者", 30, "稀有", "炫图"),
			"604":new Badge(604, "月光舞者", 0, "稀有", "文字"),
			"605":new Badge(605, "星夜歌者", 30, "稀有", "炫图"),
			"606":new Badge(606, "星夜歌者", 0, "稀有", "文字"),
			"607":new Badge(607, "绚梦星金牌影片", 0, "稀有", "文字"),
			"608":new Badge(608, "绚梦星佳作", 0, "杰出", "文字"),
			"609":new Badge(609, "Devil May Cry", 0, "超稀有", "文字"),
			"610":new Badge(610, "银翼的奇术师", 0, "超稀有", "文字"),
			"611":new Badge(611, "莫亦不摸鱼", 0, "超稀有", "文字"),
			"612":new Badge(612, "(●—●)社团达人", 0, "普通", "文字"),
			"613":new Badge(613, "全服英雄", 0, "普通", "文字"),
			"614":new Badge(614, "作业杀手", 0, "普通", "文字"),
			"615":new Badge(615, "BOSS杀手", 0, "普通", "文字"),
			"616":new Badge(616, "恋人宝典", 0, "杰出", "文字"),
			"617":new Badge(617, "甜蜜情书", 0, "普通", "文字"),
			"618":new Badge(618, "灰姑娘的骑士", 0, "普通", "文字"),
			"619":new Badge(619, "皇家造型师", 7, "超稀有", "炫图"),
			"620":new Badge(620, "积极的爱美者", 0, "普通", "文字"),
			"621":new Badge(621, "第1届造型之王", 0, "普通", "文字"),
			"622":new Badge(622, "第2届造型之王", 0, "普通", "文字"),
			"623":new Badge(623, "第3届造型之王", 0, "普通", "文字"),
			"624":new Badge(624, "第4届造型之王", 0, "普通", "文字"),
			"625":new Badge(625, "第5届造型之王", 0, "普通", "文字"),
			"626":new Badge(626, "第6届造型之王", 0, "普通", "文字"),
			"627":new Badge(627, "第7届造型之王", 0, "普通", "文字"),
			"628":new Badge(628, "第8届造型之王", 0, "普通", "文字"),
			"629":new Badge(629, "第9届造型之王", 0, "普通", "文字"),
			"630":new Badge(630, "第10届造型之王", 0, "普通", "文字"),
			"631":new Badge(631, "第11届造型之王", 0, "普通", "文字"),
			"632":new Badge(632, "第12届造型之王", 0, "普通", "文字"),
			"633":new Badge(633, "第13届造型之王", 0, "普通", "文字"),
			"634":new Badge(634, "第14届造型之王", 0, "普通", "文字"),
			"635":new Badge(635, "第15届造型之王", 0, "普通", "文字"),
			"636":new Badge(636, "第16届造型之王", 0, "普通", "文字"),
			"637":new Badge(637, "第17届造型之王", 0, "普通", "文字"),
			"638":new Badge(638, "第18届造型之王", 0, "普通", "文字"),
			"639":new Badge(639, "第19届造型之王", 0, "普通", "文字"),
			"640":new Badge(640, "第20届造型之王", 0, "普通", "文字"),
			"641":new Badge(641, "第21届造型之王", 0, "普通", "文字"),
			"642":new Badge(642, "第22届造型之王", 0, "普通", "文字"),
			"643":new Badge(643, "第23届造型之王", 0, "普通", "文字"),
			"644":new Badge(644, "第24届造型之王", 0, "普通", "文字"),
			"645":new Badge(645, "第25届造型之王", 0, "普通", "文字"),
			"646":new Badge(646, "第26届造型之王", 0, "普通", "文字"),
			"647":new Badge(647, "第27届造型之王", 0, "普通", "文字"),
			"648":new Badge(648, "第28届造型之王", 0, "普通", "文字"),
			"649":new Badge(649, "第29届造型之王", 0, "普通", "文字"),
			"650":new Badge(650, "第30届造型之王", 0, "普通", "文字"),
			"651":new Badge(651, "1届百强造型师", 0, "普通", "文字"),
			"652":new Badge(652, "2届百强造型师", 0, "普通", "文字"),
			"653":new Badge(653, "3届百强造型师", 0, "普通", "文字"),
			"654":new Badge(654, "4届百强造型师", 0, "普通", "文字"),
			"655":new Badge(655, "5届百强造型师", 0, "普通", "文字"),
			"656":new Badge(656, "6届百强造型师", 0, "普通", "文字"),
			"657":new Badge(657, "7届百强造型师", 0, "普通", "文字"),
			"658":new Badge(658, "8届百强造型师", 0, "普通", "文字"),
			"659":new Badge(659, "9届百强造型师", 0, "普通", "文字"),
			"660":new Badge(660, "10届百强造型师", 0, "普通", "文字"),
			"661":new Badge(661, "11届百强造型师", 0, "普通", "文字"),
			"662":new Badge(662, "12届百强造型师", 0, "普通", "文字"),
			"663":new Badge(663, "13届百强造型师", 0, "普通", "文字"),
			"664":new Badge(664, "14届百强造型师", 0, "普通", "文字"),
			"665":new Badge(665, "15届百强造型师", 0, "普通", "文字"),
			"666":new Badge(666, "16届百强造型师", 0, "普通", "文字"),
			"667":new Badge(667, "17届百强造型师", 0, "普通", "文字"),
			"668":new Badge(668, "18届百强造型师", 0, "普通", "文字"),
			"669":new Badge(669, "19届百强造型师", 0, "普通", "文字"),
			"670":new Badge(670, "20届百强造型师", 0, "普通", "文字"),
			"671":new Badge(671, "21届百强造型师", 0, "普通", "文字"),
			"672":new Badge(672, "22届百强造型师", 0, "普通", "文字"),
			"673":new Badge(673, "23届百强造型师", 0, "普通", "文字"),
			"674":new Badge(674, "24届百强造型师", 0, "普通", "文字"),
			"675":new Badge(675, "25届百强造型师", 0, "普通", "文字"),
			"676":new Badge(676, "26届百强造型师", 0, "普通", "文字"),
			"677":new Badge(677, "27届百强造型师", 0, "普通", "文字"),
			"678":new Badge(678, "28届百强造型师", 0, "普通", "文字"),
			"679":new Badge(679, "29届百强造型师", 0, "普通", "文字"),
			"680":new Badge(680, "30届百强造型师", 0, "普通", "文字"),
			"681":new Badge(681, "蓬莱人形", 0, "超稀有", "文字"),
			"682":new Badge(682, "Clovis Lin", 0, "超稀有", "文字"),
			"683":new Badge(683, "摸鱼大王莫亦", 0, "超稀有", "文字"),
			"684":new Badge(684, "命运之轮精品", 0, "杰出", "文字"),
			"685":new Badge(685, "命运之轮佳作", 0, "普通", "文字"),
			"686":new Badge(686, "圣泉御用设计师", 0, "杰出", "文字"),
			"687":new Badge(687, "圣泉高级设计师", 0, "普通", "文字"),
			"688":new Badge(688, "圣泉王牌美装师", 0, "杰出", "文字"),
			"689":new Badge(689, "圣泉百强美装师", 0, "普通", "文字"),
			"690":new Badge(690, "FF团长大人", 0, "超稀有", "文字"),
			"691":new Badge(691, "没有名字的怪物", 0, "超稀有", "文字"),
			"692":new Badge(692, "蕊缪薇薇", 0, "超稀有", "文字"),
			"693":new Badge(693, "亡灵之王杀手", 0, "普通", "文字"),
			"694":new Badge(694, "亡灵英雄", 0, "普通", "文字"),
			"695":new Badge(695, "亡灵杀手", 0, "普通", "文字"),
			"696":new Badge(696, "亡灵战神", 0, "普通", "文字"),
			"697":new Badge(697, "最佳★Coser", 0, "杰出", "文字"),
			"698":new Badge(698, "二次元の百科", 0, "杰出", "文字"),
			"699":new Badge(699, "封面之星", 0, "普通", "文字"),
			"700":new Badge(700, "彼岸物语", 0, "杰出", "文字"),
			"701":new Badge(701, "Killua Zoldyck", 0, "超稀有", "文字"),
			"702":new Badge(702, "喻文州的女朋友", 0, "超稀有", "文字"),
			"703":new Badge(703, "假若没有明天", 0, "超稀有", "文字"),
			"704":new Badge(704, "时尚教主", 7, "超稀有", "炫图"),
			"705":new Badge(705, "最热心老司机", 0, "普通", "文字"),
			"706":new Badge(706, "王子最佳伙伴", 7, "超稀有", "炫图"),
			"707":new Badge(707, "仙境女神", 0, "超稀有", "炫图"),
			"708":new Badge(708, "仙境公主", 30, "超稀有", "炫图"),
			"709":new Badge(709, "仙境精灵", 30, "超稀有", "炫图"),
			"710":new Badge(710, "AOYA首席灵魂画手", 0, "超稀有", "文字"),
			"711":new Badge(711, "仙境公主", 0, "超稀有", "文字"),
			"712":new Badge(712, "仙境精灵", 0, "超稀有", "文字"),
			"713":new Badge(713, "谎言家", 0, "超稀有", "文字"),
			"714":new Badge(714, "守望先锋", 0, "超稀有", "文字"),
			"715":new Badge(715, "Heavens Fall", 0, "超稀有", "文字"),
			"716":new Badge(716, "仙境物语", 0, "杰出", "文字"),
			"717":new Badge(717, "不落莲品牌设计师", 0, "超稀有", "文字"),
			"718":new Badge(718, "优雅白银", 0, "荣誉段位", "炫图"),
			"719":new Badge(719, "绚丽黄金", 0, "荣誉段位", "炫图"),
			"720":new Badge(720, "华贵铂金", 0, "荣誉段位", "炫图"),
			"721":new Badge(721, "璀璨钻石", 0, "荣誉段位", "炫图"),
			"722":new Badge(722, "巅峰超模", 0, "荣誉段位", "炫图"),
			"723":new Badge(723, "年度最佳超模", 0, "稀有", "文字"),
			"724":new Badge(724, "最潜力十佳超模", 0, "超稀有", "文字"),
			"725":new Badge(725, "最受欢迎评委", 0, "稀有", "文字"),
			"726":new Badge(726, "公司最强赞助者", 0, "杰出", "文字"),
			"727":new Badge(727, "交易王", 0, "超稀有", "文字"),
			"728":new Badge(728, "星尘斗士", 0, "超稀有", "文字"),
			"729":new Badge(729, "唐家堡智商担当", 0, "超稀有", "文字"),
			"730":new Badge(730, "Super Star", 0, "杰出", "文字"),
			"731":new Badge(731, "超人气巅峰超模", 0, "稀有", "文字"),
			"732":new Badge(732, "奥雅NO.1超模", 0, "超稀有", "炫图"),
			"733":new Badge(733, "奥雅第一CEO", 0, "超稀有", "炫图"),
			"734":new Badge(734, "声优新秀", 0, "普通", "文字"),
			"735":new Badge(735, "伊莎贝拉的声优", 0, "稀有", "炫图"),
			"736":new Badge(736, "米莉娅的声优", 0, "稀有", "炫图"),
			"737":new Badge(737, "朱利安的声优", 0, "稀有", "炫图"),
			"738":new Badge(738, "卡伦的声优", 0, "稀有", "炫图"),
			"739":new Badge(739, "尔康草的真爱", 0, "普通", "文字"),
			"740":new Badge(740, "血族之心", 0, "杰出", "文字"),
			"741":new Badge(741, "吸血鬼猎手", 0, "杰出", "文字"),
			"742":new Badge(742, "来自血族的认可", 0, "稀有", "文字"),
			"743":new Badge(743, "首席灵魂写手", 0, "超稀有", "文字"),
			"744":new Badge(744, "黑之宣告", 0, "超稀有", "文字"),
			"745":new Badge(745, "鸦语者", 0, "超稀有", "文字"),
			"746":new Badge(746, "蓝梦温暖小天使", 0, "超稀有", "炫图"),
			"747":new Badge(747, "青梦温暖小天使", 0, "超稀有", "炫图"),
			"748":new Badge(748, "紫梦温暖小天使", 0, "超稀有", "炫图"),
			"749":new Badge(749, "世上最完美的脸", 0, "杰出", "文字")

			//exportData part end
		}
		
		/**
		 * 		"{0}":new Badge({0}, "{1}", {2}, "{3}", "{4}"),
		 * 
		 * */
		
	}
}