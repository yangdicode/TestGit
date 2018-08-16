package mmo.util.component.page.tool
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import mmo.util.component.page.PageComponent;
	import mmo.util.component.page.PageManagerEvent;

	/**
	 *	多帧页面工具
	 * <br/> 1、显示的页数跟view的帧数有关
	 * <br/>2、支持view跳帧
	 * <br/>3、item的index跟data中的index一致
	 * 
	 */	
	public class PageMutliFrameTool
	{
		private var _curPage:int;
		private var _totalPage:int;
		private var _view:MovieClip;
		private var _arrayAllData:Array;
		
		private var _itemCls:Class;		
		private var _arrayItems:Array
		
		private var _pageComponent:PageComponent;
		
		/**
		 * 多帧页面工具
		 * @param view 视图
		 * @param data 数组类型数据
		 * @param itemCls 格子处理类，实现IPageItem
		 * 
		 */		
		public function PageMutliFrameTool(view:MovieClip, data:Array, itemCls:Class){
			_view = view;
			_arrayAllData = data;
			_totalPage = _view.totalFrames;
			_itemCls = itemCls;
			_arrayItems = [];
			initPage();
		}
		
		public function dispose():void{
			if( _pageComponent ){
				_pageComponent.removeEventListener(PageManagerEvent.PAGE_CHANGED, onPageChange);
				_pageComponent.dispose();
			}
			_pageComponent = null;
			_arrayAllData = null;
			disposeItem();
			_arrayItems = null;
			_itemCls = null;
			_view = null;
		}
		
		public function refresh():void{
			onRefresh();
		}
		
		public function gotoPage(page:int):void{
			refreshData(page);
		}
		
		public function gotoLastPage():void{
			refreshData(_totalPage);
		}
		
		public function set data(data:Array):void{
			_arrayAllData = data;
			refreshData(_curPage);
		}
		
		//————————————————————-
		private function initPage():void{
			if( _view["btnNext"] ){
				var arrayData:Array = [];
				for( var i:int=1;i<=_totalPage;i++ ){
					arrayData.push(i);
				}
				_pageComponent = new PageComponent(arrayData, 1, _view["btnNext"], _view["btnPrev"], _view["txtPage"], _view["txtTotal"], _view["txtJump"], _view["btnJump"]);
				_pageComponent.addEventListener(PageManagerEvent.PAGE_CHANGED, onPageChange);
				_pageComponent.gotoPage(1);
			}else{
				refreshData(1);				
			}
			
			_view.addEventListener(MouseEvent.CLICK, onClickView);
		}
		
		private function onPageChange(evt:PageManagerEvent):void{
			refreshData(evt.pageItems[0]);			
		}
		
		private function refreshData(frameIndex:int):void{
			_curPage = frameIndex;
			_curPage = Math.max(1, frameIndex);
			_curPage = Math.min(_totalPage, frameIndex);
			_view.gotoAndStop(_curPage);
			onRefreshPageChange();
		}
		
		private function onClickView(evt:MouseEvent):void{
			var clickName:String = evt.target.name;
			if(clickName == "btnFirstPage"){
				gotoPage(1);
			}else if(clickName == "btnLastPage"){
				gotoLastPage();
			}
		}
				
		private function onRefreshPageChange():void{
			disposeItem();
			_arrayItems = [];
			for(var i:int = 0; i < _arrayAllData.length; i ++){				
				setItem(_arrayAllData[i], i);
			}			
		}
		
		private function setItem(data:*, pageIndex:int ):void{
			if( !isItemShow(pageIndex) ){
				return;
			}
			var item:IPageItem = onCreateItem(pageIndex);
			_arrayItems.push(item);
			item.setItem(data);
		}
		
		private function onRefresh():void{
			for each(var item:IPageItem in _arrayItems){
				item.refresh();
			}			
		}
		
		private function onCreateItem(index:int):IPageItem{
			return new _itemCls(_view["item" + index]);
		}
		
		private function isItemShow( index:int ):Boolean{
			return (_view["item" + index] != null );
		}
		
		private function disposeItem():void{
			for each(var item:IPageItem in _arrayItems){
				item.dispose();
			}
		}
		
	}
}