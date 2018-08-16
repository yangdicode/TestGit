package mmo.framework.domain.clothesdesign
{
	public class ClothesDesignLevel
	{
		private var _level:int;
		private var _experience:int;
		private var _energyIncrement:int;
		
		public function ClothesDesignLevel(level:int, experience:int, energyIncrement:int){
			_level = level;
			_experience = experience;
			_energyIncrement = energyIncrement;
		}

		public function get level():int
		{
			return _level;
		}

		public function get experience():int
		{
			return _experience;
		}

		public function get energyIncrement():int
		{
			return _energyIncrement;
		}

	}
}