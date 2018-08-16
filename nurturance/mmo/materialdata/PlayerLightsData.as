package mmo.materialdata
{
	import mmo.framework.domain.player.ClothesLightData;
	import mmo.framework.domain.player.PlayerLightData;
	import mmo.framework.domain.player.PlayerLightTypes;

	public class PlayerLightsData
	{
		public static const data:Object =
		{
			//常规光效
			"0":new PlayerLightData(0, PlayerLightTypes.NONE_LIGHT),
			"1":new PlayerLightData(1, PlayerLightTypes.FOLLOW_AND_BACK_LIGHT, {"photos":3}),
			"2":new PlayerLightData(2, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"3":new PlayerLightData(3, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"4":new PlayerLightData(4, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"5":new PlayerLightData(5, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"6":new PlayerLightData(6, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			//过期的光效注释掉算了。
			"7":new PlayerLightData(7, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"8":new PlayerLightData(8, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"9":new PlayerLightData(9, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"10":new PlayerLightData(10, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":31/*frame用于动画光效创建时间，一般为动画帧长 */}),
//			"11":new PlayerLightData(11, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"12":new PlayerLightData(12, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"13":new PlayerLightData(13, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"14":new PlayerLightData(14, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"15":new PlayerLightData(15, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"16":new PlayerLightData(16, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"17":new PlayerLightData(17, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"18":new PlayerLightData(18, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"19":new PlayerLightData(19, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
//			"20":new PlayerLightData(20, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":65}),
//			"21":new PlayerLightData(21, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"22":new PlayerLightData(22, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"23":new PlayerLightData(23, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":63}),
//			"24":new PlayerLightData(24, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"25":new PlayerLightData(25, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"26":new PlayerLightData(26, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"27":new PlayerLightData(27, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"28":new PlayerLightData(28, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"29":new PlayerLightData(29, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"30":new PlayerLightData(30, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"31":new PlayerLightData(31, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
//			"32":new PlayerLightData(32, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":54}),
//			"33":new PlayerLightData(33, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"34":new PlayerLightData(34, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			
//			"35":new PlayerLightData(35, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":37}),
//			"36":new PlayerLightData(36, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"37":new PlayerLightData(37, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"38":new PlayerLightData(38, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"39":new PlayerLightData(39, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"40":new PlayerLightData(40, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"41":new PlayerLightData(41, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
//			"42":new PlayerLightData(42, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"43":new PlayerLightData(43, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"44":new PlayerLightData(44, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			
//			"45":new PlayerLightData(45, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"46":new PlayerLightData(46, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"47":new PlayerLightData(47, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"})
			
//			"48":new PlayerLightData(48, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"49":new PlayerLightData(49, PlayerLightTypes.FOLLOW_MOVIE_LIGHT, {"frame":37}),
//			"50":new PlayerLightData(50, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"})
			
//			"51":new PlayerLightData(51, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"52":new PlayerLightData(52, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
//			"53":new PlayerLightData(53, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"54":new PlayerLightData(54, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"55":new PlayerLightData(55, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"56":new PlayerLightData(56, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			"57":new PlayerLightData(57, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			"58":new PlayerLightData(58, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			"59":new PlayerLightData(59, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			"60":new PlayerLightData(60, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			"61":new PlayerLightData(61, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":6, "radius":20, "delayframe":5}),
			
			"62":new PlayerLightData(62, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"63":new PlayerLightData(63, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"64":new PlayerLightData(64, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"65":new PlayerLightData(65, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"66":new PlayerLightData(66, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"67":new PlayerLightData(67, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
			"68":new PlayerLightData(68, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"69":new PlayerLightData(69, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			"70":new PlayerLightData(70, PlayerLightTypes.NORMAL_LIGHT, {"location":"back"}),
			
			"71":new PlayerLightData(71, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"72":new PlayerLightData(72, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"73":new PlayerLightData(73, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			
			"74":new PlayerLightData(74, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"75":new PlayerLightData(75, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"76":new PlayerLightData(76, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
			"77":new PlayerLightData(77, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"78":new PlayerLightData(78, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"79":new PlayerLightData(79, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			
			"80":new PlayerLightData(80, PlayerLightTypes.Halo_Light, {}),
			"81":new PlayerLightData(81, PlayerLightTypes.Halo_Light, {}),
			"82":new PlayerLightData(82, PlayerLightTypes.Halo_Light, {}),
			"83":new PlayerLightData(83, PlayerLightTypes.Halo_Light, {}),
			"84":new PlayerLightData(84, PlayerLightTypes.Halo_Light, {}),
			"85":new PlayerLightData(85, PlayerLightTypes.Halo_Light, {}),
			"86":new PlayerLightData(86, PlayerLightTypes.Halo_Light, {}),
			
			"87":new PlayerLightData(87, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"88":new PlayerLightData(88, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"89":new PlayerLightData(89, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
			"90":new PlayerLightData(90, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"91":new PlayerLightData(91, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"92":new PlayerLightData(92, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"93":new PlayerLightData(93, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"94":new PlayerLightData(94, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			
			"95":new PlayerLightData(95, PlayerLightTypes.Halo_Light, {}),
			
			"96":new PlayerLightData(96, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"97":new PlayerLightData(97, PlayerLightTypes.CLOTHES_LIGHT),
			"98":new PlayerLightData(98, PlayerLightTypes.CLOTHES_LIGHT),
			"99":new PlayerLightData(99, PlayerLightTypes.CLOTHES_LIGHT),
			
			"100":new PlayerLightData(100, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"101":new PlayerLightData(101, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"102":new PlayerLightData(102, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			
			"103":new PlayerLightData(103, PlayerLightTypes.Halo_Light, {}),
			"104":new PlayerLightData(104, PlayerLightTypes.Halo_Light, {}),
			
			"105":new PlayerLightData(105, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":1, "radius":20, "delayframe":7, "direction":true}),
			"106":new PlayerLightData(106, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			"107":new PlayerLightData(107, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":7, "radius":20, "delayframe":7}),
			
			"108":new PlayerLightData(108, PlayerLightTypes.CLOTHES_LIGHT),
			"109":new PlayerLightData(109, PlayerLightTypes.CLOTHES_LIGHT),
			"110":new PlayerLightData(110, PlayerLightTypes.CLOTHES_LIGHT),
			
			"111":new PlayerLightData(111, PlayerLightTypes.Halo_Light, {}),
			
			"112":new PlayerLightData(112, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":2, "radius":10, "delayframe":10}),
			"113":new PlayerLightData(113, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":2, "radius":10, "delayframe":10}),
			"114":new PlayerLightData(114, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":2, "radius":10, "delayframe":10}),
			
			"115":new PlayerLightData(115, PlayerLightTypes.CLOTHES_LIGHT2),
			
			"116":new PlayerLightData(116, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			"117":new PlayerLightData(117, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			"118":new PlayerLightData(118, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			"119":new PlayerLightData(119, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			
			"120":new PlayerLightData(120, PlayerLightTypes.CLOTHES_LIGHT2),
			"121":new PlayerLightData(121, PlayerLightTypes.CLOTHES_LIGHT2),
			
			"122":new PlayerLightData(122, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			
			"123":new PlayerLightData(123, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
			"124":new PlayerLightData(124, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":10, "delayframe":10}),
			
			"125":new PlayerLightData(125, PlayerLightTypes.CLOTHES_LIGHT, {}),
						
			"126":new PlayerLightData(126, PlayerLightTypes.CLOTHES_LIGHT, {}),
			
			"127":new PlayerLightData(127, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			
			"128":new PlayerLightData(128, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			
			"129":new PlayerLightData(129, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			
			"130":new PlayerLightData(130, PlayerLightTypes.Vip_Mood_Light, {}),
			"131":new PlayerLightData(131, PlayerLightTypes.Vip_Mood_Light, {}),
			"132":new PlayerLightData(132, PlayerLightTypes.Vip_Mood_Light, {}),
			"133":new PlayerLightData(133, PlayerLightTypes.Vip_Mood_Light, {}),
			"134":new PlayerLightData(134, PlayerLightTypes.Vip_Mood_Light, {}),
			"135":new PlayerLightData(135, PlayerLightTypes.Vip_Mood_Light, {}),
			"136":new PlayerLightData(136, PlayerLightTypes.Vip_Mood_Light, {}),
			"137":new PlayerLightData(137, PlayerLightTypes.Vip_Mood_Light, {}),
			"138":new PlayerLightData(138, PlayerLightTypes.Vip_Mood_Light, {}),
			"139":new PlayerLightData(139, PlayerLightTypes.Vip_Mood_Light, {}),
			"140":new PlayerLightData(140, PlayerLightTypes.Vip_Mood_Light, {}),
			"141":new PlayerLightData(141, PlayerLightTypes.Vip_Mood_Light, {}),
			"142":new PlayerLightData(142, PlayerLightTypes.Vip_Mood_Light, {}),
			"143":new PlayerLightData(143, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":1, "radius":20, "delayframe":5}),
			"144":new PlayerLightData(144, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":1, "radius":20, "delayframe":5}),
			"145":new PlayerLightData(145, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"146":new PlayerLightData(146, PlayerLightTypes.CLOTHES_LIGHT, {}),
			"147":new PlayerLightData(147, PlayerLightTypes.Vip_Mood_Light, {}),			
			"148":new PlayerLightData(148, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"149":new PlayerLightData(149, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"150":new PlayerLightData(150, PlayerLightTypes.CLOTHES_LIGHT, {"hidePlayer":true}),
			"151":new PlayerLightData(151, PlayerLightTypes.Vip_Mood_Light, {}),			
			"152":new PlayerLightData(152, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":20, "delayframe":5}),
			"153":new PlayerLightData(153, PlayerLightTypes.FOOT_PRINT_LIGHT, {"num":4, "radius":20, "delayframe":5}),
			"154":new PlayerLightData(154, PlayerLightTypes.CLOTHES_LIGHT),
			"155":new PlayerLightData(155, PlayerLightTypes.CLOTHES_LIGHT),
			"156":new PlayerLightData(156, PlayerLightTypes.Vip_Mood_Light, {}),			
			"157":new PlayerLightData(157, PlayerLightTypes.CLOTHES_LIGHT2),
			"158":new PlayerLightData(158, PlayerLightTypes.CLOTHES_LIGHT2),			
			"159":new PlayerLightData(159, PlayerLightTypes.CLOTHES_LIGHT,{"hidePlayer":true}),
			"160":new PlayerLightData(160, PlayerLightTypes.CLOTHES_LIGHT,{"hidePlayer":true}),
			
			"161":new PlayerLightData(161, PlayerLightTypes.Vip_Mood_Light, {})
			
		};
		
		public static const clothesLight:Object = {
			"1":new ClothesLightData(1, "甜蜜糖果幻化套装", "2331;2330;2332;2335;2336;2334;2333", 13),
			"2":new ClothesLightData(2, "舞者幻化套装", "2348;2349;2350;2351;2352;2353", 14),
			"3":new ClothesLightData(3, "淑女轻纱", "2373;2374;2375;2376;2377", 15),
			"4":new ClothesLightData(4, "公主幻化套装", "2410;2411;2412;2413;2414;2415", 16),
			"5":new ClothesLightData(5, "新娘幻化套装", "2431;2432;2433;2434;2435;2436", 17),
			"6":new ClothesLightData(6, "羽毛绅士幻化套装", "2462;2463;2464;2465;2466", 18),
			"7":new ClothesLightData(7, "紫藤梦光翼", "2474;2475;2476;2477;2478;2479;2480", 19),
			"8":new ClothesLightData(8, "紫藤梦光翼", "2474;2481;2482;2483;2484;2485;2486", 19),
			"9":new ClothesLightData(9, "千海龙套装", "3274;3275;3276;3277;3278;3279;3280", 38),
			"10":new ClothesLightData(10, "梦寒龙套装", "3281;3282;3283;3284;3285;3286;3287", 39),
			"11":new ClothesLightData(11, "神女卡洛琳套装", "3345;3346;3347;3348;3349;3350;3351", 40),
			"12":new ClothesLightData(12, "魔女美狄亚套装", "3337;3338;3339;3340;3341;3342;3343;3344", 41),
			"13":new ClothesLightData(13, "灵花梦仙系列", "5367;5368;5369;5370;5371;5372;5373;5374;5375", 65),
			"14":new ClothesLightData(14, "美钻星空系列", "5376;5377;5378;5379;5380;5381;5382;5383;5384", 66),
			"15":new ClothesLightData(15, "十字架伯爵系列", "5385;5386;5387;5388;5389;5390;5391;5392;5393;5394", 67),
			"16":new ClothesLightData(16, "月光石梦境套装", "6149;6150;6151;6152;6153;6154;6155;6156;6157", 71),
			"17":new ClothesLightData(17, "雪铃梦境套装", "6158;6159;6160;6161;6162;6163;6164", 72),
			"18":new ClothesLightData(18, "美狄亚梦境套装", "6165;6166;6167;6168;6169;6170;6171;6172", 73),
			"19":new ClothesLightData(19, "夏橘淳欧套装", "6408;6409;6410;6411;6412;6413;6414;6415;6416", 74),
			"20":new ClothesLightData(20, "伊人誓言套装", "6399;6400;6401;6402;6403;6404;6405;6406;6407", 75),
			"21":new ClothesLightData(21, "蓝黛露华套装", "6417;6390;6391;6392;6393;6394;6395;6396;6397;6398", 76),
			"22":new ClothesLightData(22, "碧落之森系列", "7198;7199;7200;7201;7202;7203;7204;7205;7206", 87),
			"23":new ClothesLightData(23, "艾菲尔系列", "7197;7196;7188;7189;7190;7191;7192;7193;7194;7195", 88),
			"24":new ClothesLightData(24, "赤焰精灵王系列", "7207;7208;7209;7210;7211;7212;7213;7214;7215", 89),
			"25":new ClothesLightData(25, "苍月公主神迹装", "7577;7578;7579;7580;7581;7582;7583", 96),
			"26":new ClothesLightData(26, "雪域天翼女神系列", "7649;7650;7651;7652;7653;7654;7655;7656;7657;7658", 97),
			"27":new ClothesLightData(27, "海伦幻影女神系列", "7632;7633;7634;7635;7636;7637;7638;7639;7659", 98),
			"28":new ClothesLightData(28, "维纳斯夜女神系列", "7640;7641;7642;7643;7644;7645;7646;7647;7648", 99),
			"29":new ClothesLightData(29, "枫丹白露系列", "8371;8372;8373;8374;8375;8376;8377;8378;8379;8380", 108),
			"30":new ClothesLightData(30, "希腊爱琴海系列", "8362;8363;8364;8365;8366;8367;8368;8369;8370", 109),
			"31":new ClothesLightData(31, "紫睿皇家系列", "8351;8352;8353;8354;8355;8356;8357;8358;8359;8360;8361", 110),
			"32":new ClothesLightData(32, "", "9119;9120;9121;9122;9123;9135;9136;9137;9138;9116;9117;9118", 115),
			"33":new ClothesLightData(33, "维纳斯夜女神系列", "9906;9907;9908;9820;9821;9822;9823;9824;9825", 99),
			"34":new ClothesLightData(34, "维纳斯夜女神系列", "9918;9919;9920;9863;9864;9865;9866;9867;9868", 99),
			"35":new ClothesLightData(35, "枫丹白露系列", "9909;9910;9911;9826;9827;9828;9829;9830;9831;9832", 108),
			"36":new ClothesLightData(36, "枫丹白露系列", "9921;9922;9923;9869;9870;9871;9872;9873;9874;9875", 108),
			"37":new ClothesLightData(37, "灵花梦仙系列", "9912;9833;9834;9835;9836;9837;9838;9839;9840", 65),
			"38":new ClothesLightData(38, "灵花梦仙系列", "9924;9876;9877;9878;9879;9880;9881;9882;9883", 65),
			"39":new ClothesLightData(39, "雪域天翼女神系列", "9914;9915;9841;9842;9843;9844;9845;9846;9847", 87),
			"40":new ClothesLightData(40, "雪域天翼女神系列", "9926;9927;9884;9885;9886;9887;9888;9889;9890", 87),
			"41":new ClothesLightData(41, "美钻星空系列", "9913;9848;9849;9850;9851;9852;9853;9854;9855", 66),
			"42":new ClothesLightData(42, "美钻星空系列", "9925;9891;9892;9893;9894;9895;9896;9897;9898", 66),
			"43":new ClothesLightData(43, "赤焰精灵王系列", "9916;9917;9856;9857;9858;9859;9860;9861;9862", 89),
			"44":new ClothesLightData(44, "赤焰精灵王系列", "9928;9929;9899;9900;9901;9902;9903;9904;9905", 89),
			"45":new ClothesLightData(45, "白色祈愿系列", "9938;9939;9940;9941;9942;9943;9944;9945;9946", 120),
			"46":new ClothesLightData(46, "白色守护系列", "9948;9949;9950;9951;9952;9953;9954;9955;9956;9957", 121),
			"47":new ClothesLightData(47, "小时代系列", "10617;10618;10619;10620;10621;10622;10623;10624;10625", 123),
		    "48":new ClothesLightData(48, "契约•恶魔套装", "11881;11882;11883;11884;11885;11886;11887;11888;11889;11890;11891;11892;11893;11894;11895", 125),
			"49":new ClothesLightData(49, "契约•天使套装", "11939;11940;11941;11942;11943;11944;11872;11873;11874;11875;11876;11877;11878;11879;11880", 126),
			"50":new ClothesLightData(50, "苏非娅表白魔石", "12156;12157;12158;12159;12160;12161;12162;12163;12164;12165;12166", 127),
			"51":new ClothesLightData(51, "苏非娅愤怒魔石", "12156;12157;12158;12159;12160;12161;12162;12163;12164;12165;12167", 128),
			"52":new ClothesLightData(52, "苏非娅拒绝魔石", "12156;12157;12158;12159;12160;12161;12162;12163;12164;12165;12168", 129),
			"53":new ClothesLightData(53, "光明圣女套装", "13274;13275;13276;13278;13279;13280;13281;13282;13283;13284;13285;13286;13287", 145),
			"54":new ClothesLightData(54, "光明圣女套装", "13277;13275;13276;13278;13279;13280;13281;13282;13283;13284;13285;13286;13287", 145),
			"55":new ClothesLightData(55, "暗裔伏魔套装", "13288;13289;13291;13292;13293;13294;13295;13296;13297;13298;13300;13301;13302", 146),
			"56":new ClothesLightData(56, "玛丽苏剧", "13811;13814", 148),
			"57":new ClothesLightData(57, "言情剧", "13812;13815", 149),
			"58":new ClothesLightData(58, "恶搞剧", "13798;13801", 150),
			"59":new ClothesLightData(59, "落樱之海套装", "14325;14326;14327;14328;14329;14330;14331;14332;14333;14334;14336;14337", 154),
			"60":new ClothesLightData(60, "月祭紫樱套装", "14338;14339;14340;14341;14342;14343;14344;14345;14346;14347;14348;14349", 155),
			"61":new ClothesLightData(61, "蓝桥之恋套装", "15249;15250;15251;15253;15256;15257;15258;15259", 157),
			"62":new ClothesLightData(62, "天空之境套装", "15227;15228;15229;15231;15232;15233;15234;15235;15236;15237", 158),
			"63":new ClothesLightData(63, "光影战姬套装", "17007;17008;17009;17010;17011;17012;17015;17016;17017;17018;17019;17020;17021", 159),
			"64":new ClothesLightData(64, "假面骑士套装", "16994;16995;16996;16997;16998;17000;17001;17002;17003;17004;17005;17006", 160)
		};
	}
}