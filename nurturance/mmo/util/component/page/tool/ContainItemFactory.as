package mmo.util.component.page.tool
{
	import flash.display.Sprite;
	
	public class ContainItemFactory extends NormalPageItemFactory implements IPageItemFactory
	{
		private var _viewArr:Array = [];
		private var _constructParams:*;
		
		/**
		 * @param args 构造参数
		 */		
		public function ContainItemFactory(pageView:Sprite, itemCls:Class, params:* = null)
		{
			_constructParams = params;
			for(var i:int = 0; i < pageView.numChildren; i ++)
			{
				_viewArr.push(pageView.getChildAt(i));
			}
			_viewArr.sortOn(["y", "x"], [Array.NUMERIC, Array.NUMERIC]);
			super(pageView, itemCls);
		}
		
		override public function dispose():void{
			super.dispose();
			_viewArr = null;
		}
		
		override protected function createItem(index:int):IPageItem{
			if(_constructParams != null)
			{
				return new _itemCls(_viewArr[index], _constructParams);
			}
			else
			{
				return new _itemCls(_viewArr[index]);
			}
		}
		
		override protected function getPageNum():int{
			return _view.numChildren;
		}
	}
}