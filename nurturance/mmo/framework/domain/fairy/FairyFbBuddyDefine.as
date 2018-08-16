package mmo.framework.domain.fairy
{
	public class FairyFbBuddyDefine
	{
		private var _userName:String;
		private var _fairyId:int;
		private var _fairyExp:int;
		private var _mainSkillLv:int;
		private var _isNpc:Boolean;
		private var _hasInvite:Boolean;
		
		public function FairyFbBuddyDefine(userName:String, fairyId:int, fairyExp:int, mainSkillLv:int, isNpc:Boolean, hasInvite:Boolean = false)
		{
			_userName = userName;
			_fairyId = fairyId;
			_fairyExp = fairyExp;
			_mainSkillLv = mainSkillLv;
			_isNpc = isNpc;
			_hasInvite = hasInvite;
		}
		
		public static function build(obj:Object):FairyFbBuddyDefine{
			var userName:String = obj["un"];
			var fairyId:int = obj["fid"];
			var fairyExp:int = obj["exp"];
			var mainSkillLv:int = obj["mslv"];
			var hasInvite = obj["hadused"];
			var isNpc = obj.hasOwnProperty("isnpc") ? obj["isnpc"] : false;
			return new FairyFbBuddyDefine(userName, fairyId, fairyExp, mainSkillLv, isNpc, hasInvite);
		}

		public function get userName():String
		{
			return _userName;
		}

		public function get fairyId():int
		{
			return _fairyId;
		}

		public function get mainSkillLv():int
		{
			return _mainSkillLv;
		}

		public function get isNpc():Boolean
		{
			return _isNpc;
		}

		public function get hasInvite():Boolean
		{
			return _hasInvite;
		}

		public function get fairyExp():int
		{
			return _fairyExp;
		}

		public function set hasInvite(value:Boolean):void
		{
			_hasInvite = value;
		}

		
	}
}