package mmo.framework.domain.dreamcard
{
	public class DreamCardSubject
	{
		private var _id:int;
		private var _name:String;
		private var _bonusName:String;
		private var _bonus:String;
		private var _bonusOneoff:int;
		
		public function DreamCardSubject(id:int, name:String, bonusName:String, 
			bonus:String, bonusOnoeff:int){
			_id = id;
			_name = name;
			_bonusName = bonusName;
			_bonus = bonus;
			_bonusOneoff = bonusOnoeff;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get bonus():String
		{
			return _bonus;
		}

		public function get bonusName():String
		{
			return _bonusName;
		}

		public function get bonusOneoff():int
		{
			return _bonusOneoff;
		}


	}
}