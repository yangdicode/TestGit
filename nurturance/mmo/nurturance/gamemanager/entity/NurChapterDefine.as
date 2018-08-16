package mmo.nurturance.gamemanager.entity
{
	public class NurChapterDefine
	{
		private var _gameId:int;
		private var _id:int;
		private var _name:String;
		
		public function NurChapterDefine(gameId:int, id:int, name:String)
		{
			_gameId = gameId;
			_id = id;
			_name = name;
			
		}

		public function get gameId():int
		{
			return _gameId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

	}
}