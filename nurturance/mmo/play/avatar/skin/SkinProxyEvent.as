package mmo.play.avatar.skin
{
	import flash.events.Event;
	
	public class SkinProxyEvent extends Event
	{
		/**
		 * 衣服图片下载完成
		 * */
		public static const ONSKINLOADED:String = "onSkinLoaded";
		public var skinNo:String;
		public function SkinProxyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}