package mmo.util.component.page.tool
{
	public interface IPageItem
	{
		function setItem(data:*):void;
		
		function clearItem():void;
		
		function dispose():void;
		
		function refresh():void;
	}
}