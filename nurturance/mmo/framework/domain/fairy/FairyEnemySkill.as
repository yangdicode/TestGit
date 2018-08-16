package mmo.framework.domain.fairy
{
	public class FairyEnemySkill
	{
		private var _skillId:int;
		private var _skillName:String;
		private var _desc:String;
		private var _extData:Object;
		
		public function FairyEnemySkill(skillId:int, skillName:String, desc:String, extData:Object = null)
		{
			_skillId = skillId;
			_skillName = skillName;
			_desc = desc;
			_extData = extData;
		}

		public function get skillName():String
		{
			return _skillName;
		}

		public function get skillId():int
		{
			return _skillId;
		}
		
		public function get desc():String
		{
			return _desc;
		}
		
		public function get extData():Object
		{
			return _extData;
		}
	}
}