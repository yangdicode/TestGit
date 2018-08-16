package mmo.framework.domain.fairy
{
	public class FairyFriendBuff
	{
		private var _buffId:int;
		private var _name:String;
		private var _desc:String;
		private var _buffType:String;
		private var _extData:Object;
		
		public function FairyFriendBuff(buffId:int, name:String, desc:String, buffType:String, extData:Object=null)
		{
			_buffId = buffId;
			_name = name;
			_desc = desc;
			_buffType = buffType;
			_extData = extData;
		}
		
		public function get buffId():int
		{
			return _buffId;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get desc():String
		{
			return _desc;
		}
		
		public function get buffType():String
		{
			return _buffType;
		}
		
		public function get buffTypeId():int
		{
			return FairyFriendBuffType.getBuffTypeIdByName(_buffType);
		}
		
		public function get extData():Object
		{
			return _extData;
		}
	}
}