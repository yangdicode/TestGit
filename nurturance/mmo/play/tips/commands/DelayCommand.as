package mmo.play.tips.commands {
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mmo.play.tips.TipsInfo;
	import mmo.util.command.ISceneCommand;
	import mmo.util.command.SceneSimpleCommand;
	
	public class DelayCommand extends SceneSimpleCommand implements ISceneCommand {
		
		//~ fields ------------------------------------------------------------
		
		private var _timer:Timer;
		
		private var _content:Object;
		
		//~ public methods ----------------------------------------------------
		
		public function DelayCommand() {
			super();
		}
		
		override public function execute(content:Object):void {
			this._content = content;
			
			var info:TipsInfo = content["info"] as TipsInfo;
			
			if(info.delay > 0) {
				this._timer = new Timer(info.delay, 1);
				this._timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
				this._timer.start();
			}
			else {
				onTimer(null);
			}
		}
		
		override public function cancel():void {
			dispose();
			super.cancel();
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onTimer(e:TimerEvent):void {
			succeed(this._content);
			
			dispose();
		}
		
		private function dispose():void {
			if(this._timer != null) {
				this._timer.stop();
				this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
				this._timer = null;
			}
			
			this._content = null;
		}
		
	}
}