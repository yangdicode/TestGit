package mmo.interfaces.resource
{
	import mmo.interfaces.IService;
	
	/**
	 * 资源下载Service 
	 * @author hekehui
	 * 
	 */
	public interface IResourceService extends IService
	{
		/**
		 * 下载资源，完成后必须分发ResourceServiceEvent.onLoaded事件 
		 * 
		 */		
		function load():void;
	}
}