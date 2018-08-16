package mmo.util.component.filter.event {
	
	import flash.events.Event;

	public class FilterEvent extends Event {
		
		//~ constants ---------------------------------------------------------
		
		/**
		 * 选择了一种类型
		 */
		public static const SELECTED_A_TYPE:String = "onSelectAType";
		
		//~ fields ------------------------------------------------------------
		
		private var _params:Object;
		
		//~ public methods ----------------------------------------------------
		
		public function FilterEvent(type:String, params:Object = null) {
			super(type);
			this._params = params;
		}
		
		public function get params():Object {
			return this._params;
		}
		
		override public function clone():Event {
			return new FilterEvent(type, this._params);
		}
		
	}
}