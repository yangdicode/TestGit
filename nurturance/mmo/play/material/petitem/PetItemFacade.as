package mmo.play.material.petitem
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.utils.getDefinitionByName;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.petitem.PetItem;
	import mmo.framework.domain.material.petitem.UserPetItem;
	import mmo.framework.domain.material.petitem.UserPetItemData;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.visitor.MaterialFacadeVisitor;

	
	public class PetItemFacade extends EventDispatcher implements IMaterialFacade
	{
		private static var _instance:PetItemFacade;
		private var _userPetItemData:UserPetItemData;
		private var _petItemDefine:Object;
		
		public static function get instance():PetItemFacade
		{
			if(_instance == null)
			{
				_instance = new PetItemFacade();
			}
			return _instance;
		}
		
		public function PetItemFacade()
		{
			initConfig();
		}
		
		public function getAllUserPetItem():Object
		{
			return this._userPetItemData.getAllUserPetItems();
		}
		
		public function getUserPetItemArr():Array
		{
			var arr:Array = [];
			for each(var upi:UserPetItem in _userPetItemData.getAllUserPetItems())
			{
				arr.push(upi);
			}
			return arr;
		}	
		
		public function getPetItemArr():Array
		{
			var arr:Array = [];
			for each(var pi:PetItem in _petItemDefine)
			{
				arr.push(pi);
			}
			return arr;
		}	
		
		public function initMyPetItem(userPetItemData:UserPetItemData):void
		{
			this._userPetItemData = userPetItemData;
			
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUserPetItemChange);
		}
		
		private function onUserPetItemChange(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if(!(changeable is UserPetItem))
			{
				return;
			}
			if(getUserPetItemArr().indexOf(changeable) == -1)
			{
				return;
			}	
			var event:UserMaterialEvent = null;
			if(evt.params["property"] == UserMaterial.propertyQuantity)
			{
				event = new UserMaterialEvent(UserMaterialEvent.onQuantiyChange);
			}else if(evt.params["property"] == UserMaterial.propertyUseUp)
			{
				event = new UserMaterialEvent(UserMaterialEvent.onUsedUpChange);
			}	
			event.changeNum = evt.params["newValue"] - evt.params["orgValue"];
			event.userMaterial = changeable as UserPetItem;
			this.dispatchEvent(event);
		}	

		public function get materialType():int
		{
			return MaterialTypes.PETITEM;
		}
		
		public function getMaterialById(mid:int):Material
		{
			return this._petItemDefine[mid];
		}
		
		public function getMyMaterialById(mid:int):UserMaterial
		{
			return this._userPetItemData.getUserPetItemById(mid);
		}
		
		public function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void
		{
			var petItem:PetItem = this._petItemDefine[materialId] as PetItem;
			if(petItem == null)
			{
				throw new Error("PetItemFacade says:invalidate materialId:" + materialId.toString());
			}
			var userPetItem:UserPetItem = new UserPetItem(petItem, MaterialTypes.PETITEM, 0, 0);
			this._userPetItemData.addUserPetItem(userPetItem);
			
			userPetItem.setValue(UserMaterial.propertyQuantity,quantity);
			userPetItem.setValue(UserMaterial.propertyUseUp,useUp);
		}
		
		public function getMyMaterialNum(materialId:int):int
		{
			var userPetItem:UserMaterial = this.getMyMaterialById(materialId);
			if(userPetItem == null){
				return 0;
			}
			return userPetItem.quantity;
		}
		
		public function hasMaterial(materialId:int, num:int=1):Boolean
		{
			return this._userPetItemData.hasUserPetItem(materialId);
		}
		
		public function getView(mid:int):DisplayObject
		{
			return PetItemViewCreater.instance.getView(mid);
		}
		
		public function getIcon(mid:int, width:Number=0, height:Number=0):DisplayObject
		{
			return PetItemViewCreater.instance.getIcon(mid, width, height);
		}
		
		public function accept(materialVisitor:MaterialFacadeVisitor):*
		{
			return materialVisitor.visitorPetItem(this);
		}
		
		private function initConfig():void
		{
			var className:String = "mmo.materialdata.PetItemsData";
			var cls:Class = getDefinitionByName(className) as Class;
			if(cls == null){
				return;
			}
			this._petItemDefine = cls.data;
		}
	}
}