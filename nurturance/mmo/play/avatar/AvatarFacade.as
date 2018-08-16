package mmo.play.avatar {
	
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.play.avatar.proxy.AlbumAvatarProxy;
	
	public class AvatarFacade{
		
		//~ constants ---------------------------------------------------------
		
		/** 设置附加服装信息 */
		public static const UPDATE_ADDITIONAL_CLOTHES:String = 
			"UpdateAdditionalClothes";
		//~ public methods ----------------------------------------------------
		public static const dispatcher:EventDispatcher = new EventDispatcher();
		public function AvatarFacade() {
			
		}
		
		/**
		 * 魔妆店专用
		 * @param avatarInfo 形象信息
		 * 
		 */		
		public static function getMakeUpAvatarProxy(avatarInfo:AvatarInfo = null):IAlbumAvatarProxy
		{
			var albumAvatarProxy:AlbumAvatarProxy = new AlbumAvatarProxy(true, false, true);
			if(avatarInfo != null) {
				albumAvatarProxy.setAvatarInfo(avatarInfo);
			}
			return albumAvatarProxy;
		}
		
		/**
		 * 获得相册的用户形象代理
		 * 如果需要在形象卡全部下下载后, 再进行处理,
		 * 请将使用以下调用格式,也就是保证设置avatarInfo在监听之后
		 * var proxy:IAlbumAvatarProxy = AvatarFacade.getAlbumAvatarProxy(clickable);
		 * proxy.addEventListener(AvatarEvent.onAvatarSpriteComplete, onSpriteComplete);
		 * proxy.setAvatarInfo(avatarInfo);
		 * 
		 * @param avatarInfo	形象信息
		 * 
		 * @return	ICardAvatarProxy
		 */
		public static function getAlbumAvatarProxy(
				clickable:Boolean = false, 
				avatarInfo:AvatarInfo = null, isHalfAvatar:Boolean = false):IAlbumAvatarProxy {
			var albumAvatarProxy:AlbumAvatarProxy = new AlbumAvatarProxy(clickable, isHalfAvatar);
			if(avatarInfo != null) {
				albumAvatarProxy.setAvatarInfo(avatarInfo);
			}
			return albumAvatarProxy;
		}
		
		private function compileMe():void
		{
			var avatarEvent:AvatarEvent;
			var avatarHelper:AvatarHelper;
		}	
	}
}