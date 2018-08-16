package mmo.play.avatar.actionInfo
{
	import mmo.play.avatar.ActionInfo;
	
	public class ComplexActionInfo extends ActionInfo
	{
		private var delayArr:Array 
		public function ComplexActionInfo(action:String, row:int, length:int, delayArr:Array)
		{
			super(action, row, length, 0);
			this.delayArr = delayArr;
		}
		
		override public function getFrameDelay(frame:int):int
		{
			return this.delayArr[frame];
		}	
	}
}