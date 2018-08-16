package mmo.nurturance.nodehandle.effect
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IDispose;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.play.runner.EnterFrameRunner;
	
	public class NurEffect1 implements IDispose
	{
		private const Offset:int = 10;
		
		private var _res:DisplayObject;
		
		public function NurEffect1(info:XML)
		{
			_res = NurManageHandler.instance.windowManager.blackGround;
			trace("begin shake");
			EnterFrameRunner.instance.addRunnable(run);
			TweenLite.delayedCall(1.5, stop);
		}
		
		private function run():void
		{
			var distx:Number = Math.random() * Offset;
			_res.x = (_res.x >= 0) ? -distx : distx;
		}
		
		private function stop():void
		{
			trace("stop shake");
			EnterFrameRunner.instance.removeRunnable(run);
			_res.x = 0;
			_res.y = 0;
		}
		
		public function dispose():void
		{
			TweenLite.killDelayedCallsTo(stop);
			EnterFrameRunner.instance.removeRunnable(run);
			_res = null;
		}
	}
}