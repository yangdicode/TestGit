package mmo.interfaces.card
{
	import mmo.interfaces.IInitService;
	import mmo.interfaces.IService;
	
	public interface ICardEquipmentService extends IService
	{
		/**
		 * 显示卡片装备面板 
		 */		
		function showPanel():void;
	}
}