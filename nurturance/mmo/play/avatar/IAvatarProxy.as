package mmo.play.avatar {
	
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.interfaces.IDispose;
	
	/**
	 * 用户形象代理
	 */
	public interface IAvatarProxy extends IDispose, IEventDispatcher {
		
		/**
		 * 设置用户形象
		 * 
		 * @param avatarInfo
		 */
		function setAvatarInfo(avatarInfo:AvatarInfo):void;
		
		/**
		 * 获得用户形象
		 * 
		 * @return	AvatarInfo
		 */
		function getAvatarInfo():AvatarInfo;
		
		/**
		 * 获得用户形象Sprite
		 * 
		 * @return	Sprite
		 */
		function getSprite():Sprite;
		
		/**
		 * 执行动作
		 * 
		 * @param act	动作编码
		 */
		function action(act:String):Boolean;
		
		/**
		 * 当前动作
		 * 
		 * @return	String
		 */
		function currentAction():String;
		
	}
	
}