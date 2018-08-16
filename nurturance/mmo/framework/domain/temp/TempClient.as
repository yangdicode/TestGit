package mmo.framework.domain.temp
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;

	/**
	 * 运营活动
	 */	
	public class TempClient
	{
		private static var _instance:TempClient;
		
		private static const EXTENSIONS_ID:int = 44;
		public static const EXTENSIONS_NAME:String = "TempExtension";	
		
		/**
		 *  前端缓存部分用户热点活动数据(后端推送事件) --- 已经停止更新
		 * */
		public static const EVT_UPDATE_TEMPPROP:String = "44_e1";
		
		/**
		 *  是否已经可以开始‘占卜’了(后端推送事件) 
		 * */
		public static const EVT_SEND_STAGE_READY:String = "44_e2";
		/**
		 *  被强制踢下站台了(后端推送事件) 
		 * */
		public static const EVT_LEAVE_STAGE:String = "44_e3";
		/**
		 *  前端缓存部分用户热点活动数据(更新部分)(后端推送事件) --- 新的,代替 EVT_UPDATE_TEMPPROP 
		 * */
		public static const EVT_UPDATE_TEMPPROP_2:String = "44_e4";
		
		public static const EVT_SCENEMONSTER_GIFT:String = "44_e5";
		
		/**
		 * 场景怪自动攻击
		 */		
		public static const EVT_SCENEMONSTER_AUTODECHP:String = "44_e6";
		/**
		 * 后台主动推送，完成阶段活动的某步
		 */		
		public static const EVT_TOMATO_EARL_STEP:String = "44_e7";
		
		/**
		 * 打场景怪活动结束 
		 */		
		public static const EVT_SCENEMONSTER_END:String = "44_e10";
		
		
		/** 获取前端缓存部分用户热点活动数据(全部)  **/
		public static const CMD_GET_TEMP_PROP_INTS:String = "44_1000";
		public static const cmdHitMonster:String = "44_1";
		public static const cmdTakeGift:String = "44_2";		
		//七夕送玫瑰
		public static const cmdVoteNpc:String = "44_3";
		public static const cmdGetVotes:String = "44_4";
		public static const cmdGetLeftVoteNum:String = "44_5";		
		//稻草兑换
		public static const cmdExchangeDaocao:String = "44_6";		
		//多多卡编号礼物
		public static const cmdChangeDuoduoGift:String = "44_7";		
		//朵朵西舞会海报宣传
		public static const cmdGetDanceClickNum:String = "44_8";
		public static const cmdClickDance:String = "44_9";		
		//中秋赏月夜礼物
		public static const cmdMidAutumnGift:String="44_10";		
		//小丑狂欢节特殊战斗运营
		public static const cmdLogLastFightClown:String = "44_13";
		public static const cmdGetLastFightClown:String = "44_14";		
		//雪玲的礼物
		public static const cmdGetXueLingMaturePetGift = "44_15";
		public static const cmdGetXueLingRidePetGift = "44_16";		
		//流失用户调研和常规用户调研
		public static const cmdLostUserResearch = "44_17";		
		public static const cmdUserResearch = "44_18";		
		//宠物投票
		public static const cmdVotePet = "44_19";
		public static const cmdCanVotePet = "44_20";		
		//万圣节女巫的游戏
		public static const cmdHandleDetectLampwick = "44_22";
		public static const cmdHandleChangeLampwick = "44_23";
		public static const cmdHandleHalloweenGameBonus = "44_24";		
		//万圣节百鬼夜游
		public static const cmdHandleGetCheapskateBonus = "44_25";
		public static const cmdHandleGetCravenGhostBonus = "44_26";		
		//万圣节开启宝箱
		public static const cmdOpenChest:String = "44_27";		
		/**
		 * 括除金币
		 */		
		public static const cmdDecScore = "44_21";		
		//感恩节加虫子
		public static const cmdHandleIncWorm = "44_28";			
		//火鸡的心愿
		public static const cmdHandleGetThanksgivingDayTimes = "44_29";		
		//签到奖励
		public static const cmdHandleGetThanksgivingDayGift = "44_30";		
		//买特价商品
		public static const cmdHandleSellItemHalfPrice = "44_31";
		//购买礼包
		public static const cmdHandleBuyThanksgivingDayGift = "44_32";
		//获取礼包已经购买的次数
//		public static const cmdHandleGetBuyGiftTimes = "44_33";		
		//宠物评选投票结果
		public static const cmdhandleGetPetVoteViews = "44_34";		
		//场景交互采集奖励
		public static const cmdHandleGetSceneBonus = "44_35";		
		//神灯许愿
		public static const cmdWishingLamp = "44_36";
		//神灯许愿次数,今天是否许愿
		public static const cmdGetWishingLampTimes = "44_37";
		//领取悠悠蛋?
		public static const cmdTakeEgg = "44_38";
		//寒假冲级数据
		public static const cmdWinterGetUserActiveTime = "44_39";
		//寒假冲级奖励
		public static const cmdWinterTakeBonus = "44_40";		
		/**
		 * 新年兑换
		 */		
		public static const CMD_NEWYEAR_TRANS:String = "44_41";		
		public static const cmdTakeYearBeastBonus:String = "44_43";		
		/**
		 * 设置一个每天清除的值 
		 */		
		public static const CMD_SET_DAILY_CACHE:String = "44_44";
		/**
		 * 获取一个每天清除的值 
		 */		
		public static const CMD_GET_DAILY_CACHE:String = "44_45";
		/**
		 * 使用战宠宠物袋 
		 */		
		public static const CMD_USE_BAG_ADD_BATTLE_PET:String = "44_46";		
		/**
		 * 增加原味巧克力
		 */		
		public static const CMD_ADD_ORICHOCOLATE:String = "44_47";		
		/**
		 * 赠送好友巧克力
		 */		
		public static const CMD_SEND_OTHER_CHOCOLATE:String = "44_48";		
		/**
		 * 查看好友可送巧克力数量
		 */		
		public static const CMD_GET_CAN_SEND_CHOCOLATE_NUM:String = "44_49";		
		/**
		 * 建造巧克力屋
		 */		
		public static const CMD_BUILD_CHOCOLATE_HOUSE:String = "44_50";		
		/**
		 * 获得巧克力屋
		 */		
		public static const CMD_GET_CHOCOLATE_HOUSE:String = "44_51";		
		/**
		 * 取得自己巧克力数据
		 */		
		public static const CMD_GET_MY_CHOCOLATE_DATA:String = "44_52";		
		/**
		 * 获得建造了几天
		 */		
		public static const CMD_GET_BUILD_HOUSE_DAYS:String = "44_53";		
		/**
		 *  前端缓存部分用户热点活动数据(主动获取) --- 已过期
		 * */
		public static const CMD_GET_USER_TEMP_PROP:String = "44_54";				
		/**
		 * 站台子：守护者站上去
		 */		
		public static const CMD_AGGREGATION_STAND_PLATFORM:String = "44_55";		
		/**
		 * 守护者离开站台,领取奖励
		 */		
		public static const CMD_AGGREGATION_LEAVE_PLATFORM:String = "44_56";		
		/**
		 * 当前站台所站的用户
		 */		
		public static const CMD_AGGREGATION_GET_PLATFORMUSER:String = "44_57";		
		/**
		 * 获得宣传人数
		 */		
		public static const CMD_AGGREGATION_GET_USERCOUNT:String = "44_58";				
		/*** 神羽骑士号召令**/
		public static const CMD_SUBMIT_INVITE_CODE:String = "44_60"; //提交邀请码
		public static const CMD_TAKE_INVITE_MEMBER_BONUS:String = "44_61"; //领取奖励
		public static const CMD_SEND_INVITE_MEMBER_MSG:String = "44_62"; //发消息邀请
		public static const CMD_GET_INVITE_MEMBER_STATE:String = "44_63"; //多少人被你邀请成为VIP
		/*** 奥雅特使集结号 2012年2月14日 从InviteCodeClient临时移过来的，两周运营活动 ***/
		public static const TEMPTAKEINVITESTATE:String = "44_65";
		public static const TEMPTAKEINVITEBONUS:String = "44_66";
		public static const TAKE_MOLY_BONUS:String = "44_69";
		public static const MOLY_BONUS_GOT_TODAY:String = "44_70";		
		//s-缘分塔罗牌
		public static const CMD_STANDON_STAGE:String = "44_74";
		public static const CMD_LEAVE_STAGE:String = "44_75";
		public static const CMD_TAKE_STAGE_USER:String = "44_77";
		// 抽奖
		public static const CMD_TAKE_FTURNTABLE_BONUS:String = "44_78";
		public static const CMD_TAKE_LEFT_FTURNTABLE_TIMES:String = "44_79"
		// 领主变身记
		public static const CMD_TAKE_GAME_TEMPITEM:String = "44_82";
		public static const CMD_TAKE_KING_BONUS:String = "44_83";
		public static const CMD_GET_TEMP_KING_STATE:String = "44_84";		
		//e-缘分塔罗牌
		/*** 商城消费增加VIP成长值活动 经验值 ****/
		public static const CMD_GET_TEMP_VIPEXP_INC:String = "44_81";		
		public static const CMD_GET_LAIRD_TODAY_DONECOUNT:String = "44_85";
		public static const CMD_TAKE_LAIRD_BONUS:String = "44_86";
		public static const CMD_GET_EQ_STATE:String = "44_87";
		public static const CMD_COMMON_TEMP:String = "44_88";		
		public static const TAKE_TODAY_DO_TIMES:String = "44_90";
		public static const TAKE_YINYANGSHI_SHILIAN_BONUS:String = "44_91";
		// 卡夫兑换
		public static const CMD_TAKE_KAFU_BONUS:String = "44_92";		
		public static const CMD_SEND_FLOWER_TO_TREE:String = "44_93"; //给祈福树送花
		public static const CMD_GET_TREE_CHARM:String = "44_94";  //取祈福树的魅力值
		public static const CMD_BLESS_MONTHER:String = "44_95"; //祝福-(留言和画画)
		public static const CMD_GET_BLESS_MSG:String = "44_96"; //取祝福内容		
		public static const CMD_BATTLE_PARTY_MAX_RECORD_GIFT:String = "44_e99";
		public static const CMD_BATTLE_PARTY_GIFTEVT:String = "44_e97";
		public static const CMD_BATTLE_PARTY_TAKEGIFT:String = "44_98";
		// 忍者试练
		public static const CMD_TEMP_NINJA_SHILIAN_BONUS:String = "44_100";
		// 走秀前300名
		public static const CMD_TEMP_SHOW_TOP300_BONUS:String = "44_101";
		public static const CMD_GET_USER_SHOW_RANKING:String = "44_102";		
		public static const CMD_TAKE_LOOKAFTER_EIDOLON_BONUS:String = "44_103";
		public static const CMD_TAKE_ANNAGROWPLAN_BONUS:String = "44_104";		
		public static const CMD_TAKE_VISTIHOUSE_GIFT:String = "44_105";//活动-幸运粽子礼包
		public static const CMD_GET_VISITHOUSE_INFO:String = "44_106";//活动-幸运粽子礼包
		public static const CMD_TAKE_MISSYOU_BONUS:String = "44_107";		
		public static const CMD_TAKE_VIPFIRSTOPEN_GIFT:String = "44_108";
		public static const CMD_GET_USER_VIP_STATE:String = "44_109";
		public static const CMD_TAKE_VIP_BACK_GIFT:String = "44_110";		
		public static const CMD_TEMP_SEND_INVITE_MSG:String = "44_111";
		public static const CMD_TEMP_FILLIN_INVITE_CODE:String = "44_112";
		public static const CMD_TEMP_TAKE_INVITE_BONUS:String = "44_113";
		//***********************周年庆大筹备*******************//
		public static const CMD_BLESS_AOYA:String = "44_116";
		public static const CMD_GET_BLESS_AOYA:String = "44_117";
		//***********************周年庆大筹备*******************//
		public static const CMD_KILL_SHADOW_TEMPLE_MONSTER_BY_MONEY:String = "44_118";		
		public static const CMD_TEMP_JOIN_MAGICHOUSE:String = "44_119";//进入魔法屋
		public static const CMD_TAKE_MAGICHOUSE_BONUS:String = "44_120";//领取魔法屋奖励
		public static const CMD_TEMP_TAKE_XIAOYAWISH_BONUS:String = "44_121"; //领取小雅的奖励
		public static const CMD_TEMP_GODDESS_BONES:String = "44_122";		
		public static const CMD_TEMP_START_PACKAGEFLOWER :String = "44_123";
		public static const CMD_TEMP_TAKE_PACKAGEFLOWER_BONUS:String = "44_124";		
		public static const CMD_TEMP_TAKE_TRANSFERTORCH_BONES:String = "44_125";
		public static const CMD_TEMP_GET_TEAM_CHARM:String = "44_126";
		public static const CMD_TEMP_SEND_FLOWER_TO_TEAM:String = "44_127";
		public static const CMD_TEMP_FINISH_LOVEPROMISE_PHASE:String = "44_128";		
		//昏迷的喜鹊
		public static const CMD_MAGPIE_SEND_WATER:String = "44_129";
		public static const CMD_MAGPIE_TAKE_SEED:String = "44_130";				
		//演奏家之梦 
		public static const CMD_TEMP_GET_MUSIC_STAGE:String = "44_137";//获得台子信息
		public static const CMD_TEMP_STAND_ON_MUSIC_STAGE:String = "44_138";//站台子
		public static const CMD_TEMP_LEAVE_MUSIC_STAGE:String = "44_139";//离开台子			
		public static const CMD_GET_DANCEPARTY2_BONUS:String = "44_131";	//单人跳舞		
		public static const CMD_TEMP_VIP_AUGUEST_GIFT_STATE:String = "44_145";
		public static const CMD_TEMP_TAKE_VIP_AUGUEST_GIFT:String = "44_146";
		//绝版小摊
		public static const CMD_GET_USER_STALL_STATE:String = "44_147";
		public static const CMD_COMMON_FLUSH_STALL_ITEMS:String = "44_148";
		public static const CMD_YB_FLUSH_STALL_ITEMS:String = "44_149";
		public static const CMD_EXCHANGE_STALL_ITEMS:String = "44_150";		
		public static const CMD_TAKE_MAGBRILINKBEAD_BONUS:String = "44_151";//鹊桥连珠		
		public static const CMD_HIT_DRUM:String = "44_152";		
		public static const CMD_TEMP_BBQ_BONUS:String = "44_154";//夏日烧烤		
		public static const CMD_TEMP_GET_SHOOTINT_BONUS:String = "44_155"; //气枪射击
		public static const CMD_TAKE_FIREWORKS_BONUS:String = "44_156";
		public static const CMD_TEMP_TAKE_DROPGIFT_BONUS:String = "44_159";
		public static const CMD_TAKE_DOLLORIGIN_CHIP:String = "44_160";
		
		public static const CMD_TEMP_INC_NPCFAVOR:String = "44_161";//加人偶好感。
		/**
		 * 绝版宠物大回归  
		 */			
		public static const CMD_TEMP_CHOOSEBATTLEPET:String = "44_167";    // 选择战宠支持
		public static const CMD_TEMP_SENDFLOWER_BATTLEPET:String = "44_168";  //对选择的战宠送花
		public static const CMD_TEMP_GET_BATTLEPET_VOTE:String = "44_169";  //取战宠的投票数		
		public static const CMD_TEMP_INC_DOLL_VOTE:String = "44_170"; //神秘的人偶师。
		
		public static const CMD_TEMP_GET_USER_RECHARGEORRENEWMONTHS:String = "44_175";
		public static const CMD_TEMP_TAKE_VIP_BACK_BONUS:String = "44_176";
		public static const CMD_TEMP_TAKE_VIP_BACK_EXT_BONUS:String = "44_177";

		
		public static const CMD_GET_RETURN_BATTLE_PET_STATE:String = "44_181";
		public static const CMD_TAKE_MAX_VOTE_BATTLE_PET:String = "44_182";
		
		public static const CMD_TEMP_TAKE_HEARROAD_BONUS:String = "44_186";//心灵通道
		
		public static const CMD_TEMP_FINISH_PHASE_ACTIVITY:String = "44_190";//阶段性活动 完成第几个活动
		
		public static const CMD_TEMP_GET_2012_HALLOWMAS_BADGE:String = "44_194";
		
		public static const CMD_TEMP_FINISH_DRAW_TRAINING:String = "44_195";//绘画特训
		
		public static const CMD_TEMP_GARDEN_EXCHANGE:String = "44_196";//鲜花加工厂
		
		public static const CMD_TEMP_LUOQI_COLLECTION :String = "44_197";//洛奇收集		
		
		//战宠训练
		public static const CMD_TRAIN_BATTLE_PET:String = "44_200";//训练	
		public static const CMD_BUY_TRAIN_TIME:String = "44_201";//买次数
		public static const CMD_CLEAR_TRAIN_PET_CD:String = "44_202";//清CD
		
		//家园大赛活动
		public static const CMD_TEMP_HOUSE_VOTE:String = "44_203";
		
		//感恩节打折活动
		public static const CMD_TEMP_THANKSGIVING_SHOPITEM_DISCOUNT:String = "44_204";
		
		//绝版之梦宣传
		public static const CMD_TEMP_INC_LOTTERY_CHANCE:String = "44_214";//增加抽奖次数
		public static const CMD_TEMP_TAKE_LOTTERY_BONUS:String = "44_215";//抽奖

		//职业投票的
		public static const CMD_TEMP_VOTE_PROFESSION:String = "44_221";
		public static const CMD_TEMP_VIEW_PROFESSION_VOTE :String = "44_222";
		
		// 绝版宠物召唤
		public static const CMD_TEMP_TAKE_TURN_CARD_STATE:String = "44_217";
		public static const CMD_TEMP_TURN_ALL_CARD:String = "44_218";
		public static const CMD_TEMP_TURN_SOME_CARD:String = "44_219";
		public static const CMD_TEMP_TAKE_TURN_CARD_BOUS:String = "44_220";
		
		//绝版家具大回归
		public static const CMD_TEMP_TAKE_FUR_TICKET:String = "44_231";
		
		//元宵大侠挑战
		public static const CMD_TEMP_PASS_YEAR_EGG_BATTLE_RAFFLE:String = "44_241";
		
		//寒假召集令
		public static const CMD_TEMP_TAKE_RECALLED_BONUS :String = "44_246";
		public static const CMD_TEMP_TAKE_RECALL_BUDDY_BONUS :String = "44_247";
		
		//羽贝抽奖
		public static const CMD_TEMP_EXCHANGE_YUBEI_LOTTERY_BONUS:String = "44_248";
		
		public static const CMD_TEMP_2013_WV_NEWBIE_BONUS:String = "44_249";
		public static const CMD_TEMP_20130110_BACK_BONUS:String = "44_250";
		
		//时光机
		public static const CMD_TEMP_GET_TIME_MACHINE_STATE:String = "44_252";
		public static const CMD_TEMP_REFRESH_TIME_MACHINE:String = "44_253";
		public static const CMD_TEMP_SET_MACHINE_MONTH:String = "44_254";
		public static const CMD_TEMP_SET_MACHINE_SEX:String = "22_255";
		public static const CMD_TEMP_TAKE_TIME_MACHINE_BONUS:String = "44_256";

		//幸福的青鸟
		public static const CMD_TEMP_FEED_BIRD:String = "44_251";
		public static const CMD_TEMP_TAKE_FEED_BIRD_BONUS:String = "44_257";

		public static const CMD_TEMP_TAKE_YEAMMEMBER_GIFT130118:String = "44_258";
				 
		public static const CMD_VOTE_KNIGHT:String = "44_262";//投票
		public static const CMD_VIEW_KNIGHT_VOTE:String = "44_263";//拿票数
		public static const CMD_TAKE_VOTE_BONUS :String = "44_264";//拿奖励
		
		//石头兑换
		public static const CMD_TEMP_STONE_EXCHANGE:String = "44_266";
		
		//牙牙乐
		public static const CMD_TAKE_FUNCARD_GIFT:String = "44_267";
		
		//夜赫的踪迹
		public static const CMD_TEMP_FINDCLUE_GETTODAYDONECOUNT:String = "44_268";
		public static const CMD_TEMP_FINDCLUE_INCREASETODAYDONECOUNT:String = "44_269";
		public static const CMD_TEMP_FINDCLUE_DRAWBONUS:String = "44_270";

		
		public static const CMD_TEMP_DXJ_LVUP_ORI_BATTLEPET:String = "44_271";  //大小姐的果茶
		
		public static const CMD_TEMP_BOLITEST_TAKE_BONUS:String = "44_273"; //波利大冒险拿奖励
		
		public static const CMD_TEMP_TAKE_SUPEVOORE_BONUS:String = "44_275"; //战宠超进化挖矿
		
		public static const CMD_TEMP_GAME_KING_EXCHANGE:String = "44_276";//游戏王，兑换蛇年红包
		

		public static const CMD_TEMP_2013_YXFL_SF:String = "44_277";//元宵闹花灯-送花

		public static const CMD_TAKE_HOLE_GARDENFLOWER_BONUS:String = "44_291";//摘绣球花奖励
		
		public static const CMD_TAKE_ANCIENTRY_BONUS:String = "44_292";//古风系列，领娃娃
		
		public static const CMD_SETTLE_WAKE_FLOWER_BONUS:String = "44_307";//阳光下的瞌睡花，领奖励
				
		
		public static const CMD_SEND_GARDENFLOWER_WINDMILL:String = "44_322";//小小风车力量大
		
		public static const CMD_TAKE_HUANYINGLIGHT_BONUS:String = "44_324";//搜寻幻影之光
		
		public static const CMD_TAKE_HISTORY_TOPNO1_BONUS:String = "44_325";//红蔷薇骑士领宠物
		
		public static const CMD_VOTE_61_CLOTHES:String = "44_326";
		
		public static const CMD_CLEAR_MAGICHOUSE_CD:String = "44_330";//清除进去魔法屋cd
		
		public static const CMD_CANDY_QUEEN_HOLY_GUARD:String = "44_396";//肥婆大挑战 神圣力量
				
		public static const CMD_PROFESSION_CHARACTOR_TEST:String = "44_404";//职业测试
		
		public static const CMD_XIAOXIAO_LOVE_TAKINGPHOTOS:String = "44_398";   //小小爱拍照
		
		public static const CMD_LIGHT_ARRAY_BONUS:String = "44_427";                   //卡洛琳光明法阵交互奖励
		public static const CMD_LIGHT_ARRAY_CLEARCD:String = "44_428";                 //卡洛琳光明法阵清除CD
		
		public static const CMD_SHENYU_FIRSTOPEN_BONUS:String = "44_454";//2013-09-30神羽首充3重大礼
		
		public static const CMD_PULLOUT_PUMPKINLIGHT_GETINFO:String = "44_464";//拔南瓜，取收获值
		public static const CMD_PULLOUT_PUMPKINLIGHT_SETTLE:String = "44_465";//拔南瓜，收获南瓜
		public static const CMD_PULLOUT_PUMPKINLIGHT_BUYTIME:String = "44_466";//拔南瓜，购买收获值
		
		public static const CMD_CHINESEDEITY_CLICK:String = "44_561"           //中国神猜猜看
		
		public static const CMD_SILVER_CRYSTAL_QUICKSTART:String = "44_564";    //银水晶超进化清除交互CD
		public static const CMD_SILVER_CRYSTAL_SUPEREVO:String = "44_565";      //银水晶超进化
		
		public static const CMD_TAKE_DOUBLE_DAN_GIFT:String = "44_517"; //每日登陆：双蛋
		
		public static const CMD_VIP_SUIT_COLLECTION:String = "44_566"; //神羽绝版大收集
		
		public static const CMD_WINGS3_MERGE:String = "44_10_17";        //羽翼融合大行动
		
		//**************************
		
		/** 获取用户某段时间新充值月份数目 **/
		public static const CMD_GET_USER_INCVIPMONTHS:String = "44_157";
		
		//**************************
		public static const CMD_GET_MC_COUNT:String = "44_1001";	
		public static const CMD_GET_TIME_START_FROM_MC:String = "44_1002";
		public static const CMD_GET_MULTI_TEMPPROPSTRINGS:String = "44_1004";
		
		public static const CMD_TAKE_LOTTER_BONUS:String = "44_33";
		
		
		public function TempClient()
		{
		}

		public static function get instance():TempClient
		{
			if(_instance == null)
			{
				_instance = new TempClient();
			}	
			return _instance;
		}	


		
		// 真想把它公开，不加了，太长。
		public function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		
		 /**  发命令的包装  **/
		public function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{
			
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_ID, cmd, function(backParams:Object):void{
				
				if(callBack != null){
					callBack.apply(null, [backParams]);
				}
			}, params);
		}
		
		
		/**
		 * 击中场景怪（场景打怪）
		 * @param monsterKey,TempMonsterKey定义
		 */		
		public function hitMonster(monsterKey:String,dec:int = 1):void
		{
			this.sendXtMessage(cmdHitMonster,{"monster":monsterKey,"dec":dec});
		}
		
		/**
		 * 获取怪物掉落的礼物（场景打怪）
		 */		
		public function takeGift(monsterKey:String):void
		{
			this.sendXtMessage(cmdTakeGift,{"monster":monsterKey});
		}
		
		/**
		 * 七夕节送玫瑰活动 
		 */	
		public var leftRoseNum:int = -1;
		public function getLeftRoseNum():void
		{
			this.sendXtMessage(cmdGetLeftVoteNum,{});
		}
		
		public function voteNpc(npcId:int):void
		{
			this.sendXtMessage(cmdVoteNpc, {"npc":npcId});
		}
		
		public function getVotes():void
		{
			this.sendXtMessage(cmdGetVotes, {});
		}
		
		/**
		 * 兑换稻草活动 
		 */		
		public function exchangeDaocao(giftId:int):void
		{
			this.sendXtMessage(cmdExchangeDaocao, {"id":giftId});
		}
		
		/**
		 * 多多卡编号礼物
		 */		
		public function changeDuoduoGift(pwd:String):void
		{
			this.sendXtMessage(cmdChangeDuoduoGift, {"pwd":pwd});
		}
		
		/**
		 * 朵朵西舞会海报宣传
		 */		
		public var danceClickNum:int = -1;
		public function getDanceClickNum():void
		{
			this.sendXtMessage(cmdGetDanceClickNum,{});
		}
		
		public function clickDance(clickUserName:String):void
		{
			this.sendXtMessage(cmdClickDance,{"cun":clickUserName});
		}
		
		public function getMidAutumnGift():void
		{
			this.sendXtMessage(cmdMidAutumnGift,{});
		}
		
		public function sendLastFightClown(id:int):void
		{
			this.sendXtMessage(cmdLogLastFightClown, {"id":id});
		}
		
		public function getLastFightClown():void
		{
			this.sendXtMessage(cmdGetLastFightClown, {});
		}
		
		/**
		 *  获取成熟的宠物礼品
		 */
		public function getXueLingMaturePetGift():void
		{
			this.sendXtMessage(cmdGetXueLingMaturePetGift,{});
		}
		
		/**
		 * 获取骑宠礼品 
		 */		
		public function getXueLingRidePetGift():void
		{
			this.sendXtMessage(cmdGetXueLingRidePetGift,{});
		}		

		/**
		 * 流失用户调研
		*/
		public function lostUserResearch(nSex:int,nAge:int,strData:String):void
		{
			this.sendXtMessage(cmdLostUserResearch, {"sex":nSex,"age":nAge,"opt":strData});
		}
		/**
		 * 常规用户调研
		 * 
		 * </br> int gender = (int) ao.getNumber("sex"); // 性别：男：0 女：1
       * </br> int age = (int) ao.getNumber("age"); // 年龄,第二版之后该参数没用了

       * </br> // 选择---
       * </br> // params: 问题No_答案Id,答案Id#问题No_答案Id,答案Id#问题No_答案Id,答案Id
       * </br> String options = (String) ao.getString("opt");

       * </br> // 建议（那种题目有一项选择是用户自由填写发挥的）
       * </br>  // params: 问题No_答案Id#问题No_答案Id#问题No_答案Id#问题No_答案Id
       * </br> String adviceIds = (String) ao.getString("id");

       * </br> // 对应上面的adviceIds，一一对应
       * </br> Object[] advices = ao.getArray("adv");

       * </br> // 该调研是否有效
       * </br> boolean valid = ao.getBool("valid");

       * </br> // 第几套题库
       * </br> int tao = (int) ao.getNumber("tao");
		 */
		public function userResearch(nSex:int,nAge:int,strData:String,strId:String,adv:Array,valid:Boolean=true,tao:int=1, callBack:Function=null):void
		{
			//this.sendXtMessage(cmdUserResearch, {"sex":nSex,"age":nAge,"opt":strData,"id":strId,"adv":adv, "valid":valid, "tao":tao});
			sendExtAndCallBack(cmdUserResearch, {"sex":nSex,"age":nAge,"opt":strData,"id":strId,"adv":adv, "valid":valid, "tao":tao}, callBack);
		}
		
		/**
		 * 宠物评选投票
		*/
		public function votePet( voteWeeklyId:int,voteData:String,isMale:Boolean):void
		{
			this.sendXtMessage(cmdVotePet,{"id":voteWeeklyId,"ids":voteData,"male":isMale});
		}
		/**
		 * 判断用户是否参加过当期的宠物评选 
		*/
		public function canVotePet( voteWeeklyId:int):void
		{
			this.sendXtMessage(cmdCanVotePet,{"id":voteWeeklyId});
		}
		
		/**
		 * 扣除金币,先在前端同步缓存
		 */
		public function decScore(decNum:int):void
		{
			if(decNum <= 0){
				return;
			}
			var myInfo:UserInfo = MainModelLocator.instance.retrieveModel(UserInfo) as UserInfo;
			if(myInfo.score <= decNum){
				myInfo.score = 0;
			}else{
				myInfo.score -= decNum;
			}
			this.sendXtMessage(cmdDecScore,{"dec":decNum});
		}
		
		/**
		 * 换南瓜灯和灯芯 
		 */		
		public function handleChangeLampwick():void
		{
			this.sendXtMessage(cmdHandleChangeLampwick,{});
		}
		
		/**
		 * 消耗一个灯芯
		 */		
		public function handleDetectLampwick():void
		{
			this.sendXtMessage(cmdHandleDetectLampwick,{});
		}
		
		/**
		 *小游戏奖励糖果 
		 * @param gameName 游戏名
		 * @param levelBonus 奖励糖果数量
		 */
		public function handleHalloweenGameBonus(gameName:String,levelBonus:int):void
		{
			this.sendXtMessage(cmdHandleHalloweenGameBonus,{"game":gameName, "num":levelBonus});
		}
		
		/**
		 * 小气鬼领取奖励 
		 * 
		 */		
		public function handleGetCheapskateBonus():void
		{
			this.sendXtMessage(cmdHandleGetCheapskateBonus,{"game":"HalloweenGhost"});
		}
		
		/**
		 * 胆小鬼领取奖励 
		 * @param type 1为不扣金币 2为扣金币
		 * 
		 */		
		public function handleGetCravenGhostBonus(type:int):void
		{
			this.sendXtMessage(cmdHandleGetCravenGhostBonus,{"game":"HalloweenGhost","t":type});
		}
		
		/**
		 * 万圣节开启南瓜宝箱
		 */		
		public function openWanChest(boxType:int):void
		{
			this.sendXtMessage(cmdOpenChest,{"t":boxType});
		}
		
		/**
		 * 感恩节加虫子 
		 * @param num
		 * 
		 */		
		public function handleIncWorm(num:int):void
		{
			this.sendXtMessage(cmdHandleIncWorm,{"num":num});
		}
		
		/**
		 * 感恩节获取每天已经领取的状态 
		 * 
		 */		
		public function handleGetThanksgivingDayTimes():void
		{
			this.sendXtMessage(cmdHandleGetThanksgivingDayTimes,{});
		}
		
		/**
		 * 感恩节领取礼包 
		 * 
		 */		
		public function handleGetThanksgivingDayGift():void
		{
			this.sendXtMessage(cmdHandleGetThanksgivingDayGift,{});
		}
		
		/**
		 * 感恩节 特价商品
		 * @param type 商品类型
		 * @param id 物品id
		 * @param num 购买数量
		 * 
		 *  @author hanjun
		 * */
		public function handleSellItemHalfPrice(type:int,id:int,num:int):void
		{
			this.sendXtMessage(cmdHandleSellItemHalfPrice,{"type":type,"id":id,"num":num});
		}
		/**
		 * 感恩节 购买礼包
		 * @author hanjun
		 * 
		 * @param id 礼包编号
		 * */
		public function handleBuyThanksgivingDayGift(id:int):void
		{
			this.sendXtMessage(cmdHandleBuyThanksgivingDayGift,{"id":id});
		}
		/**
		 * 感恩节 获取礼包已经购买的次数
		 * @author hanjun
		 * */
//		public function handleGetBuyGiftTimes():void
//		{
//			this.sendXtMessage(cmdHandleGetBuyGiftTimes,{});
//		}
		
		/**
		 * 场景交互奖励 
		 * @param id 奖励配置ID SceneBonusTypes
		 * 
		 */		
		public function handleGetSceneBonus(id:int):void
		{
			this.sendXtMessage(cmdHandleGetSceneBonus,{"id":id});
		}
		
		/***
		 * 获取宠物评选结果
		 * */
		public function handleGetPetVoteViews():void
		{
			this.sendXtMessage(cmdhandleGetPetVoteViews,{});
		}
			
		/***
		 * 神灯许愿
		 * */
		public function handleWishingLamp():void
		{
			this.sendXtMessage(cmdWishingLamp,{});
		}
		/***
		 * 神灯许愿次数,今天是否许愿
		 * */
		public function handleGetWishingLampTimes():void
		{
			this.sendXtMessage(cmdGetWishingLampTimes,{});
		}
		/***
		 * 领取悠悠蛋?
		 * */
		public function handleTakeEgg():void
		{
			this.sendXtMessage(cmdTakeEgg,{});
		}
		
		/**
		 * 寒假冲级数据
		 */		
		public function handleGetUserActiveTime():void
		{
			this.sendXtMessage(cmdWinterGetUserActiveTime,{});
		}
		/**
		 * 寒假冲级奖励
		 * @param giftNum 奖励类型
		 */		
		public function handletakeBonus(giftNum:int):void
		{
			this.sendXtMessage(cmdWinterTakeBonus,{"i":giftNum});
		}
		
		/**
		 * 新年兑换
		 * @param giftId 礼物ID
		 */		
		public function handleTransNewYearBonus(giftId:int):void
		{
			this.sendXtMessage(CMD_NEWYEAR_TRANS,{"id":giftId});
		}
		
		public function takeYearBeastBonus():void
		{
			this.sendXtMessage(cmdTakeYearBeastBonus,{});
		}
		
		public function setDailyCache(key:String, value:String):void
		{
			this.sendXtMessage(CMD_SET_DAILY_CACHE, {"key":key, "value":value});
		}
		
		public function getDailyCache(key:String):void
		{
			this.sendXtMessage(CMD_GET_DAILY_CACHE, {"key":key});
		}
		/**
		 * 使用战宠宠物袋 
		 * @param id
		 * 
		 */		
		public function useBattlePetBag(id:int):void
		{
			this.sendXtMessage(CMD_USE_BAG_ADD_BATTLE_PET,{"iid":id});
		}
		
		/**
		 * 增加原味巧克力
		 * @return ret
		 */		
		public function addOriChocolate(num:int):void
		{
			sendXtMessage(CMD_ADD_ORICHOCOLATE, {"num":num});
		}
		
		/**
		 * 赠送好友原味巧克力 
		 * @retuen ret
		 */		
		public function sendOtherChocolate(userName:String, num:int):void
		{
			sendXtMessage(CMD_SEND_OTHER_CHOCOLATE, {"un":userName, "num":num});
		}
		
		/**
		 * 查看好友可送原味巧克力数量
		 * @return c 数量
		 */		
		public function getCanSendChocolateNum(userName:String):void
		{
			sendXtMessage(CMD_GET_CAN_SEND_CHOCOLATE_NUM, {"un":userName});
		}
		
		/**
		 * 建造巧克力屋
		 * @return suc
		 */		
		public function buildChocolateHouse():void
		{
			sendXtMessage(CMD_BUILD_CHOCOLATE_HOUSE, {});
		}
		
		/**
		 * 获取巧克力屋
		 * @return suc
		 */		
		public function getChocolateHouse():void
		{
			sendXtMessage(CMD_GET_CHOCOLATE_HOUSE, {});
		}
		
		/**
		 * 获得自己的巧克力信息
		 * @return "oric":原味巧克力数量;"thickc":浓情巧克力数量;"rec":收到的浓情巧克力数量
		 */		
		public function getMyChocolateData():void
		{
			sendXtMessage(CMD_GET_MY_CHOCOLATE_DATA, {});
		}
		
		public function getMyHouseBuildDays():void
		{
			sendXtMessage(CMD_GET_BUILD_HOUSE_DAYS, {});
		}
		
		/**
		 * 前端缓存部分用户热点活动数据(主动获取) --- 已停止更新
		 * */
		public function getUserTempProp():void
		{
			sendXtMessage(CMD_GET_USER_TEMP_PROP,{});
		}
		
		/**
		 * 站台子
		 */		
		public function handleStandPlatform(p:int):void
		{
			sendXtMessage(CMD_AGGREGATION_STAND_PLATFORM, {"p":p});
		}
		
		/**
		 * 离开台子
		 */		
		public function handelLeavePlatform():void
		{
			sendXtMessage(CMD_AGGREGATION_LEAVE_PLATFORM, {});
		}
		
		/**
		 * 获得站台子的玩家
		 */		
		public function getPlatformUser():void
		{
			sendXtMessage(CMD_AGGREGATION_GET_PLATFORMUSER, {});
		}
		
		/**
		 * 获得站台子玩家数量
		 */		
		public function getPlatformUserCount():void
		{
			sendXtMessage(CMD_AGGREGATION_GET_USERCOUNT, {});
		}
		
		/** 奥雅特使集结号 2012年2月14日 **///从InviteCodeClient临时移过来的，两周运营活动 
		public function tempTakeInvitesState():void
		{
			sendXtMessage(TEMPTAKEINVITESTATE, {});
		}
		public function tempTakeInviteBonus():void
		{
			sendXtMessage(TEMPTAKEINVITEBONUS, {});
		}
		
		public function takeMolyBonus(id:int, sg:int, sc:int):void
		{
			sendXtMessage(TAKE_MOLY_BONUS, {"t":id, "sg":sg, "sc":sc});
		}
		
		public function molyBonusGotToday():void
		{
			sendXtMessage(MOLY_BONUS_GOT_TODAY, {});
		}
		
		// 神羽骑士号召令
		/**神羽骑士号召令 —— 提交邀请码**/
		public function submitInviteCode(ddid:int):void
		{
			var ddidStr:String = ddid.toString();
			sendXtMessage(CMD_SUBMIT_INVITE_CODE, {"ddid":ddidStr});
		}
		/**神羽骑士号召令 —— 领取奖励 **/
		public function takeInviteMemberBonus():void
		{
			sendXtMessage(CMD_TAKE_INVITE_MEMBER_BONUS, {});
		}
		/**神羽骑士号召令  —— 发消息邀请 **/
		public function sendInviteMsg():void
		{
			sendXtMessage(CMD_SEND_INVITE_MEMBER_MSG, {});
		}
		/**神羽骑士号召令  —— 多少人被你邀请成为VIP,是否可以领取奖励，是否已领取奖励 **/
		public function getInviteState():void
		{
			sendXtMessage(CMD_GET_INVITE_MEMBER_STATE, {});
		}
		
		/**缘分塔罗牌  —— 站台子 **/
		public function standonStage(id:int):void
		{
			sendXtMessage(CMD_STANDON_STAGE, {"p":id});
		}
		/**缘分塔罗牌  —— 离开台子 **/
		public function leaveStage():void
		{
			sendXtMessage(CMD_LEAVE_STAGE, {});
		}
		/**缘分塔罗牌  —— user in 台子上 **/
		public function takeStageUser():void
		{
			sendXtMessage(CMD_TAKE_STAGE_USER, {});
		}
		
		public function getFturntableBonus():void
		{
			sendXtMessage(CMD_TAKE_FTURNTABLE_BONUS, {});
		}
		
		public function getFturnatableTimes():void
		{
			sendXtMessage(CMD_TAKE_LEFT_FTURNTABLE_TIMES, {});
		}
		
		/*** 商城消费增加VIP成长值活动 经验值 ****/
		public function getTempVipExpInc():void
		{
			sendXtMessage(CMD_GET_TEMP_VIPEXP_INC, {});
		}
		
		public function getCommonGift(key:String):void
		{
			sendXtMessage(CMD_COMMON_TEMP, {"key":key});
		}
		
		public function takeGameItem(gameName:String):void
		{
			sendXtMessage(CMD_TAKE_GAME_TEMPITEM, {"game":gameName});
		}
		public function takeKingBonues(items:String):void
		{
			sendXtMessage(CMD_TAKE_KING_BONUS, {"items":items});
		}
		public function getKingState():void
		{
			sendXtMessage(CMD_GET_TEMP_KING_STATE, {});
		}
		/** 获取 当天完成‘领主夺宝记’的次数 **/
		public function getLairdTodayDoneCount():void
		{
			sendXtMessage(CMD_GET_LAIRD_TODAY_DONECOUNT, {});
		}
		/** 获取 ‘领主夺宝记’的奖励 **/
		public function takeLairdBonus():void
		{
			sendXtMessage(CMD_TAKE_LAIRD_BONUS, {});
		}
		
		/**  获取前端缓存部分用户热点活动数据(全部) new 2012年3月31日 **/
		public function getUserCommunityData():void
		{
			sendXtMessage(CMD_GET_TEMP_PROP_INTS, {});
		}
		
		public function getEQState():void
		{
			sendXtMessage(CMD_GET_EQ_STATE, {});
		}
		
		public function takeTodayDoTimes(key:String):void
		{
			sendXtMessage(TAKE_TODAY_DO_TIMES, {"key":key});
		}
		
		public function takeYinZhiLiBonus(soulgold:int, score:int, yinNum:int):void
		{
			sendXtMessage(TAKE_YINYANGSHI_SHILIAN_BONUS, {"ag":soulgold, "s":score, "yin":yinNum});
		}
		
		public function takeKafuBonus(pwd:String):void
		{
			sendXtMessage(CMD_TAKE_KAFU_BONUS, {"pwd":pwd});
		}
		
		/**
		 *母亲节送花 
		 * @param flowerId
		 * @param num
		 */		
		public function sendFlowerToTree(flowerId:int, num:int):void
		{
			this.sendXtMessage(CMD_SEND_FLOWER_TO_TREE,{"fid":flowerId,"num":num});
		}
		
		/**
		 *获取母亲树魅力值 
		 */		
		public function getTreeCharm():void
		{
			this.sendXtMessage(CMD_GET_TREE_CHARM,{});
		}
		
		/**
		 * 母亲节祝福
		 * @param type =1 祝福语， =2画画
		 * @param c 内容
		 */		
		public function blessMother(type:int, c:String):void
		{
			this.sendXtMessage(CMD_BLESS_MONTHER,{"t":type,"c":c});
		}
				
		/**
		 *获取母亲节祝福 
		 */		
		public function getBlessMsg():void
		{
			this.sendXtMessage(CMD_GET_BLESS_MSG,{});
		}
		
		/**
		 *  活动-幸运粽子礼包 -拿信息
		 */		
		public function getVisithouseInfo(userName:String):void
		{
			this.sendXtMessage(CMD_GET_VISITHOUSE_INFO,{"un":userName});
		}
		/**
		 *  活动-幸运粽子礼包-拿奖励
		 */		
		public function takeVistihouseGift(userName:String):void
		{
			this.sendXtMessage(CMD_TAKE_VISTIHOUSE_GIFT,{"un":userName});
		}
		
		
		/**
		 * @param keys keys = type+"_"+key+"_"+target;多个时用分号隔开，具体命名看后台。
		 */		
		public function getMcCount(keys:String):void
		{
			this.sendXtMessage(CMD_GET_MC_COUNT,{"keys":keys});
		}
		
		public function getTimeMc(key:String):void
		{
			this.sendXtMessage(CMD_GET_TIME_START_FROM_MC, {"key":key});
		}
		
		public function getBattlePartyGift():void
		{
			this.sendXtMessage(CMD_BATTLE_PARTY_TAKEGIFT, {});
		}
		
		public function getNinjaRenShuBonus(aoguang:int, score:int):void
		{
			sendXtMessage(CMD_TEMP_NINJA_SHILIAN_BONUS, {"ag":aoguang, "s":score});
		}
		
		public function createSBYunyingBattle():void
		{
			
		}
		
		//***********************周年庆大筹备*******************//
		public function blessAoYa(content:String):void
		{
			this.sendXtMessage(CMD_BLESS_AOYA, {"c":content});
		}
		
		public function getBlessAoYaData():void
		{
			this.sendXtMessage(CMD_GET_BLESS_AOYA, {});
		}
		//***********************周年庆大筹备*******************//
		
		//暑期神羽骑士召集令
		public function sendInviteMsg2():void
		{
			this.sendXtMessage(CMD_TEMP_SEND_INVITE_MSG, {});
		}
		
		public function fillinInviteCode(ddid:String):void
		{
			this.sendXtMessage(CMD_TEMP_FILLIN_INVITE_CODE, {"ddid":ddid});
		}
		
		public function takeInviteBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_INVITE_BONUS, {});
		}
		
		public function killShadowTempleMonsterByMoney(bossIndex:int, phase:int):void
		{
			this.sendXtMessage(CMD_KILL_SHADOW_TEMPLE_MONSTER_BY_MONEY, {"monster":bossIndex, "phase":phase});
		}
				
		public function joinMagicHouse():void
		{
			this.sendXtMessage(CMD_TEMP_JOIN_MAGICHOUSE, {});
		}
		public function takeMagicHouse(isTakeBonus:Boolean):void
		{
			this.sendXtMessage(CMD_TAKE_MAGICHOUSE_BONUS, {"it":isTakeBonus});
		}
		public function clearMagicHouseCd():void
		{
			this.sendXtMessage(CMD_CLEAR_MAGICHOUSE_CD,{});
		}
		
		public function takeXiaoYaWishBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_XIAOYAWISH_BONUS,{});
		}
		
		public function startPackageFlower():void
		{
			this.sendXtMessage(CMD_TEMP_START_PACKAGEFLOWER,{});
		}
		public function takePackageFlowerBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_PACKAGEFLOWER_BONUS,{});
		}
		
		public function finishLovePromisePhase(phase:int):void
		{
			this.sendXtMessage(CMD_TEMP_FINISH_LOVEPROMISE_PHASE,{"phase":phase});
		}
		
		public function getMusicStageData():void
		{
			this.sendXtMessage(CMD_TEMP_GET_MUSIC_STAGE,{});
		}
		
		public function setMusicStageIn(index:int):void
		{
			this.sendXtMessage(CMD_TEMP_STAND_ON_MUSIC_STAGE,{"index":index});
		}
		
		public function setMusicStageOut():void
		{
			this.sendXtMessage(CMD_TEMP_LEAVE_MUSIC_STAGE,{});
		}
		
		public function sendMagpieWater(num:int):void
		{
			this.sendXtMessage(CMD_MAGPIE_SEND_WATER,{"num":num});
		}
		public function takeMagpieSeed():void
		{
			this.sendXtMessage(CMD_MAGPIE_TAKE_SEED,{});
		}
		
		public function getDanceParty2Bonus(isWin:Boolean):void
		{
			this.sendXtMessage(CMD_GET_DANCEPARTY2_BONUS,{"iswin":isWin});
		}
		
		//鹊桥连珠
		public function takeMagpieLinkBonus(lv:int):void
		{
			this.sendXtMessage(CMD_TAKE_MAGBRILINKBEAD_BONUS,{"lv":lv});
		}
		
		public function hitDrum(userName:String):void
		{
			this.sendXtMessage(CMD_HIT_DRUM,{"un":userName});
		}
		
		public function finishBBQ(score:int, demandNum:String):void
		{
			this.sendXtMessage(CMD_TEMP_BBQ_BONUS, {"score":score, "dn":demandNum});
		}
		
		public function getAirGunShootGift(soulGold:int, ticket:int):void{
			this.sendXtMessage(CMD_TEMP_GET_SHOOTINT_BONUS, {"ag":soulGold, "yznum":ticket});
		}
		
		/**
		 * 	获取新充值月份数目，
		 * 左闭右开[startDate, endDate),"2012-12-21" 
		 * 后端返回为：res.putInt("months", months);
		 * 
		 * @param startDate [开始日期
		 * @param endDate 结束日期) 
		 */			
		public function getUserIncVipMonths(startDate:String, endDate:String):void
		{
			this.sendXtMessage(CMD_GET_USER_INCVIPMONTHS,{"sd":startDate, "ed":endDate});
		}
				
		//加人偶好感度
		public function incNpcFavor(id:int, inc:int, ext:String = ""):void
		{
			this.sendXtMessage(CMD_TEMP_INC_NPCFAVOR,{"id":id,"inc":inc,"ext":ext});
		}
		
		//获取宠物回归人气数
		public function getPetBackVotes():void
		{
			this.sendXtMessage(CMD_TEMP_GET_BATTLEPET_VOTE, {});
		}
		
		//支持某只回归宠物
		public function sponsorBackPet(petId:int):void
		{
			this.sendXtMessage(CMD_TEMP_CHOOSEBATTLEPET, {"pid":petId});
		}
		
		//给支持的回归宠物送一朵花
		public function sendFlowerToPet(flowerId:int):void
		{
			this.sendXtMessage(CMD_TEMP_SENDFLOWER_BATTLEPET ,{"fid":flowerId});
		}
		
		//神秘的人偶师。
		public function incDollVote(count:int):void
		{
			this.sendXtMessage(CMD_TEMP_INC_DOLL_VOTE,{"inc":count});
		}
				
		public function getReturnPetState():void
		{
			this.sendXtMessage(CMD_GET_RETURN_BATTLE_PET_STATE,{});
		}
		public function takeMaxVotePet():void
		{
			this.sendXtMessage(CMD_TAKE_MAX_VOTE_BATTLE_PET,{});
		}
		
		public function getVipMonths():void
		{
			this.sendXtMessage(CMD_TEMP_GET_USER_RECHARGEORRENEWMONTHS, {});
		}	
		
		public function takeVipGift2012Oct(index:int, ext:int):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_VIP_BACK_BONUS, {"index":index, "ext":ext});
		}
		
		public function takeVipExtraGift2012Oct(index:int, ext:int):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_VIP_BACK_EXT_BONUS, {"index":index, "ext":ext});
		}
		
		//心灵通道
		public function takeHeartRoadBonus(index:int):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_HEARROAD_BONUS,{"index":index});
		}
		
		//完成阶段性活动
		public function setPhasedActivityDone(activityId:int):void
		{
			this.sendXtMessage(CMD_TEMP_FINISH_PHASE_ACTIVITY, {"stepid":activityId});
		}
		
		public function get2012HallowmasBadge():void
		{
			this.sendXtMessage(CMD_TEMP_GET_2012_HALLOWMAS_BADGE, {});
		}
		
		//绘画特训s
		public function finishDrawTraining(tid:int):void
		{
			this.sendXtMessage(CMD_TEMP_FINISH_DRAW_TRAINING,{"tid":tid});
		}
		
		/**
		 * 鲜花加工厂兑换
		 * @param plantId 消耗物品的Id
		 * @param num 获得物品的数量
		 * 
		 */		
		public function handleGardenExchange(plantId:int, num:int):void
		{
			this.sendXtMessage(CMD_TEMP_GARDEN_EXCHANGE, {"id":plantId, "num":num});
		}
		
		public function takeLuoqiCollectBonus(agNumber:int,isWin:Boolean):void
		{
			this.sendXtMessage(CMD_TEMP_LUOQI_COLLECTION ,{"ag":agNumber,"iw":isWin});
		}
		
		//战宠训练 速成
		public function onTrainBattlePet(upid:int):void
		{
			this.sendXtMessage(CMD_TRAIN_BATTLE_PET,{"upid":upid});
		}
		public function onBuyTrainTime():void
		{
			this.sendXtMessage(CMD_BUY_TRAIN_TIME, {});
		}
		public function onClearTrainPetCD():void
		{
			this.sendXtMessage(CMD_CLEAR_TRAIN_PET_CD, {});
		}
		
		/**
		 * 家园大赛投票 
		 * @param vids 形式如"1,2,5,6"
		 */		
		public function voteHouseComp(vids:String):void
		{
			this.sendXtMessage(CMD_TEMP_HOUSE_VOTE, {"vids":vids});
		}
		
		/**
		 * 感恩节打折活动
		 */		
		public function getThanksgivingShopItemDiscount():void
		{
			this.sendXtMessage(CMD_TEMP_THANKSGIVING_SHOPITEM_DISCOUNT,{});
		}
		
		/**
		 * 加绝版之梦宣传抽奖机会 
		 * 
		 */		
		public function incLotteryChance():void
		{
			this.sendXtMessage(CMD_TEMP_INC_LOTTERY_CHANCE, {});
		}
		/**
		 * 绝版之梦宣传进行抽奖 
		 * 
		 */		
		public function takeLotteryBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_LOTTERY_BONUS, {});
		}
				
		public function takeVoteProfession(votes:String):void
		{
			this.sendXtMessage(CMD_TEMP_VOTE_PROFESSION, {"votes":votes});
		}
		
		public function getVoteProfessionInfo():void
		{
			this.sendXtMessage(CMD_TEMP_VIEW_PROFESSION_VOTE, {});
		}
		
		
		// 绝版宠物召唤
		public function takeCardState():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_TURN_CARD_STATE,{});
		}
		
		public function turnAllCard():void
		{
			this.sendXtMessage(CMD_TEMP_TURN_ALL_CARD,{});
		}
		
		public function trunSomeCard(cards:String):void
		{
			this.sendXtMessage(CMD_TEMP_TURN_SOME_CARD,{"cids":cards});
		}
		
		public function takeTurnBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_TURN_CARD_BOUS,{});
		}
		
		/**
		 * 绝版家具完成交互领家具卷 
		 * @param num 
		 * 
		 */		
		public function takeFurTicket(num:int):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_FUR_TICKET, {"num":num});
		}		
		
		//寒假召集令		
		public function takeRecallBonus(ddid:String):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_RECALLED_BONUS, {"ddid":ddid});
		}
		public function takeRecallBuddyBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_RECALL_BUDDY_BONUS, {});
		}
		public function take2013WvNewbieBonus():void
		{
			this.sendXtMessage(CMD_TEMP_2013_WV_NEWBIE_BONUS,{});
		}
		public function take20130110BackBonus():void
		{
			this.sendXtMessage(CMD_TEMP_20130110_BACK_BONUS,{});
		}
		
		/**
		 * 羽贝抽奖
		 */		
		public function exchangeYuBeiLoteryBonus():void
		{
			this.sendXtMessage(CMD_TEMP_EXCHANGE_YUBEI_LOTTERY_BONUS,{});
		}
		
		
		//时光机
		public function getTimeMachineState():void
		{
			this.sendXtMessage(CMD_TEMP_GET_TIME_MACHINE_STATE,{});
		}
		
		public function RefreshTimeMachine():void
		{
			this.sendXtMessage(CMD_TEMP_REFRESH_TIME_MACHINE,{});
		}
		
		public function setMachineMonth(il:Boolean):void
		{
			this.sendXtMessage(CMD_TEMP_SET_MACHINE_MONTH,{"il":il});
		}
		
		public function setMachineSex(il:Boolean):void
		{
			this.sendXtMessage(CMD_TEMP_SET_MACHINE_SEX,{"il":il});
		}
		
		public function takeTimeMachineBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_TIME_MACHINE_BONUS,{});
		}
		
		//幸福青鸟
		public function feedBird(fid:int, num:int):void
		{
			this.sendXtMessage(CMD_TEMP_FEED_BIRD,{"fid":fid, "num":num});
		}
		
		public function takeFeedBirdBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_FEED_BIRD_BONUS,{});
		}
		
		public function takeYearMenberLimitGiftBonus():void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_YEAMMEMBER_GIFT130118,{});
		}

		public function voteKnight():void
		{
			this.sendXtMessage(CMD_VOTE_KNIGHT,{});
		}
		public function getVoteKnightNumber():void
		{
			this.sendXtMessage(CMD_VIEW_KNIGHT_VOTE,{});
		}
		public function takeVoteKnightBonus(id:int):void
		{
			this.sendXtMessage(CMD_TAKE_VOTE_BONUS,{"id":id});
		}
		
		/** 输入牙牙乐欢乐密码的 **/
		public function takeYayaleFuncardGift(pwd:String,type:int):void
		{
			this.sendXtMessage(CMD_TAKE_FUNCARD_GIFT,{"pwd":pwd,"type":type});
		}
		
		public function takeStoneExchange(id:int,num:int=1):void
		{
			this.sendXtMessage(CMD_TEMP_STONE_EXCHANGE,{"id":id,"num":num});
		}
		
		//夜赫的踪迹
		public function findCluegetTodayDoneCount():void
		{
			this.sendXtMessage(CMD_TEMP_FINDCLUE_GETTODAYDONECOUNT,{});
		}
		public function fineClueIncreaSetTodayDoneCount(sceneId:int):void
		{
			this.sendXtMessage(CMD_TEMP_FINDCLUE_INCREASETODAYDONECOUNT,{"sceneId":sceneId});
		}
		public function fineClueGetBonus(num:int):void
		{
			this.sendXtMessage(CMD_TEMP_FINDCLUE_DRAWBONUS,{"bonusLv":num});
		}
		
		//大小姐的果茶
		public function dxjLvUpPet(petId:int):void
		{
			this.sendXtMessage(CMD_TEMP_DXJ_LVUP_ORI_BATTLEPET,{"ubpid":petId});
		}
		/**
		 * 波利大冒险拿奖励 
		 * 
		 */		
		public function takeBoliTestGift():void	
		{
			this.sendXtMessage(CMD_TEMP_BOLITEST_TAKE_BONUS, {});
		}
		
		
		//战宠超进化挖矿
		public function takeSuperVooreBonuse(type:int, score:int):void
		{
			this.sendXtMessage(CMD_TEMP_TAKE_SUPEVOORE_BONUS,{"t":type,"num":score});
		}
		
		//游戏王兑换红包
		public function takeKinggameHongbao(num:int):void
		{
			this.sendXtMessage(CMD_TEMP_GAME_KING_EXCHANGE,{"num":num});
		}
		
		//闹花灯送花
		public function naoHuaDengSongHua(name:String, id:int):void
		{
			this.sendXtMessage(CMD_TEMP_2013_YXFL_SF,{"buddy":name,"gfid":id});
		}
		
		//元宵大侠挑战抽奖
		public function takeYuanxiaodaxiaRollGift():void
		{
			this.sendXtMessage(CMD_TEMP_PASS_YEAR_EGG_BATTLE_RAFFLE,{});
		}
		
		//摘绣球花奖励
		public function takeHoleGardenFloweerBonus(num:int,ext:String):void
		{
			this.sendXtMessage(CMD_TAKE_HOLE_GARDENFLOWER_BONUS,{"num":num,"ext":ext});
		}
		
		public function takeAncientryBonus(type:int,strChoice:String):void
		{
			sendXtMessage(CMD_TAKE_ANCIENTRY_BONUS,{"t":type,"c":strChoice});
		}
		
		public function takeWakeFlowerBonus(num:int):void
		{
			sendXtMessage(CMD_SETTLE_WAKE_FLOWER_BONUS,{"num":num});
		}
		
		public function takeClothVoteBonus(type:int,index:int):void
		{
			sendXtMessage(CMD_VOTE_61_CLOTHES,{"type":type,"v":index});
		}
		
		public function sendGardenFlowerWindmill(fid:int, num:int):void
		{
			this.sendXtMessage(CMD_SEND_GARDENFLOWER_WINDMILL,{"gfid":fid, "num":num});
		}
		
		public function takeHuanYingLght(num:int):void
		{
			this.sendXtMessage(CMD_TAKE_HUANYINGLIGHT_BONUS,{"num":num});
		}
		
		public function takeHistoryTopNo1Bonus():void
		{
			this.sendXtMessage(CMD_TAKE_HISTORY_TOPNO1_BONUS,{});
		}
			
		public function buyCandyQueenHolyGuard(index:int):void
		{
			this.sendXtMessage(CMD_CANDY_QUEEN_HOLY_GUARD,{"id":index});
		}
		
		public function takeProfessionTestResult(proId:int):void
		{
			this.sendXtMessage(CMD_PROFESSION_CHARACTOR_TEST,{"pId":proId});
		}
		
		public function takePictureBonus(xxPic:int,shzPic:int,hllPic:int):void
		{
			this.sendXtMessage(CMD_XIAOXIAO_LOVE_TAKINGPHOTOS,{"xx":xxPic,"gd":shzPic,"lhh":hllPic});
		}
		
		public function takeMagicSquareBonus(rock:int):void
		{
			this.sendXtMessage(CMD_LIGHT_ARRAY_BONUS,{"pc":rock});
		}
		
		public function clearMagicSquareCD():void
		{
			this.sendXtMessage(CMD_LIGHT_ARRAY_CLEARCD,{});
		}
		
		public function clearPrincessEvolveCD():void
		{
			this.sendXtMessage(CMD_SILVER_CRYSTAL_QUICKSTART,{});
		}
		
		public function princessEvolve(petId:int):void
		{
			this.sendXtMessage(CMD_SILVER_CRYSTAL_SUPEREVO,{"userpetid":petId});
		}
		
		public function vipClothesCollect(index:int):void
		{
			this.sendXtMessage(CMD_VIP_SUIT_COLLECTION,{"index":index});
		}
		
		public function wingUnite(key:int):void
		{
			this.sendXtMessage(CMD_WINGS3_MERGE,{"key":key});
		}
		
		
		public function takeDoubleEggsGift():void{
			sendXtMessage(CMD_TAKE_DOUBLE_DAN_GIFT,{});
		}
		
		public function sendGodGuess(index:int):void
		{
			sendXtMessage(CMD_CHINESEDEITY_CLICK,{"index":index});
		}
		
		/**
		 *	领取神羽首充奖励 
		 * @param bId 1-3，对应三个面板，衣服的、房子的、骑宠的
		 * @param sId 对应配置里的顺序,从1开始
		 */		
		public function shenYuFirstOpenBonus(bId:int,sId:int):void{
			this.sendXtMessage(CMD_SHENYU_FIRSTOPEN_BONUS,{"bigId":bId,"smallId":sId});
		}
		
		public function getBeatCushawRestValue():void{
			this.sendXtMessage(CMD_PULLOUT_PUMPKINLIGHT_GETINFO,{});
		}		
		public function gainCushaw(count:int):void{
			this.sendXtMessage(CMD_PULLOUT_PUMPKINLIGHT_SETTLE,{"count":count});
		}
		public function buyCushawRest(num:int):void{
			this.sendXtMessage(CMD_PULLOUT_PUMPKINLIGHT_BUYTIME,{"num":num});
		}
		
		
		
		
		//********************************************
		/**
		 * 	获取新充值月份数目，
		 * 左闭右开[startDate, endDate),"2012-12-21" 
		 * 后端返回为：res.putInt("months", months);
		 * 
		 * @param startDate [开始日期
		 * @param endDate 结束日期) 
		 * @param callBack 回调函数，参数为params:Object
		 */		
		public function getUserIncVipMonthsCallBack(startDate:String, endDate:String,callBack:Function):void
		{
			this.sendExtAndCallBack(CMD_GET_USER_INCVIPMONTHS,{"sd":startDate, "ed":endDate},callBack);
		}
		/**
		 * @param key请咨询后台哥
		 * retrun key, ret为奖励的index（从0开始）
		 */
		public function takeLotterBonus(key:String):void
		{
			this.sendXtMessage(CMD_TAKE_LOTTER_BONUS,{"key":key});
		}
		
		/**
		 * 批量取tempRropString
		 * @param keys 包含批量要取的KEY
		 * @param callBack 参数返回"values"为需要取的KEY的值的数组
		 * 
		 */		
		public function getMultiTempPropStringAndCallBack(keys:Array, callBack:Function):void{
			this.sendExtAndCallBack(CMD_GET_MULTI_TEMPPROPSTRINGS,{"keys":keys}, callBack);
		}
		//**********************************************
	}
}