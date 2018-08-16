package mmo.play.material.changehelper
{
	public interface IResourceChangeObserver
	{
		function start():void;
		function stop():void;
		function restart():void;
		function showChangePanel(type:int = 1):void;
		function getChangeValue():*
		function clear():void;
		function isChangeValue():Boolean;
	}
}