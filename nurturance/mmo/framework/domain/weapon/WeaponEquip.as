package mmo.framework.domain.weapon
{
	import mmo.framework.domain.profession.BattleAttribute;

	public class WeaponEquip extends BattleAttribute
	{
		public static const EMPTY_WEAPON:WeaponEquip = new WeaponEquip(0, "", 0, 0, "", "", 0, 0, 0, "");
		private var _id:int;
		private var _name:String;
		private var _starLv:int;
		private var _maxLv:int;
		private var _handelDesc:String;
		private var _desc:String;
		private var _evoId:int;
		private var _subFunc:String;
		
		public function WeaponEquip(id:int, name:String, starLv:int, maxLv:int, handelDesc:String, desc:String, critPer:int, hitPer:int, evoId:int,subFunc:String="匕")
		{
			super(0,0,0,0,0,0,critPer, hitPer);
			_id = id;
			_name = name;
			_starLv = starLv;
			_maxLv = maxLv;
			_handelDesc = handelDesc;
			_desc = desc == "" ? "无" : desc;
			_evoId = evoId;
			_subFunc = subFunc;
		}
		
		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get starLv():int
		{
			return _starLv;
		}

		public function get maxLv():int
		{
			return _maxLv;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get evoId():int
		{
			return _evoId;
		}

		public function get handelDesc():String
		{
			return _handelDesc;
		}

		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 critiPersent 
		 **/		
		public function get critPer():Number
		{
			return critiPersent;
		}
		
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 hitPersent 
		 **/	
		public function get hitPer():Number
		{
			return hitPersent;
		}

		public function get subFunc():String
		{
			return _subFunc;
		}

	}
}