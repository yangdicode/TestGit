package mmo.interfaces.control
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IInitService;
	
	public interface ITeamControlBarService extends IInitService
	{
		function get view():Sprite;
		function show(parent:Sprite, x:Number = 0, y:Number = 0):void
		function hide():void	
	}
}