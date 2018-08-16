package mmo.play.avatar.proxy
{

	import flash.display.Sprite;
	import flash.geom.Rectangle;

	import mmo.common.DisplayUtil;
	import mmo.interfaces.IDispose;
	import mmo.play.avatar.AvatarEvent;

	public class AlbumViewHelper implements IDispose
	{

		//~ fields ------------------------------------------------------------

		/** 产生视图的AvatarProxy */
		private var _avatarProxy:BaseAvatarProxy;

		/** 调整的目标宽度 */
		private var _width:int;

		/** 调整的目标高度 */
		private var _height:int;

		/** 可调整的元件 */
		private var _sprite:Sprite;

		//~ public methods ----------------------------------------------------

		function AlbumViewHelper(proxy:BaseAvatarProxy, sprite:Sprite, width:int, height:int)
		{
//			trace("-------AlbumViewProxy Constructured");
			this._avatarProxy = proxy;
			this._sprite = sprite;
			this._width = width;
			this._height = height;

			onAvatarSpriteChanged(null);

			this._avatarProxy.addEventListener(AvatarEvent.AVATAR_SPRITE_CHANGED, onAvatarSpriteChanged);
		}

		public function dispose():void
		{
//			trace("--------AlbumViewProxy disposed");
			this._avatarProxy.removeEventListener(AvatarEvent.AVATAR_SPRITE_CHANGED, onAvatarSpriteChanged);
			this._avatarProxy = null;
			this._sprite = null;
		}

		//~ private methods ---------------------------------------------------

		private function onAvatarSpriteChanged(e:AvatarEvent):void
		{
			var sp:Sprite = this._avatarProxy.getSprite();

			if (sp.width / sp.scaleX > this._width || sp.height / sp.scaleY > this._height)
			{
				DisplayUtil.scaleDisplay(this._sprite, this._width, this._height);
			}
		}

	}
}