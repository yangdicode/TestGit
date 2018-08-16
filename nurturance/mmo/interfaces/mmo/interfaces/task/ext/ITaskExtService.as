package mmo.interfaces.task.ext
{
	import flash.events.IEventDispatcher;
	
	import mmo.interfaces.IService;
	
	public interface ITaskExtService extends IService
	{
		/**
		 * 初始化
		 * 
		 */
		function init():void;
		/**
		 * 释放 
		 * 
		 */
		function clear():void;
	}
}