package mmo.interfaces.mail
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IService;

	public interface IMailService extends IService
	{
		function setControlBarButton(button:DisplayObject):void;
		function showMailUI();
		function getNewMailNum(callback:Function):void;
	}
}