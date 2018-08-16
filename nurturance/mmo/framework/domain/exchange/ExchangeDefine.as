package mmo.framework.domain.exchange
{
	import com.adobe.utils.StringUtil;
	
	import mmo.common.DateUtil;

	public class ExchangeDefine
	{
		private var _id:int;
		private var _des:String;
		private var _demands:Vector.<ExchangeItem> = new Vector.<ExchangeItem>();
		private var _bonus:Vector.<ExchangeItem> = new Vector.<ExchangeItem>();
		private var _maxLimit:int;
		private var _maxLimitVip:int;
		private var _startDay:String;
		private var _strTipsDesc:String;
		
		private var _mcKey:String;	//当天/周兑换几个，限制每天/周兑换个数
		private var _tempInKey:String;		//一辈子兑换几个，限制一辈子兑换个数
		private var _isOnlyVip:Boolean;
		private var _vipRate:Number; //神羽打折率
		
		public function ExchangeDefine(id:int, des:String, demandsStr:String, bonusStr:String,  maxLimit:int=0,maxLimitVip:int=0,startDay:String="",strTipsDesc:String="", mcKey:String="", tempInKey:String="", isOnlyVip:Boolean=false, vipRate:Number = 1.0)
		{
			_id = id;
			_des = des;
			initItem(_demands, demandsStr);
			initItem(_bonus, bonusStr);
			_maxLimit = maxLimit;
			_maxLimitVip = maxLimitVip;
			_startDay = startDay;
			_strTipsDesc = strTipsDesc;
			
			_mcKey = mcKey;
			_tempInKey = tempInKey;
			_isOnlyVip = isOnlyVip;
			_vipRate = vipRate;
		}
		
		private function initItem(arr:Vector.<ExchangeItem>, itemStrs:String):void
		{
			if(StringUtil.isEmpty(itemStrs)){
				return;
			}
			var allItemStr:Array = itemStrs.split(",");
			for each(var eachItemStr:String in allItemStr)
			{
				var itemStr:Array = eachItemStr.split("-");
				var exchangeItem:ExchangeItem = new ExchangeItem(itemStr[0], itemStr[1], itemStr[2]);
				arr.push(exchangeItem);
			}
		}

		public function get id():int
		{
			return _id;
		}

		public function get des():String
		{
			return _des;
		}
				
		public function get tipsDesc():String
		{
			return _strTipsDesc;
		}
		
		public function isOnlyVipExchange():Boolean{
			return _isOnlyVip;
		}

		/**
		 * ExchangeItem
		 */		
		public function get demands():Vector.<ExchangeItem>
		{
			return _demands;
		}
		
		/**
		 * ExchangeItem
		 */
		public function get bonus():Vector.<ExchangeItem>
		{
			return _bonus;
		}
		
		/**
		 * 兑换次数限制，0为不限制
		 * */
		public function get maxLimit():int
		{
			return _maxLimit;
		}
		
		/**
		 * vip兑换次数限制，0为不限制 ,
		 * */
		public function get maxLimitVip():int
		{
			if( _maxLimitVip==0 )
				_maxLimitVip = _maxLimit;
			return _maxLimitVip;
		}
		
		/**
		 * 是否有兑换次数限制
		 * */
		public function hasExchangeTimesLimit():Boolean{
			return ( maxLimit>0 || maxLimitVip>0);
		}
		
		/**
		 * 当天/当周兑换次数的mcKey，""为没有限制key
		 * */
		public function get mcKey():String
		{
			return _mcKey;
		}
		
		/**
		 * 这辈子兑换次数的tempInKey，""为没有限制key
		 * */
		public function get tempInKey():String
		{
			return _tempInKey;
		}
		
		/**
		 * 是否到了开始兑换日期 
		 * @return true-可以开始兑换
		 * 
		 */		
		public function isStartDay():Boolean
		{
			if( _startDay == "" )
				return true;
			var arrayDay:Array = _startDay.split("-");
			if( arrayDay.length != 3 )//格式有误,判断为不能开始
			{
				trace("****限制开始时间格式有误！_startDay:"+_startDay+",arrayDay:"+arrayDay);
				return false;
			}
			var startTime:Number = new Date(int(arrayDay[0]),int(arrayDay[1]-1),int(arrayDay[2])).time;
			var curTime:Number = DateUtil.getServerTime().time;
			
			return Boolean(curTime>=startTime);
		}
		
		// 进一步细分数据
		/**		 
		 * 有多少种奖励物品
		 */		
		public function getBonusLength():int
		{
			return _bonus.length;
		}
		/**
		 * ExchangeItem bonus  id 奖励物品的编号
		 */
		public function getBonusId(index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _bonus[index] as ExchangeItem;
			if( exchangeItem )
			{
				return exchangeItem.id;
			}
			return -1;
		}
		/**
		 * ExchangeItem bonus  type 奖励物品的类型
		 */
		public function getBonusType(index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _bonus[index] as ExchangeItem;
			if( exchangeItem )
			{
				return exchangeItem.type;
			}
			return -1;
		}
		/**		 
		 * 有多少种兑换物
		 */	
		public function getDemandLength():int
		{
			return _demands.length;
		}
		/**
		 * ExchangeItem demands  number 兑换物的数量
		 */
		public function getDemandNumber(index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _demands[index] as ExchangeItem;
			if( exchangeItem )
			{
				return exchangeItem.num;
			}
			return 0;
		}
		/**
		 * ExchangeItem demands  number 神羽折扣后的兑换物数量
		 */
		public function getDemandVipNumber( index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _demands[index] as ExchangeItem;
			if( exchangeItem )
			{
				return Math.round(exchangeItem.num*_vipRate);
			}
			return 0;
		}
		
		/**
		 * ExchangeItem demands  id 兑换物的编号
		 */
		public function getDemandId(index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _demands[index] as ExchangeItem;
			if( exchangeItem )
			{
				return exchangeItem.id;
			}
			return -1;
		}
		/**
		 * ExchangeItem demands  type 兑换物的类型
		 */
		public function getDemandType(index:int = 0):int
		{
			var exchangeItem:ExchangeItem = _demands[index] as ExchangeItem;
			if( exchangeItem )
			{
				return exchangeItem.type;
			}
			return -1;
		}
		
	}
}