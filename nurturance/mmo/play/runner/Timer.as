package mmo.play.runner
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Timer extends EventDispatcher
	{
		private var _timer:flash.utils.Timer;	
		public function Timer(delay:Number, repeatCount:int=0)
		{
			_timer = new flash.utils.Timer(delay, repeatCount);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
		}
		
		public function get currentCount():int
		{
			return _timer.currentCount;
		}	
		
		public function get delay():Number
		{
			return _timer.delay;
		}
		
		public function set delay(value:Number):void
		{
			_timer.delay = value;
		}
		
		public function get repeatCount():int
		{
			return _timer.repeatCount;
		}
		
		public function set repeatCount(value:int):void
		{
			_timer.repeatCount = value;
		}
		
		public function get running():Boolean
		{
			return _timer.running;
		}	
		
		public function start():void
		{
			_timer.start();
		}	
		
		public function stop():void
		{
			_timer.stop();
		}	
		
		public function reset():void
		{
			_timer.reset();
		}	
		
		public function dispose():void
		{
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, onTimer);
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			_timer = null;
		}	
		
		private function onTimer(evt:TimerEvent):void
		{
			this.dispatchEvent(evt.clone());
		}	
		
		private function onComplete(evt:TimerEvent):void
		{
			this.dispatchEvent(evt.clone());
		}	
	}
}