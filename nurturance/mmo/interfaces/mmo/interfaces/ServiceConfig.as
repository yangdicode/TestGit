package mmo.interfaces {
	import flash.events.EventDispatcher;
	
	import mmo.interfaces.activity.IActivityService;
	import mmo.interfaces.agtask.IAGTaskService;
	import mmo.interfaces.aoyabattle.IAoyaBattleService;
	import mmo.interfaces.aoyacircle.IAoYaCircleService;
	import mmo.interfaces.aoyadesign.IAoYaDesignService;
	import mmo.interfaces.aoyashare.IAoYaShareService;
	import mmo.interfaces.aoyatv.IAoYaTVService;
	import mmo.interfaces.arena.IArenaService;
	import mmo.interfaces.auction.IAuction;
	import mmo.interfaces.band.IBandService;
	import mmo.interfaces.battle.IBattleService;
	import mmo.interfaces.battle.IWildMonsterService;
	import mmo.interfaces.battleinforpanel.IBattleInfoPanelService;
	import mmo.interfaces.buddy.IBuddyDocService;
	import mmo.interfaces.buddy.IBuddyListService;
	import mmo.interfaces.bugle.IBugleService;
	import mmo.interfaces.candycrush.ICandyCrushService;
	import mmo.interfaces.card.ICardSkillService;
	import mmo.interfaces.cardmap.ICardMapService;
	import mmo.interfaces.chanelmarket.IChanelMarketService;
	import mmo.interfaces.closefriend.ICloseFriendService;
	import mmo.interfaces.clothbook.IClothBookService;
	import mmo.interfaces.clothesdesign.IClothesDesignService;
	import mmo.interfaces.collegecraft.ICollegeCraftService;
	import mmo.interfaces.collegeprefession.ICollegeProfessionService;
	import mmo.interfaces.community.ICommunityService;
	import mmo.interfaces.control.IControlBarService;
	import mmo.interfaces.control.ITeamControlBarService;
	import mmo.interfaces.course.ICourseService;
	import mmo.interfaces.divinebless.IDivineBlessService;
	import mmo.interfaces.dreamcard.IDreamCardService;
	import mmo.interfaces.dressmaster.IDressMasterService;
	import mmo.interfaces.fairy.IFairyService;
	import mmo.interfaces.fairybattle.IFairyBattleService;
	import mmo.interfaces.fashionstar.IFashionStarService;
	import mmo.interfaces.fbservice.IFBService;
	import mmo.interfaces.flower.IFlowerService;
	import mmo.interfaces.foundation.IFoundationService;
	import mmo.interfaces.garden.IGardenService;
	import mmo.interfaces.garden.gardenplant.IGardenPlantService;
	import mmo.interfaces.garden.gardenui.IGardenControlBar;
	import mmo.interfaces.garden.gardenui.IGardenUIService;
	import mmo.interfaces.gather.IGatherService;
	import mmo.interfaces.halos.IHalosService;
	import mmo.interfaces.honor.IHonorService;
	import mmo.interfaces.house.IHouseService;
	import mmo.interfaces.innertv.IInnerTvService;
	import mmo.interfaces.invitecode.IInviteCodeService;
	import mmo.interfaces.jumpsoon.IJumpSoonService;
	import mmo.interfaces.magicfairytale.IMagicFairytaleService;
	import mmo.interfaces.mail.IMailService;
	import mmo.interfaces.map.IMapService;
	import mmo.interfaces.market.IMagicMakeUpService;
	import mmo.interfaces.market.IMarketPlusService;
	import mmo.interfaces.market.IMarketService;
	import mmo.interfaces.market.IRmbMarketService;
	import mmo.interfaces.materialschange.IMaterialsChangeService;
	import mmo.interfaces.menu.IMenuService;
	import mmo.interfaces.msgbox.IMsgBoxService;
	import mmo.interfaces.notify.INotifyService;
	import mmo.interfaces.notify.IOfflineMsgService;
	import mmo.interfaces.npcbattle.INpcBattleService;
	import mmo.interfaces.nuannuan.INuannuanService;
	import mmo.interfaces.nurturance.INurturanceService;
	import mmo.interfaces.palace.IPalaceService;
	import mmo.interfaces.party.IPartyService;
	import mmo.interfaces.pet.IPetService;
	import mmo.interfaces.petbreeding.IPetBreedingService;
	import mmo.interfaces.playroom.IPlayRoomService;
	import mmo.interfaces.poker.IPokerService;
	import mmo.interfaces.profession.IProfessionService;
	import mmo.interfaces.publicsale.IPublicSaleService;
	import mmo.interfaces.rangers.IRangersService;
	import mmo.interfaces.sell.ISellService;
	import mmo.interfaces.skill.buildskill.IBuildSkillService;
	import mmo.interfaces.skill.feedskill.IFeedSkillService;
	import mmo.interfaces.skill.tailorskill.ITailorSkillService;
	import mmo.interfaces.skyteamwar.ISkyTeamWarService;
	import mmo.interfaces.starlightbook.IStarLightBookService;
	import mmo.interfaces.supermarket.ISupermarketService;
	import mmo.interfaces.supermodel.ISuperModelService;
	import mmo.interfaces.superstar.ISuperStarService;
	import mmo.interfaces.sysgift.ISysGiftService;
	import mmo.interfaces.talk.ITalk;
	import mmo.interfaces.task.ITaskNpcService;
	import mmo.interfaces.task.ITaskPanel;
	import mmo.interfaces.task.ITaskService;
	import mmo.interfaces.task.ext.ITaskExtManager;
	import mmo.interfaces.tasktbranch.ITasktBranchService;
	import mmo.interfaces.tower.ITowerService;
	import mmo.interfaces.twingift.ITwinGiftService;
	import mmo.interfaces.union.IUnionService;
	import mmo.interfaces.usercard.IUserCardService;
	import mmo.interfaces.vip.IVipPanelService;
	import mmo.interfaces.viyacard.IViYaCardService;
	import mmo.interfaces.wondernuan.IWonderNuanService;

	/**
	 * service配置
	 * */
	public class ServiceConfig extends EventDispatcher {
		public static var services:Array=[						
			//离线消息
			new ServiceInfo("OfflineMsgService"
				, IOfflineMsgService, "mmo.offlinemsg.OfflineMsgService", "notify/notify", "mmo.offlinemsg.OfflineMsgService"),
			new ServiceInfo("NotifyService"
				, INotifyService, "mmo.notify.NotifyService", "notify/notify", "mmo.notify.NotifyService"),
			new ServiceInfo("NotifyView"
				, IInitService, "mmo.notifyview.NotifyView", "notify/notifyview", "mmo.interfaces.SingleLocator"),
			// 好友
			new ServiceInfo("BuddyDocService"
				, IBuddyDocService, "mmo.buddylist.buddydoc.BuddyDocService", "buddylist/buddydoc", "mmo.buddylist.buddydoc.BuddyDocServiceLocator"),
			new ServiceInfo("BuddyListService"
				, IBuddyListService, "mmo.buddylist.buddylist.BuddyListService", "buddylist/buddylist", "mmo.buddylist.buddylist.BuddyListServiceLocator"),
			new ServiceInfo("TalkService"
			, ITalk, "mmo.talk.TalkService", "talk/talk", "mmo.talk.TalkServiceLocator"),
			//任务相关
			new ServiceInfo("TaskNpcService"
			, ITaskNpcService, "mmo.tasknpc.TaskNpcService", "task/tasknpc", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("TaskService"
			, ITaskService, "mmo.taskservice.TaskService", "task/taskservice", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("TaskExtManager"
			, ITaskExtManager, "mmo.taskextmanager.TaskExtManager", "task/taskextmanager", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("TaskPanel"
				, ITaskPanel, "mmo.taskpanel.TaskPanel", "task/taskpanel", "mmo.interfaces.SingleLocator"),
			//采集相关
			new ServiceInfo("GatherService"
			, IGatherService, "mmo.gather.GatherService", "gather/gather", "mmo.interfaces.SingleLocator"),
			//种族技能相关
			new ServiceInfo("BuildSkillService"
				, IBuildSkillService, "mmo.skill.buildskill.BuildSkillService", "skill/skillservice", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("FeedSkillService"
				, IFeedSkillService, "mmo.skill.feedskill.FeedSkillService", "skill/skillservice", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("TailorSkillService"
				, ITailorSkillService, "mmo.skill.tailorskill.TailorSkillService", "skill/skillservice", "mmo.interfaces.SingleLocator"),
			//课程相关
			new ServiceInfo("CourseService"
				, ICourseService, "mmo.course.CourseService", "course/courseservice", "mmo.interfaces.SingleLocator"),
			//职业相关
			new ServiceInfo("ProfessionService"
				, IProfessionService, "mmo.profession.ProfessionService", "profession/professionservice", "mmo.interfaces.SingleLocator"),
			//个人形象卡相关
			new ServiceInfo("UserCardService"
				, IUserCardService, "mmo.usercard.UserCardService", "usercard/service", "mmo.interfaces.SingleLocator"),
			//进入小屋的接口
			new ServiceInfo("HouseService"
				, IHouseService, "mmo.houseservice.HouseService", "house/house", "mmo.interfaces.SingleLocator"),
			//战斗接口
			new ServiceInfo("BattleService"
				, IBattleService, "mmo.battle.service.BattleService", "battle/battle", "mmo.interfaces.SingleLocator"),
			//场景遇敌
			new ServiceInfo("WildMonsterService"
				, IWildMonsterService, "mmo.wildmonster.WildMonsterService", "wildmonster/wildmonsterservice", "mmo.interfaces.SingleLocator"),
			//卡片合成和卡片分解
			new ServiceInfo("CardSkillService"
				, ICardSkillService, "mmo.cardskill.CardSkillService", "cardskill/cardskillservice", "mmo.interfaces.SingleLocator"),
			
			//地图
			new ServiceInfo("MapService"
				, IMapService, "mmo.map.MapService", "map/mapservice", "mmo.interfaces.SingleLocator"),
			//控制栏
			new ServiceInfo("ControlBarService"
				, IControlBarService, "mmo.control.ControlBarService", "control/control", "mmo.interfaces.SingleLocator"),
			//商城
			new ServiceInfo("MarketService"
				, IMarketService, "mmo.market.MarketService", "market/market"),
			//回购
			new ServiceInfo("SellService"
				, ISellService, "mmo.sell.SellService", "sell/sell"),
			//副本
			new ServiceInfo("FBService"
				, IFBService, "mmo.fbservice.service.FBService", "fbservice/fbservice"),
			//邀请码
			new ServiceInfo("InviteCodeService"
				,IInviteCodeService, "mmo.invitecode.InviteCodeService", "baseapp/invitecode"),
			//社区交互初始化
			new ServiceInfo("CommunityDocService"
				,ICommunityService, "mmo.community.CommunityDocService", "community/CommunityService","mmo.interfaces.SingleLocator"),
			//卡片图鉴
			new ServiceInfo("CardMapService"
				,ICardMapService, "mmo.cardmap.CardMapService", "cardmap/cardmapservice","mmo.interfaces.SingleLocator"),
			new ServiceInfo("MailService"
				, IMailService, "mmo.mail.MailService", "mail/mail", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("AuctionService"
				, IAuction, "mmo.auction.AuctionService", "auction/auction", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("PokerService"
				,IPokerService,"mmo.poker.PokerService", "poker/pokerservice", "mmo.interfaces.SingleLocator"),
			//迷镜通道，挑战模式、自由模式
			new ServiceInfo("TowerService"
				, ITowerService, "mmo.tower.TowerService", "tower/towerservice", "mmo.interfaces.SingleLocator"),
			//成就系统
			new ServiceInfo("HonorService"
				, IHonorService, "mmo.honor.HonorService", "honor/honorservice", "mmo.interfaces.SingleLocator"),
			// 宠物养成系统
			new ServiceInfo("PetBreedingService"
				, IPetBreedingService, "mmo.petbreeding.main.PetBreedingService", "petbreeding/petbreedingservice", "mmo.interfaces.SingleLocator"),
			// 竞技场
			new ServiceInfo("ArenaService"
				, IArenaService, "mmo.arena.ArenaService", "arena/arena", "mmo.interfaces.SingleLocator"),
			//组队ui
			new ServiceInfo("TeamControlBarService"
				, ITeamControlBarService, "mmo.control.team.TeamControlBarService", "control/control"),
			// vip界面
			new ServiceInfo("VipPanelService",
				IVipPanelService, "mmo.vip.panel.VipPanelService", "vip/vippanelservice", "mmo.interfaces.SingleLocator"),
			// 送花系统
			new ServiceInfo("FlowerService",
				IFlowerService, "mmo.flower.FlowerService", "flower/flowerservice", "mmo.interfaces.SingleLocator"),
			//礼包系统
			new ServiceInfo("SysGiftService",
				ISysGiftService, "mmo.sysgift.SysGiftService", "sysgift/sysgiftservice", "mmo.interfaces.SingleLocator"),
			//奥光任务
			new ServiceInfo("AGTaskService",
				IAGTaskService,"mmo.agtask.AGTaskService","agtask/agtaskservice","mmo.interfaces.SingleLocator"),
			//人民币商城
			new ServiceInfo("RmbMarketService", 
				IRmbMarketService, "mmo.rmbmarket.RmbMarketService", "rmbmarket/rmbmarket", "mmo.interfaces.SingleLocator"),
			//花园种植
			new ServiceInfo("GardenService"
				, IGardenService, "mmo.garden.gardenservice.GardenService", "garden/gardenservice/gardenservice", "mmo.interfaces.SingleLocator", [],
				[new InjectObject("interacts", ["GardenPlantService", "GardenControlBarService"])]),
			//种植操作
			new ServiceInfo("GardenPlantService",
				IGardenPlantService, "mmo.garden.gardenplant.GardenPlantService", "garden/gardenplant/gardenplantservice"),
			//花园工具栏
			new ServiceInfo("GardenControlBarService",
				IGardenControlBar, "mmo.garden.gardencontrolbar.GardenControlBarService", "garden/gardencontrolbar/gardencontrolbarservice"),
			//花园ui
			new ServiceInfo("GardenUIService",
				IGardenUIService, "mmo.garden.gardenui.GardenUIService", "garden/gardenui/gardenuiservice"),
			//魔妆店
			new ServiceInfo("MagicMakeUpService", 
				IMagicMakeUpService, "mmo.magicmakeup.MagicMakeUpService", "magicmakeup/magicmakeup", "mmo.interfaces.SingleLocator"),
			new ServiceInfo("DivineBlessService", IDivineBlessService, "mmo.divinebless.DivineBlessService", 
				"divinebless/divineblessservice", "mmo.interfaces.SingleLocator"),
			
			//守护精灵
			new ServiceInfo("FairyService", 
				IFairyService, "mmo.fairy.FairyService", "fairy/fairyservice", "mmo.interfaces.SingleLocator"),
		
			new ServiceInfo("FairyBattleService", 
				IFairyBattleService, "mmo.fairybattle.service.FairyBattleService", "fairybattle/fairybattleservice", "mmo.interfaces.SingleLocator"),
			
			//战斗信息面版
			new ServiceInfo("BattleInfoPanelService", IBattleInfoPanelService, 
				"mmo.battleinfopanel.BattleInfoPanelService", "battleinfopanel/battleinfopanelservice", "mmo.interfaces.SingleLocator"),

			//npc战斗
			new ServiceInfo("NpcBattleService",INpcBattleService,
				"mmo.npcbattle.NpcBattleService","npcbattle/npcbattleservice", "mmo.interfaces.SingleLocator"),
		
			new ServiceInfo("CandyCrushService", ICandyCrushService, "mmo.candycrush.CandyCrushService",
				"candycrush/service", "mmo.interfaces.SingleLocator"),
			
			//pet
			new ServiceInfo("PetService", IPetService, "mmo.pet.PetService", "pet/petservice", 
				"mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("ClothesDesignService", IClothesDesignService, 
				"mmo.clothesdesign.service.ClothesDesignService", "clothesdesign/service", "mmo.interfaces.SingleLocator"),
			
			//消息盒子
			new ServiceInfo("MsgBoxService", IMsgBoxService, "mmo.msgbox.MsgBoxService", "msgbox/msgboxservice", 
				"mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("SupermarketService",
				ISupermarketService,"mmo.supermarket.SupermarketService","supermarket/service","mmo.interfaces.SingleLocator"),
			//学院争霸
			new ServiceInfo("CollegeCraftService",ICollegeCraftService,
				"mmo.collegecraft.CollegeCraftService","collegecraft/collegecraftservice","mmo.interfaces.SingleLocator"),
			//学院争霸职业（星光总汇）
			new ServiceInfo("CollegeProfessionService",ICollegeProfessionService,
				"mmo.collegeprofession.CollegeProfessionService","collegeprofession/collegeprofessionservice","mmo.interfaces.SingleLocator"),
			
			//衣服图鉴
			new ServiceInfo("ClothBookService", IClothBookService, "mmo.clothbook.ClothBookService",
				"clothbook/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("SuperStarService",ISuperStarService,"mmo.superstar.SuperStarService",
				"superstar/service", "mmo.interfaces.SingleLocator"),
			//梦幻星辉盛典（4个天团的比拼）
			new ServiceInfo("SkyTeamWarService",ISkyTeamWarService,"mmo.skyteamwar.SkyTeamWarService",
				"skyteamwar/service", "mmo.interfaces.SingleLocator"),
			
			//喇叭
			new ServiceInfo("BugleService",IBugleService,"mmo.bugle.BugleService",
				"bugle/service", "mmo.interfaces.SingleLocator"),
			
			//星光手册
			new ServiceInfo("StarLightBookService",IStarLightBookService,"mmo.starlightbook.StarLightBookService",
				"starlightbook/service", "mmo.interfaces.SingleLocator"),
			
			//到处都得调用，跨场景运营活动新垃圾桶，替代CommunityDocService
			new ServiceInfo("ActivityService", IActivityService, "mmo.activity.ActivityService",
				"activity/service","mmo.interfaces.SingleLocator"),
			
			//雪奈尔
			new ServiceInfo("ChanelService", IChanelMarketService, "mmo.chanelmarket.ChanelMarketService",
				"chanelmarket/service","mmo.interfaces.SingleLocator"),
			
			//派对
			new ServiceInfo("PartyService", IPartyService, "mmo.party.service.PartyService", 
				"party/service/service", "mmo.interfaces.SingleLocator"),
			
			//双生信物
			new ServiceInfo("TwinGiftService", ITwinGiftService, "mmo.twingift.TwinGiftService",
				"twingift/service","mmo.interfaces.SingleLocator"),
			
			//梦境店的卡牌
			new ServiceInfo("DreamCardService", IDreamCardService, "mmo.dreamcard.DreamCardService",
				"dreamcard/service","mmo.interfaces.SingleLocator"),
			
			//用于添加各种产品奇怪的基础功能
			new ServiceInfo("FoundationService", IFoundationService, "mmo.foundation.FoundationService",
				"foundation/foundationservice","mmo.interfaces.SingleLocator"),
			
			//米丫丫光环
			new ServiceInfo("HalosService", IHalosService, "mmo.halos.HalosService",
				"halos/service","mmo.interfaces.SingleLocator"),
			
			//巴伦拍卖行
			new ServiceInfo("PublicSaleService", IPublicSaleService, "mmo.publicsale.PublicSaleService",
				"publicsale/service","mmo.interfaces.SingleLocator"),
			//瞬移
			new ServiceInfo("JumpSoonService", IJumpSoonService, "mmo.jumpsoon.JumpSoonService",
				"jumpsoon/service","mmo.interfaces.SingleLocator"),
			
			//宫殿
			new ServiceInfo("PalaceService", IPalaceService, "mmo.palace.PalaceService",
				"palace/service","mmo.interfaces.SingleLocator"),
			
			//暖暖
			new ServiceInfo("NuannuanService", INuannuanService, "mmo.nuannuan.NuannuanService",
				"nuannuan/service", "mmo.interfaces.SingleLocator"),
			
			//平台分享
			new ServiceInfo("AoYaShareService", IAoYaShareService, "mmo.aoyashare.AoYaShareService",
				"aoyashare/service", "mmo.interfaces.SingleLocator"),
			
			//奥雅战役
			new ServiceInfo("AoyaBattleService", IAoyaBattleService, "mmo.aoyabattle.AoyaBattleService",
				"aoyabattle/service", "mmo.interfaces.SingleLocator"),		
			
			//Rangers
			new ServiceInfo("RangersService", IRangersService, "mmo.rangers.RangersService", 
				"rangers/service", "mmo.interfaces.SingleLocator"),
			
			//重构了奖励弹框
			new ServiceInfo("MaterialsChangeService", IMaterialsChangeService, "mmo.materialschange.MaterialsChangeService",
				"materialschange/service", "mmo.interfaces.SingleLocator"),
			
			//新手商店
			new ServiceInfo("ViYaCardService", IViYaCardService, "mmo.viyacard.ViYaCardService",
				"viyacard/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("BandService", IBandService, "mmo.band.BandService",
				"band/service", "mmo.interfaces.SingleLocator"),
			
			//游戏室
			new ServiceInfo("PlayRoomService", IPlayRoomService, "mmo.playroom.PlayRoomService",
				"playroom/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("TasktBranchService", ITasktBranchService, "mmo.tasktbranch.TasktBranchService",
				"tasktbranch/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("UnionService", IUnionService, "mmo.union.UnionService",
				"union/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("NurturanceService", INurturanceService, "mmo.nurturance.NurturanceService",
				"nurturance/service", "mmo.interfaces.SingleLocator"),
			//设计馆
			new ServiceInfo("AoYaDesignService", IAoYaDesignService, "mmo.aoyadesign.AoYaDesignService",
				"aoyadesign/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("WonderNuanService", IWonderNuanService, "mmo.wondernuan.WonderNuanService",
				"wondernuan/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("CloseFriendService", ICloseFriendService, "mmo.closefriend.CloseFriendService",
				"closefriend/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("AoYaTVService", IAoYaTVService, "mmo.aoyatv.AoYaTVService",
				"aoyatv/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("MenuService", IMenuService, "mmo.menu.MenuService",
				"menu/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("DressMasterService", IDressMasterService, "mmo.dressmaster.DressMasterService",
				"dressmaster/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("FashionStarService", IFashionStarService, "mmo.fashionstar.FashionStarService",
				"fashionstar/service", "mmo.interfaces.SingleLocator"),
			
			new ServiceInfo("MarketPlusService", IMarketPlusService, "mmo.marketplus.MarketPlusService",
				"marketplus/service", "mmo.interfaces.SingleLocator"),
			//魔法童话奇缘
			new ServiceInfo("MagicFairytaleService", IMagicFairytaleService, "mmo.magicfairytale.MagicFairytaleService",
				"magicfairytale/service", "mmo.interfaces.SingleLocator"),
			//8月超模
			new ServiceInfo("SuperModelService", ISuperModelService, "mmo.supermodel.SuperModelService",
				"supermodel/service", "mmo.interfaces.SingleLocator"),
			//9月奥雅圈
			new ServiceInfo("AoYaCircleService", IAoYaCircleService, "mmo.aoyacircle.AoYaCircleService",
				"aoyacircle/service", "mmo.interfaces.SingleLocator"),
			//角色编辑器
			new ServiceInfo("InnerTvService", IInnerTvService, "mmo.innertv.InnerTvService",
				"innertv/service", "mmo.interfaces.SingleLocator")
			
		];
	}
}