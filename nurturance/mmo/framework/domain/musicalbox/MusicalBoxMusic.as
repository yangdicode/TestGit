package mmo.framework.domain.musicalbox
{
	public class MusicalBoxMusic
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		
		public function MusicalBoxMusic(info:Array)
		{
			_id = info[0];
			_name = info[1];
			_desc = info[2];
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


	}
}