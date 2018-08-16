package mmo.play.material.plantitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.material.MaterialViewCreatorEvent;
	import mmo.play.viewloader.ViewLoader;
	
	public class PlantItemViewCreator extends EventDispatcher implements IMaterialViewCreator
	{
		private static const ViewClsPrefix:String = "mmo.plantitem.view";
		private static const ViewUrlPrefix:String = "plantitem/view";
		
		private var _resStorageType:ResStorageType;
		
		public function PlantItemViewCreator(resStorageType:ResStorageType=null)
		{
			this._resStorageType = resStorageType;
		}
		
		public function getView(id:int):DisplayObject
		{
			var thisObj:PlantItemViewCreator = this;
			var onGetView:Function = function(content:DisplayObject):void
			{
				thisObj.dispatchEvent(new MaterialViewCreatorEvent(MaterialViewCreatorEvent.onGetView
					, id, {"view":content}));
			};
			
			ResScheduler.getResource(this.getViewUrl(id), onGetView, this.getClassName(id), null,
				null, ResPriority.NORMAL, true, this._resStorageType);
			return null;
		}
		
		public function getIcon(id:int, width:Number=0, height:Number=0):DisplayObject
		{
			if (width==0 && height==0)
			{
				return ViewLoader.instance.getViewCustom(this.getClassName(id), this.getViewUrl(id),
					width, height, null, this._resStorageType, null, null, false, false);
			}
			
			return ViewLoader.instance.getViewCustom(this.getClassName(id), this.getViewUrl(id),
				width, height, null, this._resStorageType);
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