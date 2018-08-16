package mmo.framework.domain.cardmap
{
	/**
	 * 晶卡特效解说(图鉴使用)
	 */	
	
	public class CardMapBuff
	{
		
		private var _buffNo:int;
		private var _buffName:String;
		private var _buffIntro:String;
		
		public function CardMapBuff(buffNo:int,buffName:String,buffIntro:String)
		{
			this._buffNo = buffNo;
			this._buffName = buffName;
			this._buffIntro = buffIntro;
		}
		
		/**
		 * 跟BuffDefine相对应,主要是取图标文件
		 */		
		public function get buffNo():int
		{
			return _buffNo;
		}

		public function get buffName():String
		{
			return _buffName;
		}

		public function get buffIntro():String
		{
			return _buffIntro;
		}
	}
}