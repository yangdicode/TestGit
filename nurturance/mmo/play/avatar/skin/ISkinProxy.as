package mmo.play.avatar.skin
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	import mmo.interfaces.IDispose;
	import mmo.play.avatar.SkinInfo;

	public interface ISkinProxy extends IEventDispatcher, IDispose
	{
		function loadSkin(isPriority:Boolean = false):void;
		function action(label:String):void;
		function get skinInfo():SkinInfo;
		function get displayObject():DisplayObject;
		function isSkin(skinNo:String):Boolean;
	}
}