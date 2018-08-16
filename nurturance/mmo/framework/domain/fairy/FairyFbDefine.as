package mmo.framework.domain.fairy
{
	public class FairyFbDefine
	{
		private var _fbId:int;
		private var _fbName:String;
		private var _desc:String;
		private var _needOrder:int;
		private var _backGround:int;
		private var _starLv:int;
		private var _preFb:int;
		private var _type:String;
		private var _tecFb:Boolean;
		private var _isOnline:Boolean;
		private var _onceBonus:Boolean;
		
		public static const NORMAL_FB_NAME:String = "常规";
		public static const COMMUNITY_FB_NAME:String = "活动";
		public static const TECHNIQUE_FB_NAME:String = "技术";
		public static const TimeLimit_FB_Name:String = "限时";
		
		public function FairyFbDefine(fbId:int, fbName:String, desc:String, needOrder:int, backGround:int, starLv:int, preFb:int, type:String, tecFb:int, isOnline:int, onceBonus:int)
		{
			 _fbId = fbId;
			 _fbName = fbName;
			 _desc = desc;
			 _needOrder = needOrder;
			 _backGround = backGround;
			 _starLv = starLv;
			 _preFb = preFb;
			 _type = type;
			 _tecFb = tecFb == 1;
			 _isOnline = (isOnline == 1);
			 _onceBonus = onceBonus != 0;
		}

		public function get fbId():int
		{
			return _fbId;
		}

		public function get fbName():String
		{
			return _fbName;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get needOrder():int
		{
			return _needOrder;
		}

		public function get backGround():int
		{
			return _backGround;
		}
		
		/**
		 * 主要用于区分catalog
		 */		
		public function get type():String
		{
			return _type;
		}

		public function get starLv():int
		{
			return _starLv;
		}

		public function get preFb():int
		{
			return _preFb;
		}

		public function get isOnline():Boolean
		{
			return _isOnline;
		}
		
		public function get onceBonus():Boolean
		{
			return _onceBonus;
		}

		public function get isTecFb():Boolean
		{
			return _tecFb;
		}

		
	}
}