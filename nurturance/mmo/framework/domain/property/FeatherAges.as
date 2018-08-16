package mmo.framework.domain.property
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.MainModelLocator;

	public class FeatherAges
	{
		//最大羽龄限制
		public static const MAX_AGE:int = 50;
		
		private static var data:Array = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FeatherAgeConfig")["data"];
		private static var giftAges:Array = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FeatherAgeConfig")["giftAge"];
		public function FeatherAgeLevels()
		{
		}
		
		public static function getFeatherAgeAttr(age:int):int
		{
			return data[age - 1];
		}	
		
		public static function getAttrFeatherAge(attr:int):int
		{
			for (var i:int = 0; i < data.length; i++)
			{
				if(attr < int(data[i]))
				{
					return i;
				}	
			}	
			return 0;
		}	
		
		/**
		 * 判断羽龄是否可以领取礼包 (冲级礼包的羽龄)
		 * @param age 需要判断的羽龄
		 * @return true-可以
		 * 
		 */		
		public static function isGiftAge(age:int):Boolean
		{
			return giftAges.indexOf(age) >= 0;
		}	
		
		/**
		 * 获取羽龄在冲级礼包的羽龄配置数组中的引索id 
		 * @param age 羽龄
		 * @return 冲级礼包的羽龄配置数组中的引索id，没有配置返回-1
		 * 
		 */		
		public static function getAgeGiftIndex(age:int):int
		{
			return giftAges.indexOf(age);
		}
		/**
		 * 获取冲级礼包的羽龄配置数组 
		 * @return 冲级礼包的羽龄配置数组
		 * 
		 */		
		public static function getAgeGiftArray():Array
		{
			return giftAges;
		}
		/**
		 * 判断用户羽龄是否达到最大值
		 */		
		public static function isUserMaxAge():Boolean
		{
			var userProperty:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
			return Boolean(userProperty.featherAge >= MAX_AGE)
		}
	}
}