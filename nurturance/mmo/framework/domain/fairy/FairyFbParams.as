package mmo.framework.domain.fairy
{
	public class FairyFbParams
	{
		private var _fbId:int;
		private var _subFbId:int;
		private var _aillianceFairyId:int;
		private var _aillianceFairyLv:int;
		private var _aillianceFairyMainSkillLv:int;
		
		/**
		 * 战斗参数类
		 */		
		public function FairyFbParams(fbId:int, subFbId:int, aillianceFairyId:int, aillianceFairyLv:int, aillianceFairyMainSkillLv:int)
		{
			_fbId = fbId;
			_subFbId = subFbId;
			_aillianceFairyId = aillianceFairyId;
			_aillianceFairyLv = aillianceFairyLv;
			_aillianceFairyMainSkillLv = aillianceFairyMainSkillLv;
		}
		
		public function get fbId():int
		{
			return _fbId;
		}

		public function get subFbId():int
		{
			return _subFbId;
		}

		public function get aillianceFairyId():int
		{
			return _aillianceFairyId;
		}

		public function get aillianceFairyLv():int
		{
			return _aillianceFairyLv;
		}

		public function get aillianceFairyMainSkillLv():int
		{
			return _aillianceFairyMainSkillLv;
		}


	}
}