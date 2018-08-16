package mmo.interfaces.fbservice
{
	import flash.events.IEventDispatcher;
	
	public interface IFBStep extends IEventDispatcher
	{
		/**
		 * 开始步骤 
		 */		
		function start():void;
		/**
		 * 中断步骤。 
		 */		
		function cancel():void;
		/**
		 * 进入该场景的时候需要初始化的东西。 
		 */
		function initScene():void;
		/**
		 * 离开该步骤对应的场景的时候执行的东西。
		 */
		function clearScene():void;
		/**
		 * 该步骤的Key。 
		 */
		function get key():String;
	}
}