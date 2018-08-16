package mmo.util.component.page.tool
{
	import flash.display.Sprite;

	public interface IPageItemFactory
	{
		function get pageNum():int;
		function dispose():void;
		
		function setItem(data:*, pageIndex:int, arrIndex:int):void;
		function clearItem(pageIndex:int):void;
		
		function refresh():void;
		
		function onPageChange(pageItems:Array, curPage:int):void;
		
		function get items():Vector.<IPageItem>;
		
		function registerItemListener(type:String, listener:Function):void;
		
	}
}