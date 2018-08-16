package mmo.interfaces.jumpsoon
{
	import mmo.interfaces.IInitService;
	
	public interface IJumpSoonService extends IInitService
	{
		function checkCanJump():Boolean;
		function playJumpSoonMovie(playerName:String, action:String):void;
	}
}