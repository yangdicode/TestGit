package mmo.play.eventdispatcher
{
	import flash.events.EventDispatcher;

	public class CommonModel extends EventDispatcher
	{
		public function CommonModel()
		{
		}
		
		public function initData():void{
			
		}
		
		final protected function onInitEve():void{
			this.dispatchEvent(new CommonModelEvent(CommonModelEvent.ON_INIT));
		}
		
		final protected function updateEve():void{
			this.dispatchEvent(new CommonModelEvent(CommonModelEvent.UPDATE));
		}
		
	}
}