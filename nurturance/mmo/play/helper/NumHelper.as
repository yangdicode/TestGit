package mmo.play.helper
{
	import flash.display.MovieClip;

	/**
	 * 数字显示帮助类
	 * @author liyawei
	 */	
	
	public class NumHelper
	{
		private static var _instance:NumHelper
		
		public function NumHelper()
		{
		}
		
		public static function get instance():NumHelper
		{
			if(_instance == null)
			{
				_instance = new NumHelper();
			}
			return _instance;
		}
		
		/**
		 * 元件数字显示
		 * @param numMc 显示的数字元件，由右到左依次命名 num0,num1,……
		 * @param num   要显示的数字,必须为正数,否则置0
		 * @param side  显示方式：0 完全显示，包括0;
		 * 						 1 左边显示，右边去0;
		 * 						 2 右边显示，左边去0;
		 * 						 3 居中显示，去掉两边0;beta版。。。
		 * @param leastCount 最少的占用个数，空缺的用0补充
		 */		
		public function setNumMc(numMc:MovieClip,num:int,side:int = 0,leastCount:int = 1):void
		{
			if(num < 0){
				num = 0;
			}
			
			var numMcArray:Array = new Array();
			var oneNumMc:MovieClip;
			var numCount:int;
			var showStates:Array = [];
			for(numCount = 0; numCount < 20; numCount++){
				oneNumMc = numMc.getChildByName("num"+numCount.toString()) as MovieClip;
				if(oneNumMc == null){
					break;
				}
				oneNumMc.visible = true;
				oneNumMc.gotoAndStop(1);
				numMcArray.push(oneNumMc);
				showStates.push(true);
			}
			
			numCount = 0;
			for(var reNum:int = num; reNum > 0;){
				if(numCount == numMcArray.length){
					break;
				}
				var lastNum:int = reNum % 10;
				MovieClip(numMcArray[numCount]).gotoAndStop(lastNum + 1);
				reNum = Math.floor(reNum/10);
				numCount ++;
			}
			
			numCount = (numCount < leastCount)?leastCount:numCount;
			
			var arrayLength:int = numMcArray.length;
			if(side == 2){
				for(;numCount < arrayLength; numCount ++){
					MovieClip(numMcArray[numCount]).visible = false;
					showStates[numCount] = false;
				}
			}
			
			if(side == 1){
				numCount --;
				var downNum:int = arrayLength - 1;
				for(;numCount >= 0; numCount--){
					var numFrame:int = MovieClip(numMcArray[numCount]).currentFrame;
					MovieClip(numMcArray[downNum]).gotoAndStop(numFrame);
					downNum --;
				}
				for(;downNum >=0 ;downNum--){
					MovieClip(numMcArray[downNum]).visible = false;
					showStates[downNum] = false;
				}
			}
			
			if(side == 3){
				var i:int;
				var startNum:int = int((arrayLength - numCount)/2 + numCount) - 1;
				
				for(i = arrayLength - 1; i > startNum; i--)
				{
					MovieClip(numMcArray[i]).stop();
					MovieClip(numMcArray[i]).visible = false;
					showStates[startNum] = false;
				}
				
				numCount --;	
				
				for(;numCount >= 0; numCount--){
					var goFrame:int = MovieClip(numMcArray[numCount]).currentFrame;
					MovieClip(numMcArray[startNum]).gotoAndStop(goFrame);
					startNum --;
				}			
				
				for(;startNum >=0 ;startNum--){
					MovieClip(numMcArray[startNum]).visible = false;
					showStates[startNum] = false;
				}
			}
		}		
		
	}
}