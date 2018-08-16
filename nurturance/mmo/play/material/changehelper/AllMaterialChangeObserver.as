package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.domain.material.UserMaterial;
	import mmo.play.material.MaterialFacade;
	import mmo.play.material.changehelper.IResourceChangeObserver;
	
	public class AllMaterialChangeObserver implements IResourceChangeObserver
	{
		private var _materialObservers:Object;
		public function AllMaterialChangeObserver()
		{
			_materialObservers = {};
			var materialTypes:Array = MaterialFacade.getMaterialTypes();
			for each(var type:int in materialTypes)
			{
				_materialObservers[type] = new UserMaterialChangeObserver(type);
			}
		}
		
		public function start():void
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				observer.start();
			}
		}
		
		public function stop():void
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				observer.stop();
			}
		}
		
		public function restart():void
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				observer.restart();
			}
		}
		
		public function showChangePanel(type:int=1):void
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				observer.showChangePanel(type);
			}
		}
		
		public function getChangeValue():*
		{
			var total:Dictionary = new Dictionary();
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				var changeValue:Dictionary = observer.getChangeValue() as Dictionary;
				for (var userMaterial:Object in changeValue)
				{
					total[userMaterial] = changeValue[userMaterial];
				}	
			}
			return total;
		}
		
		public function clear():void
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				observer.clear();
			}
		}	
		
		public function isChangeValue():Boolean
		{
			for each(var observer:IResourceChangeObserver in _materialObservers)
			{
				if(observer.isChangeValue()){
					return true;
				}
			}
			return false;
		}
		
		public function fillMaterialById(type:int, id:int):void{
			var observer:UserMaterialChangeObserver = _materialObservers[type];
			observer.addFillMaterialById(id);
		}
	}
}