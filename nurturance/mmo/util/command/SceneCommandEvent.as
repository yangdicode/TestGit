package mmo.util.command {
	
	import flash.events.Event;

	public final class SceneCommandEvent extends Event {
		
		//~ constants ---------------------------------------------------------
		
		public static const SUCCEED:String = "onCommandSucceed";
		
		public static const FAILED:String = "onCommandFailed"; 
		
		public static const CANCELED:String = "onCommandCanceled";
		
		//~ fields ------------------------------------------------------------
		
		private var _params:Object;
		
		private var _command:ISceneCommand;
		
		//~ public methods ----------------------------------------------------
		
		public function SceneCommandEvent(type:String, command:ISceneCommand, params:Object = null) {
			super(type);
			this._command = command;
			this._params = params;
		}
		
		public function get params():Object {
			return this._params;
		}
		
		public function get command():ISceneCommand {
			return this._command;
		}
		
	}
}