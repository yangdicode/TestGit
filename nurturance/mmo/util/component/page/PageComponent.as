package mmo.util.component.page
{
	import flash.display.InteractiveObject;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	

	public class PageComponent extends EventDispatcher
	{
		private var _pageManager:PageManager;
		
		private var _btnNext:SimpleButton;
		private var _btnPrev:SimpleButton;
		private var _txtPage:TextField;
		private var _txtTotal:TextField;
		private var _jumpPageText:TextField;
		private var _jumpPageBtn:InteractiveObject;
		public function PageComponent(data:Array, perPageNum:int, 
			btnNext:SimpleButton = null, btnPrev:SimpleButton = null, 
			txtPage:TextField = null, txtTotal:TextField = null, 
			jumpPageText:TextField = null, jumpPageBtn:InteractiveObject = null)
		{
			_pageManager = new PageManager(data, perPageNum);
			_pageManager.addEventListener(PageManagerEvent.PAGE_CHANGED, onPageChanged);			
			
			_btnNext = btnNext ||= new SimpleButton();
			_btnPrev = btnPrev ||= new SimpleButton();
			_txtPage = txtPage;
			_txtTotal = txtTotal;
			_btnNext.addEventListener(MouseEvent.CLICK, onNext);
			_btnPrev.addEventListener(MouseEvent.CLICK, onPrev);
			_jumpPageText = jumpPageText;
			_jumpPageBtn = jumpPageBtn;
			setJumpPage();
		}
		
		public function set data(data:Array):void
		{
			_pageManager.data = data;
			if(_jumpPageText != null)
			{
				_jumpPageText.text = "1";
			}
		}	
		
		public function gotoPage(page:int):void
		{
			_pageManager.gotoPage(page);
		}	
		
		public function get curPage():int
		{
			return _pageManager.curPage;
		}
		
		public function get totalPage():int
		{
			return _pageManager.totalPage;
		}
		
		public function get perPageNum():int{
			return _pageManager.perPageNum;
		}
		
		public function changePerPageNum(perPageNum:int):void
		{
			_pageManager.changePerPageNum(perPageNum);
		}
		
		private function onPageChanged(evt:PageManagerEvent):void
		{
			if(_txtPage != null){
				_txtPage.text = String(evt.curPage);
			}
			if(_txtTotal != null){
				_txtTotal.text = String(evt.totalPage);
			}
			if(evt.hasNext)
			{
				DisplayUtil.clearFilters(_btnNext);
			}else
			{
				DisplayUtil.applyGray(_btnNext);
			}	
			if(evt.hasPrev)
			{
				DisplayUtil.clearFilters(_btnPrev);
			}else
			{
				DisplayUtil.applyGray(_btnPrev);
			}	
			this.dispatchEvent(evt);
		}	
		
		private function onNext(evt:MouseEvent):void
		{
			_pageManager.nextPage();
		}	
		
		private function onPrev(evt:MouseEvent):void
		{
			_pageManager.prevPage();
		}	
		
		private function setJumpPage():void
		{
			if(_jumpPageBtn == null || _jumpPageText == null)
				return;
			_jumpPageText.text = "1";
			_jumpPageText.restrict = "0-9";
			_jumpPageText.addEventListener(Event.CHANGE, onJumpPageChange);
			_jumpPageBtn.addEventListener(MouseEvent.CLICK, onJumpPage);
			_jumpPageText.addEventListener(MouseEvent.MOUSE_DOWN, onDownText, false, 10);
			_jumpPageText.addEventListener(KeyboardEvent.KEY_DOWN, onPressKey);
		}
		
		private function onJumpPage(evt:MouseEvent):void{
			tryJump();
		}
		
		private function onPressKey(evt:KeyboardEvent):void{
			if(evt.keyCode == 13){
				tryJump();
			}
		}
		
		private function tryJump():void{
			var jumpToPage:int = int(_jumpPageText.text);
			if(jumpToPage > _pageManager.totalPage || jumpToPage < 0 || jumpToPage == _pageManager.curPage)
				return;
			_pageManager.gotoPage(jumpToPage);
		}
		
		private function onDownText(evt:MouseEvent):void
		{
			evt.stopImmediatePropagation();
			evt.stopPropagation();
		}
		
		private function onJumpPageChange(evt:Event):void
		{
			var page:int = int(_jumpPageText.text);
			if(page > _pageManager.totalPage)
				_jumpPageText.text = String(_pageManager.totalPage);
			if(page < 0)
				_jumpPageText.text = "0";
		}
		
		public function dispose():void
		{
			_pageManager.removeEventListener(PageManagerEvent.PAGE_CHANGED, onPageChanged);	
			_pageManager = null;
			
			_btnNext.removeEventListener(MouseEvent.CLICK, onNext);
			_btnNext = null;
			_btnPrev.removeEventListener(MouseEvent.CLICK, onPrev);
			_btnPrev = null;
			
			if(_jumpPageText != null)
			{
				_jumpPageText.removeEventListener(Event.CHANGE, onJumpPageChange);
				_jumpPageBtn.removeEventListener(MouseEvent.CLICK, onJumpPage);
				_jumpPageText.removeEventListener(MouseEvent.MOUSE_DOWN, onDownText);
				_jumpPageText.removeEventListener(KeyboardEvent.KEY_DOWN, onPressKey);
				_jumpPageBtn = null;
				_jumpPageText = null;
			}
			
			_txtPage = null;
			_txtTotal = null;
		}	
	}
}