package mmo.interfaces.innertv
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IInnerTvService extends IDownloadInitService
	{
		function showRoleEdit():void;
		function getRolesData(callback:Function):void;
		function copyRolesData():void;
	}
}