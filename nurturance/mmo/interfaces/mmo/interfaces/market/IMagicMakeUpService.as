package mmo.interfaces.market
{
	import mmo.interfaces.IInitService;

	public interface IMagicMakeUpService extends IInitService
	{
		/** 
		 * 打开魔妆面板
		 */		
		function StartMagicMakeUp():void;
	}
}