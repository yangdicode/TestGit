package mmo.framework.domain.material.clothes
{
	public final class ClothesSuit
	{

		//~ fields ------------------------------------------------------------

		private var _suitId:int;

		private var _suitName:String;

		private var _clothesList:Array;

		//~ public methods ----------------------------------------------------

		public function ClothesSuit(suitId:int, suitName:String, clothesList:Array)
		{
			this._suitId = suitId;
			this._suitName = suitName;
			this._clothesList = clothesList;
		}

		public function get suitId():int
		{
			return this._suitId;
		}

		public function get suitName():String
		{
			return this._suitName;
		}

		public function get clothesList():Array
		{
			return this._clothesList;
		}

	}
}