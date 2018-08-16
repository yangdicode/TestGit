package mmo.play.material.petitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	
	import mmo.framework.domain.petbreeding.PetBreedingDomain;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.material.IMaterialViewCreator;
	import mmo.play.material.MaterialViewCreatorEvent;
	import mmo.play.viewloader.ViewLoader;
	
	public class PetItemViewCreater extends EventDispatcher implements IMaterialViewCreator
	{
		public static const iconClassName:String = "mmo.petitem.Icon";
		public static  const iconFileName:String = "petbreeding/petitem/petitem";
		public static  const viewClassName:String = "mmo.petitem.View";
		public static  const viewFileName:String = "petbreeding/petitem/petitem";
		private static var _instance:PetItemViewCreater;
		
		public static function get instance():PetItemViewCreater
		{
			if(_instance == null)
			{
				_instance = new PetItemViewCreater(PetBreedingDomain.myDomain);
			}
			return _instance;
		}		
		
		private var _domain:ApplicationDomain;
		public function PetItemViewCreater(domain:ApplicationDomain)
		{
			_domain = domain;
		}
		
		/**
		 * @return null， 自己监听事件:MaterialViewCreatorEvent.onGetView
		 */
		public function getView(id:int):DisplayObject
		{
			var _resStorageType:ResStorageType = new ResStorageType(_domain);
			ResScheduler.getResource(viewFileName + id.toString(), onGetView, viewClassName + id.toString(), null,
				null, ResPriority.NORMAL, false, _resStorageType);
			return null;
		}
		
		public function getIcon(id:int, width:Number=0, height:Number=0):DisplayObject
		{
			var _resStorageType:ResStorageType = new ResStorageType(_domain);
			return ViewLoader.instance.getViewCustom(iconClassName + id.toString(), iconFileName + id.toString(),
				width, height, null, _resStorageType);
		}
		
		private function onGetView(content:DisplayObject):void
		{
			this.dispatchEvent(new MaterialViewCreatorEvent(MaterialViewCreatorEvent.onGetView
				, this.getObjId(content), {"view":content}));
		}
		
		private function getObjId(content:*):int
		{
			var className:String = getQualifiedClassName(content);
			// 第一个数字的索引
			for(var i:int = 0; i < className.length; i++){
				var str:String = className.charAt(i);
				if(str >= "0" && str <= "9"){
					break;
				}
			}
			var startIndex:int = i;
			if(i >= className.length){
				startIndex = className.length -1;
			}
			
			return parseInt(className.substring(startIndex));
		}
	}
}