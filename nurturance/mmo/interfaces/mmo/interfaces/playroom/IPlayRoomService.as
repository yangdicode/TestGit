package mmo.interfaces.playroom
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IPlayRoomService extends IDownloadInitService
	{
		function showPlayRoom():void;
		
		function joinGameRoom(roomId:int, gameName:String):void;
		
		function get curPlayerExp():int;
		
		function showTemp():void;
	}
}