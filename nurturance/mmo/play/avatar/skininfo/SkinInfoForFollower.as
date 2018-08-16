package mmo.play.avatar.skininfo
{
	import mmo.play.avatar.ActionInfo;
	import mmo.play.avatar.SkinInfo;
	
	public class SkinInfoForFollower extends SkinInfo
	{
		public function SkinInfoForFollower(info:Array = null)
		{
			super(info);
		}
		
		//~ protected methods -------------------------------------------------
		
		/**
		 * 重写该方法，设定动作信息
		 */
		override protected function getActionInfo():Array {
			// "act" 为动作标识符
			// "row" 为动作所在行
			// "len" 为动作帧长度
			// "delay" 为每帧的延迟，单位为帧。例如delay=1表示延迟1帧，即实际该帧的动画停留2帧的时间
			return [
				ActionInfo.getInstance("ldzn", 0, 1, 0),	// 普通站立
				ActionInfo.getInstance("rdzn", 1, 1, 0),
				ActionInfo.getInstance("luzn", 2, 1, 0),
				ActionInfo.getInstance("ruzn", 3, 1, 0),
				ActionInfo.getInstance("ldwn", 0, 4, 3),	// 普通移动
				ActionInfo.getInstance("rdwn", 1, 4, 3),
				ActionInfo.getInstance("luwn", 2, 4, 3),
				ActionInfo.getInstance("ruwn", 3, 4, 3)
			];
		}
		
	}
}