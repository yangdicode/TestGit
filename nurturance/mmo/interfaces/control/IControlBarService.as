package mmo.interfaces.control
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mmo.interfaces.IInitService;

	public interface IControlBarService extends IInitService
	{
		function get view():Sprite;
		function show(parent:Sprite, x:Number = 0, y:Number = 0):void;
		function hide():void;
		function addUI(view:DisplayObject, x:Number = 0, y:Number = 0):void
		function removeUI(viewName:String):void;	
		function addUIAtTopLayer(view:DisplayObject, x:Number = 0, y:Number = 0):void;
		function removeTopLayerUI(viewName:String):void;
		/**
		 * 设置UI屏蔽状态 
		 */		
		function unAbleView(viewName:String,func:Function = null):void;
		
		/**
		 * 恢复UI点击 
		 */		
		function reAbleView(viewName:String):void;
		
		/**
		 * 为新手任务提供特殊隐藏某些部分的接口
		 * 请与写新手任务的人潜规则…… 
		 */		
		function hideForNewbieTask(typeId:int):void;
		/**
		 * 为新手任务提供接口隐藏某些部分以后的显示
		 * 请与写新手任务的人潜规则…… 
		 */
		function showForNewbieTask(typeId:int):void;
		/**
		 * 添加右上角触发点
		 * */
		function addTopRightIcon(icon:DisplayObject, priority:int = 1):void;
		/**
		 * 添加左上角触发点
		 * */
		 function addTopLeftIcon(icon:DisplayObject, priority:int = 1):void;
		 /**
		  * 添加左上角（列）触发点
		  * */
		 function addTopLeftRowIcon(icon:DisplayObject, priority:int = 1):void;
		 
		 /**
		  * 添加左边触发点，图标最大55*55
		  */		 
		 function addLeftIcon(icon:DisplayObject, name:String, priority:int = 0):void;
		 
		 /**
		  * 移除左边触发点
		  */		 
		 function removeLeftIcon(name:String):void;
		
		 /**
		  * 添加右边触发点，图标最大55*55
		  * */
		 function addRightIcon(icon:DisplayObject, priority:int = 1, iconName:String = "" ):void
		 /**
		  * 获取右边触发点
		  * */
		 function getRightIcon(iconName:String):DisplayObject;
		 /**
		  * 移除右边触发点
		  */		 
		 function removeRightIcon(iconName:String):void
			 
		 /**
		  * 查找图标全局位置
		  */		 
		 function getIconLocal(iconName:String):Point;
		 
		 function set rightIconVisible(visible:Boolean):void;
		 
		 function set lockShootPanel(isLock:Boolean):void;
		 
		 /**
		 * 聊天框展开/收起状态
		 */
		 function set historyPanelState(isOpen:Boolean):void;
		 
	}
}