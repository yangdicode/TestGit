package mmo.framework.domain.rangers.define
{
	public class RangersEvoDefine
	{
		private var _id:int;
		private var _evoId:int;
		private var _demand:XML;
		private var _itemDemands:Array;
		
		public function RangersEvoDefine(id:int, evoId:int, demand:XML){
			_id = id;
			_evoId = evoId;
			_demand = demand;
			
			var xmlList:XMLList = _demand.d;
			for each(var eXml:XML in xmlList){
				if(eXml.@type == "item"){
					parseItemDemand(eXml);
				}
			}
		}
		
		/**
		 * 原星灵
		 */		
		public function get id():int
		{
			return _id;
		}

		/**
		 * 目标
		 */		
		public function get evoId():int
		{
			return _evoId;
		}

		/**
		 * 材料
		 */		
		public function get demand():XML
		{
			return _demand;
		}
		
		/**
		 * 物品材料[[类型， id， 数量], [类型， id， 数量], [类型， id， 数量]]
		 */		
		public function get itemDemand():Array{
			return _itemDemands;
		}
		
		private function parseItemDemand(xml:XML):void{
			_itemDemands = [];
			var itemStrs:Array = String(xml.@items).split(",");
			for each(var eItemStr:String in itemStrs){
				_itemDemands.push(eItemStr.split("-"));
			}
		}

	}
}