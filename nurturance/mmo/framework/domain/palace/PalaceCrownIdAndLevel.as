package mmo.framework.domain.palace
{
	public class PalaceCrownIdAndLevel
	{
		private var _id:int;
		private var _level:int;
		
		public function PalaceCrownIdAndLevel(id:int, level:int)
		{
			this._id = id;
			this._level = level;
		}
		
		public static function parse(info:Object):PalaceCrownIdAndLevel
		{
			return new PalaceCrownIdAndLevel(info.cid, info.clv);
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get level():int
		{
			return _level;
		}

		public function set level(value:int):void
		{
			_level = value;
		}
		
		public function get info():PalaceCrown
		{
			return PalaceDataFacade.getPalaceCrown(this._id);
		}
		
		public function get levelInfo():PalaceCrownLevel
		{
			return PalaceDataFacade.getPalaceCrownLevel(this._id, this._level);
		}
	}
}