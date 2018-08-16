package mmo.play.material.gitem
{
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.utils.getDefinitionByName;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.gitem.GItem;
	import mmo.framework.domain.material.gitem.GItemTypes;
	import mmo.framework.domain.material.gitem.UserGItem;
	import mmo.framework.domain.material.gitem.UserGItemsData;
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
	 * 物品定义、个人物品信息获取
	 */
	public class GItemFacade extends EventDispatcher implements IMaterialFacade
	{
		
		private static var _instance:GItemFacade;
		
		/**根据id获得item属性**/
		private var itemMap:Object;
		
		/**用户item数据**/
		private var userItemsData:UserGItemsData;
		
		public function GItemFacade() 
		{
			this.initItemsConfig();
		}
		
		public static function get instance():GItemFacade
		{
			if (_instance == null)
			{
				_instance = new GItemFacade();
			}
			return _instance;
		}

		private function initItemsConfig():void {
			var className:String = "mmo.materialdata.GItemData";
			var type:Class = getDefinitionByName(className) as Class;
			
			this.itemMap = type["data"];
		}
		
		public function initMyItems():void
		{
			this.userItemsData = ModelInfo.getUserItems();
			
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onUserGItemChange);
		}
		
		private function onUserGItemChange(evt:ChangeableEvent):void
		{
			var changeable:IChangeableObject = evt.object;
			if(!(changeable is UserGItem))
			{
				return;
			}
			if(getUserGitemsArr().indexOf(changeable) == -1)
			{
				return;
			}
			//禁止显示物品变化
			if(UserGItem(changeable).gItem.forbiddenShowChange){
				return;
			}
			//直接禁止某类收集品的物品变化
			if(UserGItem(changeable).gItem.type == GItemTypes.VirtualGItems){
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
			event.userMaterial = changeable as UserGItem;
			this.dispatchEvent(event);
		}	

		/**
		 * 物品类别
		 * @return
		 */
		public function get materialType():int {
			return MaterialTypes.GITEM;
		}

		/**
		 * 一个新的UserMaterial对象
		 */
		public function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void {
			var material:GItem = this.getItemById(materialId);
			if (material == null) {
				throw new Error("invalidate material id:" + materialId);
			}
			
			//备注，不在初始化赋值的原因，抛出物品改变事件时候，用户数据还没存储，
			//      拿不到相应数据处理（例如任务就不能走正常流程，改成后赋值）
			var newUserItem:UserGItem = new UserGItem(material, 0, 0);
			this.userItemsData.addUserItem(newUserItem);
			
			newUserItem.setValue(UserMaterial.propertyQuantity,quantity);
			newUserItem.setValue(UserMaterial.propertyUseUp,useUp);
		}
		
		/**
		 * 接口调用，获取物品定义
		 * */
		public function getMaterialById(mid:int):Material{
			return this.getItemById(mid);
		}
		
		/**
		 * 接口调用，获取用户物品信息
		 * */
		public function getMyMaterialById(mid:int):UserMaterial{
			return this.getMyItemById(mid);
		}
		
		/**
		 * 获取物品定义
		 * @param id
		 * @return
		 */
		public function getItemById(id:int):GItem {
			return this.itemMap[id] as GItem;
		}
		
		/**
		 * 获取用户的物品信息
		 * @param id
		 *
		 */
		public function getMyItemById(id:int):UserGItem {
			return this.userItemsData.getUserItemById(id) as UserGItem;
		}
		
		/**
		 * 获取所有收集品定义
		 * */
		public function getGItemsArr():Array
		{
			var arr:Array = [];
			for each( var gitem:GItem in itemMap)
			{
				arr.push(gitem);
			}
			return arr;
		}	
		
		public function getUserGitemsArr():Array
		{
			var arr:Array = [];
			for each(var userGitem:UserGItem in this.userItemsData.getAllUserItems())
			{
				arr.push(userGitem);
			}
			return arr;
		}
		
//		/**
//		 * 获取用户某种类型收集品
//		 * */
//		public function getMyItemsByType(itemType:int):Array
//		{
//			var res:Array = [];
//			
//			for each (var userItem:UserItem in this.userItemsData.getAllUserItems())
//			{
//				if(Item(userItem.material).type == itemType)
//				{
//					res.push(userItem);
//				}
//			}
//			return res;
//		}
		
		/**
		 * 用户拥有收集品数量
		 */		
		public function getMyMaterialNum(itemId:int):int
		{
			var userItem:UserGItem = this.getMyItemById(itemId);
			if(userItem == null){
				return 0;
			}
			return userItem.quantity;
		}
		
		/**
		 *  获取用户是否拥有某种物品
		 *  @param id 
		 * */
		public function hasMaterial(itemId:int,num:int = 1):Boolean{
			if(this.getMyMaterialNum(itemId) >= num){
				return true;
			}
			return false;
		}
		
		/**
		 * 增加礼物收集品，需后台配置验证
		 */	
		public function addGiftItem(itemId:int,itemNum:int = 1):void{
			GItemClient.instance.addGiftItem(itemId,itemNum);
		}
		
		public function getView(itemId:int):DisplayObject
		{
			return null;
		}
		/**
		 *获取收集品的视图
		 * @param itemId
		 * @return
		 *
		 */
		public function getIcon(itemId:int,width:Number = 0,height:Number = 0):DisplayObject {
			var viewCreator:GItemViewCreator = new GItemViewCreator(SceneDomainResLoader.resStoryageType);
			return viewCreator.getIcon(itemId,width,height);
		}
		
		/**
		 * visitor
		 * */
		public function accept(materialVisitor:MaterialFacadeVisitor):*
		{
			return materialVisitor.visitorGItem(this);
		}	
	}
}