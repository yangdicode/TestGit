package mmo.framework.domain.clothesdesign
{
	import mmo.framework.domain.exchange.ExchangeDefine;
	
	public class ExchangeItemDefine extends ExchangeDefine
	{
		private var _needLevel:int;
		
		public function ExchangeItemDefine(id:int, des:String, demandsStr:String, bonusStr:String, needLevel:int)
		{
			super(id, des, demandsStr, bonusStr);
			_needLevel = needLevel;
		}
		
		public function get needLevel():int{
			return _needLevel;
		}
		
	}
}