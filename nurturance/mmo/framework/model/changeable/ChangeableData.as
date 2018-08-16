package mmo.framework.model.changeable
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ChangeableData extends EventDispatcher implements IChangeableObject
	{
		private var _data:Object;
		
		public function ChangeableData()
		{
			super();
			_data = {};
		}
		
		public function dispose():void
		{
			_data = null;
		}
		
		public function setValue(property:String, value:Object):void
		{
			var orgValue:Object = null;
			if(_data.hasOwnProperty(property))
			{
				orgValue = _data[property];
			}	
			_data[property] = value;
			var params:Object = {"property":property, "orgValue":orgValue, "newValue":value};
			dispatchEvent(new ChangeableEvent(ChangeableEvent.onObjectPropertyChanged,
				this, params));
		}
		
		public function getValue(property:String):Object
		{
			return _data[property];
		}
	}
}