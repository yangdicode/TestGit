package mmo.common
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class DragSetting
	{
		private var spriteObj:Sprite;

		public function DragSetting(obj:Sprite)
		{
			spriteObj=obj;
			spriteObj.addEventListener(MouseEvent.MOUSE_DOWN, btnDown);
			spriteObj.addEventListener(MouseEvent.MOUSE_UP, btnUp);
		}
		
		public function stopDrag()
		{
			spriteObj.removeEventListener(MouseEvent.MOUSE_DOWN, btnDown);
			spriteObj.removeEventListener(MouseEvent.MOUSE_UP, btnUp);
		}
		
		public function startDrag()
		{
			spriteObj.addEventListener(MouseEvent.MOUSE_DOWN, btnDown);
			spriteObj.addEventListener(MouseEvent.MOUSE_UP, btnUp);
		}	
		
		
		private function btnDown(evt:MouseEvent):void
		{
			evt.stopPropagation();
			if(spriteObj.mouseY<60)
			{
				spriteObj.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);				
            	spriteObj.startDrag();
            }
		}
		
		private function onRemoveFromStage(evt:Event):void{
			spriteObj.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			spriteObj.stopDrag();
		}
				
		private function btnUp(evt:MouseEvent):void
		{
			spriteObj.stopDrag();
		}
	}
}