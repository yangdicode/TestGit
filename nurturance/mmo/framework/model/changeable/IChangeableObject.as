package mmo.framework.model.changeable
{
	import flash.events.IEventDispatcher;
	
	public interface IChangeableObject extends IEventDispatcher
	{
		function setValue(property:String, value:Object):void;
		function getValue(property:String):Object;
	}
}