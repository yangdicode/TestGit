package mmo.play.avatar {
	
	import flash.events.Event;
	
	public class AvatarEvent extends Event {
		
		//~ constants ---------------------------------------------------------
		
		/** 服装信息改变 */
		public static const AVATAR_INFO_CHANGED:String = "onAvatarInfoChanged";
		
		/** 
		 * 用户穿着的服装改变
		 * 
		 * @param clothesId		服装ID 
		 */
		public static const AVATAR_SPRITE_CHANGED:String = "onAvatarSpriteChanged";
		
		/** 用户穿着的服装已更新完毕 */
		public static const AVATAR_SPRITE_COMPLETED:String = "onAvatarSpriteCompleted"; 
		
		/** 用户服装被选择 */
		public static const CLOTHES_SELECTED:String = "onClothesSelected";
		
		//~ fields ------------------------------------------------------------
		
		private var _params:Object;
		
		//~ public methods ----------------------------------------------------
		
		public function AvatarEvent(type:String, params:Object = null) {
			super(type);
			this._params = params;
		}
		
		public function get params():Object {
			return this._params;
		}

	}
}