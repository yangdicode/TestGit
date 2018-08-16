package mmo.nurturance.gamemanager.entity
{
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;

	public class NurGameDefine
	{
		private var _id:int;
		private var _name:String;
		private var _startDate:String;
		private var _endDate:String;
		private var _isOnline:int;
		
		public function NurGameDefine(id:int, name:String, startDate:String, endDate:String, isOnline:int)
		{
			_id = id;
			_name = name;
			_startDate = startDate;
			_endDate = endDate;
			_isOnline = isOnline;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get startDate():String
		{
			return _startDate;
		}

		public function get endDate():String
		{
			return _endDate;
		}
		
		public function get chapterCount():int
		{
			return NurDefinesProvider.getTotalChapterNum(_id);
		}

		public function get isOnline():int
		{
			return _isOnline;
		}

	}
}