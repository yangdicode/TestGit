package mmo.framework.domain.halos
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.player.PlayerLights;

	public class HaloLightInfo
	{
		private var _halo:Halo;
		private var _colorId:int;
		private var _frameAId:int;
		private var _frameBId:int;
		private var _endData:Number;
		
		public function HaloLightInfo(haloId:int, colorId:int = 1, frameAId:int = 0, frameBId:int = 0, endData:Number = 0){
			_halo = PlayerLights.getHaloById(haloId);
			_colorId = colorId;
			_frameAId = frameAId;
			_frameBId = frameBId;
			_endData = endData;
		}
		
		public static function get emptyLightInfo():HaloLightInfo{
			return new HaloLightInfo(0, 0);
		}
		
		public static function buildByUserVar(userVariable:String):HaloLightInfo{
			if(StringUtil.isEmpty(userVariable)){
				return emptyLightInfo;
			}
			var params:Array = userVariable.split(",");
			return new HaloLightInfo(int(params[0]), int(params[1]), int(params[2]), int(params[3]), Number(params[4]));
		}
		
		public function get isUseingHalo():Boolean{
			return _halo != null;
		}

		public function get halo():Halo
		{
			return _halo;
		}

		public function get colorId():int
		{
			return _colorId;
		}

		public function get frameAId():int
		{
			return _frameAId;
		}

		public function get frameBId():int
		{
			return _frameBId;
		}

		public function get endData():Number
		{
			return _endData;
		}
		
		public function toString():String{
			return _halo.id + "," + _colorId + "," + frameAId + "," + frameBId + "," + _endData;
		}


	}
}