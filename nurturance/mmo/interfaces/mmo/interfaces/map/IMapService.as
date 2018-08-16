package mmo.interfaces.map
{
	import mmo.interfaces.IInitService;
	
	public interface IMapService extends IInitService
	{
		/** 显示地图 **/
		function show():void;
		/** 关闭地图 **/
		function close():void;
		
		/** 添加阻止进去场景对象 **/
		function addMapCanceler( mapCanceler:IMapCancel ):void;

		/** 撤销阻止进去场景对象 **/
		function removeMapCanceler( mapCanceler:IMapCancel ):void;
			
	}
}