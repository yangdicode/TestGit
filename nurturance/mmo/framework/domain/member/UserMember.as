package mmo.framework.domain.member
{
	import flash.events.EventDispatcher;
	
	import mmo.common.DateUtil;

	public class UserMember extends EventDispatcher
	{
		public function UserMember()
		{
		}

		private var _userName:String;

		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}

		private var _exp:int;

		public function get exp():int
		{
			return _exp;
		}

		public function set exp(value:int):void
		{
			_exp = value;
		}

		public function get level():int
		{
			return MemberLevels.getLevelByExp(_exp);
		}

		private var _memberType:int;

		/**
		 *会员类型
		 *
		 * */
		public function get memberType():int
		{
			return _memberType;
		}

		/**
		 * @private
		 */
		public function set memberType(value:int):void
		{
			_memberType = value;
		}

		private var _isMember:Boolean;

		public function get isMember():Boolean
		{
			return _isMember;
		}

		public function set isMember(value:Boolean):void
		{
			_isMember = value;
		}
		
		private var _isRMBMember:Boolean;
		public function get isRMBMember():Boolean{
			return _isRMBMember;
		}
		
		public function set isRMBMember(isRMBMember:Boolean):void{
			_isRMBMember = isRMBMember;
		}
		
		/**
		 * 见习神羽骑士，体验会员
		 */		
		public function get isExpeMember():Boolean{
			return _isMember && !_isRMBMember;
		}
		
		private var _expeMemberEndTime:Number;
		public function set expeMemberEndTime(endTime:Number):void{
			_expeMemberEndTime = endTime;
			//修正为结束时间的一整天，不是时间点。
			var date:Date = new Date(_expeMemberEndTime);
			var  regulateDate:Date = new Date(date.fullYear, date.month, date.date, 23, 59, 59);
			_expeMemberEndTime = regulateDate.time;
		}
		
		/**
		 * 平民玩家，从来没有充值过会员
		 */		
		public function get isPopulace():Boolean{
			return (!isRMBMember && exp<=0);
		}
		
		/**
		 * 过期会员,曾经充值过会员，但是当前不是会员
		 */		
		public function get isOverdieMember():Boolean{
			return (!isRMBMember && exp > 0);
		}
		
		private var _isYearMember:Boolean;
		public function get isYearMember():Boolean
		{
			return _isYearMember;
		}

		public function set isYearMember(value:Boolean):void
		{
			_isYearMember = value;
		}
		
		private var _newChargeMonth:int
		/**
		 * 新一年中用户新充值月份数目
		 */		
		public function get newChargeMonth():int
		{
			return _newChargeMonth;
		}
		
		public function set newChargeMonth(value:int):void
		{
			_newChargeMonth = value;
		}
		
		private var _newChargeTime:Number;
		/**
		 *最新充值时间 
		 */		
		public function get newRechargeTime():Number{
			return _newChargeTime;
		}
		
		public function set newRechargeTime(value:Number):void
		{
			_newChargeTime = value;
		}
		
		public function getNewRechargeTimeString():String{
			if( _newChargeTime<=0 ){
				return "无";
			}
			var newDate:Date = new Date(_newChargeTime);
			return newDate.fullYear+"-"+(newDate.month+1)+"-"+newDate.date;
		}
		
		private var _isHalfYearMember:Boolean;
		/**
		 * 2015年费-剩余365天以上,半价成为年费 
		 */	
		public function get isHalfYearMember():Boolean{
			return _isHalfYearMember;
		}
		
		public function set isHalfYearMember( value:Boolean ):void{
			_isHalfYearMember = value;
		}
		
		private var _invalidateTime:Number;
		
		/** vip到期时间，毫秒 **/
		public function get invalidateTime():Number
		{
			return _isRMBMember ? _invalidateTime : _expeMemberEndTime;
		}
		
		public function set invalidateTime(value:Number):void
		{
			this._invalidateTime = value;
		}
		
		/** rmb神羽 兑换神羽天数 **/
		public function delayRmbVipInvalidateTime( delayDays:int ):void{
			_invalidateTime += (delayDays*24*60*60*1000);
		}
		
		private var _firstOpenTime:Number=0;
		/** vip首充时间，平民为0。基于自 GMT 时间 1970 年 1 月 1 日 0:00:000 以来的毫秒数  **/
		public function get firstOpenTime():Number{
						
			if( isRMBMember && _firstOpenTime==0 ) //刚注册的用户，马上充值vip，后端还没有返回数据
				firstOpenTime = DateUtil.getServerTime().time;
						
			return _firstOpenTime;
		}		
		public function set firstOpenTime( value:Number ):void{
			if( value==0 ){
				_firstOpenTime = 0;
				return;
			}
			var dateOld:Date = new Date(value);
			var dateNew:Date = new Date(dateOld.fullYear, dateOld.month, dateOld.date);
						
			_firstOpenTime = dateNew.time;
		}
		
		/** 相对于首充时间，已经成为vip的天数（包括中途过期vip的日期） **/
		public function getTobeVipDays():int{
			if( !_isMember )
				return 0;
			var serverTime:Number = DateUtil.getServerTime().time;
			var dtTime:Number = Math.max(0,(serverTime - firstOpenTime));
			var days:int = dtTime/1000/3600/24;
			return (days+1);
		}
		
		/** vip剩余天数 **/
		public function get leftDays():int
		{
			if( !_isMember )
				return 0;
			var serverTime:Number = DateUtil.getServerTime().time;
			var days:int = (invalidateTime - serverTime)/1000/3600/24;
			return (days+1);
		}

		override public function toString():String
		{
			return "exp: " + exp + "isMember: " + _isMember + "isYearMember: " + _isYearMember;
		}
	}
}