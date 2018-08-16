package mmo.framework.domain.card
{
	import flash.system.ApplicationDomain;

	public class CardEquipLimits
	{
		private static var _config:Object;
		public function CardEquipLimits()
		{
		}
		
		public static function getCardEquipLimit(cardId:int):CardEquipLimit
		{
			if (_config == null)
			{
				initConfig();
			}
			if (_config[cardId] == null)
			{
				return new CardEquipLimit(cardId, 1, "", 0, 0, 0, 0, 0, 0);
			}
			return _config[cardId];
		}
		
		private static function initConfig():void
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardEquipLimitData") as Class;
			_config = cls["data"];
		}
	}
}