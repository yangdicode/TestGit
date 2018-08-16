package mmo.interfaces.nurturance
{
	import mmo.interfaces.IDownloadInitService;

	public interface INurturanceService extends IDownloadInitService
	{
		/**
		 * 测试用借口，参数自己看着办
		 * @param params
		 * 
		 */		
		function test(params:Object = null):void;
		/**
		 * 打开综合面板 
		 * 
		 */		
		function showMutilPanel():void;
		/**
		 * 打开宣传面板 
		 * 
		 */		
		function showAdvertisePanel():void;
		/**
		 * 是否完成了最新章节 
		 * @return 
		 * 
		 */		
		function hadfinishLatestChapter():Boolean;
		
		/**
		 * 已经完成的结局列表
		 * @return 
		 * 
		 */		
		function hadgainEndings(gameId:int):Array;
		
		/**
		 * 全部任务面板
		 * @return 
		 * 
		 */		
		function showDepositsPanel():void;
		/**
		 * 自由显示</br>
		 * xml里任意节点都可以加action=""</br>
		 * 回调actionCall里加参数action:String</br>
		 * showJump:显示跳过</br>
		 * jumpCall:跳过回调</br>
		 * endCall:关闭对话回调</br>
		 */	
		function showFree(xml:XML, actionCall:Function = null, 
						  showJump:Boolean = false, jumpCall:Function = null, 
						  endCall:Function = null):void;
			
		/**
		 * 检查是否存在此NPC
		 * @return 
		 * 
		 */		
		function checkNpcNameIsExist(name:String):Boolean;
	}
}