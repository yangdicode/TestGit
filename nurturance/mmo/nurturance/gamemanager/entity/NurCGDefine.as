package mmo.nurturance.gamemanager.entity
{
	public class NurCGDefine
	{
		private var _gameId:int;
		private var _id:int;
		private var _desc:String;
		private var _lv:String;
		
		public function NurCGDefine(gameId:int, id:int, desc:String, lv:String)
		{
			_gameId = gameId;
			_id = id;
			_desc = desc;
			_lv = lv;
		}
		
		public function get gameId():int
		{
			return _gameId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get lv():String
		{
			return _lv;
		}
	}
}