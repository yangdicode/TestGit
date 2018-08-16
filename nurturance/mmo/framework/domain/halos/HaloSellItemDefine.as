package mmo.framework.domain.halos
{
	public class HaloSellItemDefine
	{
		private var _index:int;
		private var _name:String;
		private var _haloId:int;
		private var _colorId:int;
		private var _mainFrameId:int;
		private var _sideFrameId:int;
		
		public function HaloSellItemDefine(index:int, name:String, haloId:int, colorId:int, mainFrameId:int, sideFrameId:int )
		{
			_index = index;
			_name = name;
			_haloId = haloId;
			_colorId = colorId;
			_mainFrameId = mainFrameId;
			_sideFrameId = sideFrameId;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get haloId():int
		{
			return _haloId;
		}
		
		public function get colorId():int
		{
			return _colorId;
		}
		
		public function get mainFrameId():int
		{
			return _mainFrameId;
		}
		
		public function get sideFrameId():int
		{
			return _sideFrameId;
		}		

	}
}