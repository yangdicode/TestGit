package mmo.play.avatar {
	
	import mmo.common.cachepool.CachePool;
	import mmo.play.avatar.actionInfo.ComplexActionInfo;
	
	public class ActionInfo {
		
		//~ fields ------------------------------------------------------------
		
		/** 动作标识符 */
		public var action:String;
		
		/** 动作所在行 */
		public var row:int;
		
		/** 动作帧长度 */
		public var length:int;
		
		/** 每帧延迟 */
		public var delay:int;
		/**
		 * 动作的元件是否需要水平翻转，注意：同一动作所有元件都必须翻转或不翻转
		 */
		public var rotate:int = 0;
		
		/** 对象池 */
		private static var _cachePool:CachePool = new CachePool(128);
		
		//~ public methods ----------------------------------------------------

		/**
		 * 
		 * @param rotate 0：不翻转 1水平翻转
		 */
		public static function getInstance(action:String, row:int, length:int, delay:int
			, rotate:int = 0):ActionInfo {
			var key:String = action + "*" + row + "*" + length;
			
			var actionInfo:ActionInfo = _cachePool.getObject(key) as ActionInfo;
			if(actionInfo == null) {
				// 临时生成新对象
				actionInfo = new ActionInfo(action, row, length, delay);
				actionInfo.rotate = rotate;
				_cachePool.addObject(key, actionInfo);
			}
			
			return actionInfo;
		} 
		
		/**
		 * 获取特殊的actionInfo
		 * 
		 * */
		public static function getComplexActionInfo(action:String, row:int, length:int, delayArr:Array
													,rotate:int = 0):ActionInfo
		{
			var actionInfo:ActionInfo = new ComplexActionInfo(action, row, length, delayArr);
			actionInfo.rotate = rotate;
			return actionInfo;
		}	

		//~ package private methods -------------------------------------------
		
		function ActionInfo(action:String, row:int, length:int, delay:int = 0) {
			this.action = action;
			this.row = row;
			this.length = length;
			this.delay = delay;
		}
		
		public function getFrameDelay(frame:int):int
		{
			return this.delay;
		}	
		
		public function getNextFrame(frame:int):int
		{
			var next:int = ++frame;
			if(next >= length)
			{
				next = 0;
			}
			return next;
		}	
	}
}