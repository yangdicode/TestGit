package mmo.framework.domain.collegeprofession
{
	public class CollegeProfessionDefine
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _arrayDailyTaskIds:Array;
		private var _arrayChallengeTaskIds:Array;
		
		public function CollegeProfessionDefine(id:int,name:String,desc:String,strDailyTaskIds:String,strChallengeTaskIds:String)
		{			
			_id = id;
			_name = name;
			_desc = desc;
			_arrayDailyTaskIds = strDailyTaskIds.split(",");
			_arrayChallengeTaskIds = strChallengeTaskIds.split(",");
		}
				
		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get arrayDailyTaskIds():Array
		{
			return _arrayDailyTaskIds;
		}

		public function get arrayChallengeTaskIds():Array
		{
			return _arrayChallengeTaskIds;
		}

	}
}