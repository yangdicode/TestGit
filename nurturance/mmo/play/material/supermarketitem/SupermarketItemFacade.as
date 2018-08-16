package mmo.play.material.supermarketitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.utils.getDefinitionByName;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.supermarket.SupermarketItem;
	import mmo.framework.domain.material.supermarket.UserSupermarketItem;
	import mmo.framework.domain.material.supermarket.UserSupermarketItemData;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.visitor.MaterialFacadeVisitor;
	
	public class SupermarketItemFacade extends EventDispatcher implements IMaterialFacade
	{
		private static var _instance:SupermarketItemFacade;
		
		private var _supermarketItemsData:Object;
		private var _userSupermarketItemData:UserSupermarketItemData;
		
		public function SupermarketItemFacade()
		{
			this.initSupermarketItemsData();
		}
		
		public static function get instance():SupermarketItemFacade
		{
			if (_instance == null)
			{
				_instance = new SupermarketItemFacade();
			}
			
			return _instance;
		}
		
		public function get materialType():int
		{
			return MaterialTypes.SUPERMARKET;
		}
		
		public function getMaterialById(mid:int):Material
		{
			return this._supermarketItemsData[mid];
		}
		
		public function getMyMaterialById(mid:int):UserMaterial
		{
			return this._userSupermarketItemData.getUserSupermarketItemById(mid);
		}
		
		public function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void
		{
			var item:SupermarketItem = this._supermarketItemsData[materialId] as SupermarketItem;
			if(item == null)
			{
				throw new Error("SupermarketItemFacade says:invalidate materialId:" + materialId.toString());
			}
			var newUserItem:UserSupermarketItem = new UserSupermarketItem(item, 0, 0);
			this._userSupermarketItemData.addUserSupermarketItem(newUserItem);
			
			newUserItem.setValue(UserMaterial.propertyQuantity, quantity);
			newUserItem.setValue(UserMaterial.propertyUseUp, useUp);
		}
		
		public function getMyMaterialNum(materialId:int):int
		{
			var userItem:UserMaterial = this.getMyMaterialById(materialId);
			if(userItem == null){
				return 0;
			}
			return userItem.quantity;
		}
		
		public function hasMaterial(materialId:int, num:int=1):Boolean
		{
			return this._userSupermarketItemData.hasUserSupermarketItem(materialId);
		}
		
		public function getView(mid:int):DisplayObject
		{
			return null;
		}
		
		public function getIcon(mid:int, width:Number=0, height:Number=0):DisplayObject
		{
			var viewCreator:SupermarketItemViewCreator = new SupermarketItemViewCreator();
			return viewCreator.getIcon(mid, width, height);
		}
		
		public function accept(materialVisitor:MaterialFacadeVisitor):*
		{
			return materialVisitor.visitorSupermarketItem(this);
		}
		
		public function getAllUserSupermarketItems():Object
		{
			return this._userSupermarketItemData.getAllUserSupermarketItems();
		}
		
		public function getUserSupermarketItemArr():Array
		{
			var arr:Array = [];
			for each(var usi:UserSupermarketItem in this.getAllUserSupermarketItems())
			{
				arr.push(usi);
			}
			
			return arr;
		}	
		/**
		 * SupermarketTypes.*
		 * @param type
		 * @return 
		 * 
		 */		
		public function getUserSupermarketItemByType(type:int):Array
		{
			var arr:Array = [];
			for each(var usi:UserSupermarketItem in this.getAllUserSupermarketItems())
			{
				if(usi.itemType == type && usi.quantity > 0)
					arr.push(usi);
			}
			return arr;
		}
		
		public function getSupermarketItemDataArr():Array
		{
			var arr:Array = [];
			for each(var pi:SupermarketItem in this._supermarketItemsData)
			{
				arr.push(pi);
			}
			
			return arr;
		}	
		
		public function initMySupermarketItems(userSupermarketItemData:UserSupermarketItemData):void
		{
			this._userSupermarketItemData = userSupermarketItemData;
			
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUserSupermarketItemChange);
		}
		
		private function onUserSupermarketItemChange(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if (!(changeable is UserSupermarketItem))
			{
				return;
			}
			if (this.getUserSupermarketItemArr().indexOf(changeable) == -1)
			{
				return;
			}	
			var event:UserMaterialEvent = null;
			if (evt.params["property"] == UserMaterial.propertyQuantity)
			{
				event = new UserMaterialEvent(UserMaterialEvent.onQuantiyChange);
			}
			else if (evt.params["property"] == UserMaterial.propertyUseUp)
			{
				event = new UserMaterialEvent(UserMaterialEvent.onUsedUpChange);
			}	
			event.changeNum = evt.params["newValue"] - evt.params["orgValue"];
			event.userMaterial = changeable as UserSupermarketItem;
			this.dispatchEvent(event);
		}
		
		private function initSupermarketItemsData():void
		{
			var className:String = "mmo.materialdata.SupermarketItemsData";
			var type:Class = getDefinitionByName(className) as Class;
			
			this._supermarketItemsData = type["data"];
		}
	}
}