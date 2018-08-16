package mmo.interfaces.bugle
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IInitService;

	/**
	 * 命名有误，应该叫TalkService
	 * 不用tryCatch
	 */
	public interface IBugleService extends IInitService
	{
		/**
		 * 大喇叭
		 * @param defaultStr
		 * @param appendKey     在extSentenceDefine配置
		 * @param appendParams  条件比较苛刻，不能包含":" 、  ","和 "_"
		 */
		function showBigBugle(defaultStr:String="", appendKey:int=0, appendParams:String=null):void;
		/**
		 * 小喇叭
		 */
		function showSmallBugle(defaultStr:String="", appendKey:int=0, appendParams:String=null):void;
		
		/**
		 * 设置消息框
		 * handleType 详见DialogBoxType
		 */
		function setHistoryMsgBox(views:Sprite, handleType:int=0, showTab:int = 0):IHistoryHandler;
		
		/** 客户端自行播放自定义喇叭信息 **/
		function showCustomBugle( strMsg:String, isBugle:Boolean = false, onClickFunc:Function = null ):void;
		
	}
}