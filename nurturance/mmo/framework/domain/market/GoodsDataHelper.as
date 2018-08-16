package mmo.framework.domain.market
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.material.gitem.GItemTypes;

	public class GoodsDataHelper
	{
		private static var _goodsData:Object;
		private static var _goodsDataByName:Object;
		
		private static var _suitData:Object;
		private static var _singleGoodsData:Object;
		
		private static var configClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.GoodsData") as Class;
		
		private static var outDateData:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.OutDateGoods")["outDate"];
		private static var voucherCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.RmbMarketVoucher") as Class;
		
		public function GoodsDataHelper()
		{
		}
		
		/**
		 * 错误命名，应为getGoodsByGoodsId
		 */		
		public static function getGoodsBuyGoodsId(goodsId:int):Goods
		{
			initGoodsData();
			if(!_goodsData.hasOwnProperty(goodsId)){
				//throw new Error("找不到id为" + goodsId + "的商品!");
				trace("找不到id为" + goodsId + "的商品!");
				return null;
			}
			return _goodsData[goodsId];
		}
		
		/**
		 * 获取商品名称
		 */		
		public static function getGoodsName( goodsId:int ):String{
			var goods:Goods = getGoodsBuyGoodsId(goodsId);
			if( goods )
				return goods.name;
			return "";
		}
		/**
		 * 获取商品描述
		 */		
		public static function getGoodsDesc( goodsId:int ):String{
			var goods:Goods = getGoodsBuyGoodsId(goodsId);
			if( goods )
				return goods.desc;
			return "";
		}
		/**
		 * 获取商品价格
		 */		
		public static function getGoodsPrice( goodsId:int ):int{
			var goods:Goods = getGoodsBuyGoodsId(goodsId);
			if( goods )
				return goods.price;
			return 9999;
		}
		/**
		 * 获取商品神羽价格
		 */		
		public static function getGoodsVipPrice( goodsId:int ):int{
			var goods:Goods = getGoodsBuyGoodsId(goodsId);
			if( goods )
				return goods.vipPrice;
			return 9999;
		}
		/**
		 * 获取商品显示价格
		 */		
		public static function getGoodsDisplayPrice( goodsId:int ):int{
			var goods:Goods = getGoodsBuyGoodsId(goodsId);
			if( goods )
				return goods.displayPrice;
			return 9999;
		}
		
		/**
		 * 通过名字去取单体商品，礼包排除在外 
		 * @param name商品名字
		 * @return 
		 * 
		 */		
		public static function getGoodsByName(name:String):Goods
		{
			initGoodsData();
			if (!_goodsDataByName.hasOwnProperty(name))
			{
				//throw new Error("这货不是商品：" + name);
				trace("这货不是商品：" + name);
				return null;
			}
			return _goodsDataByName[name];
		}
		
		/**
		 * 根据物品类型、id找到商品。。。
		 */		
		public static function getSingleGoodsByItem(itemType:int, itemId:int):Goods
		{
			initGoodsData();
			var key:String = itemType + "-" + itemId;
			if(!_singleGoodsData.hasOwnProperty(key))
			{
				return null;
			}
			return _singleGoodsData[key];
		}
		
		public static function getSuitGoodsById(suitId:int):Goods
		{
			initSuitData();
			if (_suitData[suitId] == null)
			{
				//throw new Error("id : " + suitId + "  的套装不存在。");
				trace("id : " + suitId + "  的套装不存在。");
				return null;
			}
			return _suitData[suitId];
		}
		
		public static function getSuitDataArray(currency:int = 0):Array{
			initSuitData();
			var arr:Array = [];
			for each(var goods:Goods in _suitData)
			{
				if(goods.IsOnSale() && goods.currency == currency){
					arr.push(goods);
				}
			}
			arr.sort(decendingSort);
			return arr;
		}
		public static function decendingSort(a:Goods, b:Goods):int
		{
			if(a.id < b.id)
				return 1;
			if(a.id > b.id)
				return -1;
			return 0;
		}
		public static function getGoodsByCatalog(catalog:int):Object{
			initGoodsData();
			var data:Object = {};
			var goods:Goods;
			for each(goods in _goodsData){
				if(goods.catalog != catalog || !goods.IsOnSale()){
					continue;
				}
				data[goods.id] = goods;
			}
			return data;
		}
		
		public static function getGoodsByCurrency(currency:int = 0):Object{
			initGoodsData();
			var obj:Object = {};
			for each(var goods:Goods in _goodsData){
				if(goods.IsOnSale() && goods.currency == currency){
					obj[goods.id] = goods;
				}
			}
			return obj;
		}
		
		public static function isGiftBag(goods:Goods):Boolean{
			return GItemTypes.GiftBag.indexOf(goods.goodsType) >= 0;
		}
		
		public static function isShanelGiftBag(goods:Goods):Boolean{
			return goods.catalog == MarketCatalog.ShanelGItem && GItemTypes.ShanelGiftBag.indexOf(goods.goodsType) >= 0;
		}
		
		public static function getOutDateGoodsName(goodsId:int):String{
			if(outDateData.hasOwnProperty(goodsId)){
				return outDateData[goodsId];
			}else{
				return "普通商品";
			}
		}
		
		public static function getAllVoucherInfo():Object{
			return voucherCls["data"];
		}
		
		public static function getVoucherById(id:int):Object{
			return getAllVoucherInfo()[id];
		}
		
		private static function initGoodsData():void
		{
			if(_goodsData != null){
				return;
			}
			_goodsData = new Object();
			_goodsDataByName = new Object();
			_singleGoodsData = new Object();
			var goodsData:Object = configClass["data"];
			for each(var goodsInfo:Object in goodsData)
			{
				var goods:Goods = new Goods(goodsInfo);
				_goodsData[goods.id] = goods;
				_goodsDataByName[goods.name] = goods;
				//把礼包（多个物品）过虑掉
				if(goods.items.length == 1 && goods.IsOnSale()){
					var key:String = goods.itemTypes[0] + "-" + goods.items[0];
					_singleGoodsData[key] = goods;
				}
			}
		}
		
		private static function initSuitData():void
		{
			if(_suitData != null)
			{
				return;
			}
			_suitData = {};
			var config:Object = configClass["clohtesSuitData"];
			for each(var suitData:Object in config)
			{
				var goods:Goods = new Goods(suitData);
				if(goods.IsOnSale()){
					_suitData[goods.id] = goods;
				}
			}
		}
	}
}