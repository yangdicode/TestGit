package mmo.interfaces.notify
{
	import mmo.interfaces.IService;
	
	public interface IOfflineMsgService extends IService
	{
		function initOfflineMsgs():void;
	}
}