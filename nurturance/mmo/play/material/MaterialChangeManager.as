package mmo.play.material
{
	import flash.events.EventDispatcher;
	
	import mmo.common.DateUtil;
	import mmo.framework.comm.Commands;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.play.dialog.NewDialog;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.furniture.FurnitureFacade;
	import mmo.play.material.gitem.GItemFacade;
	
	/**
	 * 后端物品修改返回更新前端缓存处理
	 * */
	
	public class MaterialChangeManager extends EventDispatcher
	{
		private static var _instance:MaterialChangeManager;
		
		private static const cmdMaterialChange = "itemchange";
		
		public function MaterialChangeManager()
		{
		}
		
		public static function get instance():MaterialChangeManager
		{
			if(_instance == null){
				_instance = new MaterialChangeManager();
			}
			return _instance;
		}
		
		public function init():void
		{
			SocketClient.instance.addEventListener(cmdMaterialChange, onMaterialUpdated);
		}
		
		private function onMaterialUpdated(evt:SocketClientEvent):void
		{
			var materialInc:Boolean = evt.params.inc;
			var materialId:int = evt.params.id;
			var materialType:int = evt.params.type;
			var changeNum:int = evt.params.num;
			
			var facade:IMaterialFacade = MaterialFacade.getFacade(materialType);
			
			if(changeNum == 0){
				return;
			}
			
			if(materialInc == false){
				changeNum = -changeNum;
			}
			
			var userMaterial:UserMaterial = facade.getMyMaterialById(materialId);
			
			if(userMaterial != null)
			{
				userMaterial.getTime = DateUtil.getServerTime().time;
				this.updateAmount(facade, userMaterial, changeNum);
			}
			else
			{
				this.addUserMaterial(facade, materialId, changeNum);
			}
		}
		
		private function updateAmount(facade:IMaterialFacade, userMaterial:UserMaterial
			, changeNum:int):void
		{
			var newQuantity:int = userMaterial.quantity + changeNum;
			userMaterial.setValue(UserMaterial.propertyQuantity, newQuantity);
		}
		
		private function addUserMaterial(facade:IMaterialFacade,materialId:int,changeNum:int):void
		{
			facade.addNewUserMaterial(materialId,changeNum,0);
		}
	}
}