package mmo.interfaces.control
{
	import mmo.interfaces.IService;
	
	public interface IMapService extends IService
	{
		/**
		 * 显示地图 
		 * 
		 */		
		function show():void;
	}
}