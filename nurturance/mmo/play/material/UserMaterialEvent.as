package mmo.play.material
{
	import flash.events.Event;
	
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserMaterialEvent extends Event
	{
		public static const onQuantiyChange:String = "onQuantityChange";
		public static const onUsedUpChange:String = "onUsedUpChange";
		public function UserMaterialEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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

		private var _changeNum:int;

		public function get changeNum():int
		{
			return _changeNum;
		}

		public function set changeNum(value:int):void
		{
			_changeNum = value;
		}

	}
}