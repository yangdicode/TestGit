package mmo.framework.view
{
	import flash.display.DisplayObject;

	public interface IMediator
	{
		function initialize():void
		function get view():DisplayObject;
		function set view(_view:DisplayObject):void;
		function dispose():void
	}
}