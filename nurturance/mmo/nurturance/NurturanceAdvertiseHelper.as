package mmo.nurturance
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.System;

	public class NurturanceAdvertiseHelper
	{
		public function NurturanceAdvertiseHelper()
		{
		}
		
		public static function copyContent():void
		{
			//System.setClipboard("我在奥雅之光专区玩好玩的文字游戏哦，完成游戏还可以获得奥雅之光精美的服饰，你也去看看吧！网址：http://aoya.100bt.com/");
			System.setClipboard("我在7K7K奥雅之光专区玩好玩的文字游戏哦，完成游戏还可以获得奥雅之光精美的服饰，你也去看看吧！网址：http://www.7k7k.com/special/aoya/");
		}
		
		public static function gotoAoYa():void
		{
			//navigateToURL(new URLRequest("http://aoya.100bt.com/"), "_blank");
			navigateToURL(new URLRequest("http://www.7k7k.com/special/aoya/"), "_blank");
			//navigateToURL(new URLRequest("http://news.4399.com/aoyazhiguang/"), "_blank");
		}
	}
}