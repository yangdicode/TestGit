package mmo.play.material.clothes
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.viewloader.ViewContainer;
	import mmo.play.viewloader.ViewLoader;
	
	public class ClothesViewCreator implements IMaterialViewCreator
	{
		public static const SKETCH_FILEPATH:String = "clothes/";
		private static const sketchClass:String = "#id#_A";
		
		
		private var _resStorageType:ResStorageType;
		/**
		 * resStorageType 如果为null表示 ResStorageType.PERSISTENT
		 * 即资源加载到主域
		 * 
		 * */
		public function ClothesViewCreator(resStorageType:ResStorageType = null)
		{
			_resStorageType = resStorageType;
		}
		
		public function getView(id:int):DisplayObject
		{
			throw new Error(this + "invalid method!!!!");
		}
		
		public function getIcon(id:int,width:Number = 0,height:Number = 0):DisplayObject
		{
			var className:String = sketchClass.replace("#id#",this.getFormatedId(id));
			var url:String = SKETCH_FILEPATH +  this.getFormatedId(id);
			var vl:ViewContainer = ViewLoader.instance.getViewCustom(className, url, width, height, null, _resStorageType);
			return vl;
		}
		
		/**
		 * 此方法在getIcon的基础上可支持删除命名为“bg”的元件，主要为了删除衣服图标的底板
		 * */
		public function getIconWithoutBg(id:int,width:Number = 0,height:Number = 0,needRemoveBg:Boolean =  true):DisplayObject
		{
			var className:String = sketchClass.replace("#id#",this.getFormatedId(id));
			var url:String = SKETCH_FILEPATH +  this.getFormatedId(id);
			var vl:ViewContainer = ViewLoader.instance.getViewCustom(className, url, width, height, null, _resStorageType,setViewByParams,{"needRemoveBg":needRemoveBg});
			return vl;
		}
		
		private function setViewByParams(content:Sprite,param:Object):void
		{
			if(param!=null && param.needRemoveBg)
			{

				if(content!=null && content["bg"]!=null)
				{
					content.removeChild(content["bg"] as DisplayObject);
				}
			}
		}
		
		private function getFormatedId(id:int):String
		{
			var format:String = "a000000";
			var idString:String = id.toString();
			return format.substr(0, format.length - idString.length ) + idString;
		}
		
		
	}
}