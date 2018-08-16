package mmo.play.material.gitem
{
	import flash.display.DisplayObject;
	
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.viewloader.ViewContainer;
	import mmo.play.viewloader.ViewLoader;
	
	/**
	 * 每50个物品图标放在同一个文件中
	 * 例如 id（1-50） 放在 view1 中，
	 *      id (51-100) 放在 view2 中
	 * 		依此类推……
	 * */
	
	public class GItemViewCreator implements IMaterialViewCreator
	{
		private static const viewPrefix:String = "mmo.gitem.view";
		private static const viewUrl:String = "gitem/view"
			
		private static const viewIconCount:int = 50;
		
		private var itemId:int;
		private var _resStorageType:ResStorageType;
		public function GItemViewCreator(resStorageType:ResStorageType = null)
		{
			_resStorageType = resStorageType;
		}
		
		public function getView(itemId:int):DisplayObject
		{
			return null;	
		}
		
		public function getIcon(itemId:int,width:Number = 0,height:Number = 0):DisplayObject
		{
			this.itemId = itemId;
			
			var index:int = Math.floor((itemId-1)/viewIconCount) + 1;
			var url:String = viewUrl + index;
			
			var vl:ViewContainer = ViewLoader.instance.getViewCustom(this.getClassName(itemId),url,width,height, null, _resStorageType);
			return vl;
		}
				
		private function getClassName(id:int):String
		{
			return viewPrefix + id;
		}
	}
}