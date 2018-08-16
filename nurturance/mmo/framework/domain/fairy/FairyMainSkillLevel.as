package mmo.framework.domain.fairy
{
	public class FairyMainSkillLevel
	{
		private var _skillId:int;
		private var _level:int;
		private var _round:int;
		
		public function FairyMainSkillLevel(skillId:int, level:int, round:int)
		{
			this._skillId = skillId;
			this._level = level;
			this._round = round;
		}
		
		public function get skillId():int
		{
			return this._skillId;
		}
		
		public function get level():int
		{
			return this._level;
		}
		
		public function get round():int
		{
			return this._round;
		}
	}
}