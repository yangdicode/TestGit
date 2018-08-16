package mmo.interfaces.twingift
{
	import mmo.interfaces.IInitService;

	public interface ITwinGiftService extends IInitService
	{
		function showMainPanel():void;
		function showCreatePanel():void;
		function getSendGiftInfo(userName:String, offset:int, limit:int, callBack:Function):void;
		function getReceiveGiftInfo(userName:String, offset:int, limit:int, callBack:Function):void;
	}
}