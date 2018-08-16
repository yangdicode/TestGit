package mmo.util.component.page
{
	import flash.events.Event;
	
	public class PageManagerEvent extends Event
	{
		public static const PAGE_CHANGED:String = "onPageChanged";
		private var _pageItems:Array;
		
		private var _curPage:int;
		
		private var _totalPage:int;
		public function PageManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function get pageItems():Array
		{
			return _pageItems;
		}	
		
		public function set pageItems(items:Array):void
		{
			this._pageItems = items;
		}	
		
		public function get curPage():int
		{
			return this._curPage;
		}	
		
		public function set curPage(curPage:int):void
		{
			this._curPage = curPage;
		}
		
		public function get totalPage():int
		{
			return this._totalPage;
		}	
		
		public function set totalPage(totalPage:int):void
		{
			this._totalPage = totalPage;
		}	
		
		public function get hasNext():Boolean
		{
			return this._curPage < this._totalPage? true: false;
		}
		
		public function get hasPrev():Boolean
		{
			return this._curPage > 1? true:false;;
		}	
		
		override public function clone():Event
		{
			var evt:PageManagerEvent = new PageManagerEvent(type, bubbles, cancelable);
			evt.curPage = _curPage;
			evt.totalPage = _totalPage;
			evt.pageItems = _pageItems;
			return evt;
		}	
	}
}