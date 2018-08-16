package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.MaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class UserMaterialChangeObserver implements IResourceChangeObserver
	{
		private var _materialFacade:IMaterialFacade;
		private var _material_changeNum:Dictionary;
		private var _idFilter:Array;
		public function UserMaterialChangeObserver(materialType:int)
		{
			_materialFacade = MaterialFacade.getFacade(materialType);
			_material_changeNum = new Dictionary();
			_idFilter = [];
		}
		
		public function start():void
		{
			_materialFacade.addEventListener(UserMaterialEvent.onQuantiyChange, onQuantityChanged);
		}
		
		public function stop():void
		{
			_materialFacade.removeEventListener(UserMaterialEvent.onQuantiyChange, onQuantityChanged);
		}
		
		public function restart():void
		{
			clear();
			start();
		}	
		
		public function showChangePanel(type:int = 1):void
		{
			stop();
			for (var userMaterial:Object in _material_changeNum)
			{
				var changeNum:int = _material_changeNum[userMaterial];
				if(changeNum <= 0)
				{
					continue;
				}	
				if(UserMaterial(userMaterial).materialType == MaterialTypes.CARDITEM)
				{
					MaterialGetPanel.instance().showCardPanel(userMaterial.materialId, changeNum);
					continue;
				}	
				if(type == 1){
					MaterialGetPanel.instance().showTips(userMaterial.materialType,userMaterial.materialId,changeNum);
				}else{
					MaterialGetPanel.instance().showMaterialPanel(userMaterial.materialType,userMaterial.materialId,changeNum);
				}
			}	
		}
		
		public function getChangeValue():*
		{
			stop();
			return _material_changeNum;
		}
		public function isChangeValue():Boolean
		{
			for (var userMaterial:Object in _material_changeNum)
			{
				var changeNum:int = _material_changeNum[userMaterial];
				if(changeNum <= 0)
				{
					continue;
				}
				
				return true;
			}
			return false;
		}
		
		public function clear():void
		{
			_material_changeNum = new Dictionary();
		}
		
		public function addFillMaterialById(id:int):void{
			_idFilter.push(id);
		}
		
		private function onQuantityChanged(evt:UserMaterialEvent):void
		{
			var userMaterial:UserMaterial = evt.userMaterial;
			trace("index of filter = " + _idFilter.indexOf(userMaterial.materialId));
			if(_idFilter.indexOf(userMaterial.materialId) >= 0){
				return;
			}
			var materialChangeNum:int = int(_material_changeNum[userMaterial]);
			_material_changeNum[userMaterial] = materialChangeNum + evt.changeNum;
		}	
	}
}