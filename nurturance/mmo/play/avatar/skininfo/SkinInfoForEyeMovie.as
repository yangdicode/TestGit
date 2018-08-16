package mmo.play.avatar.skininfo
{
	import mmo.play.avatar.ActionInfo;
	import mmo.play.avatar.SkinInfo;
	
	public class SkinInfoForEyeMovie extends SkinInfo
	{
		public function SkinInfoForEyeMovie(info:Array = null)
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
				ActionInfo.getComplexActionInfo("ldzn", 0, 4, [4,4,4,4]),	// 普通站立
				ActionInfo.getComplexActionInfo("rdzn", 1, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("luzn", 2, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("ruzn", 3, 4, [4,4,4,4]),
				ActionInfo.getInstance("ldwn", 4, 6, 3),	// 普通移动
				ActionInfo.getInstance("rdwn", 5, 6, 3),
				ActionInfo.getInstance("luwn", 6, 6, 3),
				ActionInfo.getInstance("ruwn", 7, 6, 3),
				ActionInfo.getComplexActionInfo("ldd", 8, 4, [4,4,4,4]),	// 坐下
				ActionInfo.getComplexActionInfo("rdd", 9, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("lud", 10, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("rud", 11, 4, [4,4,4,4]),
				ActionInfo.getInstance("ldm", 12, 4, 4),	// 制作
				ActionInfo.getInstance("rdm", 13, 4, 4),
				ActionInfo.getInstance("lum", 14, 4, 4),
				ActionInfo.getInstance("rum", 15, 4, 4),
				ActionInfo.getInstance("ldp", 12, 4, 4),	// 采集
				ActionInfo.getInstance("rdp", 13, 4, 4),
				ActionInfo.getInstance("lup", 14, 4, 4),
				ActionInfo.getInstance("rup", 15, 4, 4),
				ActionInfo.getComplexActionInfo("ldzr", 16, 4, [4,4,4,4]),	// 骑宠站立
				ActionInfo.getComplexActionInfo("rdzr", 17, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("luzr", 18, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("ruzr", 19, 4, [4,4,4,4]),
				ActionInfo.getInstance("ldwr", 20, 2, 3),	// 骑宠移动
				ActionInfo.getInstance("rdwr", 21, 2, 3),
				ActionInfo.getInstance("luwr", 22, 2, 3),
				ActionInfo.getInstance("ruwr", 23, 2, 3),
				ActionInfo.getComplexActionInfo("ldzn", 24, 4, [4,4,4,4]),	// 飞行站立
				ActionInfo.getComplexActionInfo("rdzn", 25, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("luzn", 26, 4, [4,4,4,4]),
				ActionInfo.getComplexActionInfo("ruzn", 27, 4, [4,4,4,4]),
				ActionInfo.getInstance("ldwf", 28, 2, 3),	//  飞行移动
				ActionInfo.getInstance("rdwf", 29, 2, 3),
				ActionInfo.getInstance("luwf", 30, 2, 3),
				ActionInfo.getInstance("ruwf", 31, 2, 3),
				ActionInfo.getInstance("lds", 32, 1, 0),	// 射击
				ActionInfo.getInstance("rds", 33, 1, 0),
				ActionInfo.getInstance("lus", 34, 1, 0),
				ActionInfo.getInstance("rus", 35, 1, 0),
			];
		}	
	}
}