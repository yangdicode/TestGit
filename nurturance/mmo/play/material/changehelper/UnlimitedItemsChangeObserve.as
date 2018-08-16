package mmo.play.material.changehelper
{
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;
	import mmo.play.material.panel.MaterialGetPanel;
	import mmo.play.unlimited.UserUnlimitedItem;
	import mmo.play.unlimited.UserUnlimitedItems;
	
	public class UnlimitedItemsChangeObserve implements IResourceChangeObserver
	{
		private var _itemChange:Object;
		
		public function UnlimitedItemsChangeObserve()
		{
			this._itemChange = {};
		}
		
		public function start():void
		{
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUnlimitedItemChanged);
		}
		
		public function stop():void
		{
			ChangeableDispatcher.instance.removeEventListener(ChangeableEvent.onObjectPropertyChanged, onUnlimitedItemChanged);
		}
		
		public function restart():void
		{
			this.clear();
			this.start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			if (this.isBoutiqueCoinChange())
			{
				var num:Number = this._itemChange[UserUnlimitedItems.BoutiqueCoin];
				MaterialGetPanel.instance().showBoutiqueCoinPanel(num);
			}
		}
		
		public function getChangeValue():*
		{
			return this._itemChange;
		}
		
		public function clear():void
		{
			this.stop();
			this._itemChange = {};
		}
		
		public function isChangeValue():Boolean
		{
			for each(var item:Object in this._itemChange)
			{
				return true;
			}
			return false;
		}
		
		private function isBoutiqueCoinChange():Boolean
		{
			if (this._itemChange.hasOwnProperty(UserUnlimitedItems.BoutiqueCoin))
			{
				return true;
			}
			return false;
		}
		
		private function onUnlimitedItemChanged(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if (!(changeable is UserUnlimitedItem))
			{
				return;
			}
			
			var item:UserUnlimitedItem = changeable as UserUnlimitedItem;
			var changeNum:Number = Number(evt.params.newValue) - Number(evt.params.orgValue);
			if (this._itemChange.hasOwnProperty(item.id))
			{
				var num:Number = this._itemChange[item.id];
				num += changeNum;
				this._itemChange[item.id] = num;
			}
			else
			{
				this._itemChange[item.id] = changeNum;
			}
		}
	}
}