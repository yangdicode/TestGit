package mmo.framework.domain.npcbattle
{
	import flash.system.ApplicationDomain;

	public class NpcFavorItemDefines
	{
		private static const NpcFavorItemConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.npcbattle.config.NpcFavorItemDefineData") as Class;
				
		public function NpcFavorItemDefines()
		{
		}
		
		public static function getNpcFavorItemDefine(itemId:int):NpcFavorItemDefine
		{
			var data:Object = NpcFavorItemConfig["data"];
						
			return data[itemId.toString()];
		}
		
		public static function getAllNpcFavorItemIds():Array
		{
			var arrayIds:Array = [];
			var data:Object = NpcFavorItemConfig["data"];
			for each(var itemDefine:NpcFavorItemDefine in data)
			{
				arrayIds.push(itemDefine._itemId);
			}
			return arrayIds;
		}
		
	}
}