package mmo.interfaces.garden
{
	import mmo.interfaces.IService;
	
	public interface IGardenInteract extends IService
	{
		function initData():void;
		function get interactType():String;
		function onGardenSceneInit():void;
		function onGardenSceneDispose():void;
	}
}