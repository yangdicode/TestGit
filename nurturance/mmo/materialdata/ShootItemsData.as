package mmo.materialdata
{
	import mmo.framework.domain.player.ShootFlyType;
	import mmo.framework.domain.player.ShootItem;
	import mmo.play.shoot.ShootItems;

	public class ShootItemsData
	{
		public function ShootItemsData()
		{
		}
		
		public static const defaultShootItems:Array = [
			ShootItems.CRYSTAL
		];
		
		//这个也需要配置data
		/** 变身石配置，物品id对于变身衣服id **/
		public static const OBJ_GITEMID_TRANSID_MAPS:Object = {
			"4019":13408,
			"4020":13409
		}
		
		public static const data:Object = {
			//奥雅结晶
			"crystal" : new ShootItem("crystal", "奥雅结晶", "shoot/star", "mmo.shoot.star", 4, 1),
			"candy" : new ShootItem("candy", "奥雅结晶", "shoot/candy", "mmo.shoot.candy", 1),
			"cracker" : new ShootItem("cracker", "红炮竹", "shoot/cracker", "mmo.shoot.cracker", 1),
			"tempitem": new ShootItem("tempitem", "硬币", "shoot/tempitem", "mmo.shoot.tempitem", 1, ShootFlyType.PARABOLA),
			"cake1": new ShootItem("cake1", "粉桃花", "shoot/cake1", "mmo.shoot.cake1", 1),
			"cake2": new ShootItem("cake2", "紫桃花", "shoot/cake2", "mmo.shoot.cake2", 1),
			"cake3": new ShootItem("cake3", "黄桃花", "shoot/cake3", "mmo.shoot.cake3", 1),				
			"love": new ShootItem("love", "奶油", "shoot/love", "mmo.shoot.love", 1),			
			"dec1": new ShootItem("dec1", "锤子", "shoot/dec1", "mmo.shoot.dec1", 2),
			"dec2": new ShootItem("dec2", "油漆", "shoot/dec2", "mmo.shoot.dec2", 2),
			"dec3": new ShootItem("dec3", "鲜花", "shoot/dec3", "mmo.shoot.dec3", 2),
			
			//天气魔法石
			"weatherSnow": new ShootItem("weatherSnow", "下雪天气魔石", "shoot/weather", "mmo.shoot.weatherSnow", 1, 0, true, 4021, true, true),
			
			//射击变身，变身石，（也要配置上面OBJ_GITEMID_TRANSID_MAPS）
			"transformRabbit": new ShootItem("transformRabbit", "兔子变身魔石", "shoot/transform", "mmo.shoot.transformRabbit", 1, 1, true, 4019, true, false),
			"transformLightning": new ShootItem("transformLightning", "打雷变身魔石", "shoot/transform", "mmo.shoot.transformLightning", 1, 1, true, 4020, true, false),
			
			
			"pro2" : new ShootItem("pro2", "音符", "shoot/pro2", "mmo.shoot.pro2", 1),
			"pro3" : new ShootItem("pro3", "剑气", "shoot/pro3", "mmo.shoot.pro3", 2.5),
			"pro4" : new ShootItem("pro4", "奥能光球", "shoot/pro4", "mmo.shoot.pro4", 1.2),
			"pro5" : new ShootItem("pro5", "光箭", "shoot/pro5", "mmo.shoot.pro5", 3),
			"pro6" : new ShootItem("pro6", "乐曲", "shoot/pro6", "mmo.shoot.pro6", 1),
			"pro7" : new ShootItem("pro7", "飞盾", "shoot/pro7", "mmo.shoot.pro7", 2),
			"pro8" : new ShootItem("pro8", "无双剑气", "shoot/pro8", "mmo.shoot.pro8", 2.5),
			"pro9" : new ShootItem("pro9", "火焰光球", "shoot/pro9", "mmo.shoot.pro9", 2),
			"pro10" : new ShootItem("pro10", "冰锥", "shoot/pro10", "mmo.shoot.pro10", 2.3),
			"pro11" : new ShootItem("pro11", "咒符", "shoot/pro11", "mmo.shoot.pro11", 2.5),
			"pro12" : new ShootItem("pro12", "忍者镖", "shoot/pro12", "mmo.shoot.pro12", 3.0),
			"pro13" : new ShootItem("pro13", "圣箭", "shoot/pro13", "mmo.shoot.pro13", 3.0),
			"pro14" : new ShootItem("pro14", "虚空月牙", "shoot/pro14", "mmo.shoot.pro14", 3.0),
			"pro15" : new ShootItem("pro15", "暗魔弹", "shoot/pro15", "mmo.shoot.pro15", 3.0),
			"pro16" : new ShootItem("pro16", "水晶弹", "shoot/pro16", "mmo.shoot.pro16", 3.0),			
			"pro17" : new ShootItem("pro17", "蝙蝠", "shoot/pro17", "mmo.shoot.pro17", 3.0),			
			"pro18" : new ShootItem("pro18", "极光弹", "shoot/pro18", "mmo.shoot.pro18", 3.0),			
			"pro19" : new ShootItem("pro19", "枪弹", "shoot/pro19", "mmo.shoot.pro19", 3.0),
			"pro20" : new ShootItem("pro20", "音符", "shoot/pro20", "mmo.shoot.pro20", 3.0),
			"pro21" : new ShootItem("pro21", "梦镜", "shoot/pro21", "mmo.shoot.pro21", 3.0)
		};
		
	}
}