package mmo.play.helper
{
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;

	public class SceneDomainResLoader
	{
		public static function get domain():ApplicationDomain{
			return ApplicationDomain.currentDomain;
		}
		
		public static function get resStoryageType():ResStorageType{
			return new ResStorageType(domain);
		}
		
		/**
		 * 下载资源
		 */		
		public static function loadRes(file:String, clsName:String, callBack:Function, priority:int=6):void{
			ResScheduler.getResource(file, callBack, clsName, function():void{}, null, priority, true, resStoryageType);
		}
		
		public static function cancelRes(file:String, event:Function=null):void{
			ResScheduler.cancel(file, event);
		}
		
		/**
		 * 预加载
		 */		
		public static function preLoadRes(file:String, clsName:String = ""):void{
			loadRes(file, clsName, function(content:DisplayObject):void{}, ResPriority.LOWEST);
		}
		
		/**
		 * 获得类定义;
		 * 建议for循环大量新建对象用getDef获得类再自行new实例，省掉check与get application的时间。
		 */		
		public static function getDefByName(clsName:String):Class{
			if (checkDefinition(clsName)){
				return domain.getDefinition(clsName) as Class;
			}
			return null;
		}
		
		/**
		 * 获得类实例;
		 * 建议for循环大量新建对象用getDef获得类再自行new实例，省掉check与get application的时间。
		 */
		public static function getResByName(clsName:String):*{
			var cls:Class = getDefByName(clsName);
			return new cls();
		}
		
		private static function checkDefinition(clsName:String):Boolean{
			if (domain!=null && domain.hasDefinition(clsName)){
				return true;
			}
			trace("该域没有找到资源" + clsName);
			return false;
		}
	}
}