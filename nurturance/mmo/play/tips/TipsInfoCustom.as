package mmo.play.tips
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	
	import mmo.loader.scheduler.ResStorageType;

	public class TipsInfoCustom extends TipsInfo
	{
		private var _customFile:String;
		private var _customClass:String;
		private var _params:Object;
		private var _resStorageType:ResStorageType;
		
		public function TipsInfoCustom(content:InteractiveObject, 
				customFile:String,customClass:String,params:Object,delay:uint, 
				deltaX:int, deltaY:int, tipsType:int, resStorageType:ResStorageType) 
		{
			super(content, "", delay, deltaX, deltaY, tipsType);
			this._customFile = customFile;
			this._customClass = customClass;
			this._params = params;
			this._resStorageType;
		}
		
		override public function get fileName():String {
			return _customFile;
		}
		
		override public function get className():String {
			return _customClass;
		}
		
		public function get params():Object
		{
			return this._params;
		}

		override public function get resStorageType():ResStorageType
		{
			return _resStorageType;
		}

	}
}