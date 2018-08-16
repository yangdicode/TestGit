package mmo.interfaces.party
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IPartyService extends IDownloadInitService
	{
		function showEntrance():void;
		
		function tryEnterParty(roomId:int, type:int):void;
		
		function tryEnterActivityParty(type:int, params:* = null):void;
		
		function execute(key:String, params:* = null):void;
		
	}
}