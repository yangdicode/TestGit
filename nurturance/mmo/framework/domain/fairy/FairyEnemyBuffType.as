package mmo.framework.domain.fairy
{
	public class FairyEnemyBuffType
	{
		private static const TypeNames:Object =
			{
				"破防":1,
				"毒":2,
				"蓄力":3
			};
		
		public static const DefenseBreak:int = 1;
		
		public static const Poison:int = 2;
		
		public static const ChangeAtk:int = 3;
		
		public function FairyEnemyBuffType()
		{
		}
		
		public static function getBuffTypeIdByName(typeName:String):int
		{
			if (!TypeNames.hasOwnProperty(typeName))
			{
				throw new Error("敌方BUFF类型有误：" + typeName);
			}
			return TypeNames[typeName];
		}
	}
}