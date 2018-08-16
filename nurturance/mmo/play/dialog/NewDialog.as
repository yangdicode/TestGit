package mmo.play.dialog
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	import mmo.common.ModalDialog;
	import mmo.common.ModalDialogManager;
	import mmo.common.dialog.DialogControl;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.play.layer.LayerManager;
	
	public class NewDialog {
		
		private static var _useBgCount:int = 0;
		public function NewDialog() {
		}
		
		/**
		 * 获得笑脸的图标
		 */
		public static function getSucceedIcon(callback:Function = null, context:Object = null):DisplayObject{
			var icon:DisplayObject = createInstance("mmo.common.dialog.Icon_Succeed_Res");
			if(callback != null){ 
				callback.apply(context, [icon]);
			}
			return icon;
		}
		
		/**
		 * 获得哭脸的图标
		 */
		public static function getFailIcon(callback:Function = null, context:Object = null):DisplayObject{
			var icon:DisplayObject = createInstance("mmo.common.dialog.Icon_Fail_Res");
			if(callback != null){ 
				callback.apply(context, [icon]);
			}
			return icon;			
		}
		
		/**
		 * 获得消息提示框
		 * 
		 * @param message	提示语
		 * @param callBack	回调函数，含1个参数，为生成的对话框
		 * @param icon		图标
		 */
		public static function getMessageDialog(message:String
			, callback:Function = null, context:Object = null, icon:DisplayObject = null):ModalDialog {
			if(icon == null){
				icon = getSucceedIcon();
			}
			
			var dialogType:Class = getDefinitionByName("mmo.common.dialog.MessageDialog_Icon_Res") as Class;
			var panel:Sprite = Sprite(new dialogType());
			DialogControl.instance.setIconDialog(panel,icon,message);
			var dialog:ModalDialog = ModalDialog.getCustomDialog(panel);
			
			if(callback != null){ 
				callback.apply(context, [dialog]);
			}
			
			return dialog;
		}
		
		/**
		 * 获得消息提示框
		 * 
		 * @param message	提示语
		 * @param icon		图标
		 * @param confirm   获取确认框
		 */		
		public static function getDialog(message:String, icon = null, confirm:Boolean = false):ModalDialog{
			if(!confirm){
				return getMessageDialog(message, null, null, icon);
			}
			
			return getCofirmDialog(message, icon);
		}
		
		/**
		 * 获取类实例 
		 * @param clsName
		 * @return 
		 * 
		 */
		private static function createInstance(clsName:String):DisplayObject{
			var cls:Class = getDefinitionByName(clsName) as Class;
			var instance:DisplayObject = DisplayObject(new cls());
			return instance;	
		}
		
		/**
		 * 用模态对话框显示信息
		 * 
		 * @param message	提示语
		 * @param icon		图标，默认为笑脸
		 */
		public static function showMessage(message:String, icon:DisplayObject = null,nextFun:Function = null,inCancel:Boolean = true, layer:Sprite = null):void{
			NewDialog.showCustomDialog(getMessageDialog(message, null, null, icon),nextFun,inCancel,false,null,layer);
		}
		
		/**
		 * 显示成功提示语
		 * @param message	提示语
		 */
		public static function showSucceedMessage(message:String,nextFun:Function = null,inCancel:Boolean = true, layer:Sprite = null):void{
			showMessage(message, getSucceedIcon(),nextFun,inCancel,layer);
		}
		
		/**
		 * 显示失败提示语
		 * 
		 * @param message	提示语
		 */
		public static function showFailMessage(message:String,nextFun:Function = null,inCancel:Boolean = true, layer:Sprite = null):void{
			showMessage(message, getFailIcon(),nextFun,inCancel,layer);
		}
		
		/**
		 * 获取确认提示框 
		 * @param message
		 * @param callback
		 * @param context
		 * @param icon
		 * @return 
		 * 
		 */
		public static function getCofirmDialog(message:String,icon:DisplayObject = null):ModalDialog{
			var panel:Sprite = null;
			var dialogType:Class = null;
			if(icon == null){
				dialogType = getDefinitionByName("mmo.common.dialog.ConfirmDialog_Res") as Class;
				panel = Sprite(new dialogType());	
				DialogControl.instance.setDialog(panel,message);
			}
			else {
				dialogType = getDefinitionByName("mmo.common.dialog.ConfirmDialog_Icon_Res") as Class;
				panel = Sprite(new dialogType());
				DialogControl.instance.setIconDialog(panel,icon,message);
			}		
			var dialog:ModalDialog = ModalDialog.getCustomDialog(panel);	
			return dialog;		
		}
		
		/**
		 * 显示确认提示框 
		 * @param message
		 * @param callback
		 * @param context
		 * @param icon
		 * @return 
		 */
		public static function showCofirmDialog(message:String,icon:DisplayObject = null):ModalDialog{
			var dlg:ModalDialog = getCofirmDialog(message,icon);
			show(dlg);
			return dlg;
		}
		
		/**
		 * 显示选择确定框
		 * @param nextFun 确定选择后回调函数
		 * 
		 * @param needBackName 为true时，nextFun需要参数strName返回点击按钮的名称；为false时，则不需要参数
		 *
		 *  @modify by hanjun 2012年12月13日18:40:14
		 */		
		public static function showChoiceDialog(message:String,nextFun:Function = null,icon:DisplayObject = null,layer:Sprite = null,showBack:Boolean = true,needBackName:Boolean=false):ModalDialog{
			if(icon == null){
				icon = getSucceedIcon();
			}
			return NewDialog.showCustomDialog(NewDialog.getCofirmDialog(message,icon),nextFun,needBackName,needBackName,null,layer,-1,-1,showBack);//isCancel 跟needBackName的一样
		}
		
		/**
		 * 添加模态对话框
		 *
		 * @param	window		窗口
		 * @param	alignType	位置。
		 * @param	x			窗口坐标，alignType为none时有效
		 * @param	y
		 * @param	effect		窗口动画效果，默认为弹出效果
		 * @param	effect		窗口动画效果，默认为弹出效果
		 * @param	grayBackground 是否显示灰色底色。false时为透明底
		 * @return	是否添加成功
		 */
		public static function addModalDialog(window:DisplayObject,
											  alignType:int = 4,  //AlignType.MIDDLE_CENTER
											  effect:int = 0,  	  //PanelEffect.NONE
											  grayBackground:Boolean = true,
											  x:int = -1,
											  y:int = -1):Boolean
		{
			return ModalDialogManager.getInstance(LayerManager.getBaseTop()).addModalDialog(
				window,alignType,effect,grayBackground,x,y);
		}
		
		/**
		 * 关闭浮动显示窗口
		 *
		 * @param	window		待关闭的浮动窗口
		 * @param	effect		动画效果，默认为弹出效果
		 */
		public static function removeModalDialog(window:DisplayObject, 
										   effect:int = 0):Boolean   //PanelEffect.NONE
		{
			return ModalDialogManager.getInstance(LayerManager.getBaseTop()).removeModalDialog(window,effect);
		}
		
		/**获得自定义框**/
		public static function getCustomDialog(dialogSprite:Sprite):ModalDialog
		{
			return ModalDialog.getCustomDialog(dialogSprite);
		}
		
		/**
		 * 在层上显示dialogSprite
		 * 命名为"btnClose","btnCancel"将会自动关闭
		 * @param dialogSprite
		 * @param layer
		 */		
		public static function show(dialogSprite:Sprite,layer:Sprite = null,x:int=-1,y:int=-1,
									  grayBackground:Boolean = false):void
		{
			if(layer == null){
				layer = LayerManager.getCurrentLayerTop();
			}
			var dlg:ModalDialog;
			if(dialogSprite is ModalDialog)
			{
				dlg = ModalDialog(dialogSprite);
			}else{
				DialogControl.instance.setDialog(dialogSprite);
				dlg = getCustomDialog(dialogSprite);
			}
			
			dlg.show(layer,x,y,grayBackground);
		}
		
		/**
		 * 自定义dialog显示，可以用后续函数来执行后续操作
		 * @param dialogSprite 弹出的自定义面板框
		 * @param nextFun 弹出框的后续操作函数
		 * @param inCancel 后续函数操作是否包括Cancel,Close操作
		 * @param needBackName 返回当前操作的触发键是哪个
		 * @param funArgArray 返回函数的参数数组
		 * @return 
		 */		
		public static function showCustomDialog(dialogSprite:Sprite,nextFun:Function = null,
			inCancel:Boolean = false,needBackName:Boolean = false,funArgArray:Array = null,
			layer:Sprite = null,x:int=-1,y:int=-1,grayBackground:Boolean = true):ModalDialog
		{
			var dialog:ModalDialog;
			if(dialogSprite is ModalDialog){
				dialog = ModalDialog(dialogSprite);
			}else{
				DialogControl.instance.setDialog(dialogSprite);
				dialog = getCustomDialog(dialogSprite);
			}
			
			DialogControl.instance.setNextFun(dialog,nextFun,inCancel,needBackName,funArgArray);
			
			show(dialog,layer,x,y,grayBackground);
			return dialog;
		}
		
		/**
		 * 加载并显示modalDialog,可以传回调函数
		 */
		public static function loadAndShowDialog(fileName:String,className:String,
													x:int = -1,y:int = -1,
												    nextFun:Function = null,inCancel:Boolean = false,
												    needBackName:Boolean = false,funArgArray:Array = null,
													layer:Sprite = null,grayBackground:Boolean = true):void
		{
			var onGetDialog:Function = function(dialog:Sprite):void
			{
				ProgressFullSprite.close();
				showCustomDialog(dialog,nextFun,inCancel,needBackName,funArgArray,layer,x,y,grayBackground);
			}
				
			ProgressFullSprite.show(false);
			ResScheduler.getResource(fileName,onGetDialog,className);
		}
		
		public static function loadAndShowInSceneDomain(fileName:String, className:String,
														x:int = -1, y:int = -1,
														nextFun:Function = null, inCancel:Boolean = false,
														needBackName:Boolean = false, funArgArray:Array = null,
														layer:Sprite = null, grayBackground:Boolean = true):void
		{
			ProgressLoader.load(fileName, onLoadDialog, className);
			function onLoadDialog(sp:Sprite):void{
				ProgressLoader.close();
				showCustomDialog(sp, nextFun, inCancel, needBackName, funArgArray, layer, x, y, grayBackground);
			}
		}
		
		
		public static function closeDialog(customSprite:DisplayObject, cancel:Boolean=false):void
		{
			ModalDialog.closeDialog(customSprite,cancel);
		}
		
		public static function clearModalDialog():void
		{
			ModalDialogManager.getInstance(LayerManager.getBaseTop()).clearAll();
			ModalDialogManager.getInstance(LayerManager.getMovieLayer()).clearAll();
		}
		
		public static function clearFloatPanel():void
		{
			FloatPanelManager.getInstance().clearAll();
		}
		
		public static function clearAll():void
		{
			clearModalDialog();
			clearFloatPanel();
		}
		
		/**
		 * 获取当前场景的底图
		 */		
		public static function getBackgroundBitmap(colorForm:Number = 1):Bitmap
		{
			return new Bitmap();
		}
		/**
		 * 将场景移出显示区域，显示背景换成由原场景生成的bitmap。
		 */		
		public static function setMovieBackground(blur:Boolean = false):void{
		}
		/**
		 * 恢复场景
		 */		
		public static function removeMovieBackground(force:Boolean = false):void{
		}
		
		/** 场景是否被移除  **/
		public static function isBackGroundRemove():Boolean{
			return true;
		}
	}
}