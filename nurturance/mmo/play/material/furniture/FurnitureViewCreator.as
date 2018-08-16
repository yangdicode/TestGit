package mmo.play.material.furniture
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.material.MaterialViewCreatorEvent;
	import mmo.play.viewloader.ViewContainer;
	import mmo.play.viewloader.ViewLoader;
	
	/**
	 * 视图（缩略图）创建器 
	 * @author hekehui
	 * 
	 */
	public class FurnitureViewCreator extends EventDispatcher implements IMaterialViewCreator
	{
		private static const viewClass:String = "mmo.furniture.b#id#_C";
		private static const sketchClass:String = "mmo.furniture.b#id#_B";
		private static const roomClass:String = "mmo.furniture.b#id#_F";
		private static const roomUrl:String = "furniture/displayview/b";
		private static const houseClas:String = "mmo.furniture.b#id#_T";
		private static const furnitureUrlPrefix:String = "furniture/b";
		
		private var _resStorageType:ResStorageType;
		
		/**
		 * 默认为null 表示ResStorageType.PERSISTENT
		 * 
		 * */
		public function FurnitureViewCreator(resStorageType:ResStorageType = null)
		{
			_resStorageType = resStorageType;
		}
		
		public function getView(id:int):DisplayObject
		{
			var className:String = viewClass.replace("#id#", this.getFormatedId(id));	
			// 如果开启cach且物品是小屋，在下载view或sketch后，
			// 更换房型时getResource返回的是最后一次下载的view(sketch)，得不到house的文档类
			ResScheduler.getResource(this.getFurnitureUrl(id), function(content:*):void{
				
				onGetView(content, id);
				
			}, className, null, null, ResPriority.NORMAL, false, _resStorageType);
				
			return null;
		}
				
		private function onGetView(content:*, id:int):void
		{
			this.dispatchEvent(new MaterialViewCreatorEvent(MaterialViewCreatorEvent.onGetView, 
				id, {"view":content}));
		}
		
		public function getRoomView(id:int, width:Number = 0, height:Number = 0):void{
			var formatId:String = getFormatedId(id);
			var className:String = roomClass.replace("#id#", formatId);
			var url:String = roomUrl + formatId;
			ResScheduler.getResource(url, function(content:*):void{
				
				onGetView(content, id);
				
			}, className, null, null, ResPriority.NORMAL, 
				false, _resStorageType);
		}
		
		public function getHouseView(id:int, width:Number, height:Number = 0):DisplayObject{
			var formatId:String = getFormatedId(id);
			var className:String = houseClas.replace("#id#", formatId);
			var url:String = roomUrl + formatId;
			var vc:ViewContainer = ViewLoader.instance.getViewCustom(className, url, width, height, null, _resStorageType,null,null,false);
			return vc;	
		}
		
		public function getIcon(id:int, width:Number = 0, height:Number = 0):DisplayObject
		{
			var className:String = sketchClass.replace("#id#", this.getFormatedId(id));
			var vc:ViewContainer = ViewLoader.instance.getViewCustom(className, getFurnitureUrl(id), width, height, null, _resStorageType);
			return vc;	
		}	
				
		private function getFurnitureUrl(id:int):String
		{
			return furnitureUrlPrefix + this.getFormatedId(id);
		}
		
		private function getObjId(content:*):int
		{
			var className:String = getQualifiedClassName(content);
			className = className.replace("mmo.furniture::b", "");
			var index:int = className.indexOf("_");
			
			var idString:String = className.substring(0, index);
			var id:int =  new int(idString);
			return id;
		}
		
		private function getFormatedId(id:int):String
		{
			var format:String = "000000";
			var idString:String = id.toString();
			return format.substr(0, format.length - idString.length ) + idString;
		}
	}
}