package mmo.framework.domain.fairy
{
	public class FairyLeaderSkill
	{
		private var _skillId:int;
		private var _name:String;
		private var _desc:String;
		private var _extData:Object;
		
		public function FairyLeaderSkill(skillId:int, name:String, desc:String, extData:Object=null)
		{
			this._skillId = skillId;
			this._desc = desc;
			this._name = name;
			this._extData = extData;
		}
		
		public function get skillId():int
		{
			return this._skillId;
		}
		
		public function get name():String
		{
			return this._name;
		}
		
		public function get desc():String
		{
			return this._desc;
		}
		
		public function get extData():Object
		{
			return this._extData;
		}
	}
}