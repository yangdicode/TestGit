package mmo.play.tips
{
	import flash.display.InteractiveObject;
	
	import mmo.loader.scheduler.ResStorageType;
	
	public class TipsInfoClass extends TipsInfoCustom
	{
		private var _cls:Class;
		
		public function TipsInfoClass(content:InteractiveObject, cls:Class, params:Object, delay:uint, deltaX:int, deltaY:int, tipsType:int){
			super(content, "", "", params, delay, deltaX, deltaY, tipsType, null);
			_cls = cls;
		}
		
		public function get cls():Class{
			return _cls;
		}
		
	}
}