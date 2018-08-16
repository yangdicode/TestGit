package mmo.interfaces.map
{
	public interface IMapCancel
	{
		/**
		 * 能去sceneName则反回true，不能刚返回false；
		 * @param sceneName
		 */		
		function onReadyLoadScene(sceneName:String):Boolean;
		/**
		 * 显示是否放弃任务的面版
		 * @param callBack 选择面版选择确定时回调函数
		 */		
		function showChoiceGiveUpTaskPanel(callBack:Function):void;
		/**
		 * 放弃任务
		 */		
		function onGiveUpTask():void;
	}
}