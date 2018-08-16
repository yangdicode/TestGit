package mmo.interfaces.clothesdesign
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class CloDesEventDispatcher extends EventDispatcher
	{
		public static const instance:CloDesEventDispatcher = new CloDesEventDispatcher();
		
		public function CloDesEventDispatcher(target:IEventDispatcher=null){
			super(target);
		}
	}
}