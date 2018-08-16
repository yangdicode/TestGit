package mmo.framework.domain.divinebless
{
	import flash.system.ApplicationDomain;

	public class Divinations
	{
		private static var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.DivinationData") as Class;
		private static var data:Object = cls["data"];
		private static var jewerlyGoods:Array;
		
		public function Divinations()
		{
		}
		
		public static function getDivinationBuffById(id:int):DivinationBuffDefine{
			if(!data.hasOwnProperty(id))
				throw new Error("没有找到这个占卜buff");
			return data[id];
		}
		
		public static function getAllJeweryGoods():Array{
			if(jewerlyGoods == null)
				initJewelryGoods();
			return jewerlyGoods;
		}
		
		private static function initJewelryGoods():void{
			jewerlyGoods = [];
			for each(var define:DivinationBuffDefine in data){
				if(define.goodsId > 0)
					jewerlyGoods.push(define);
			}
		}
		
	}
}