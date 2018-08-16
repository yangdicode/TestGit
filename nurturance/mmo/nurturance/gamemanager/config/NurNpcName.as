package mmo.nurturance.gamemanager.config
{
	/**
	 *Npc对应的ID和名字
	 */
	public class NurNpcName {
		private static var config:Object;
		
		public static function checkNpcNameIsExist(name:String):Boolean
		{
			if (config == null){
				init();
			}
			
			for (var key:String in config){
				var npcName:String = config[key];
				if (npcName==name && int(key)<100000)
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 获取Npc名字
		 * @param npcId
		 */		
		public static function getNpcName(npcId:int):String {
			if(config == null){
				init();
			}
			
			var key:int = npcId;
			if(config[key] == null){
				return null;
			}
			
			var npcName:String = String(config[key]).split(",")[0];
			return npcName;
		}
		
		/**
		 * 获取Npc信息
		 * @param npcId
		 */		
		public static function getNpcIntro(npcId:int):String {
			if(config == null){
				init();
			}
			
			if(npcId == -1){
				return null;
			}
			
			var key:int = npcId;
			if(config[key] == null){
				return null;
			}
			
			var nameArray:Array = String(config[key]).split(",");
			if(nameArray.length < 2){
				return null;
			}
			return nameArray[1];
		}
		
		public static function needTalkSignNpc(npcId:int):Boolean{
			var noNeedSignId:Array = [0, 1, 3, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 29, 30,
				31, 36, 37, 38, 39, 40, 43, 46, 50, 51, 52, 53, 56, 61,104,105,106,107,108,109,110,111,112,113,114,115,116,148,149,150,151,
				152,153,157,158,159,207,208,209,218,219,225,237,248,256,259,290,297,295,325,328,329,332,369,379,384,407,408,409,423,425,427,
				433,435,439,476,477,487,529,534,551,610,614,620,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,
				643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,670,671,672,673,674,675,676,678,679,680,681,682,683,687,
				688,689,690,691,692,693,694,695,696,697,698,699,701,702,703,710,711,716,717,719,726,730,731,732,733,739,741,742,743,744,745,
				746,747,748,749,750,751,752,760,761,765,766,767,772,778,783,784,785,786,799,800,801,805,807,816,817,839,858,859,860,862,879,
				880,881,890,918
			];
			return Boolean(noNeedSignId.indexOf(npcId) == -1);
		}
		
		public static function checkIsCustomNpc(id:int):int
		{
			var temp:Object = {"517":100052, "518":100051, "520":100041};
			if (temp.hasOwnProperty(String(id)))
			{
				return temp[id];
			}
			return -1;
		}
		
		/**
		 *config[npcId] = (name,npcIntro)
		 * id自定义，不要有重复即可
		 */
		private static function init():void 
		{
			config = {};
			config[0] = "";
			config[1] = "？？";
			config[2] = "美绘";
			config[3] = "妈妈";
			config[4] = "绘莉";
			config[5] = "夜辉";
			config[6] = "星野";
			config[7] = "月华";
			config[8] = "少女";
			config[9] = "工作人员";
			config[10] = "设计师";
			config[11] = "少年";
			config[12] = "月绍";
			config[13] = "少年A";
			config[14] = "少年B";
			config[15] = "少年C";
			config[16] = "少年D";
			config[17] = "少女A";
			config[18] = "少女B";
			config[19] = "少女C";
			config[20] = "少女D";
			config[21] = "某模特";
			config[22] = "罗莎";
			config[23] = "小孩";
			config[24] = "女人";
			config[25] = "洺雪";
			config[26] = "希辰";
			config[27] = "模特冰冰";
			config[28] = "模特馨雨";
			config[29] = "摄影师";
			config[30] = "女助理";
			config[31] = "小女孩";
			
			config[32] = "矢崎";
			config[33] = "林凰兮";
			config[34] = "雪薇可儿";
			config[35] = "小修";
			config[36] = "摩卡";
			config[37] = "记者1";
			config[38] = "记者2";
			config[39] = "记者3";
			config[40] = "男助理";
			
			config[41] = "学园执事";
			config[42] = "寿司摊主";
			config[43] = "围观的魔女们";
			config[44] = "暗黑睡美人";
			config[45] = "小魔女";
			config[46] = "魔女们";
			config[47] = "哈尼";
			
			config[48] = "卡赫";
			config[49] = "莉莉";
			config[50] = "魔女1";
			config[51] = "魔女2";
			config[52] = "仆人";
			config[53] = "神父";
			config[54] = "小男孩";
			config[55] = "小女孩";
			
			config[56] = "驯兽女郎";
			config[57] = "恶魔蒂斯";
			config[58] = "天使萝米";
			config[59] = "精灵公主";
			config[60] = "莫莉";
			config[61] = "神秘人";
			
			config[62] = "守护者";
			config[63] = "帝兰";
			config[64] = "？？？";
			config[65] = "亚斯兰";
			config[66] = "苏非娅";
			config[67] = "洛奇儿";
			config[68] = "斯塔那";
			config[69] = "萨罗斯";
			config[70] = "卡琳儿";
			config[71] = "卡特琳娜";
			config[72] = "艾米女神";
			
			config[73] = "米拉";
			config[74] = "卡嘉";
			config[75] = "卡米拉";
			config[76] = "爱丽娜";
			config[77] = "路德";
			config[78] = "艾薇儿";
			config[79] = "？？？";
			
			config[80] = "近侍女仆";
			config[81] = "小男孩";
			
			config[82] = "佳奈";
			config[83] = "“狗狗”";
			config[84] = "谜之男子";
			config[85] = "白露";
			config[86] = "老师";
			config[87] = "同班同学A";
			config[88] = "同班同学B";
			config[89] = "同班同学C";
			config[90] = "同班同学D";
			config[91] = "同班同学E";
			config[92] = "同班同学F";
			config[93] = "小狗";
			
			config[94] = "辛西娅";
			config[95] = "弗雷斯特";
			config[96] = "雪巫王";
			config[97] = "女仆";
			config[98] = "少女A";
			config[99] = "少女B";
			config[100] = "少女C";
			config[101] = "帝兰（少年）";
			config[102] = "哈乐乐";
			config[103] = "小小";
			config[104] = "家庭教师";
			config[105] = "随从";
			config[106] = "谜之路人甲";
			config[107] = "谜之路人乙";
			config[108] = "谜之路人丙";
			config[109] = "间谍A";
			config[110] = "间谍B";	
			config[111] = "宾客A";
			config[112] = "宾客B";
			config[113] = "宾客C";
			config[114] = "众宾客";
			config[115] = "宾客X";	
			config[116] = "家族长老";
			
			config[117] = "雪人1号";
			config[118] = "雪人2号";
			config[119] = "雪人3号";
			config[120] = "杰克";
			config[121] = "管家";
			config[122] = "贝洛";
			
			
			config[123] = "发布会司仪";
			config[124] = "记者A";
			config[125] = "记者B";
			config[126] = "记者C";
			config[127] = "试镜会主持A";
			config[128] = "路易";
			config[129] = "试镜选手A";
			config[130] = "试镜选手B";
			config[131] = "试镜选手C";
			config[132] = "秘书助理";
			config[133] = "试镜会主持B";
			config[134] = "嘉靖";
			config[135] = "柒柒";
			config[136] = "宾客A";
			config[137] = "宾客B";
			config[138] = "宾客C";
			config[139] = "秦一涟";
			config[140] = "导演A";
			config[141] = "临时演员A";
			config[142] = "临时演员B";
			config[143] = "临时演员C";
			config[144] = "剧组助理";
			config[145] = "路过的演员A";
			config[146] = "路过的演员B";
			config[147] = "路过的演员C";
			config[148] = "演员X";
			config[149] = "演员Y";
			config[150] = "演员Z";
			config[151] = "工作人员A";
			config[152] = "工作人员B";
			config[153] = "工作人员C";
			config[154] = "身份不明的男子";
			config[155] = "叶双羽";
			config[156] = "路过的演员R";
			config[157] = "路过的演员O";
			config[158] = "路过的演员P";
			config[159] = "路过的演员Q";
			config[160] = "导演B";
			config[161] = "导演助理";
			config[162] = "花店速递";
			config[163] = "路过的演员J";
			config[164] = "路过的演员K";
			config[165] = "路过的演员L";
			config[166] = "路过的演员E";
			config[167] = "路过的演员F";
			config[168] = "路过的演员G";
			config[169] = "伍仟";
			config[170] = "颁奖典礼主持人";
			config[171] = "不知名演员U";
			config[172] = "不知名演员V";
			config[173] = "不知名演员W";
			config[174] = "颁奖典礼主持";
			config[175] = "助手";
			config[176] = "演员O";
			config[177] = "演员P";
			config[178] = "演员Q";
			config[179] = "花店送花员";
			config[180] = "娱乐记者";
			config[181] = "临时演员R";
			config[182] = "临时演员S";
			config[183] = "临时演员T";
			
			config[184] = "演艺班教员A";
			config[185] = "演艺班教员B";
			config[186] = "演艺班学员A";
			config[187] = "演艺班学员B";
			config[188] = "演艺班学员C";
			config[189] = "演艺班学员D";
			config[190] = "演艺班学员E";
			config[191] = "演艺班学员F";
			config[192] = "衫雨七";
			config[193] = "场务";//161
			config[194] = "助手";//144
			config[195] = "首映式主持人";//138
			config[196] = "首映式嘉宾A";
			config[197] = "首映式嘉宾B";
			config[198] = "首映式嘉宾C";
			config[199] = "首映式观众A";
			config[200] = "首映式观众B";
			config[201] = "首映式观众C";
			
			config[202] = "魔法学园导师";
			config[203] = "魔法见习生A";
			config[204] = "魔法见习生B";
			config[205] = "魔法见习生C";
			config[206] = "魔法见习生D";
			config[207] = "谜之声音";
			config[208] = "魔法学园长";
			config[209] = "温柔的声音";
			config[210] = "無音";
			config[211] = "文静少女";
			config[212] = "美琴";
			config[213] = "聆乐";
			config[214] = "派对宾客A";
			config[215] = "派对宾客B";
			config[216] = "派对宾客C";
			config[217] = "派对宾客D";
			config[218] = "外面的声音A";
			config[219] = "外面的声音B";
			config[220] = "班主任";
			config[221] = "同学A";
			config[222] = "同学B";
			config[223] = "同学C";
			config[224] = "同学D";
			config[225] = "熟悉的声音";
			config[226] = "使魔训练师";
			config[227] = "使魔琴知音";
			config[228] = "梦铃";
			config[229] = "沉睡的使魔";
			
			config[230] = "薇薇恩";
			config[231] = "少年";
			config[232] = "菲亚";
			config[233] = "金发少年";
			config[234] = "大臣A";
			config[235] = "大臣B";
			config[236] = "大臣C";
			config[237] = "身后的声音";
			config[238] = "甜点师";
			config[239] = "可疑人物A";
			config[240] = "可疑人物B";
			config[241] = "可疑人物C";
			config[242] = "圣泉之国国王";
			config[243] = "魔焰之国士兵A";
			config[244] = "魔焰之国士兵B";
			config[245] = "魔焰之国士兵C";
			config[246] = "长发少女";
			config[247] = "亚丝兰";
			config[248] = "男子的声音";
			config[249] = "囚灵少女";
			config[250] = "禁魔少女";
			config[251] = "魔焰之国士兵X";
			config[252] = "魔焰之国士兵Y";
			config[253] = "魔焰之国将领A";
			config[254] = "魔焰之国将领B";
			config[255] = "村民";
			config[256] = "少女的声音";
			config[257] = "少女";
			config[258] = "洛奇";
			config[259] = "谜之声音";
			config[260] = "谜之男子";
			config[261] = "夜修罗";
			config[262] = "魔焰之国士兵Y";
			config[263] = "辅政大臣";
			config[264] = "威恩";
			
			
			config[265] = "子恒";
			config[266] = "阳炎";
			config[267] = "冰夏";
			config[268] = "男生A";
			config[269] = "男生B";
			config[270] = "丽香";
			config[271] = "路过的女生A";
			config[272] = "路过的女生B";
			config[273] = "路过的女生C";
			config[274] = "男生C";
			config[275] = "男生D";
			config[276] = "男生E";
			config[277] = "同学H";
			config[278] = "杂志社社员A";
			config[279] = "杂志社社员B";
			config[280] = "同学X";
			config[281] = "同学Y";
			config[282] = "杂志社社员C";
			config[283] = "杂志社社员D";
			config[284] = "摄影师";
			config[285] = "羽毛球社社长";
			config[286] = "路过的学生A";
			config[287] = "路过的学生B";
			config[288] = "路过的学生C";
			config[289] = "美都";
			config[290] = "熟悉的声音";
			config[291] = "同学O";
			config[292] = "同学P";
			config[293] = "同学Q";
			config[294] = "神秘的少女";
			config[295] = "同学的声音";
			config[296] = "莉莉丝";
			config[297] = "莉莉丝的声音";
			
			config[298] = "曼陀罗华";
			config[299] = "曼珠沙华";
			config[300] = "诗音";
			config[301] = "宝心";
			config[302] = "彼岸之神";
			config[303] = "冥河之神";
			config[304] = "流萤";
			config[305] = "紫蝶";
			config[306] = "少女甲";
			config[307] = "少女乙";
			config[308] = "少女丙";
			config[309] = "随行侍卫";
			config[310] = "舒亚";
			config[311] = "提亚";
			config[312] = "祭司甲";
			config[313] = "祭司乙";
			config[314] = "图雅皇后";
			config[315] = "侍卫";
			config[316] = "侍卫甲";
			config[317] = "侍卫乙";
			config[318] = "大臣";
			config[319] = "助理";
			config[320] = "发表会主持人";
			config[321] = "少女";
			config[322] = "游戏玩家";
			
			config[323] = "艾妮";
			config[324] = "斯诺";
			config[325] = "女人的声音";
			config[326] = "谜之女性";
			config[327] = "冰雪女王";
			config[328] = "谜之声音";
			config[329] = "少女的声音";
			config[330] = "黑裙少女";
			config[331] = "黑天鹅公主";
			config[332] = "爽朗的男声";
			config[333] = "爽朗的男子";
			config[334] = "齐格夫王子";
			config[335] = "少女A";
			config[336] = "少女B";
			config[337] = "少女C";
			config[338] = "少女D";
			config[339] = "少女E";
			config[340] = "少女F";
			config[341] = "少女G";
			config[342] = "侍女A";
			config[343] = "侍女B";
			config[344] = "侍女总管";
			config[345] = "贵族少女X";
			config[346] = "贵族少女Y";
			config[347] = "贵族少女Z";
			config[348] = "侍卫";
			config[349] = "兔子先生";
			config[350] = "三月兔";
			config[351] = "青虫";
			config[352] = "鸽子";
			config[353] = "猫咪";
			config[354] = "哭泣的猫";
			config[355] = "柴郡猫";
			config[356] = "疯帽子";
			config[357] = "睡鼠";
			config[358] = "白玫瑰皇后";
			config[359] = "红心男子";
			config[360] = "红心王子";
			config[361] = "搜查士兵";
			config[362] = "吹笛的男子";
			config[363] = "哈姆雷恩";
			config[364] = "镇上的居民A";
			config[365] = "镇上的居民B";
			config[366] = "镇上的居民C";
			config[367] = "镇上的居民D";
			config[368] = "笛子精灵";
			config[369] = "居民们的声音";
			config[370] = "皇后";
			config[371] = "侍卫A";
			config[372] = "侍卫B";
			config[373] = "带弓箭的男子";
			config[374] = "帕森王子";
			config[375] = "镇上的女孩A";
			config[376] = "镇上的女孩B";
			config[377] = "镇上的女孩C";
			config[378] = "镇上的女孩D";
			config[379] = "男子的尖叫声";
			config[380] = "国王";
			config[381] = "女仆A";
			config[382] = "女仆B";
			config[383] = "女仆C";
			config[384] = "老婆婆的声音";
			config[385] = "艾丝";
			config[386] = "小矮人蒂兰兰";
			config[387] = "小矮人威威恩";
			config[388] = "小矮人兰兰斯";
			config[389] = "小矮人塔塔纳";
			config[390] = "小矮人苏菲菲";
			config[391] = "小矮人洛奇奇";
			config[392] = "小矮人哈哈乐";
			config[393] = "女仆玛柯娜";
			
			config[394] = "丫鬟";
			config[395] = "私塾先生";
			config[396] = "武艺师父";
			config[397] = "私塾书友甲";
			config[398] = "私塾书友乙";
			config[399] = "私塾书友丙";
			config[400] = "私塾书友丁";
			config[401] = "私塾书友";
			config[402] = "梁山伯";
			config[403] = "谜之私塾书友";
			config[404] = "林慕青";
			config[405] = "祝员外";
			config[406] = "祝夫人";
			config[407] = "家丁的声音";
			config[408] = "男子的声音";
			config[409] = "丫鬟的声音";
			config[410] = "祝英台";
			config[411] = "马文才";
			config[412] = "阿波罗";
			config[413] = "阿芙洛狄忒";
			config[414] = "侍女缪诃";
			config[415] = "侍女穆拉";
			config[416] = "侍女弥赛拉";
			config[417] = "士兵A";
			config[418] = "士兵B";
			config[419] = "士兵C";
			config[420] = "普里阿墨斯王";
			config[421] = "宙斯";
			config[422] = "勒托女神";
			config[423] = "女子的声音";
			config[424] = "男子的声音";
			config[425] = "士兵的声音";
			config[426] = "穿戴甲胄的男子";
			config[427] = "神秘的声音";
			config[428] = "帕里斯";
			config[429] = "陌生的天使";
			config[430] = "路西法";
			config[431] = "撒旦";
			config[432] = "亚当";
			config[433] = "上帝的声音";
			config[434] = "阿斯蒙蒂斯";
			config[435] = "少女的声音";
			config[436] = "无名天使A";
			config[437] = "无名天使B";
			config[438] = "无名天使C";
			config[439] = "内心的声音";
			
			config[441] = "迷糊的蛇";
			config[442] = "亚当当";
			config[443] = "夏娃艾妮";
			
			config[444] = "颁奖典礼司仪";
			config[445] = "舞起狂澜";
			config[446] = "科洛维斯";
			config[447] = "__________离城";
			config[448] = "格子图___";
			config[449] = "猛将林一陈";
			config[450] = "南城离_";
			config[451] = "御焕君_";
			
			config[452] = "守护者";
			config[453] = "谜之学长";
			config[454] = "谜之学姐";
			config[455] = "谜之同学A";
			config[456] = "谜之同学B";
			config[457] = "谜之同学";
			config[458] = "谜之老师";
			config[459] = "弗雷斯特";
			config[460] = "尤利西斯";
			config[461] = "帝兰";
			config[462] = "亚斯兰";
			config[463] = "苏非娅";
			config[464] = "洛奇儿";
			config[465] = "斯塔那";
			config[466] = "威恩";
			config[467] = "绘画老师";
			config[468] = "同学A";
			config[469] = "同学B";
			config[470] = "同学C";
			config[471] = "同学D";
			config[472] = "家政老师";
			config[473] = "萨罗斯";
			config[474] = "卡琳儿";
			config[475] = "菲莉";
			config[476] = "旁白的声音";
			config[477] = "广播的声音";
			config[478] = "身份不明的幽灵少女";
			config[479] = "菲丽丝";
			config[480] = "朵朵西";
			config[481] = "魔法师A";
			config[482] = "魔法师B";
			config[483] = "魔法师C";
			config[484] = "魔法师D";
			config[485] = "女仆";
			config[486] = "陌生的少女";
			config[487] = "菲丽丝的声音";
			config[488] = "菲尔";
			
			
			config[489] = "玉兔";
			config[490] = "嫦娥";
			config[491] = "吴刚";
			config[492] = "仙鲤";
			config[493] = "月露";
			config[494] = "玉郎";
			
			config[495] = "伊莎贝拉";
			config[496] = "米莉娅";
			config[497] = "朱利安";
			config[498] = "卡伦";
			config[499] = "玛利亚";
			config[500] = "劳拉";
			config[501] = "预备教会成员";
			config[502] = "苏娜";
			config[503] = "欧德";
			config[504] = "利昂";
			config[505] = "菲尼克";
			config[506] = "露夏";
			config[507] = "普拉";
			config[508] = "斯莫娜";
			config[509] = "教皇";
			config[510] = "少年";
			config[511] = "村民A";
			config[512] = "村民B";
			config[513] = "村民C";
			config[514] = "吸血鬼A";
			config[515] = "吸血鬼B";
			config[516] = "吸血鬼C";
			config[517] = "思卡莱特";
			config[518] = "瑞尔希";
			config[519] = "血腥玛丽";
			config[520] = "特提亚";
			config[521] = "村民";
			config[522] = "虚弱的人";
			config[523] = "瓦内萨";
			config[524] = "扎克";
			
			config[525] = "幻影军团将领A";
			config[526] = "幻影军团将领B";
			config[527] = "幻影军团将领C";
			config[528] = "幻影军团将领D";
			config[529] = "菲尔的声音";
			config[530] = "辛西娅";
			config[531] = "夜修罗";			
			config[532] = "？？？";
			
			config[533] = "教会成员";
			config[534] = "谜之声音";
			
			config[535] = "阳天";
			config[536] = "铃月";
			config[537] = "谜之少女";
			config[538] = "阳天的叔父";
			config[539] = "司机";
			config[540] = "管家";
			config[541] = "前台A";
			config[542] = "前台B";
			config[543] = "员工A";
			config[544] = "员工B";
			config[545] = "员工C";
			config[546] = "员工D";
			config[547] = "员工E";
			config[548] = "千影";
			config[549] = "大狐仙甲";
			config[550] = "大狐仙乙";
			config[551] = "行人的声音";
			config[552] = "陌生的少年";
			config[553] = "助理";
			config[554] = "派对主持";
			config[555] = "黑西服男子A";
			config[556] = "黑西服男子B";
			config[557] = "黑西服男子C";
			config[558] = "巡警A";
			config[559] = "巡警B";
			config[560] = "神秘的男子";
			config[561] = "千影探员";
			config[562] = "女仆";
			
			config[563] = "美妆店店主";
			config[564] = "偶像新生A";
			config[565] = "偶像新生B";
			config[566] = "偶像新生C";
			config[567] = "偶像新生D";
			config[568] = "偶像新生E";
			config[569] = "偶像新生F";
			config[570] = "形体舞导师";
			config[571] = "学生A";
			config[572] = "学生B";
			config[573] = "学生C";
			config[574] = "模特选拔主持人";
			config[575] = "参赛者A";
			config[576] = "参赛者B";
			config[577] = "参赛者C";
			config[578] = "模特评委A";
			config[579] = "模特评委B";
			config[580] = "路过的学生A";
			config[581] = "路过的学生B";
			config[582] = "邻居A";
			config[583] = "邻居B";
			config[584] = "邻居C";
			config[585] = "星探";
			config[586] = "围观群众A";
			config[587] = "围观群众B";
			config[588] = "围观群众C";
			config[589] = "路人A";
			config[590] = "路人B";
			config[591] = "路人C";
			config[592] = "路人D";
			config[593] = "路人E";
			config[594] = "粉丝";
			config[595] = "同学A";
			config[596] = "同学B";
			config[597] = "助理";
			config[598] = "圣诞祭主持";
			config[599] = "服装店店主";
			config[600] = "导演";
			config[601] = "美玖";
			config[602] = "夏希";
			config[603] = "夏纪";
			config[604] = "模特少女";
			config[605] = "“夏希”";
			config[606] = "实花";
			config[607] = "偶像新生G";
			config[608] = "偶像新生H";
			config[609] = "偶像新生I";
			config[610] = "电话里的声音";
			config[611] = "粉丝A";
			config[612] = "粉丝B";
			config[613] = "粉丝C";
			config[614] = "夏纪的声音";
			config[615] = "圣诞祭主持人的声音";
			
			config[616] = "颁奖典礼主持人";
			config[617] = "梦冰";
			config[618] = "贝洛";
			config[619] = "夜宇";
			
			config[620] = "#username#";
			config[621] = "顾白溪";
			config[622] = "三月";
			config[623] = "乔乔";
			config[624] = "宠物店顾客A";
			config[625] = "宠物店顾客B";
			config[626] = "宠物店顾客C";
			config[627] = "电视机的声音";
			config[628] = "静静";
			config[629] = "同台演员A";
			config[630] = "同台演员B";
			config[631] = "指导老师";
			config[632] = "人偶";
			config[633] = "评委A";
			config[634] = "评委B";
			config[635] = "评委C";
			config[636] = "“丫鬟莺儿”";
			config[637] = "主持人";
			config[638] = "福利院阿姨";
			config[639] = "孩子们";
			config[640] = "小孩子的声音";
			config[641] = "总选主持人";			
			config[642] = "齐宇";
			config[643] = "服装店店员";
			config[644] = "程嘉";
			config[645] = "粉丝们";
			config[646] = "路人A";
			config[647] = "路人B";
			config[648] = "小孩子A";
			config[649] = "小孩子B";
			config[650] = "小孩子C";
			config[651] = "小孩子D";
			config[652] = "小孩子E";
			config[653] = "临时演员A";
			config[654] = "临时演员B";
			config[655] = "乔乔的妈妈";
			
			config[656] = "守护者A";
			config[657] = "守护者B";
			config[658] = "守护者C";
			config[659] = "守护者D";
			config[660] = "艾米女神";
			config[661] = "帝兰";
			config[662] = "亚斯兰";
			config[663] = "苏非娅";
			config[664] = "洛奇儿";
			config[665] = "斯塔那";
			config[666] = "萨罗斯";
			config[667] = "卡琳儿";
			config[668] = "光之精灵少女";
			config[669] = "暗之精灵少女";
			
			config[670] = "酒吧顾客A";
			config[671] = "学员A";
			config[672] = "学员B";
			config[673] = "学员C";
			config[674] = "女孩A";
			config[675] = "男A";
			config[676] = "女A";
			config[677] = "裴乐林";
			config[678] = "顾客甲";
			config[679] = "老师A";
			config[680] = "老师B";
			config[681] = "学员A、B、C";
			
			config[682] = "守护者E";
			config[683] = "路过的守护者";
			config[684] = "芙洛";
			config[685] = "黛丝";
			config[686] = "樱寻";
			
			config[687] = "电话";
			config[688] = "经纪人A";
			config[689] = "经纪人B";
			
			config[690] = "小孩B";
			config[691] = "村民A";
			config[692] = "村民B";
			config[693] = "村民C";
			config[694] = "村民A";
			config[695] = "村民B";
			config[696] = "村民C";
			config[697] = "老师A";
			config[698] = "演员";
			config[699] = "芊芊";
			config[700] = "神秘的少女";
			config[701] = "大树A";
			
			config[702] = "和尚甲";
			config[703] = "和尚乙";
			config[704] = "妖狐";
			config[705] = "璟逸";
			config[706] = "善音";
			config[707] = "顾琮";
			
			config[708] = "守护者";//显示用户自己形象
			config[709] = "龙";
			
			config[710] = "龙王";
			config[711] = "卫兵";
			config[712] = "兴霞教弟子甲";
			config[713] = "兴霞教弟子乙";
			config[714] = "兴霞教长老";
			config[715] = "兴霞教弟子";
			
			config[716] = "学员";
			config[717] = "自责的学员";
			config[718] = "威利";
			config[719] = "比利";
			config[720] = "温蒂";
			config[721] = "苏非娅";
			config[722] = "邪恶的黑魔法师";
			config[723] = "艾丽莎";
			config[724] = "维克多";
			config[725] = "伊娃";
			config[726] = "老师";
			config[727] = "露露";
			config[728] = "詹妮弗";
			config[729] = "卢克";
			
			config[730] = "同学";
			config[731] = "兽医";
			config[732] = "花痴们";
			config[733] = "害羞的女同学";
			config[734] = "呦呦";
			config[735] = "小福";
			config[736] = "颜溪";
			config[737] = "弃弃";
			config[738] = "花痴";
			config[739] = "主持人";
			config[740] = "女生";
			config[741] = "女仆小姐姐";
			
			config[742] = "看守骑士";
			config[743] = "莽撞的精灵";
			config[744] = "凑过来的精灵";
			config[745] = "丽娜";
			config[746] = "维雅";
			config[747] = "看热闹的精灵";
			config[748] = "精灵甲";
			config[749] = "精灵乙";
			config[750] = "女王";
			config[751] = "贵族们";
			config[752] = "裁判";
			config[753] = "爱尔芙";
			config[754] = "海瑟薇";
			config[755] = "奈落";
			config[756] = "兰多";
			config[757] = "诺维娜";
			config[758] = "凯瑟琳娜";
			config[759] = "爱洛";
			config[760] = "贵族";
			config[761] = "司仪";
			config[762] = "安吉莉娅";
			config[763] = "洛瑞丝";
			config[764] = "嘉文";
			config[765] = "女仆";
			config[766] = "长老";
			config[767] = "国王";
			config[768] = "爱丽儿";
			config[769] = "赛德";
			config[770] = "桐子";
			config[771] = "黑影";
			config[772] = "村民";
			config[773] = "小兰多";
			config[774] = "小奈落";
			config[775] = "梅里亚";
			config[776] = "凯伦";
			config[777] = "审判者";
			config[778] = "精灵";
			
			config[779] = "艾米";
			config[780] = "夜赫";
			config[781] = "学妹";
			config[782] = "神官";
			
			config[783] = "学员";
			config[784] = "学弟";
			config[785] = "学弟2号";
			config[786] = "学妹";
			config[787] = "伽子";
			config[788] = "小妹妹";
			config[789] = "神秘的影子";
			config[790] = "1号学弟";
			config[791] = "妮娜";
			
			config[792] = "夏洛特";
			config[793] = "杰森";
			config[794] = "劳伦斯";
			config[795] = "扎克";
			config[796] = "莉莉";
			config[797] = "美纱";
			config[798] = "露西";
			config[799] = "新娘们";
			config[800] = "女仆";
			config[801] = "觉醒者";				
			config[802] = "亚历克斯";
			config[803] = "杜克";
			config[804] = "以利亚";
			config[805] = "小蝙蝠";
			config[806] = "薇薇安";
			config[807] = "吸血鬼们";
			config[808] = "弥赛亚";
			
			config[809] = "云深";
			config[810] = "璃洛";
			config[811] = "若絮";
			config[812] = "小云深";
			config[813] = "小混混甲";
			config[814] = "小混混乙";
			config[815] = "小混混丙";			
			config[816] = "爷爷";
			config[817] = "班主任";
			config[818] = "松鼠";
			config[819] = "雪灵";
			
			config[820] = "程嘉";
			config[821] = "萝莉也能奶天下";
			config[822] = "陆琪琪";
			config[823] = "一刀封疆";
			config[824] = "飘飘";
			config[825] = "风雨无清";
			config[826] = "念奴娇";
			config[827] = "小不点";
			config[828] = "八云";
			config[829] = "雨雪霏霏";
			config[830] = "斯蒂娜";
			config[831] = "苏西";
			config[832] = "音乐家";
			config[833] = "嘉减乘除";
			config[834] = "香小艾";
			config[835] = "绑匪";
			config[836] = "被劫镖者";
			config[837] = "原音无相";
			config[838] = "论坛";
			config[839] = "观众";
			config[840] = "主持人";
			
			config[841] = "叶凌渊";
			config[842] = "苏筱涵";
			config[843] = "盒子";
			config[844] = "巫毒娃娃";
			config[845] = "白茜茜";
			config[846] = "简攸宁";
			
			config[847] = "三月";
			config[848] = "昊昊";
			config[849] = "乔乔";
			config[850] = "顾白溪";
			config[851] = "秦一涟";
			config[852] = "伍仟";
			config[853] = "白茜茜";
			config[854] = "苏筱涵";
			config[855] = "简攸宁";
			config[856] = "叶凌渊";
			config[857] = "安俊赫";
			
			
			config[858] = "服装师";
			config[859] = "主持人";
			config[860] = "Miko";
			config[861] = "美可";
			config[862] = "记者";
			config[863] = "徐繁锦";
			config[864] = "徐新亚";
			
			config[865] = "嬴政";
			config[866] = "灵湘";
			config[867] = "姬丹";
			config[868] = "江喻澄";
			config[869] = "徐默";
			config[870] = "弹幕";
			config[871] = "李斯";
			config[872] = "将士";
			
			config[873] = "纨绔子弟";
			config[874] = "卖身葬父的人";
			config[875] = "小丫头";
			config[876] = "婢女";
			config[877] = "卖酒的小贩";
			config[878] = "老爷爷";
			
			config[879] = "游客";
			config[880] = "镖师";
			config[881] = "劫匪";
			config[882] = "阿飞";
			
			config[883] = "赵云";
			config[884] = "苏姑娘";
			config[885] = "道长";
			config[886] = "卖艺的人";
			config[887] = "士兵";
			config[888] = "新郎";
			config[889] = "琳琅阁掌柜";
			
			config[890] = "网友";
			config[891] = "外卖小哥";
			config[892] = "湘水女神";
			config[893] = "乐佩";
			config[894] = "葛朵";
			config[895] = "弗林";
			config[896] = "荆轲";
			
			config[897] = "兰陵王";
			config[898] = "药师";
			config[899] = "琴师";
			config[900] = "侠客";
			config[901] = "王侯公子";
			config[902] = "道姑";
			config[903] = "杂耍的人";
			
			config[904] = "李太白";
			config[905] = "扶桑浪人";
			config[906] = "酒楼掌柜";
			config[907] = "和尚";
			config[908] = "公主";
			config[909] = "书生";
			config[910] = "舞姬";
			
			config[911] = "红豆";
			config[912] = "奥利弗";
			config[913] = "巴芙洛娃";
			config[914] = "容若";
			config[915] = "男孩";
			config[916] = "女孩";
			config[917] = "犬妖";
			config[918] = "学生";
			config[919] = "南茜";
			config[920] = "呱呱";
			config[921] = "蛙巫医";
			config[922] = "医生";
			config[923] = "碧吉塔";
			config[924] = "塔利亚";
			config[925] = "阴影";
			config[926] = "古董妖怪们";
			config[927] = "阎王";
			config[928] = "菡烟";
			config[929] = "琳琅";
			config[930] = "老板";
			config[931] = "玉辞心";
			config[932] = "孔宣";
			config[933] = "缪幻薇";
			config[934] = "薇蝶";
			config[935] = "梅荫雪";
			config[936] = "白犬";
			
			config[937] = "院长";
			config[938] = "路人";
			config[939] = "小男孩";
			config[940] = "爷爷";
			config[941] = "茶露露";
			config[942] = "松小莘";
			config[943] = "柯琳";
			config[944] = "卡嘉莉";
			config[945] = "挑事的学生";
			config[946] = "8号选手";
			config[947] = "怪物";
			config[948] = "家长";
			config[949] = "卡莲";
			config[950] = "学生会长";
			config[951] = "伊芙琳";
			config[952] = "米法拉";
		}
	}
}


