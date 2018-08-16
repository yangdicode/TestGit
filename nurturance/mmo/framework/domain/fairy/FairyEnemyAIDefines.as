package mmo.framework.domain.fairy
{
	import flash.system.ApplicationDomain;

	public class FairyEnemyAIDefines
	{
		private static const AIDefines:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyEnemyAIData") as Class;
		
		private static var _monsterIdAIDefinesMap:Object;
		
		public function FairyEnemyAIDefines()
		{
		}
		
		public static function getAIDefinesByMonsterId(monsterId:int):Array
		{
			if(_monsterIdAIDefinesMap == null)
			{
				initMap();
			}
			
			return _monsterIdAIDefinesMap[monsterId];
		}
		
		private static function initMap():void
		{
			var defines:Object = AIDefines["defines"];
			var arr:Array;
			_monsterIdAIDefinesMap ={};
			
			for each(var aiDefine:FairyEnemyAIDefine in defines)
			{
				if(_monsterIdAIDefinesMap[aiDefine.monsterId] != null)
				{
					arr = _monsterIdAIDefinesMap[aiDefine.monsterId]
					arr.push(aiDefine);
				}
				else
				{
					arr = [];
					arr.push(aiDefine);
					_monsterIdAIDefinesMap[aiDefine.monsterId] = arr;
				}
			}
		}
	}
}