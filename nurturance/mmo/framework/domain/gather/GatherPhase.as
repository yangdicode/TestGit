package mmo.framework.domain.gather
{
	/**
	 * 采集阶段定义
	 * @author liyawei
	 */	
	public class GatherPhase
	{
		private var _phaseId:int;
		private var _needLv:int;
		private var _needGLv:int;
		private var _demandItems:XML;
		private var _demandScore:int;
		
		public function GatherPhase(id:int,needLv:int,needGLv:int,dItems:XML,dScore:int)
		{
			this._phaseId = id;
			this._needLv = needLv;
			this._needGLv = needGLv;
			this._demandItems = dItems;
			this._demandScore = dScore;
		}
		
		public function get phaseId():int
		{
			return _phaseId;
		}

		public function get needLv():int
		{
			return 0;
		}

		public function get needGatherLv():int
		{
			return _needGLv;
		}
		
		/**
		 * 金币需求
		 */		
		public function get demandScore():int
		{
			return _demandScore;
		}
		
		/**
		 * 物品需求 
		 * return itemArray = {id,num}
		 */		
		public function get demandItems():Array
		{
			if(this._demandItems == null){
				return null;
			}
			var items:XMLList = _demandItems.item;
			if(items == null || items.length() <= 0){
				return null;
			}
			var itemArray:Array = new Array();
			for each (var item:XML in items){
				var itemObj:Object = {"id":item.@id,"num":item.@num};
				itemArray.push(itemObj);
			}
			return itemArray;
		}
	}
}