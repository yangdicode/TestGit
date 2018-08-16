package mmo.nurturance.gamemanager.entity
{
	public class NurEndingDefine
	{
		private var _gameId:int;
		private var _id:int;
		private var _name:String;
		private var _type:int;
		private var _limit:String;
		
		public function NurEndingDefine(gameId:int, id:int, name:String, type:int, limit:String)
		{
			_gameId = gameId;
			_id = id;
			_name = name;
			_type = type;
			_limit = limit;
			
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

		public function get type():int
		{
			return _type;
		}

		public function get limit():String
		{
			return _limit;
		}

	}
}