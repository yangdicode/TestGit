package mmo.framework.domain.cardmap
{
	public class CardMapType
	{
		public static var typeNameArray:Array = ["职业卡","武器卡","魔法卡","技能卡","宠物卡"];
		
		//所有卡
		public static var allCards:int = 0;
		
		//职业卡类型
		public static var professionCard:int = 1;
		
		//武器卡类型
		public static var weaponCard:int = 2;
		
		//魔法卡
		public static var magicCard:int = 3;
		
		//技能卡
		public static var skillCard:int = 4;
		
		//宠物卡
		public static var petCard:int = 5;
		
		/**
		 * 根据类型获得类型名称
		 */		
		public static function getTypeName(type:int):String
		{
			return typeNameArray[type-1];
		}
	}
}