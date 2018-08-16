package mmo.play.runner
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mmo.play.layer.LayerManager;

	public class EnterFrameRunner
	{
		private static var _instance:EnterFrameRunner;
		public static function get instance():EnterFrameRunner
		{
			if(_instance == null)
			{
				_instance = new EnterFrameRunner();
			}	
			return _instance;	
		}	
		
		private var _runList:Dictionary;
		private var _stage:Stage;
		private var _paused:Boolean;
		public function EnterFrameRunner()
		{
			_stage = LayerManager.stage;
			_stage.addEventListener(Event.ENTER_FRAME, enterFrame);
			
			_paused = false;
			
			_runList = new Dictionary();
		}
		
		public function addRunnable(func:Function):void
		{
			_runList[func] = func;
		}	
		
		public function removeRunnable(func:Function):void
		{
			if(hasRunnable(func))
			{
				delete _runList[func];
			}	
		}	
		
		public function hasRunnable(func:Function):Boolean
		{
			return (_runList[func] != null);
		}
		
		public function pause():void
		{
			_paused = true;
		}	
		
		public function reStart():void
		{
			_paused = false;
		}	
		
		public function dispose():void
		{
			_stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
			_stage = null;

			_runList = null;
		}
		
		private function enterFrame(evt:Event):void
		{
			if(_paused)
			{
				return;
			}	
			for each(var func:Function in _runList)
			{
				func.apply();
			}
		}
	}
}