package mmo.play.material.changehelper
{
	import flash.display.Sprite;
	
	import mmo.framework.domain.materialschange.MaterialsChange;
	import mmo.framework.domain.materialschange.MaterialsChangeType;
	import mmo.interfaces.ServiceContainer;
	import mmo.interfaces.materialschange.IMaterialsChangeService;
	import mmo.play.eventdispatcher.CommonEvent;
	import mmo.play.eventdispatcher.CommonEventDispatcher;
	
	/**
	 * 物品获得计数器
	 * 记录 物品获得和数量
	 *      金币获得数量
	 *      奥雅之光获得数量
	 *
	 * */
	public class MaterialChangeHelper
	{
		private var _mc:MaterialsChange;
		
		public function MaterialChangeHelper()
		{
			this._mc = IMaterialsChangeService(ServiceContainer.getService(IMaterialsChangeService)).getMaterialsChange();
		}
		
		public function startCount():void
		{
			this._mc.startCount();
		}
		
		public function stopCount():void
		{
			this._mc.stopCount();
		}
		
		/**
		 *	 停止计数，返回物品是否有变化
		 * @return true - 有变化
		 * 
		 */		
		public function hasMaterialChange():Boolean
		{
			return this._mc.hasMaterialChange();
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
			return this._mc.getChangeItemValue();
		}
		
		/**
		 * 某一物品改变数
		 */
		public function getSingleChangeItemValue(type:int, id:int):int{
			return this._mc.getSingleChangeItemValue(type, id);
		}
		
		public function getChangeScoreValue():int
		{
			return this._mc.getChangeScoreValue();
		}
		
		public function getChangeSGoldValue():int
		{
			return this._mc.getChangeSGoldValue();
		}
		
		/**
		 * 停止计数，显示变化物品(只显示增加数量的物品)和金币
		 * @param showType  默认 1:显示飞入动画
		 * 				         0:显示物品获得栏
		 **/
		public function showChangeValue(showType:int = 0,layer:Sprite = null):void
		{
			if (!this._mc.hasMaterialChange())
			{
				CommonEventDispatcher.instance.dispatchEvent(new CommonEvent(CommonEvent.ShowAllMaterialGetTips));
				return;
			}
			this._mc.showChangeValue(showType);
		}
		
		/**
		 * 停止计数，显示物品变化
		 * @param showType  默认 1:显示飞入动画
		 * 				         0:显示物品获得栏
		 **/
		public function showChangeAllMaterialValue(showType:int = 0):void
		{
			if (!this._mc.hasMaterialChange())
			{
				CommonEventDispatcher.instance.dispatchEvent(new CommonEvent(CommonEvent.ShowAllMaterialGetTips));
				return;
			}
			this._mc.showChangeValueByType(MaterialsChangeType.ALLMATERIAL);
		}		
		
		/**
		 * 清除计数
		 */		
		public function clearChangeValue():void
		{
			this._mc.clearChangeValue();
		}
		
		public function hasGetNpc():Boolean{
			return this._mc.hasMaterialChangeByType(MaterialsChangeType.USERNPC);
		}
		
		/**
		 * 过滤某些物品，最好在start之前调用
		 * @param args:int类型;type,id,type,id......
		 */		
		public function fillMaterial(...args):void{
			var i:int = 0, type:int, id:int, length:int = args.length;
			if(length % 2 != 0){
				throw new Error("参数不正确，应为双数，现为单数。");
			}
			var materialChangeObserver:* = this._mc.getObserverByType(MaterialsChangeType.ALLMATERIAL);
			for(; i < length - 1; i += 2){
				type = args[i];
				id = args[i + 1];
				materialChangeObserver.fillMaterialById(type, id);
			}
		}
		
		public function dispose():void
		{
			this._mc.dispose();
			this._mc = null;
		}
	}
}