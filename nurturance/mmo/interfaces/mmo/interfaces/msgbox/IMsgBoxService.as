package mmo.interfaces.msgbox
{
	import mmo.interfaces.IInitService;

	public interface IMsgBoxService extends IInitService
	{
		function showBoxPanel():void;
		
		/**
		 * 关闭盒子项（用于次数用尽）
		 */
		function shutBoxCd(key:int):void;
		
		/**
		 * 设置cd
		 */
		function setBoxCd(key:int, cd:int):void;
		
		function getMsgNum():int;
	}
}