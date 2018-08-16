package mmo.framework.domain.player
{
	public class ClothesLightData
	{
		private var _id:int;
		private var _name:String;
		private var _clothesStrs:String;
		private var _clothesIds:Array;
		private var _lightId:int;
		
		public function ClothesLightData(id:int, name:String, clothesIds:String, lightId:int){
			_id = id;
			_name = name;
			_clothesStrs = clothesIds;
			_clothesIds = clothesIds.split(";");
			_lightId = lightId;
		}
		
		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get clothesStrs():String
		{
			return _clothesStrs;
		}

		public function get clothesIds():Array
		{
			return _clothesIds;
		}

		public function get lightId():int
		{
			return _lightId;
		}

	}
}