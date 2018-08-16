package mmo.framework.model.changeable
{
	import flash.events.IEventDispatcher;
	
	public interface IChangeableCollection extends IEventDispatcher
	{
		/**
		 * 获取所有子集 
		 * @return 
		 * 
		 */
		function getObjects():Array;
		
		function addObject(value:IChangeableObject):void;
		
		function removeObject(value:IChangeableObject):void;
	}
}