package mmo.framework.domain.scenebonus
{
	public class SceneBonusData
	{
		private static var _instance:SceneBonusData;
		private var stateArr:Array = [];
		
		public function SceneBonusData()
		{
		}
		
		public static function get instance():SceneBonusData
		{
			if(_instance == null)
				_instance = new SceneBonusData();
			return _instance;
		}
		
		public function setDone(id:int):void
		{
			stateArr[id] = 1;
		}
		
		public function hasDone(id:int):Boolean
		{
			if(stateArr[id] == 1)
				return true;
			else
				return false;
		}
	}
}