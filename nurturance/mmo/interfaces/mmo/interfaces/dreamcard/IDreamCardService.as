package mmo.interfaces.dreamcard
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface IDreamCardService extends IDownloadInitService
	{
		function enterDreamShop():void;
		function showCardBag(userName:String=null):void;
		function getUserDreamCardIds(callback:Function, userName:String=null):void;
		
		function showResultMain():void;
		function showBonus():void;
		function showDetail():void;
		
		function showCardBook():void;
		function showCardBookTop():void;
		function showCardDetal(cardId:int):void;
		
		function getDreamCard(cardId:int, callBack:Function = null):Sprite;
		/**
		 * UserDreamCardData
		 */		
		function getUserDreamCards(callBack:Function, userName:String):void;
	}
}