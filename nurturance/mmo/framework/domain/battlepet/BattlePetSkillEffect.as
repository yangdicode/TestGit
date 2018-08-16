package mmo.framework.domain.battlepet
{
	public class BattlePetSkillEffect
	{
		private var _effectType:String;
		private var _actionType:String;
		
		public function BattlePetSkillEffect(effectType:String, actionType:String)
		{
			_effectType = effectType;
			_actionType = actionType;
		}
		
		public function get effectType():String
		{
			return _effectType;
		}

		public function get actionType():String
		{
			return _actionType;
		}

	}
}