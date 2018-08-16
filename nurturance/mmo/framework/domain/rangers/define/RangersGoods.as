package mmo.framework.domain.rangers.define
{
	public class RangersGoods
	{
		public static const Experience:String = "经验道具";
		public static const Normal:String = "普通道具";
		public static const Score:String = "金币礼包";
		public static const FriendScore:String = "星援值礼包";
		
		public static function get giftBags():Array{
			return [Score, FriendScore];
		}
		
		private var _goodsId:int;
		private var _name:String;
		private var _type:String;
		private var _catalog:String;
		
		public function RangersGoods(goodsId:int, name:String, type:String, catalog:String){
			_goodsId = goodsId;
			_name = name;
			_type = type;
			_catalog = catalog;
		}

		public function get goodsId():int{
			return _goodsId;
		}

		public function get name():String{
			return _name;
		}

		public function get type():String{
			return _type;
		}

		/**
		 * 分类
		 */		
		public function get catalog():String{
			return _catalog;
		}


	}
}