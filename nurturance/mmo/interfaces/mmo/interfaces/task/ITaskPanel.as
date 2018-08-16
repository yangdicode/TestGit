package mmo.interfaces.task
{
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.interfaces.IService;

	public interface ITaskPanel extends IService
	{
		/**
		 * 显示任务面板
		 * @param taskId
		 */		
		function showPanel(taskId:int = -1):void;
		
		/**
		 * 显示任务面板海报
		 * */
		function showTaskPoster():void;
		
		/**
		 * 设置面板默认任务id
		 */
		function setPanelPreTaskId(taskId:int):void
		
		/**
		 * 设置面板步骤图标状态
		 * @param content  要设置的图标
		 * @param taskSteps 图标包含的任务步骤
		 * @param tips 进行任务中要显示的tips内容
		 * @param isShowDoing 是否显示进行中
		 */		
		function setTaskStepIconState(content:Sprite,taskSteps:Array,tips:String = "",isShowDoing:Boolean = true):void;
		
		/**
		 * 设置面板结束图标状态
		 * @param content  要设置的图标
		 * @param taskId   图标包含的任务步骤
		 * @param tips     进行任务中要显示的tips内容
		 * @param isShowDoing  是否显示进行中
		 */		
		function setTaskFinishIconState(content:Sprite,taskId:int,tips:String = "",isShowDoing:Boolean = true):void;
		
		/**
		 * 设置物品图标状态
		 * @param content 要设置的图标
		 * @param mId 	  物品Id
		 * @param tips 	  显示的tips字符串
		 * @param mNum    物品数量
		 * @param mType   物品类型(默认收集品)
		 */		
		function setItemIconState(content:Sprite,mId:int,tips:String = "",mNum:int = 1,mType:int = MaterialTypes.GITEM):void

		/**
		 * 在对应图标上添加进行中，打钩效果
		 * @param content  要设置的图标
		 * @param state    设置的状态,默认=1 已完成打钩，=0进行中，=-1未接取
		 * @param tips 	   显示的tips字符串
		 */		
		function setSpriteIcon(content:Sprite,tips:String = "",state:int = 1):void
			
		/**
		 * 设置怪物图标状态
		 * @param content 要设置的图标
		 * @param enemyId 怪物Id
		 * @param taskStepId 步骤Id
		 * @param txtField 显示文字(1/1)
		 * @param tips    显示的tips字符串
		 */		
		function setEnemyIcon(content:Sprite,monsterId:int,taskStepId:int,txtField:TextField = null,tips:String = ""):void
		
		/**
		 * 设置怪物图标状态
		 * @param content 要设置的图标
		 * @param taskStepId 步骤Id
		 * @param txtField 显示文字(1/1)
		 * @param tips     显示的tips字符串
		 * @param itemId 物品Id
		 * @param itemType 物品类型，默认为GITEM
		 * @param isShowIcon 图标是否出现，=false只在步骤进行时, =true一直出现
		 * @return 
		 */				
		function setGItemIcon(content:Sprite,itemId:int,taskStepId:int,txtField:TextField = null,tips:String = "",itemType:int = MaterialTypes.GITEM,isShowIcon:Boolean = false):void
			
		/**
		 * 设置整个任务面板的状态 
		 * @param view 面板元件
		 * @param handlerId 处理器ID 
		 * 0：HideIconTaskPanelHandler
		 * 1：NormalIconTaskPanelHandler
		 * 
		 * @param taskId 任务ID
		 * @param stepIdArr 任务步骤的数组 
		 * 
		 * 具体数组的写法请到对应处理类注释处查看，做法很潜规则，但目前没什么好的解决方案
		 * 
		 */		
		function setPanelState(view:MovieClip, handlerId:int, taskId:int, params:*):void
		
		/**
		 * 设置面板上步骤对应跳转的场景，点击view触发跳转场景功能。
		 * @param view 触发跳场景的Go按钮
		 * @param taskId 任务ID
		 * @param stepArr 任务步骤数组 
		 * @param sceneArr 对应场景数组
		 * 
		 * 例子：setStepScene(SimpleButton(this["BtnGo"]), 245, [832,833,834], ["Gym","CenterSquare","Gym","CenterSquare"]);
		 * 
		 * 之所以SceneArr的元素会比stepArr多1个，
		 * 是因为有 结束步骤 这个独立与任务步骤的存在，
		 * 最后一个场景元素对应的是结束步骤需要跳转的场景
		 */	
		function setStepScene(view:SimpleButton, taskId:int, stepArr:Array, sceneArr:Array):void
		
		/**
		 * 关闭面板
		 */			
		function closePanel():void
	}
}