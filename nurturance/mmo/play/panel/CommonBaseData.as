package mmo.play.panel
{
	public class CommonBaseData
	{
		private var _isCatch:Boolean = false;
		private var _callBack:Function;
		
		public function CommonBaseData()
		{
		}
		
		final public function initData(cb:Function = null):void
		{
			_callBack = cb;
			if(_isCatch && _callBack != null)
				_callBack.apply();
			else
				initCommonData();
		}
		/**
		 * 重写后要记得finishInit
		 */
		protected function initCommonData():void
		{
			finishInit();
		}
		
		protected function finishInit():void
		{
			_isCatch = true;
			if(_callBack != null)
				_callBack.apply();
		}
	}
}