package mmo.framework.model.changeable
{
	import flash.events.Event;

	public class ChangeableEvent extends Event
	{
		/**
		 * 加入容器 
		 */
		public static const onAddObject:String = "onAddObject";
		/**
		 * 从容器中删除 
		 */
		public static const onRemoveObject:String = "onRemoveObject";
		
		/**
		 * 子对象属性发生改变
		 * object:IChangeableObject
		 * property:string
		 * orgValue:object
		 * newValue :object
		 */
		public static const onObjectPropertyChanged:String = "onObjectPropertyChanged";
		
		private var _object:IChangeableObject;
		private var _params:Object; 
		
		public function ChangeableEvent(type:String
			, object:IChangeableObject, params:Object
			, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._object = object;
			this._params = params;
		}
		
		public function get object():IChangeableObject
		{
			return this._object;
		}
		
		public function get params():Object
		{
			return this._params;
		}
	}
}