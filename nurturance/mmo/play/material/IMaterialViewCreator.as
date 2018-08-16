package mmo.play.material
{
	import flash.display.DisplayObject;
	
	public interface IMaterialViewCreator
	{
		function getView(id:int):DisplayObject;
		function getIcon(id:int, width:Number = 0, height:Number = 0):DisplayObject;	
	}
}