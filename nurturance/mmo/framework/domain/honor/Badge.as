package mmo.framework.domain.honor
{
	/**
	 * 称号
	 * @author liyawei
	 */	
	
	public class Badge
	{
		public static const TYPE_WORD:String = "文字";
		public static const TYPE_IMG:String = "炫图";
		
		private var _id:int;
		private var _name:String;
		private var _liveDay:int;
		private var _lvName:String;
		private var _badgeType:String;
		
		public function Badge(id:int, name:String, liveDay:int, lvName:String, badgeType:String)
		{
			this._id = id;
			this._name = name;
			this._liveDay = liveDay;
			this._lvName = lvName;
			this._badgeType = badgeType;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}
		
		public function get lvName():String
		{
			return _lvName;
		}

		public function get isImg():Boolean
		{
			return _badgeType == TYPE_IMG;
		}
		
		public function get liveDay():int{
			return _liveDay;
		}
		
		public function get badgeType():String{
			return _badgeType;
		}
		
	}
}