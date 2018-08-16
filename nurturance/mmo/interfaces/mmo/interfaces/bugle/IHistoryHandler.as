package mmo.interfaces.bugle
{
	import flash.display.Sprite;
	
	public interface IHistoryHandler
	{
		function initHandler(view:Sprite, showTab:int = 0):void;
		function open():void;
		function close():void;
	}
}