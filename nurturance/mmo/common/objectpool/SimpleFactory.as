package mmo.common.objectpool {
	
	class SimpleFactory implements IObjectPoolFactory {
		
		private var _class:Class;
			
		public function SimpleFactory(C:Class) {
			this._class = C;
		}
		
		public function create():* {
			return new this._class();
		}
		
		public function dispose():void{
			_class = null;
		}
		
	}
	
}