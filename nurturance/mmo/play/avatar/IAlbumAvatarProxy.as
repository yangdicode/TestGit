package mmo.play.avatar {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	public interface IAlbumAvatarProxy extends IAvatarProxy {
		
		
		/**
		 * 用服装形象代替占位框，并返回形象框
		 * 
		 * @param placeHolder	占位框
		 * 
		 * @return Sprite
		 */
		function replace(placeHolder:DisplayObject):Sprite;
		
		/**
		 * 获得形象Sprite
		 * 该方法获得的服装形象，会将服装的中心调整到注册点(0,0)
		 * 
		 * @param width		宽度
		 * @param height	高度
		 * 
		 * @return Sprite
		 */
		function getSpriteForFixed(width:int, height:int):Sprite;
		
		/**
		 * 获得玩家的半身像
		 * 
		 * @param width		宽度
		 * @param height	高度
		 * 
		 * @return Sprite
		 */
		function getHalfSprite(width:int, height:int):Sprite;
	}
	
}