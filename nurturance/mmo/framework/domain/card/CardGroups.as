package mmo.framework.domain.card
{
	import flash.system.ApplicationDomain;

	public class CardGroups
	{
		private static var _config:Object;
		
		public function CardGroups()
		{
		}
		
		public static function getCardGroup(id:int):CardGroup
		{
			if (_config == null)
			{
				initConfig();
			}
			if (_config[id] == null)
			{
				return new CardGroup(id, id, 1);
			}
			return _config[id];
		}
		
		private static function initConfig():void
		{
			var cardGroupDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardGroupData") as Class;
			_config = cardGroupDataClass["data"];
		}
	}
}