package mmo.play.material.display
{
	import flash.events.Event;
	
	import mmo.framework.domain.material.UserMaterial;
	
	public class MaterialDisplayEvent extends Event
	{
		public static const ON_CHOOSE_MATERIAL:String = "onChooseMaterial";
		public static const ON_SWITCH_TYPE:String = "onSwitchType";
		public static const ON_CLOSED:String = "onClosed";
		public function MaterialDisplayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		private var _userMaterial:UserMaterial;

		public function get userMaterial():UserMaterial
		{
			return _userMaterial;
		}

		public function set userMaterial(value:UserMaterial):void
		{
			_userMaterial = value;
		}

		private var _typeKey:String;

		public function get typeKey():String
		{
			return _typeKey;
		}

		public function set typeKey(value:String):void
		{
			_typeKey = value;
		}
		
		override public function clone():Event
		{
			var evt:MaterialDisplayEvent = new MaterialDisplayEvent(type, bubbles, cancelable);
			evt.userMaterial = _userMaterial;
			evt.typeKey = _typeKey;
			return evt;
		}	
	}
}