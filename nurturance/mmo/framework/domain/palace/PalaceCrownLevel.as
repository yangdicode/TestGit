package mmo.framework.domain.palace
{
	public class PalaceCrownLevel
	{
		private var _id:int;
		private var _level:int;
		private var _gloryPower:int;
		private var _goodsId:int;
		
		public function PalaceCrownLevel(id:int, level:int, gloryPower:int, goodsId:int)
		{
			this._id = id;
			this._level = level;
			this._gloryPower = gloryPower;
			this._goodsId = goodsId;
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get level():int
		{
			return this._level;
		}
		
		public function get gloryPower():int
		{
			return this._gloryPower;
		}
		
		public function get goodsId():int
		{
			return this._goodsId;
		}
		
		public function get isMaxLevel():Boolean
		{
			if (this._level == PalaceDataFacade.getMaxPalaceCrownLevel(this._id))
			{
				return true;
			}
			return false;
		}
	}
}