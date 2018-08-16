package mmo.framework.domain.skill.stuff
{
	/**
	 * 材料图鉴数据
	 * @author liyawei
	 */	
	
	public class StuffMap
	{
		private var _stuffMapId:int;
		private var _stuffName:String;
		private var _stuffRace:String;
		private var _stuffLevel:int;
		private var _stuffFrom:Array;
		
		public function StuffMap(stuffMapId:int,stuffName:String,stuffRace:String,
								   stuffLevel:int,stuffFrom:String)
		{
			this._stuffMapId = stuffMapId;
			this._stuffName = stuffName;
			this._stuffRace = stuffRace;
			this._stuffLevel = stuffLevel;
			this._stuffFrom = stuffFrom.split("，");
		}

		public function get stuffMapId():int
		{
			return _stuffMapId;
		}

		public function get stuffName():String
		{
			return _stuffName;
		}

		public function get stuffRace():String
		{
			return _stuffRace;
		}

		public function get stuffLevel():int
		{
			return _stuffLevel;
		}

		public function get stuffFrom():Array
		{
			return _stuffFrom;
		}


	}
}