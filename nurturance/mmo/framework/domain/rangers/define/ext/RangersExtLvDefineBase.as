package mmo.framework.domain.rangers.define.ext
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.exchange.ExchangeItem;

	public class RangersExtLvDefineBase
	{
		private var _lv:int;
		private var _needLv:int;
		private var _demandXML:XML;
		
		private var _needScore:int;
		private var _needItem:Array = [];
		
		public function RangersExtLvDefineBase(lv:int, needlv:int, demand:XML){
			_lv = lv;
			_needLv = needlv;
			_demandXML = demand;
			var list:XMLList = XMLList(_demandXML.d);
			for each(var e:XML in list){
				if(e.@type == "score"){
					_needScore = e.@num;
				}else if(e.@type == "item"){
					parseItem(e.@items);
				}
			}
		}
		
		public function get lv():int
		{
			return _lv;
		}
		
		/**
		 * 需要等级
		 */
		public function get needLv():int
		{
			return _needLv;
		}
		
		/**
		 * 需要材料
		 */
		public function get demands():Array{
			return _needItem;
		}
		/**
		 * 需要金币
		 */		
		public function get needScore():int{
			return _needScore
		}
		
		private function parseItem(itemStr:String):void{
			if(StringUtil.isEmpty(itemStr)){
				return;
			}
			var eItemStrList:Array = itemStr.split(",");
			var eItemList:Array;
			var item:ExchangeItem;
			for each(var eItemStr:String in eItemStrList){
				eItemList = eItemStr.split("-");
				item = new ExchangeItem(eItemList[0], eItemList[1], eItemList[2]);
				_needItem.push(item);
			}
		}
		
	}
}