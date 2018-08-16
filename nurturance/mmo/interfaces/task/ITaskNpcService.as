package mmo.interfaces.task
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mmo.interfaces.IInitService;

	public interface ITaskNpcService extends IInitService
	{
		/**
		 * 初始始化NPC 
		 * 
		 */		
		function initNpc():void;
		
		/**
		 * 手动显示Npc开始对话面板
		 * 通过action抛出的可以调用回调函数func执行
		 * */
		function showNpcStartPanel(npcId:int, key:String,func:Array = null,actionKey:Array = null,params:Array = null):void;
		
		/**
		 * 手动显示Npc结束对话面板
		 * 通过action抛出的可以调用回调函数func执行
		 **/
		function showNpcFinishPanel(npcId:int, key:String,func:Array = null,actionKey:Array = null,params:Array = null):void;
		
		/**
		 * 手动显示Npc步骤对话面板
		 * 通过action抛出的可以调用回调函数func执行
		 * */
		function showNpcStepPanel(npcId:int, key:String,func:Array = null,actionKey:Array = null,params:Array = null):void;
		
		/**
		 *外部调用显示 Npc对话面板（任何情况都可以调用，不需要正在进行任务也可以，需要配置对话） 
		 * 通过action抛出的可以调用回调函数func执行
		 * @param key 对话xml的键值
		 * @param npcId 需要显示的npc头像Id(也可以在对话xml中配置) 
		 * @param iconId npc的头像类型，默认不传参数为1
		 */
		function showNpcPanelFreely(key:String, npcId:int, iconId:int = 1,func:Array = null,actionKey:Array = null,params:Array = null, 
									showClose:Boolean = false, closeCall:Function = null, showLayer:Sprite = null, backGround:DisplayObject = null):void;
		
		/**
		 * 外部调用显示 Npc对话面板（任何情况都可以调用，不需要正在进行任务也可以） 
		 * 通过action抛出的可以调用回调函数func执行
		 * @param content 对话内容的xml
		 * @param npcId　需要显示的npc头像Id(也可以在对话xml中配置) 
		 * @param iconId　npc的头像类型，默认不传参数为1
		 */
		function showNpcPanelFreelyByXml(content:XML, npcId:int, iconId:int = 1,func:Array = null,actionKey:Array = null,params:Array = null, 
										 showClose:Boolean = false, closeCall:Function = null, showLayer:Sprite = null, backGround:DisplayObject = null,isGray:Boolean = true):void;
		
		/**
		 *将当前场景中已生成的一个npc移除，例子如将冰河中的吉蒂救上岸 
		 * @param npcId
		 * 
		 */
		function removeNpcFromScene(npcId:int):void;
		
		/**
		 * 手动将一个npc加入到场景中
		 * @param npcId
		 * @param viewId 目前先传1
		 * @param taskId
		 * @param x
		 * @param y
		 * 
		 */		
		function addNpcToScene(npcId:int, viewId:int, x:Number, y:Number):void;
		
		/**
		 *获取当前场景已经加载npc形象的引用 
		 * @param npcId
		 * @return 
		 * 
		 */
		function getNpcView(npcId:int):DisplayObject;
		
		/**
		 * 隐藏Npc,注意保证NPC已经加入场景中,否则无效
		 * 刚进入场景的可以监听SceneManagerEvent.OnNpcAddedToScene来保证
		 * @param npcId
		 */		
		function hideNpc(npcId:int):void;
		
		/**
		 * 显示Npc
		 * @param npcId
		 */		
		function showNpc(npcId:int):void;
		
		/**
		 * 显示动画，隐藏NPC，完成后回调函数
		 */
		function showMoveHideNpc(npcId:int,move:MovieClip,x:int=-1,y:int=-1,func:Function = null,funArgArray:Array = null):void
			
		/**
		 * 获得问号图标 
		 */		
		function getNpcQuestionMark(isMain:Boolean = true):MovieClip
		
		/**
		 * 获得叹号图标 
		 */		
		function getNpcExcalmatoryMark(isMain:Boolean = true):MovieClip
			
		/**
		 * 获得NPC名字和介绍 
		 */		
		function getNpcNameAndIntroMc(npcId:int,showIntro:Boolean = true):MovieClip
			
		/**
		 * 根据NpcId获得NPC名字
		 */		
		function getNpcNameById(npcId:int):String
		
		/**
		 * 根据NpcId获得NPC介绍
		 */		
		function getNpcIntroById(npcId:int):String	
			
		/**
		 * 元件加入NPC名字，状态
		 * @param npcSp  元件,NPC一样，注册点请设置为脚底
		 * @param npcId  npcId
		 * @param iconState =0 不显示， =1 问号， =2 叹号,图标元件命名为"_icon"
		 */
		function setNpcNameAndIcon(npcSp:Sprite,npcId:int,iconState:int = 1,x:int = -1,y:int = -1,isMain:Boolean = true):void;
		
		/**
		 * 显示对应NPC节点菜单
		 * 用addNpcChoice来添加选项节点
		 * defaultTalk 为 null 时候为NPC默认对话
		 */	
		function showNpcChoicePanel(npcId:int,defaultTalk:String = null, iconId:int = 1):void
		
		/**
		 * 添加Npc选项节点
		 * 单节点直接触发
		 */
		function addNpcChoice(npcId:int,context:String,choiceXml:XML,iconType:int = 0):void
		
		/**
		 * 删除Npc选项节点
		 */
		function removeNpcChoice(npcId:int,context:String):void
			
		/**
		 * 设置只显示Npc额外选项
		 * (默认都为true的,需要false自己设置,设置完毕记得重新设置回来)
		 */
		function setOnlyShowChoice(npcId:int,onlyShow:Boolean):void
		
		/**
		 * 添加资源到场景上面，默认加载到场景的container层，如果资源是MovieClip， 则会停在第一帧
		 * resPath 和 resName 唯一标识该资源，不会被重复加载 
		 **/
		function addResoure(resPath:String, resName:String, x:Number = 0, y:Number = 0, container:DisplayObjectContainer = null, func:Function = null):void;
		
		
		/**
		 * 设置在加载资源后的触发函数
		 * */
		function setTrigger(resPath:String, resName:String, func:Function):void;
		
		/**
		 * 获得由resPath 和  resName 指定的资源
		 * */
		function getResoure(resPath:String, resName:String):DisplayObject;
		
		/**
		 * 设置npc元件在某一层，相对于全局的位置不变。主要用于在动画里面提取一个npc形象，加载到场景上，默认放到container层，或者把npc形象放回到其他层次
		 * @param npcSp  元件,NPC一样，注册点请设置为脚底
		 * @param npcId  npcId 如果该值为 -1， 则不设置 npc的name和icon
		 * @param newLayer 把npc形象加载到测层次， 默认为container
		 * @param iconState =0 不显示， =1 问号， =2 叹号
		 **/
		function setNpcOnDisplayLayer(npc:Sprite, npcId:int, newLayer:DisplayObjectContainer = null, iconState:int = 0):void;
		
		/**
		 * 获得元件的NPC形象并加入场景,回调函数参数的最后一个参数obj持有所有NPC
		 * @param movie 
		 * @param npcId npc[0]对应元件中的"npc0",以此类推
		 * @param func  若不需返回npc的引用,置null
		 * @param funArgArray NPC的引用放在最后
		 * @param frame 在元件的第几桢,默认最后一桢
		 * @param container 场景,默认Container层
		 */		
		function addSceneMovieNpc(movie:MovieClip,npcId:Array,func:Function = null, 
								  funArgArray:Array = null, frame:int = 0, container:Sprite = null):void
			
		/**
		 * 元件加入NPC符号（问号或者冒号）
		 * @param npcSp  元件,NPC一样，注册点请设置为脚底
		 * @param iconState =1 问号， =2 叹号,图标元件命名为"_icon"
		 * @param x 自定义位置x
		 * @param y 自定义位置y
		 * @param isMain 是否主线符号
		 */			
		function setNpcIcon(npcSp:Sprite,iconState:int = 1,
							x:int = -1,y:int = -1,isMain:Boolean = true):void
			
		function removeNpcIcon(npcSp:Sprite):void
		
		/**
		 * 强制关闭所有对话，用NewDailog.CloseAll()关闭NPC对话会引起内存泄露的，所以搞了这方法。
		 * 
		 */			
		function forceCloseTalkPanel():void;
			
		/** 场景固定npc，用于任务搜索 
		 * var npcData:Object;
		 * npcData["npcId"]
		 * npcData["sceneName"]
		 *  **/
		function getSceneNpcConfig():Array;
		
		/**
		 * 配置xml任务对话
		 */
		function registerTaskTalkXml(xml:XML):void;
	}
}