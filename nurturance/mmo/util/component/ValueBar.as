package mmo.util.component
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ValueBar extends Sprite
	{
		private var _mc:MovieClip;
		private var _totalValue;
		public function ValueBar(totalValue:int, curValue:int, mc:MovieClip)
		{
			_mc = mc;
			_totalValue = totalValue;
			update(curValue, totalValue);
		}
		
		public function update(curValue:int, totalValue:int = 0):void
		{
			if(totalValue > 0)
			{
				_totalValue = totalValue;
			}	
			
			var totalFrame:int = _mc.totalFrames;
			var curFrame:int = curValue / _totalValue * totalFrame;
			if(curFrame < 1)
			{
				curFrame = 1;
			}	
			if(curFrame > totalFrame)
			{
				curFrame = totalFrame;
			}	
			_mc.gotoAndStop(curFrame);
		}
	}
}