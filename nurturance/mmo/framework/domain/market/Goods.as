package mmo.framework.domain.market
{
	import mmo.common.DateUtil;
	
	public class Goods
	{
		private var _id:int;
		private var _catalog:int;
		private var _goodsType:int;
		private var _name:String;
		private var _desc:String;
		private var _currency:int;
		private var _displayPrice:Number;
		private var _price:Number;
		private var _vipPrice:Number;
		private var _itemType:int;
		private var _soulGold:int;
		private var _validity:int;
		private var _startDate:Date;
		private var _endDate:Date;
		private var _ticketEnable:Boolean;
		private var _memberOnly:Boolean;
		private var _isHot:Boolean;
		
		private var _itemIds:Array;
		private var _itemTypes:Array;
		private var _itemNums:Array;
		
		
		public function Goods(data:Object)
		{
			_id = data[0];
			_catalog = data[14];
			_goodsType = data[15];
			_name = data[1];
			_desc = data[2];
			_currency = data[3];
			_displayPrice = data[4];
			_price = data[5];
			_vipPrice = data[6];
			_soulGold = data[7];
			_validity = data[9];
			_startDate = DateUtil.parseDateStrToDate(data[10]);
			_endDate = DateUtil.parseDateStrToDate(data[11]);
			_ticketEnable = data[12] == 1? true:false;
			_memberOnly = data[13] == 1? true:false;
			_isHot = (data[16] == 1)?true:false;
			this.parseItems(String(data[8]));
		}
		
		private function parseItems(str:String):void
		{
			var arr:Array = str.split(",");
			_itemIds = [];
			_itemTypes = [];
			_itemNums = [];
			for(var i:int = 0; i < arr.length; i++)
			{
				var tempStr:String = arr[i] as String;
				var tempArr:Array = tempStr.split("-");
				_itemTypes.push(int(tempArr[0]));
				_itemIds.push(int(tempArr[1]));
				_itemNums.push(int(tempArr[2]));
			}
			_itemType = int(_itemTypes[0]);
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get catalog():int
		{
			return _catalog;
		}
		
		public function get goodsType():int
		{
			return _goodsType;
		}	
		
		public function get name():String
		{
			return _name;
		}
		
		public function get desc():String
		{
			return _desc;
		}	
		
		public function get currency():int
		{
			return _currency;
		}
		
		/**
		 * 是不是羽贝商品
		 */	
		public function get isYubeiGoods():Boolean{
			return (currency == 0);
		}
		
		/**
		 * 展示价格，经常用作：原价
		 */		
		public function get displayPrice():Number
		{
			return _displayPrice;
		}	
		
		/**
		 * 普通价格
		 */	
		public function get price():Number
		{
			return _price;
		}
		
		/**
		 * vip价格
		 */	
		public function get vipPrice():Number
		{
			return _vipPrice;
		}
		
		public function get itemType():int
		{
			return _itemType;
		}
		
		public function get items():Array
		{
			return _itemIds;
		}
		
		public function get itemNums():Array
		{
			return _itemNums;
		}
		
		public function get itemTypes():Array
		{
			return _itemTypes;
		}
		
		public function get firstItem():int
		{
			return int(_itemIds[0]);
		}	
		
		public function get validity():int
		{
			return _validity;
		}
		
		public function get startDate():Date
		{
			return _startDate;
		}	
		
		public function get endDate():Date
		{
			return _endDate;
		}
		
		//是否可用代购券购买
		public function get ticketEnable():Boolean
		{
			return _ticketEnable;
		}
		
		//是否是会员专属
		public function get memberOnly():Boolean
		{
			return _memberOnly;
		}
		
		// 是否是热卖品
		public function get isHot():Boolean
		{
			return this._isHot;
		}
		
		//商品是否在售
		public function IsOnSale():Boolean
		{
			if(this.endDate.getTime() <= DateUtil.getServerTime().getTime()
				||this.startDate.getTime()>DateUtil.getServerTime().getTime())
			{
				return false;
			}
			return true;
		}
	}
}