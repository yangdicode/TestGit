package mmo.play.tips {
	import com.adobe.utils.StringUtil;
	
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.LoaderContainer;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.tips.commands.ShowTipsCommand;
	import mmo.util.command.ISceneCommand;
	import mmo.util.command.SceneCommandEvent;
	
	/**
	 * 负责游戏中Tips的管理与显示
	 */
	public class TipsManager extends Dictionary{
		
		//~ fields ------------------------------------------------------------
		
		private static var _instance:TipsManager;
		
		/** 元件列表 */
		private var _contentTable:Dictionary;
		
		/** 当前显示Tips的元件 */
		private var _currentTarget:InteractiveObject;
		
		/** 当前显示的Tips */
		private var _currentTips:DisplayObject;
		
		/** 当前执行的命令 */
		private var _currentCommand:ISceneCommand;
		
		//~ public methods ----------------------------------------------------
		
		public function TipsManager() {
			if(_instance != null) {
				throw new Error("TipsManager is implements as Singleton!!");
				return;
			}
			
			this._contentTable = new Dictionary();
		}
		
		/**
		 * Get Instance
		 */
		public static function getInstance():TipsManager {
			if(_instance == null) {
				_instance = new TipsManager();
			}
			return _instance;
		}
		
		/**
		 * 添加简单Tips
		 * 
		 * @param	content		需要添加Tips的元件
		 * @param	message		Tips提示语
		 * @param	delay		鼠标移上去后显示Tips的延迟，单位为毫秒
		 * @param	deltaX		Tips位置与元件的X坐标偏移量
		 * @param	deltaY		Tips位置与元件的Y坐标的偏移量
		 */
		public function addTips(content:InteractiveObject, 
				message:String, 
				delay:uint = 0, 
				deltaX:int = 0, deltaY:int = -30, tipsType:int = TipsType.NORMAL):void {
			if(message == null){
//				throw new Error("tips message null");
				return;
			}					
			addTipsToTable(new TipsInfo(content, message, delay, deltaX, deltaY, tipsType));
		}
		
		public static function addTipsAndClickListener(content:InteractiveObject, listener:Function = null, tips:String = "",
					delay:uint = 0,deltaX:int = 0, deltaY:int = -30, tipsType:int = TipsType.NORMAL):void{
			if(listener != null){
				content.addEventListener(MouseEvent.CLICK, listener);
			}
			if(!StringUtil.isEmpty(tips)){
				getInstance().addTips(content, tips, delay, deltaX, deltaY, tipsType);
			}
		}
		
		public static function removeTipsAndClickListner(content:InteractiveObject, listener:Function = null):void{
			if(listener != null){
				content.removeEventListener(MouseEvent.CLICK, listener);
			}
			getInstance().removeTips(content);
		}
		
		/**
		 * 添加复杂Tips
		 * 
		 * @param	content			需要添加Tips的元件
		 * @param	messageTitle	Tips标题
		 * @param	messageContent	Tips内容
		 * @param	delay			鼠标移上去后显示Tips的延迟，单位为毫秒
		 * @param	deltaX			Tips位置与元件的X坐标偏移量
		 * @param	deltaY			Tips位置与元件的Y坐标的偏移量
		 */
		public function addComplexTips(content:InteractiveObject, 
				messageTitle:String, messageContent:String,
				delay:uint = 0,
				deltaX:int = -70, deltaY:int = -70, tipsType:int = TipsType.NORMAL) {
			if(messageTitle == null){
				throw new Error("tips messageTitle null");
			}		
			if(messageContent == null){
				throw new Error("tips messageContent null");
			}												
			addTipsToTable(new TipsInfoComplex(content, messageTitle, messageContent, delay, deltaX, deltaY,tipsType));
		}
		
		/**
		 * 添加自定义Tips,类要实现接口ITips写回调函数callBack(params:Object);
		 * 
		 * @param	content			需要添加Tips的元件
		 * @param	customFile	    自定义元件所在文件名
		 * @param	customClass	    自定义元件类名
		 * @param	params			回调函数参数
		 * @param	delay			鼠标移上去后显示Tips的延迟，单位为毫秒
		 * @param	deltaX			Tips位置与元件的X坐标偏移量
		 * @param	deltaY			Tips位置与元件的Y坐标的偏移量
		 */
		public function addCustomTips(content:InteractiveObject, 
									   customFile:String,
									   customClass:String,
									   params:Object = null,
									   delay:uint = 0,
									   deltaX:int = 9, deltaY:int = 9, tipsType:int = TipsType.NORMAL, 
									   resStorageType:ResStorageType = null) {
			if(customFile == null){
				throw new Error("tips customFile null");
			}
			if(customClass == null){
				throw new Error("tips customClass null");
			}												
			addTipsToTable(new TipsInfoCustom(content, customFile, customClass, params, delay, deltaX, deltaY,tipsType,resStorageType));
		}
		
		public function addCustonTipsByClass(content:InteractiveObject, customCls:Class,
											 params:Object = null, delay:uint = 0, deltaX:int = 9, deltaY:int = 9, 
											 tipsType:int = TipsType.NORMAL):void{
			addTipsToTable(new TipsInfoClass(content, customCls, params, delay, deltaX, deltaY, tipsType));
		}
		
		/**
		 * 移除Tips
		 * 
		 * @param	content		需要移除Tips的元件
		 */
		public function removeTips(content:InteractiveObject):void {
			if(this._contentTable[content] != null) {
				content.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
				content.removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
				content.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
				
				if(this._currentTarget == content) {
					initCommandAndTips();
				}
				
				this._contentTable[content] = null;
				delete this._contentTable[content];
			}
		}
		
		//~ private methods ---------------------------------------------------
		
		private function addTipsToTable(tipsInfo:TipsInfo):void {
			var content:DisplayObject = tipsInfo.content;
			if(this._contentTable[content] == null || this._contentTable[content] == undefined) {
				this._contentTable[content] = tipsInfo;
				content.addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0, true);
				content.addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0, true);
				content.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);
			}
		}
		
		private function onRollOver(e:MouseEvent):void {
			initCommandAndTips();
			
			this._currentTarget = InteractiveObject(e.target);

			var info:TipsInfo = this._contentTable[this._currentTarget] as TipsInfo;
			if(info == null) {
				return;
			}
			
			var content:Object = {};
			content["info"] = info;
			content["target"] = this._currentTarget;
			
			this._currentCommand = new ShowTipsCommand();
			this._currentCommand.addEventListener(SceneCommandEvent.SUCCEED, onShowTipsSucc, false, 0, true);
			this._currentCommand.execute(content);
		}
		
		private function onRollOut(e:MouseEvent):void {
			initCommandAndTips();
		}
		
		private function onRemovedFromStage(e:Event):void {
			var content:InteractiveObject = e.target as InteractiveObject;
			removeTips(content);
		}
		
		private function onShowTipsSucc(e:SceneCommandEvent):void {
			var content:Object = e.params;

			var target:DisplayObject = content["target"] as DisplayObject;
			if(target != this._currentTarget) {
				return;
			}
			
			this._currentCommand.removeEventListener(SceneCommandEvent.SUCCEED, onShowTipsSucc);
			this._currentCommand = null;
			
			this._currentTips = content["tips"];
			(this._currentTips as Sprite).mouseChildren = false;
			(this._currentTips as Sprite).mouseEnabled = false;
			
			target.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			onMouseMove(null);
		}
		
		private function onMouseMove(e:MouseEvent):void {
//			TweenLite.killTweensOf(this._currentTips);
			
			var info:TipsInfo = this._contentTable[this._currentTarget] as TipsInfo;
			if(info == null) {
				return;
			}
//			trace("--------onMouseMove tips: " + this._currentTips);
			var tx:Number = info.deltaX + LoaderContainer.instance.stage.mouseX;
			var ty:Number = info.deltaY + LoaderContainer.instance.stage.mouseY;
			
			var bounds:Rectangle = _currentTips.getBounds(_currentTips);
			if (tx + bounds.left < 0)
			{
				tx = -bounds.left;
			}
			if (tx + bounds.right > LoaderContainer.stageWidth)
			{
				tx = LoaderContainer.stageWidth - bounds.right;
			}
			
			if (ty + bounds.top < 0)
			{
				ty = -bounds.top;
			}
			if (ty + bounds.bottom > LoaderContainer.stageHeight)
			{
				ty = LoaderContainer.stageHeight - bounds.bottom;
			}
			
			this._currentTips.x = tx;
			this._currentTips.y = ty;
//			TweenLite.to(this._currentTips, 0.1, {"x":tx, "y":ty, "ease":Linear.easeNone});
		}
		
		private function initCommandAndTips():void {
			if(this._currentCommand != null) {
				this._currentCommand.cancel();
				this._currentCommand.removeEventListener(SceneCommandEvent.SUCCEED, onShowTipsSucc);
				this._currentCommand = null;
			}
			
			if(this._currentTarget != null) {
				this._currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
				this._currentTarget = null;
			}
			
			if(this._currentTips != null) {
//				TweenLite.killTweensOf(this._currentTips);
				
				if(this._currentTips.parent != null) {
					DisplayUtil.stopAndRemove(this._currentTips);
				}
				
				this._currentTips = null;
			}
		}
		
		private function compileMe():void
		{
			var showTipsCommand:ShowTipsCommand;
		}	
	}
}