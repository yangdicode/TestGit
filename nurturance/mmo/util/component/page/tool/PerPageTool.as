package mmo.util.component.page.tool
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mmo.common.DisplayUtil;
	
	/**
	 * 每页都向后端取数据
	 *	<br/> view需要有按钮：_view["btnNext"], _view["btnPrev"], 
	 * 
	 */	
	public class PerPageTool
	{
		private var _view:Sprite;
		private var _items:Array = [];
		
		private var _data:PerPageData;
		private var _onDataChange:Function;
		
		private var _forceFresh:Boolean = false;
		private var _forceNoFresh:Boolean = false
		
		/**
		 * 每页都向后端取数据
		 * @param itemCls 实现IPageItem
		 * @param dataCls 继承PerPageData
		 */	
		
		public function PerPageTool(view:Sprite, itemCls:Class, data:PerPageData, dataChange:Function = null){
			_view = view;
			_data = data;
			_onDataChange = dataChange;
			
			var itemView:Sprite;
			var item:IPageItem;
			for(var i:int = 0; i < 50; i ++){
				itemView = _view["item" + i];
				if(itemView == null){
					_data.perPageNum = i;
					break;
				}
				item = new itemCls(itemView);
				_items.push(item);
			}
			_data.setDataChangeCallBackFunc(onDataChange);
			_view.addEventListener(MouseEvent.CLICK, onClickView);
			_view["txtPage"].text = "0";
			_view["txtTotal"].text = "0";
		}
		
		public function gotoPage(page:int, forceFresh:Boolean = false, forceNoFresh:Boolean = false):void{
			_forceFresh = forceFresh;
			_forceNoFresh = forceNoFresh;
			_data.gotoPage(page, forceFresh, forceNoFresh);
		//	onDataChange();
		}
		
		/** 强制从服务端取数据刷新本页 */
		public function refreshCurPageData():void{
			_data.gotoPage(_data.curPage, true);
		}
		
		public function dispose():void{
			_data.dispose();
			for each(var item:IPageItem in _items){
				item.dispose();
			}
			_data = null;
			_view = null;
			_items = null;
		}
		
		public function get totalNum():int{
			return _data.totalNum;
		}
		
		public function get curPage():int{
			return _data.curPage;
		}
		
		public function get perPageNum():int{
			return _data.perPageNum;
		}
		
		public function setCurData( valuse:Array, forceNoFresh:Boolean = false ):void{
			_forceNoFresh = forceNoFresh;
			_data.setCurData(valuse, forceNoFresh);
		}
		
		private function onDataChange():void{
			var data:Array = _data.curPageData;
			for(var i:int = 0; i < _items.length; i ++){
				if(i < data.length){
					IPageItem(_items[i]).setItem(data[i]);
				}else{
					IPageItem(_items[i]).clearItem();
				}
			}
			refreshPageState();
			if(_onDataChange != null){
				_onDataChange.apply();
			}
		}
		
		private function refreshPageState():void{
			_view["txtPage"].text = _data.curPage;
			_view["txtTotal"].text = _data.totalPage;
			DisplayUtil.setButtonState(_view["btnPrev"], _data.curPage > 1);
			DisplayUtil.setButtonState(_view["btnNext"], _data.curPage < _data.totalPage);
			if(_view["btnFirstPage"] != null){
				DisplayUtil.setButtonState(_view["btnFirstPage"], _data.curPage > 1);
			}
			if(_view["btnLastPage"] != null){
				DisplayUtil.setButtonState(_view["btnLastPage"], _data.curPage < _data.totalPage);
			}
		}
		
		private function onClickView(evt:MouseEvent):void{
			var clickName:String = evt.target.name;
			if(clickName == "btnNext"){
				_data.gotoPage(_data.curPage + 1, _forceFresh, _forceNoFresh);
			}else if(clickName == "btnPrev"){
				_data.gotoPage(_data.curPage - 1, _forceFresh, _forceNoFresh);
			}else if(clickName == "btnLastPage"){
				_data.gotoPage(_data.totalPage, _forceFresh, _forceNoFresh);
			}else if(clickName == "btnFirstPage"){
				_data.gotoPage(1, _forceFresh, _forceNoFresh);
			}
		}
	}
}