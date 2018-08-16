package mmo.framework.domain.monster
{
	import flash.system.ApplicationDomain;

	public class Monsters
	{
		private static var config:Object;
		//保存一个id里面最低等级的那个怪物数据。
		private static var minLvMap:Object;
		
		/**
		 * 获取怪物数据 
		 * @param id	id
		 * @param lv	等级，传入默认的-1的话会返回该id怪物最低等级的数据
		 */		
		public static function getMonster(id:int, lv:int = -1):Monster
		{
			initConfig();
			if (config[id] == null)
			{
				return null;
			}
			if (lv < 0)
			{
				return minLvMap[id];
			}
			return config[id][lv];
		}
		
		/**
		 * 返回大于等于proLv的最小职业等级的id号怪物，
		 * 不存在的话返回该id等级最低的怪物。
		 */		
		public static function getMonsterByLeastProLv(id:int, proLv:int):Monster
		{
			initConfig();
			if (config[id] == null)
			{
				return null;
			}
			var lv:int = -1;
			for each(var monster:Monster in config[id])
			{
				if ((monster.proLv >= proLv)&&((lv < 0)||(lv > monster.lv)))
				{
					lv = monster.lv;
				}
			}
			return getMonster(id, lv);
		}
		
		/**
		 * 返回小于等于proLv的最大职业等级的id号怪物，
		 * 不存在的话返回该id等级最低的怪物。
		 */		
		public static function getMonsterByMaxProLv(id:int, proLv:int):Monster
		{
			initConfig();
			if (config[id] == null)
			{
				return null;
			}
			var lv:int = -1;
			for each(var monster:Monster in config[id])
			{
				if ((monster.proLv <= proLv)&&((lv < 0)||(lv < monster.lv)))
				{
					lv = monster.lv;
				}
			}
			return getMonster(id, lv);
		}
		
		private static function initConfig():void
		{
			if (config != null)
			{
				return;
			}
			var cardsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MonstersData") as Class;
			config = {};
			minLvMap = {};
			var data:Object = cardsDataClass["data"];
			for(var key:String in data)
			{
				var params:Array = key.split("_");
				var id:String = params[0];
				var lv:String = params[1];
				if (config[id] == null)
				{
					config[id] = {};
					minLvMap[id] = data[key];
				}
				config[id][lv] = data[key];
			}
		}
		
		private function compileMe():void
		{
			var wm:WildMonster;
		}
	}
}