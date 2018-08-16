package mmo.framework.domain.top
{
	public class TopInfo implements ITopInfo
	{
		protected var _ranking:int;
		protected var _name:String;
		protected var _score:Number;
		protected var _ext:String;
		protected var _time:Number;
		protected var _up:int;
		
		public function TopInfo(serverParams:Object){
			_ranking = serverParams.rk + 1;
			_name = serverParams.un;
			_score = serverParams.score;
			_time = serverParams.time;
			_ext = serverParams.ext;
			_up = serverParams.up;
		}

		public function get ranking():int
		{
			return _ranking;
		}

		public function get name():String
		{
			return _name;
		}

		public function get score():Number
		{
			return _score;
		}

		public function get ext():String
		{
			return _ext;
		}

		public function get time():Number
		{
			return _time;
		}

		public function get up():int
		{
			return _up;
		}


	}
}