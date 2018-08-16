package mmo.play.tips {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import mmo.common.effect.popup.PopUpEffect;
	import mmo.loader.LoaderContainer;
	import mmo.loader.scheduler.ResStorageType;
	

	public class TipsInfo {
		//~ constants ---------------------------------------------------------
		
		/** 不同类型的Tips，字体颜色有所不同 */
		private static const titleColorMap:Array = [uint(0x000000),uint(0xFF0000)];
		
		//~ fields ------------------------------------------------------------
		
		/** 显示的元件 */
		private var _content:InteractiveObject;
		
		/** 提示语 */
		private var _message:String;
		
		/** 延迟时间 */
		private var _delay:uint;
		
		/** 位置偏移量 */
		private var _deltaX:int;
		private var _deltaY:int;
		
		/** Tips 的类型 */
		protected var _tipsType;
		
		/** 特效 */
		protected var _effect:Object;
		/** 回调函数 */
		protected var _callback:Function;
		
		//~ public methods ----------------------------------------------------
		
		public function TipsInfo(content:InteractiveObject, message:String, delay:uint, deltaX:int, deltaY:int, tipsType:int) {
			this._content = content;
			this._message = message;
			this._delay = delay;
			this._deltaX = deltaX;
			this._deltaY = deltaY;
			this._tipsType = tipsType;
		}
		
		public function get content():InteractiveObject {
			return this._content;
		}
		
		public function get message():String {
			return this._message;
		}
		
		public function get delay():uint {
			return this._delay;
		}
		
		public function get deltaX():int {
			return this._deltaX;
		}
		
		public function get deltaY():int {
			return this._deltaY;
		}
		
		public function get className():String {
			return "mmo.play.tips.tipsres.TipsView";
		}
		
		public function get fileName():String {
			return "library_res/common_res_tips";
		}
		
		public function get titleColor():uint{
			return titleColorMap[this._tipsType];
		}
		
		public function get resStorageType():ResStorageType{
			return null;
		}
		
		public function popUp(container:DisplayObjectContainer, 
				content:DisplayObject, 
				fromX:int, fromY:int, 
				toX:int, toY:int,
				callback:Function = null):void {
			this._callback = callback;
			var targetPoint:Point = getTargetPoint(toX, toY, content);
			this._effect = new PopUpEffect(container, content, fromX, fromY, targetPoint.x, targetPoint.y, 0.2, afterPop);
//			trace("------popUp");
		}
		
		public function stopPop():void {
			if(this._effect != null) {
				this._effect["dispose"]();
				this._effect = null;
			}
			this._callback = null;
		}
		
		//~ private methods ---------------------------------------------------
		
		private function afterPop(content:DisplayObject):void {
//			trace("-----afterPop");
			if(this._callback != null) {
				this._callback.apply(null, [content]);
			}
			stopPop();
		}
		
		private function getTargetPoint(tx:int, ty:int, content:DisplayObject):Point
		{
			var bounds:Rectangle = content.getBounds(content);
			if (tx + bounds.left < 0)
			{
				tx = -bounds.left;
			}
			if (tx + bounds.right > LoaderContainer.stageWidth)
			{
				tx = LoaderContainer.stageWidth - bounds.right;
			}
			
			if (ty + bounds.top < 0)
			{
				ty = -bounds.top;
			}
			if (ty + bounds.bottom > LoaderContainer.stageHeight)
			{
				ty = LoaderContainer.stageHeight - bounds.bottom;
			}
			
			return new Point(tx, ty);
		}

	}
}