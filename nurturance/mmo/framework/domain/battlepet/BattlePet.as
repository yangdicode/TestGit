package mmo.framework.domain.battlepet
{
	import flash.system.ApplicationDomain;

	public class BattlePet
	{
		private var _id:int;
		private var _name:String;
		private var _phase:int;
		private var _lvInfo:BattlePetLvDefine;
		
		private var phaseData:Object;
		private var lvData:Object;
		
		public function BattlePet(id:int, name:String, phase:int, lvInfo:BattlePetLvDefine)
		{
			_id = id;
			_name = name;
			_phase = phase;
			_lvInfo = lvInfo;
		}
		
		public function clone():BattlePet
		{
			return new BattlePet(_id, _name, _phase, _lvInfo);
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get lvInfo():BattlePetLvDefine
		{
			return _lvInfo;
		}
		
		public function get phase():int
		{
			return _phase;
		}
		
	}
}