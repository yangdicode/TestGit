package mmo.interfaces.petbreeding
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IService;
	
	public interface IPetBreedingService extends IService
	{
		/**
		 * 打开自己的宠物小屋
		 */
		function showMyPetHouse():void;
		/**
		 * 打开别人的宠物小屋
		 */
		function showBuddiesHouse(userName:String):void;
		/**
		 * 关闭当前宠物小屋
		 */
		function closePetHouse():void;
		/**
		 * 打开宠物图鉴面板
		 */
		function showPetIntroducePanel():void;
		/**
		 * 打开宠物任务面板
		 */
		function showPetTaskPanel():void;
		/**
		 * 显示宠物帮助面板
		 */
		function showHelpPanel():void;
		/**
		 * 获取自己的宠物小屋数据
		 */
		function getSelfPetData(callback:Function):void;
		/**
		 * 展示宠物服务
		 */
		function showShowingPet(container:Sprite, ids:Array):void;
		/**
		 * 关闭宠物展示
		 */
		function closeShowingPet():void;
		/**
		 * 显示宠物孕育面板
		 */
		function showEggComposingPanel():void;
		/**
		 * 打开宠物交易面板, 1是捐赠，2是兑换
		 */
		function showPetTradePanel(index:int=1):void;
	}
}