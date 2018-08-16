package mmo.framework.domain.union
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.union.events.UnionEvent;

	public class UnionChangeable extends EventDispatcher
	{
		
		private var _protetys:Object = {};
		
		public function UnionChangeable(){
		}
		
		public function setProperty(key:String, value:*):void{
			var old:* = _protetys[key];
			if(old == value){
				return;
			}
			_protetys[key] = value;
			notifyObjectChange({"key":key, "oldValue":old, "newValue":value});
		}
		
		final protected function getProperty(key:String):*{
			return _protetys[key];
		}
		
		protected function notifyObjectChange(params:Object):void{
			var event:UnionEvent = new UnionEvent(UnionEvent.OnObjectChange, params);
			dispatchEvent(event);
		}
		
	}
}