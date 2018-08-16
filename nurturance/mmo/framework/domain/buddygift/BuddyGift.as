package mmo.framework.domain.buddygift
{
	import mmo.framework.domain.market.Goods;
	import mmo.framework.domain.market.GoodsDataHelper;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.gitem.GItemFacade;

	public class BuddyGift
	{
		private var _id:int;
		private var _gitemId:int;
		private var _familiarity:int;
		private var _goods:Goods;
		
		public function BuddyGift(info:Array)
		{
			_id = info[0];
			_gitemId = info[1];
			_familiarity = info[2];
		}
		
		public function get id():int{
			return _id;
		}
		
		public function get gitemId():int{
			return _gitemId;
		}
		
		public function get familiarity():int{
			return _familiarity;
		}
		
		public function get goods():Goods{
			initGoods();
			return _goods;
		}
		
		public function get name():String{
			var item:Material = GItemFacade.instance.getMaterialById(_gitemId);
			return item.name;
		}
		
		public function get isScore():Boolean{
			initGoods();
			return _goods.currency == 1;
		}
		
		public function get price():int{
			initGoods();
			if(ModelInfo.getUserMember().isMember){
				return _goods.vipPrice;
			}
			return _goods.price;
		}
		
		private function initGoods():void{
			if(_goods != null){
				return;
			}
			_goods = GoodsDataHelper.getSingleGoodsByItem(MaterialTypes.GITEM, _gitemId);
		}
		
	}
}