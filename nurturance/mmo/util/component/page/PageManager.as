package mmo.util.component.page
{
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	
	public class PageManager extends EventDispatcher
	{
		private var _data:Array;
		private var _pages:int;
		private var _perPageNum:int;	
		private var _curPage:int;
		public function PageManager(data:Array, perPageNum:int = 8)
		{	
			this._perPageNum = perPageNum;
			
			this.data = data;
		}
		
		public function set data(data:Array):void
		{
			if(!data)
			{
				return;
			}	
			this._data = data;
			this._pages = (this._data.length - 1) / this._perPageNum + 1;	
			this._pages = _pages > 0? _pages : 1;
			if(_curPage > _pages)
			{
				_curPage = _pages;
			}	
			if(_curPage < 1)
			{
				_curPage = 1;
			}	
			gotoPage(this._curPage);
		}	
		
		public function get totalPage():int
		{
			return _pages;
		}	
		
		public function gotoPage(index:int):void
		{
			if(this._data == null)
			{
				return;
			}	
			if(index < 1 || index > this._pages)
			{
				return;
			}	
			this._curPage = index;
			
			var evt:PageManagerEvent = new PageManagerEvent(PageManagerEvent.PAGE_CHANGED);
			evt.pageItems = getPageItems();
			evt.curPage = this._curPage;
			evt.totalPage = this._pages;
			this.dispatchEvent(evt);
		}	
		
		public function nextPage():void
		{
			this.gotoPage(this._curPage + 1);
		}	
		
		public function prevPage():void
		{
			this.gotoPage(this._curPage - 1);
		}	
		
		public function changePerPageNum(perPageNum:int):void
		{
			this._perPageNum = perPageNum;
			this._pages = (this._data.length - 1) / this._perPageNum + 1;
//			gotoPage(1);
		}
		
		private function getPageItems():Array
		{
			var start:int = (this._curPage - 1) * this._perPageNum;
			var end:int = this._curPage * this._perPageNum;
			end = end > this._data.length? this._data.length : end;
			var arr:Array = [];
			for (var i:int = start; i < end; i++)
			{
				arr.push(this._data[i]);
			}
			return arr;
		}	

		public function get curPage():int
		{
			return _curPage;
		}

		public function get perPageNum():int
		{
			return _perPageNum;
		}

	}
}