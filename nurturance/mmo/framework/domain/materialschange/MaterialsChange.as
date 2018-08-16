package mmo.framework.domain.materialschange
{
	import flash.utils.Dictionary;
	
	public class MaterialsChange
	{
		private var _changeObservers:Array;
		
		public function MaterialsChange()
		{
			_changeObservers = [];
		}
		
		public function registerObserver(observer:IResourceChangeObserver):void
		{
			_changeObservers.push(observer);
		}
		
		public function getObserverByType(type:int):IResourceChangeObserver
		{
			return this._changeObservers[type];
		}
		
		public function startCount():void
		{
			for each(var observer:IResourceChangeObserver in _changeObservers){
				observer.restart();
			}
		}
		
		public function stopCount():void
		{
			for each(var observer:IResourceChangeObserver in _changeObservers){
				observer.stop();
			}
		}
		
		/**
		 *	 停止计数，返回物品是否有变化
		 * @return true - 有变化
		 * 
		 */		
		public function hasMaterialChange():Boolean
		{
			stopCount();
			for each(var observer:IResourceChangeObserver in _changeObservers){
				if (observer.isChangeValue()){
					return true;
				}
			}
			return false;
		}
		
		public function hasMaterialChangeByType(type:int):Boolean
		{
			stopCount();
			return this.getObserverByType(type).isChangeValue();
		}
		
		/**
		 * 停止计数，返回变化数量
		 * return
		 * Object[materialType_materialId] = {userMaterial,changeNum};
		 * userMaterial 为用户物品
		 * changeNum 为变化的数量
		 * */
		public function getChangeItemValue():Object
		{
			stopCount();
			var changeItems:Dictionary = this.getObserverByType(MaterialsChangeType.ALLMATERIAL).getChangeValue() as Dictionary;
			var changeItemObject = {};
			for (var userMaterial:Object in changeItems){	
				var changeMaterial:Object = {};
				changeMaterial["userMaterial"] = userMaterial;
				changeMaterial["changeNum"] = changeItems[userMaterial];
				changeItemObject[userMaterial.materialType + "_" + userMaterial.materialId] = changeMaterial;
			}
			return changeItemObject;
		}
		
		/**
		 * 某一物品改变数
		 */
		public function getSingleChangeItemValue(type:int, id:int):int{
			var changeObj:Object = getChangeItemValue();
			var key:String = type.toString() + "_" + id.toString();
			if (changeObj[key] != null){
				return changeObj[key]["changeNum"];
			}
			return 0;
		}
		
		public function getChangeScoreValue():int
		{
			stopCount();
			return int(this.getObserverByType(MaterialsChangeType.SCORE).getChangeValue());
		}
		
		public function getChangeSGoldValue():int
		{
			stopCount();
			return int(this.getObserverByType(MaterialsChangeType.SOULGOLD).getChangeValue());
		}
		
		public function showChangeValue(showType:int=0):void
		{
			stopCount();
			for each(var observer:IResourceChangeObserver in _changeObservers){
				observer.showChangePanel(showType);
			}
		}
		
		public function showChangeValueByType(type:int, showType:int=0):void
		{
			stopCount();
			var observer:IResourceChangeObserver = _changeObservers[type];			
			observer.showChangePanel(showType);
			observer.clear();
		}		
		
		/**
		 * 清除计数
		 */		
		public function clearChangeValue():void
		{
			for each(var observer:IResourceChangeObserver in _changeObservers){
				observer.clear();
			}
		}
		
		public function dispose():void
		{
			this.stopCount();
			this.clearChangeValue();
			this._changeObservers = null;
		}
	}
}