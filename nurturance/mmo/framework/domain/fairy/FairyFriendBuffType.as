package mmo.framework.domain.fairy
{
	public class FairyFriendBuffType
	{
		private static const TypeNames:Object =
			{
				"防御":1,
				"攻击":2,
				"回复":3,
				"全体攻击":4
			};
		
		public static const DefenseUp:int = 1;
		
		public static const AtkUp:int = 2;
		
		public static const Recover:int = 3;
		
		public static const AllAtk:int = 4;
		
		public function FairyFriendBuffType()
		{
		}
		
		public static function getBuffTypeIdByName(typeName:String):int
		{
			if (!TypeNames.hasOwnProperty(typeName))
			{
				throw new Error("精灵作用名字有误：" + typeName);
			}
			return TypeNames[typeName];
		}
	}
}