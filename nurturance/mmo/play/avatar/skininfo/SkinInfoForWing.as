package mmo.play.avatar.skininfo
{
	import mmo.play.avatar.ActionInfo;
	import mmo.play.avatar.SkinInfo;
	
	public class SkinInfoForWing extends SkinInfo
	{
		public function SkinInfoForWing(info:Array = null)
		{
			super(info);
		}
		
		override protected function getActionInfo():Array
		{
			// "act" 为动作标识符
			// "row" 为动作所在行
			// "len" 为动作帧长度
			// "delay" 为每帧的延迟，单位为帧。例如delay=1表示延迟1帧，即实际该帧的动画停留2帧的时间
			return [
				ActionInfo.getInstance("ldzn", 0, 1, 0),	// 普通站立
				ActionInfo.getInstance("rdzn", 1, 1, 0),
				ActionInfo.getInstance("luzn", 2, 1, 0),
				ActionInfo.getInstance("ruzn", 3, 1, 0),
				ActionInfo.getInstance("ldwn", 4, 6, 3),	// 普通移动
				ActionInfo.getInstance("rdwn", 5, 6, 3),
				ActionInfo.getInstance("luwn", 6, 6, 3),
				ActionInfo.getInstance("ruwn", 7, 6, 3),
				ActionInfo.getInstance("ldd", 8, 1, 0),	// 普通坐下
				ActionInfo.getInstance("rdd", 9, 1, 0),
				ActionInfo.getInstance("lud", 10, 1, 0),
				ActionInfo.getInstance("rud", 11, 1, 0),
				ActionInfo.getInstance("ldm", 12, 4, 4),	// 制作
				ActionInfo.getInstance("rdm", 13, 4, 4),
				ActionInfo.getInstance("lum", 14, 4, 4),
				ActionInfo.getInstance("rum", 15, 4, 4),
				ActionInfo.getInstance("ldp", 12, 4, 4),	// 采集
				ActionInfo.getInstance("rdp", 13, 4, 4),
				ActionInfo.getInstance("lup", 14, 4, 4),
				ActionInfo.getInstance("rup", 15, 4, 4),
				ActionInfo.getInstance("ldzr", 16, 1, 0),	// 骑宠站立
				ActionInfo.getInstance("rdzr", 17, 1, 0),
				ActionInfo.getInstance("luzr", 18, 1, 0),
				ActionInfo.getInstance("ruzr", 19, 1, 0),
				ActionInfo.getInstance("ldwr", 16, 2, 3),	// 骑宠移动
				ActionInfo.getInstance("rdwr", 17, 2, 3),
				ActionInfo.getInstance("luwr", 18, 2, 3),
				ActionInfo.getInstance("ruwr", 19, 2, 3),
				ActionInfo.getInstance("ldzf", 20, 4, 7),	// 飞行站立
				ActionInfo.getInstance("rdzf", 21, 4, 7),
				ActionInfo.getInstance("luzf", 22, 4, 7),
				ActionInfo.getInstance("ruzf", 23, 4, 7),
				ActionInfo.getInstance("ldwf", 20, 4, 5),	//  飞行移动
				ActionInfo.getInstance("rdwf", 21, 4, 5),
				ActionInfo.getInstance("luwf", 22, 4, 5),
				ActionInfo.getInstance("ruwf", 23, 4, 5),
				ActionInfo.getInstance("lds", 24, 1, 0),	// 射击
				ActionInfo.getInstance("rds", 25, 1, 0),
				ActionInfo.getInstance("lus", 26, 1, 0),
				ActionInfo.getInstance("rus", 27, 1, 0)
			];
		}
	}
}