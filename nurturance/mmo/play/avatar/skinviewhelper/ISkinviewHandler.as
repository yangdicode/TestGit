package mmo.play.avatar.skinviewhelper
{
	import flash.display.MovieClip;
	
	import mmo.interfaces.IDispose;

	public interface ISkinviewHandler extends IDispose
	{
		
		function refreshView(view:MovieClip,params:Object):void;
	}
}