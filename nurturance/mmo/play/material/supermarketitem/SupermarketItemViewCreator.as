package mmo.play.material.supermarketitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.viewloader.ViewLoader;
	
	public class SupermarketItemViewCreator extends EventDispatcher implements IMaterialViewCreator
	{
		private static const ViewClsPrefix:String = "mmo.supermarketitem.view";
		private static const ViewUrlPrefix:String = "supermarketitem/view";
		
		public function SupermarketItemViewCreator()
		{
		}
		
		public function getView(id:int):DisplayObject
		{
			return null;
		}
		
		public function getIcon(id:int, width:Number=0, height:Number=0):DisplayObject
		{
			return ViewLoader.instance.getViewCustom(this.getClassName(id), this.getViewUrl(id),
				width, height, null, SceneDomainResLoader.resStoryageType);
		}
		
		public function getViewCallback(id:int, onGetView:Function, width:Number=0, height:Number=0):DisplayObject
		{
			return ViewLoader.instance.getViewCustom(this.getClassName(id), this.getViewUrl(id),
				width, height, null, SceneDomainResLoader.resStoryageType, onGetView);
			
//			ResScheduler.getResource(this.getViewUrl(id), function(content:*):void{
//				onGetView.apply(null, [id, content]);
//			}, this.getClassName(id), null,
//				null, ResPriority.NORMAL, true, SceneDomainResLoader.resStoryageType);
		}
		
		private function getClassName(id:int):String
		{
			return ViewClsPrefix + id.toString();
		}
		
		private function getViewUrl(id:int):String
		{
			return ViewUrlPrefix + id.toString();
		}
	}
}