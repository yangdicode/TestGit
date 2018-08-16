package mmo.play.panel.tab
{
	import flash.display.Sprite;

	public interface ITabView
	{
		function getPanel():Sprite;
		function dispose():void;
	}
}

