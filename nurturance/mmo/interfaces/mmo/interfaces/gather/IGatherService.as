package mmo.interfaces.gather
{
	import flash.display.InteractiveObject;
	import flash.geom.Point;
	
	import mmo.interfaces.IInitService;

	public interface IGatherService extends IInitService
	{
		/**
		 * 注册场景中可采集的资源，点击后自动执行采集动作  
		 * @param resourceId
		 * @param target 点击对象
		 */
		function registerGatherMaterial(resourceId:int, target:InteractiveObject):void;
		
		/**
		 * 是否正要采集 
		 * @return 
		 */
		function get isCollecting():Boolean;	
		
		/**
		 * 判断是否可以升阶
		 */		
		function isCanPhaseUp():Boolean;
		
		/**
		 * 显示采集阶段升级面板
		 */		
		function showPhaseUpPanel():void;
	}
}