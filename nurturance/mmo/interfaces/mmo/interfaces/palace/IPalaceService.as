package mmo.interfaces.palace
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IPalaceService extends IDownloadInitService
	{
		function joinPalace(partaker:String, palaceId:int):void;
		
		function enterPalace():void;
		
		function enterPalaceSelect():void;
		
		function showPalacePrivilege():void;
		
		function showPalaceRank(type:int=1):void;
		
		function buyToken():void;
		
		function showGloryCrown(crownId:int=1):void;
		
		function showGloryCrownPreview(crownId:int=1):void;
		
		function showMailBox():void;
		
		function showTalk():void;
		
		function grabBlessBag(partaker:String, type:int, blessBagId:int):void;
		
		function showTemp():void;
	}
}