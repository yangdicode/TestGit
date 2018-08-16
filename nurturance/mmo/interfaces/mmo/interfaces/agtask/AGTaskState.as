package mmo.interfaces.agtask
{
	public class AGTaskState
	{
		private var _id:int;
		private var _canFinish:Boolean;
		private var _hadFinish:Boolean;
		
		public function AGTaskState(id:int, canFinish:Boolean, hadFinish:Boolean)
		{
			_id = id;
			_canFinish = canFinish;
			_hadFinish = hadFinish;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get canFinish():Boolean
		{
			return _canFinish;
		}
		
		public function get hadFinish():Boolean
		{
			return _hadFinish;
		}
		
		public function set canFinish(canfinish:Boolean):void
		{
			_canFinish = canfinish;
		}
		
		public function set hadFinish(hadfinish:Boolean):void
		{
			_hadFinish = hadfinish;
		}
		
	}
}