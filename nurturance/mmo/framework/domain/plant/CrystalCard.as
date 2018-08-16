package mmo.framework.domain.plant
{
	import mmo.framework.domain.market.Goods;
	import mmo.framework.domain.market.GoodsDataHelper;
	import mmo.framework.domain.material.plantitem.PlantItem;

	public class CrystalCard
	{
		private var _id:int;
		private var _goodsId:int;
		private var _prevCardId:int;
		private var _nextCardId:int;
		private var _needItems:Array;
		private var _needTypes:Array;
		private var _needCount:Array;
		private var _openSeedIds:Array;
		
		public function CrystalCard(id:int, goodsId:int, prevCardId:int, nextCardId:int, needItems:String, openSeedIds:Array)
		{
			this._id = id;
			this._goodsId = goodsId;
			this._prevCardId = prevCardId;
			this._nextCardId = nextCardId;
			this._needTypes = [];
			this._needItems = [];
			this._needCount = [];
			this._openSeedIds = openSeedIds;
			
			var arr:Array = needItems.split(",");
			for each(var str:String in arr)
			{
				var temp:Array = str.split("-");
				this._needTypes.push(int(temp[0]));
				this._needItems.push(int(temp[1]));
				this._needCount.push(int(temp[2]));
			}
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get needItems():Array
		{
			return this._needItems;
		}
		
		public function get needTypes():Array
		{
			return this._needTypes;
		}
		
		public function get needCount():Array
		{
			return this._needCount;
		}
		
		public function get goodsId():int
		{
			return this._goodsId;
		}
		
		public function get prevCardId():int
		{
			return this._prevCardId;
		}
		
		public function get nextCardId():int
		{
			return this._nextCardId;
		}
		
		public function get openSeedIds():Array
		{
			return this._openSeedIds;
		}
		
		public function get plantItem():PlantItem
		{
			return Plants.getPlantItemById(this._id);
		}
		
		public function get goods():Goods
		{
			return GoodsDataHelper.getGoodsBuyGoodsId(this._goodsId);
		}
	}
}