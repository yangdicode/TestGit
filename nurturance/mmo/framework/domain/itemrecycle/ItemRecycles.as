package mmo.framework.domain.itemrecycle
{
	import flash.system.ApplicationDomain;

	public class ItemRecycles
	{
		private static var recycleConfig:Object = Class(ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ItemRecycleData"))["recycleConfig"];
		private static var rubbishConfig:Object = Class(ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ItemRecycleData"))["rubbishConfig"];
		
		public function ItemRecycles()
		{
		}
		
		public static function getItemRecycleDefineById(recycleId:int):ItemRecycleDefine
		{
			return recycleConfig[recycleId] as ItemRecycleDefine;
		}
		
		public static function getRubbishExchangeDefineById(rubbishId:int):RubbishExchangeDefine
		{
			return rubbishConfig[rubbishId] as RubbishExchangeDefine;
		}
		
		public static function getAllItemRecycleDefines():Array
		{
			var list:Array = [];
			for each(var define:ItemRecycleDefine in recycleConfig)
			{
				list.push(define);
			}
			return list;
		}
		
		public static function getAllRubbishExchangeDefines():Array
		{
			var list:Array = [];
			for each(var define:RubbishExchangeDefine in rubbishConfig){
				list.push(define);
			}
			list.sortOn("id", Array.DESCENDING);
			return list;
		}
		
	}
}