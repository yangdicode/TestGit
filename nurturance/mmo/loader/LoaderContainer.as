package mmo.loader
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mmo.play.layer.LayerManager;
	
	public class LoaderContainer extends Sprite
	{
		public static const stageWidth:int = 960;
		public static const stageHeight:int = 560;
		
		public static var instance:LoaderContainer = new LoaderContainer();
		
		public function LoaderContainer()
		{
			instance = this;
			this.addEventListener(Event.ADDED_TO_STAGE, addToStage);
		}
		
		private function addToStage(evt:Event){
			this.removeEventListener(Event.ADDED_TO_STAGE, addToStage);
			
			LayerManager.init();
			addChild(LayerManager.container);
		}
	}
}