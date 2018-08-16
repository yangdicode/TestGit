package mmo.play.avatar {
	import flash.display.Sprite;
	
	
	/**
	 * 皮肤(衣服)信息
	 */
	public class SkinInfo {
		
		//~ fields ------------------------------------------------------------
		
		/** 动作信息，有ActionInfo类的元素组成 */
		private var _actionInfo:Array;
		//~ public methods ----------------------------------------------------
		
		public function SkinInfo(info:Array = null) {
			// 设置默认动作信息
			this._actionInfo = getActionInfo();
			parseInfo(info);
		}
		/**
		 * 获得动作信息
		 */
		public function get actionInfo():Array {
			return this._actionInfo;
		}
		
		public function clone():SkinInfo
		{
			var skinInfo:SkinInfo = new SkinInfo();
			while(skinInfo.actionInfo.length > 0)
			{
				skinInfo.actionInfo.pop();
			}
			for each(var actionInfo:ActionInfo in _actionInfo)
			{
				skinInfo.actionInfo.push(actionInfo);
			}
			return skinInfo;
		}	
		//~ protected methods -------------------------------------------------
		
		/**
		 * 重写该方法，设定动作信息
		 */
		protected function getActionInfo():Array {
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
				ActionInfo.getInstance("ldzf", 20, 2, 7),	// 飞行站立
				ActionInfo.getInstance("rdzf", 21, 2, 7),
				ActionInfo.getInstance("luzf", 22, 2, 7),
				ActionInfo.getInstance("ruzf", 23, 2, 7),
				ActionInfo.getInstance("ldwf", 20, 2, 3),	//  飞行移动
				ActionInfo.getInstance("rdwf", 21, 2, 3),
				ActionInfo.getInstance("luwf", 22, 2, 3),
				ActionInfo.getInstance("ruwf", 23, 2, 3),
				ActionInfo.getInstance("lds", 24, 1, 0),	// 射击
				ActionInfo.getInstance("rds", 25, 1, 0),
				ActionInfo.getInstance("lus", 26, 1, 0),
				ActionInfo.getInstance("rus", 27, 1, 0)
			];
		}
		
		private function parseInfo(info:Array):void
		{
			if(info == null)
			{
				return;
			}	
			for each(var action:Object in info)
			{
				var delayArr:Array = action["delayArr"] as Array;
				var actInfo:ActionInfo = ActionInfo.getComplexActionInfo(action["act"], action["row"], delayArr.length, delayArr);
				var defaultIndex:int = getActionInfoIndex(action["act"]);
				if(defaultIndex == -1)
				{
					throw new Error("人物动作编号配置错误!!!");
				}	
				_actionInfo.splice(defaultIndex, 1);
				_actionInfo.push(actInfo);
			}
			
		}	
		
		private function getActionInfoIndex(action:String):int
		{
			for (var i:int = 0; i < _actionInfo.length; i++)
			{
				var actionInfo:ActionInfo = _actionInfo[i] as ActionInfo;
				if(actionInfo.action == action)
				{
					return i
				}	
			}
			return -1;
		}	
	}
}