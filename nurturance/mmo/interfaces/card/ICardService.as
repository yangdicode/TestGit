package mmo.interfaces.card
{
	import mmo.interfaces.IInitService;
	
	public interface ICardService extends IInitService
	{
		/**
		 * 获取卡片具体信息。 
		 * @param cardId	卡片Id
		 * @return 			卡片的信息
		 * 
		 */		
		function getCardInfo(cardId:int):Object;
		
		/**
		 * 显示卡片装备栏
		 */		
		function showCardEquipment():void;
	}
}