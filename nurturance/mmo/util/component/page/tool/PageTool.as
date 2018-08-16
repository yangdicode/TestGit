package mmo.util.component.page.tool
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mmo.util.component.page.PageComponent;
	import mmo.util.component.page.PageManagerEvent;

	/**
	 * view需要有按钮：_view["btnNext"], _view["btnPrev"],
	 * 
	 */	
	public class PageTool
	{
		
		private var _view:Sprite;
		private var _pageNum:int;
		private var _data:Array;
		private var _factory:IPageItemFactory;
		
		private var _pageComponent:PageComponent;
		
		//————————————————————————		
		private function compile():void{
			IPageItem;
			IPageItemFactory;
			NormalPageItemFactory;
			ContainItemFactory;
			PageMutliFrameTool;
			PerPageData;
			PerPageTool;
		}		
		//————————————————————————
		
		public function PageTool(view:Sprite, data:Array, factory:IPageItemFactory){
			_view = view;
			_data = data;
			_factory = factory;
			_pageNum = _factory.pageNum;
			initPage();
		}
		
		public function dispose():void{
			_pageComponent.removeEventListener(PageManagerEvent.PAGE_CHANGED, onPageChange);
			_pageComponent.dispose();
			_factory.dispose();
			_data = null;
			_pageComponent = null;
			_view = null;
		}
		
		public function refresh():void{
			_factory.refresh();
		}
		
		public function gotoPage(page:int):void{
			_pageComponent.gotoPage(page);
		}
		
		public function gotoLastPage():void{
			_pageComponent.gotoPage(_pageComponent.totalPage);
		}
		
		public function set data(data:Array):void{
			_data = data;
			_pageComponent.data = data;
		}
		
		public function get data():Array{
			return _data;
		}
		
		public function get factory():IPageItemFactory{
			return _factory;
		}
		
		public function get curPage():int{
			return _pageComponent.curPage;
		}
		
		public function registerItemListener(type:String, listener:Function):void
		{
			_factory.registerItemListener(type, listener);
		}
		
		private function initPage():void{
			_pageComponent = new PageComponent(_data, _pageNum, _view["btnNext"], _view["btnPrev"], _view["txtPage"], _view["txtTotal"], _view["txtJump"], _view["btnJump"]);
			_pageComponent.addEventListener(PageManagerEvent.PAGE_CHANGED, onPageChange);
			_pageComponent.gotoPage(1);
			_view.addEventListener(MouseEvent.CLICK, onClickView);
		}
		
		private function onPageChange(evt:PageManagerEvent):void{
			var pageItems:Array = evt.pageItems;
			_factory.onPageChange(pageItems, _pageComponent.curPage);
		}
		
		private function onClickView(evt:MouseEvent):void{
			var clickName:String = evt.target.name;
			if(clickName == "btnFirstPage"){
				gotoPage(1);
			}else if(clickName == "btnLastPage"){
				gotoLastPage();
			}
		}
		
	}
}