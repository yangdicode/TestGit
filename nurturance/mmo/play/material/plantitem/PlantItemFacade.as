package mmo.play.material.plantitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.plantitem.PlantItem;
	import mmo.framework.domain.material.plantitem.UserPlantItem;
	import mmo.framework.domain.material.plantitem.UserPlantItemData;
	import mmo.framework.domain.plant.Plants;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.visitor.MaterialFacadeVisitor;
	
	public class PlantItemFacade extends EventDispatcher implements IMaterialFacade
	{
		private static var _instance:PlantItemFacade;
		
		private var _userPlantItemData:UserPlantItemData;
		
		public function PlantItemFacade()
		{
		}
		
		public static function get instance():PlantItemFacade
		{
			if (_instance == null)
			{
				_instance = new PlantItemFacade();
			}
			
			return _instance;
		}
		
		public function get materialType():int
		{
			return MaterialTypes.PLANTITEM;
		}
		
		public function getMaterialById(mid:int):Material
		{
			return Plants.getPlantItemById(mid) as Material;
		}
		
		public function getMyMaterialById(mid:int):UserMaterial
		{
			return this._userPlantItemData.getUserPlantItemById(mid);
		}
		
		public function getPlantItemsByType(plantItemType:int):Array
		{
			var arr:Array = [];
			for each(var upi:UserPlantItem in this.getAllUserPlantItems())
			{
				if (upi.userPlantItemType==plantItemType && upi.available!=0)
				{
					arr.push(upi);
				}
			}
			
			return arr;
		}
		
		public function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void
		{
			var plantItem:PlantItem = Plants.getPlantItemById(materialId);
			if(plantItem == null)
			{
				throw new Error("PlantItemFacade says:invalidate materialId:" + materialId.toString());
			}
			var newUserPlantItem:UserPlantItem = new UserPlantItem(plantItem, 0, 0);
			this._userPlantItemData.addUserPlantItem(newUserPlantItem);
			
			newUserPlantItem.setValue(UserMaterial.propertyQuantity, quantity);
			newUserPlantItem.setValue(UserMaterial.propertyUseUp, useUp);
		}
		
		public function getMyMaterialNum(materialId:int):int
		{
			var userPlantItem:UserMaterial = this.getMyMaterialById(materialId);
			if(userPlantItem == null){
				return 0;
			}
			return userPlantItem.quantity;
		}
		
		public function hasMaterial(materialId:int, num:int=1):Boolean
		{
			return this._userPlantItemData.hasUserPlantItem(materialId);
		}
		
		public function getView(mid:int):DisplayObject
		{
			return null;
		}
		
		public function getIcon(mid:int, width:Number=0, height:Number=0):DisplayObject
		{
			var viewCreator:PlantItemViewCreator = new PlantItemViewCreator();
			return viewCreator.getIcon(mid, width, height);
		}
		
		public function accept(materialVisitor:MaterialFacadeVisitor):*
		{
			return materialVisitor.visitorPlantItem(this);
		}
		
		public function getAllUserPlantItems():Object
		{
			return this._userPlantItemData.getAllUserPlantItems();
		}
		
		public function getUserPlantItemArr():Array
		{
			var arr:Array = [];
			for each(var upi:UserPlantItem in this.getAllUserPlantItems())
			{
				arr.push(upi);
			}
			
			return arr;
		}	
		
		public function getPlantItemArr():Array
		{
			var arr:Array = [];
			for each(var pi:PlantItem in Plants.plantItems)
			{
				arr.push(pi);
			}
			
			return arr;
		}	
		
		public function initMyPlantItems(userPlantItemData:UserPlantItemData):void
		{
			this._userPlantItemData = userPlantItemData;
			
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUserPlantItemChange);
		}
		
		private function onUserPlantItemChange(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if (!(changeable is UserPlantItem))
			{
				return;
			}
			if (this.getUserPlantItemArr().indexOf(changeable) == -1)
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
			event.userMaterial = changeable as UserPlantItem;
			this.dispatchEvent(event);
		}
	}
}