package mmo.play.material.furniture
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.furniture.Furniture;
	import mmo.framework.domain.material.furniture.UserFurniture;
	import mmo.framework.domain.material.furniture.UserFurnitureData;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.visitor.MaterialFacadeVisitor;
	
	/**
	 * 家具定义、个人家具信息获取
	 */
	public class FurnitureFacade extends EventDispatcher implements IMaterialFacade
	{		
		private static var _instance:FurnitureFacade;
		
		/**根据id获得furniture属性*/
		private var furnitureMap:Object;
		private var houseRoomMap:Object;
		
		/**用户furniture数据**/
		private var userFurnitureData:UserFurnitureData; 
		
		/**视图获取类**/
		private var viewCreator:FurnitureViewCreator;
		
		/**
		 * 小屋摆放变化处理器
		 * **/
		private var houseInfoHandler:HouseInfoHandler;
		public function FurnitureFacade()
		{
			this.initFurnituresConfig();
		}
		
		public static function get instance():FurnitureFacade
		{
			if (_instance == null)
			{
				_instance = new FurnitureFacade();
			}
			return _instance;
		}
		
		private function initFurnituresConfig():void
		{
			var className:String = "mmo.materialdata.FurnitureData";
			var type:Class = getDefinitionByName(className) as Class;
			this.furnitureMap = type["data"];
			this.houseRoomMap = type["multiRoomsData"];
			
			var furnitureTypeData:Object = (ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.HouseMaterialDisplayData") as Class)["data"];
			for each(var fur:Furniture in this.furnitureMap)
			{
				fur.type = furnitureTypeData[fur.materialType + "_" + fur.id]["hmt"];
				fur.displayType = furnitureTypeData[fur.materialType + "_" + fur.id]["dt"];
			}
			
		}
		
		public function initMyFurnitures():void
		{
			this.userFurnitureData = ModelInfo.getUserFurniture();
			trace("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+this + this.userFurnitureData);
			houseInfoHandler = new HouseInfoHandler();
			
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUserFurnitureChanged);
		}
		
		private function onUserFurnitureChanged(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if(!(changeable is UserFurniture))
			{
				return;
			}
			if(getUserFurnitures().indexOf(changeable) == -1)
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
			event.userMaterial = changeable as UserFurniture;
			this.dispatchEvent(event);
		}	
		
		/**
		 * 物品类别 
		 * @return 
		 * 
		 */
		public function get materialType():int
		{
			return MaterialTypes.FURNITURE;
		}
		
		/**
		 * 创建一个新的UserMaterial对象 
		 * @param material
		 * @return 
		 * 
		 */
		public function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void
		{
			var material:Furniture = this.getFurnitureById(materialId);
			if(material == null)
			{
				throw new Error("invalidate material id:" + materialId);
			}
			var newUserFur:UserFurniture = new UserFurniture(material,0,0);
			this.userFurnitureData.addUserFurniture(newUserFur);
			
			newUserFur.setValue(UserMaterial.propertyQuantity,quantity);
			newUserFur.setValue(UserMaterial.propertyUseUp,useUp);
		}			
		
		/**
		 * 接口调用，获取家具信息
		 * */
		public function getMaterialById(mid:int):Material{
			return this.getFurnitureById(mid);
		}
		
		/**
		 * 接口调用，获取个人家具信息
		 * */
		public function getMyMaterialById(mid:int):UserMaterial{
			return this.getMyFurnitureById(mid);
		}
		
		/**
		 *  获取家具定义
		 * @param id
		 * @return 
		 * 
		 */
		public function getFurnitureById(id:int):Furniture
		{
			return this.furnitureMap[id] as Furniture;
		}
		
		public function getRoomsById(id:int):Array{
			if(!houseRoomMap.hasOwnProperty(id)){
				return [id];
			}else{
				return houseRoomMap[id];
			}
		}
		
		/**
		 * 获取用户的家具信息
		 * @param id
		 */
		public function getMyFurnitureById(id:int):UserFurniture
		{
			return this.userFurnitureData.getUserFurnitureById(id);
		}		
		
		/**
		 * 获取所有家具定义
		 * */
		public function getFurnituresArr():Array
		{
			var arr:Array = [];
			for each(var fur:Furniture in furnitureMap)
			{
				arr.push(fur);
			}
			return arr;
		}	
		/**
		 * 获取所有用户家具信息
		 * 
		 * */
		public function getUserFurnitures():Array
		{
			var furnitures:Array = [];
			trace(this + this.userFurnitureData);
			for each(var userFur:UserFurniture in this.userFurnitureData.getAllUserFurniture())
			{
				furnitures.push(userFur);
			}
			return furnitures;
		}	
		
		public function getUserFurnitureData():UserFurnitureData
		{
			return this.userFurnitureData;
		}	
		
		/**
		 * 用户拥有家具数量
		 */		
		public function getMyMaterialNum(fId:int):int
		{
			var userFur:UserFurniture = this.getMyFurnitureById(fId);
			if(userFur == null){
				return 0;
			}
			return userFur.quantity;
		}
		
		/**
		 * 判断用户是否拥有某件家具
		 * */
		public function hasMaterial(fId:int,num:int = 1):Boolean
		{
			if(this.getMyMaterialNum(fId) >= num){
				return true;
			}
			return false;
		}
		
		/**
		 * 获得家具视图
		 * */
		public function getView(fId:int):DisplayObject
		{
			if(viewCreator == null)
			{
				viewCreator = new FurnitureViewCreator(ResStorageType.TEMPORARY);
			}	
			return viewCreator.getView(fId);	
		}
		
		/**
		 * 获得家具图标
		 * */
		public function getIcon(fId:int,width:Number = 0,height:Number = 0):DisplayObject
		{
			if(viewCreator == null)
			{
				viewCreator = new FurnitureViewCreator(SceneDomainResLoader.resStoryageType);
			}	
			return viewCreator.getIcon(fId,width,height);			
		}
		
		public function getHouseIcon(fId:int, width:Number = 0, height:Number = 0):DisplayObject{
			if(viewCreator == null){
				viewCreator = new FurnitureViewCreator(ResStorageType.TEMPORARY);
			}	
			return viewCreator.getHouseView(fId,width,height);		
		}
		
		/**
		 * visitor
		 * */
		public function accept(materialVisitor:MaterialFacadeVisitor):*
		{
			return materialVisitor.visitorFurniture(this);
		}	
	}
}