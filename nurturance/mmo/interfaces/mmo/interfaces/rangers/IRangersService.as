package mmo.interfaces.rangers
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface IRangersService extends IDownloadInitService
	{
		/**
		 * 进入星灵物语
		 */		
		function enterRangers(enterCall:Function = null):void;
		
		/**
		 * 显示获得星灵
		 */		
		function showGainRanger(urIds:Array, callBack:Function = null):void;
		
		
		function getRangerView(id:int, width:Number = 0, height:Number = 0):DisplayObject;
		
		/**
		 * 是否通过某关
		 * @param missionId 关卡id
		 */		
		function hasFinisMission(missionId:int):Boolean;
		
		function showPanel(key:String, params:* = null):void;
		
		function test():void;
	}
}