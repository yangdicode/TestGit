package mmo.framework.model.changeable
{
	import flash.events.Event;
	
	/**
	 *  对象属性改变事件 
	 * @author hekehui
	 * 
	 */
	public class PropertyChangeEvent extends Event
	{
		/**
		 * 属性发生改变 
		 */
		public static const onPropertyChanged = "onPropertyChanged";
		
		private var _property:String;
		private var _orgValue:Object;
		private var _newValue:Object;
		
		public function PropertyChangeEvent(type:String, property:String, orgValue:Object, newValue:Object
			,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._property = property;
			this._orgValue = orgValue;
			this._newValue = newValue;
		}
		
		public function get property():String
		{
			return this._property;
		}
		
		public function get orgValue():Object
		{
			return this._orgValue;
		}
		
		public function get newValue():Object
		{
			return this._newValue;
		}
	}
}