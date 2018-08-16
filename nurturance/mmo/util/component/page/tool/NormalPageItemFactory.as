package mmo.util.component.page.tool
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class NormalPageItemFactory extends EventDispatcher implements IPageItemFactory
	{
		protected var _itemCls:Class;
		protected var _pageNum:int;
		protected var _view:Sprite;
		
		protected var _items:Vector.<IPageItem>;
		
		/**
		 * @param itemCls  格子处理类，实现IPageItem
		 */		
		public function NormalPageItemFactory(pageView:Sprite, itemCls:Class){
			_view = pageView;
			_pageNum = getPageNum();
			_itemCls = itemCls;
			_items = new Vector.<IPageItem>();
			for(var i:int = 0; i < _pageNum; i ++){
				_items.push(createItem(i));
			}
		}
		
		public function dispose():void{
			for each(var item:IPageItem in _items){
				item.dispose();
			}
			_items = null;
			_itemCls = null;
			_view = null;
		}
		
		public function onPageChange(pageItems:Array, curPage:int):void{
			var len:int = pageItems.length;
			var index:int;
			for(var i:int = 0; i < _pageNum; i ++){
				index = (curPage - 1) * _pageNum + i + 1;
				if(i < len){
					setItem(pageItems[i], i, index);
				}else{
					clearItem(i);
				}
			}
		}
		
		public function setItem(data:*, pageIndex:int, arrIndex:int):void{
			var item:IPageItem = getItem(pageIndex);
			item.setItem(data);
		}
		
		public function clearItem(pageIndex:int):void{
			var item:IPageItem = _items[pageIndex];
			item.clearItem();
		}
		
		public function refresh():void{
			for each(var item:IPageItem in _items){
				item.refresh();
			}
		}
		
		public function get pageNum():int{
			return _pageNum;
		}
		
		public function get items():Vector.<IPageItem>{
			return _items;
		}
		
		public function registerItemListener(type:String, listener:Function):void
		{
			if(_items.length > 0 && _items[0] is IEventDispatcher)
			{
				var dispatcher:IEventDispatcher;
				for each(dispatcher in _items)
				{
					dispatcher.addEventListener(type, listener);
				}
			}
		}
		
		protected function getItem(index:int):IPageItem{
			return _items[index];
		}
		
		protected function createItem(index:int):IPageItem{
			return new _itemCls(_view["item" + index]);
		}
		
		protected function getPageNum():int{
			for(var i:int = 0; i < 100; i ++){
				if(_view.getChildByName("item" + i) == null){
					return i;
					break;
				}
			}
			return 0;
		}
		
	}
}