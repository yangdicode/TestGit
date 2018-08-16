package mmo.framework.domain.flower
{
	import flash.system.ApplicationDomain;

	public class Flowers
	{
		private static var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FlowerData") as Class;
		private static var flowerConfig:Object = cls["flowerConfig"];
		private static var sendBonusConfig:Object = cls["sendBonusConfig"];
		private static var receiveBonusConfig:Object = cls["receiveBonusConfig"];
		private static var topBonusConfig:Object = cls["topBonusConfig"];
		private static var dailyBonusConfig:Object = cls["dailyBonus"];
		
		/**
		 * 所有用户每日礼包key
		 */		
		public static const DAILY_TYPE_COMMON:String = "common";
		/**
		 * vip用户每日礼包key
		 */		
		public static const DAILY_TYPE_MEMBER:String = "member";
		
		public function Flowers()
		{
		}
		
		public static function getTop1LightId():int{
			return cls["TOP1_LIGHT"];
		}
		
		public static function get isSpecial():Boolean{
			return cls["isSpecial"];
		}
		
		/**
		 * 根据id获得鲜花
		 */		
		public static function getFlowerById(id:int):Flower
		{
			return flowerConfig[id] as Flower;
		}
		
		/**
		 * 根据id获得送花奖励
		 */		
		public static function getSendBonusById(id:int):FlowerGift
		{
			return sendBonusConfig[id] as FlowerGift;
		}
		
		/**
		 * 根据id获得收花奖励
		 */		
		public static function getReceiveBonusById(id:int):FlowerGift
		{
			return receiveBonusConfig[id] as FlowerGift;
		}
		
		/**
		 * 根据魅力值获得收花奖励
		 */		
		public static function getReceiveDataByCharm(charm:int):FlowerGift
		{
			var config:FlowerGift
			for each(var gift:FlowerGift in receiveBonusConfig)
			{
				if(charm >= gift.need)
					config = gift;
				else
					break;
			}
			return config;
		}
		
		/**
		 * 根据送花值获得收花奖励
		 */		
		public static function getSendFlowerDataBySend(sendFlower:int):FlowerGift
		{
			var config:FlowerGift;
			for each(var gift:FlowerGift in sendBonusConfig)
			{
				if(sendFlower >= gift.need)
					config = gift;
				else
					break;
			}
			return config;
		}
		
		/**
		 * 根据排名获得花榜奖励
		 */		
		public static function getTopBonusByRanking(ranking:int):Object
		{
			var b:Object;
			for each(var bonus:Object in topBonusConfig)
			{
				if(ranking >= bonus["ranking"])
				{
					b = bonus;
				}else
				{
					break;
				}
			}
			return b;
		}
		
		public static function getDailyBonus(key:String):Object
		{
			return dailyBonusConfig[key];
		}
		
		public static function getSendGiftData():Array
		{
			var arr:Array = new Array();
			for each(var config:FlowerGift in sendBonusConfig)
			{
				arr.push(config);
			}
			return arr;
		}
		
		public static function getReceiveGiftData():Array
		{
			var arr:Array = new Array();
			for each(var config:FlowerGift in receiveBonusConfig)
			{
				arr.push(config);
			}
			return arr;
		}
		
		/**
		 * 根据魅力值获得阶段名
		 */	
		public static function getCharmName(charm:int):String
		{
			var config:FlowerGift = getReceiveDataByCharm(charm);
			var name:String = config == null ? "幼芽" : config.name;
			return name;
		}
		
	}
}