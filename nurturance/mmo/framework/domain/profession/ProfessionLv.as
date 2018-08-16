package mmo.framework.domain.profession
{
	public class ProfessionLv extends ProfessionLvBase
	{
		private var _needItems:Array;
		private var _defaultCard:Array;
		
		public function ProfessionLv(pro:int,level:int,needLightGold:int,needItems:String, defaultCard:String, 
									 dodgeRate:int, phyAtatck:int, magAttack:int, life:int, 
									 physicalDefense:int, magicDefense:int, spd:int){
			super(pro, level, needLightGold, dodgeRate, phyAtatck, magAttack, life, physicalDefense,magicDefense, spd);
			this._needItems = this.parseNeedItems(needItems);
			this._defaultCard = this.parseDefaultCard(defaultCard);
		}
		
		private function parseNeedItems(needItems:String):Array
		{
			var needItemsArray:Array = new Array();
			if(needItems != ""){
				var itemsStrs:Array = needItems.split(",");
				for each(var itemStr:String in itemsStrs){
					var eachItem:Array = itemStr.split("-");
					var eachItemObj:Object = {"type":eachItem[0],"id":eachItem[1],"num":eachItem[2]};
					needItemsArray.push(eachItemObj);
				}
			}
			return needItemsArray;
		}
		
		private function parseDefaultCard(defaultCard:String):Array
		{
			var defaultCardArray:Array = new Array();
			if(defaultCard != ""){
				defaultCardArray = defaultCard.split(",");
			}
			return defaultCardArray;
		}
		
		/**
		 * 升级职业所需物品
		 * @return needItems = [{type,id,num}]
		 */		
		public function get needItems():Array
		{
			return _needItems;
		}
		
		/**
		 * 默认卡
		 */		
		public function get defaultCard():Array
		{
			return _defaultCard.concat();
		}
		
	}
}