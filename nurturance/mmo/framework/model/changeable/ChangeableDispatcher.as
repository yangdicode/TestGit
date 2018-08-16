package mmo.framework.model.changeable
{
	import flash.events.EventDispatcher;
	
	public class ChangeableDispatcher extends EventDispatcher
	{
		private static var _instance:ChangeableDispatcher;
		
		private var changeableObjects:Array = [];
		
		public function ChangeableDispatcher()
		{
		}
		
		public static function get instance():ChangeableDispatcher
		{
			if(_instance == null){
				_instance = new ChangeableDispatcher();
			}
			return _instance;
		}
				
		public function disChangedObject(cobject:IChangeableObject,property:String, orgValue:Object
								, newValue:Object):void
		{
			var params:Object = {"property":property, "orgValue":orgValue, "newValue": newValue};
			this.dispatchEvent(new ChangeableEvent(ChangeableEvent.onObjectPropertyChanged,
				cobject, params));
		}
	}
}