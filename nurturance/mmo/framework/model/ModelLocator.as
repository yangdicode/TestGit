package mmo.framework.model
{
	import flash.utils.Dictionary;
	
	public class ModelLocator implements IModelLocator
	{
		private var modelMap:Dictionary;
		public function ModelLocator()
		{
			modelMap = new Dictionary();
		}
		
		public function addModel(key:*, obj:*):void
		{
			if(modelMap[key] != undefined)
			{
				throw new Error("Duplicate Model Error! with key : " + key);
			}
			trace("add key: "+ key + " with obj: " + obj);
			this.replaceModel(key, obj);
		}	
		
		public function hasModel(key:*):Boolean
		{
			return modelMap[key] != undefined;
		}	
		
		public function removeModel(key:*):void
		{
			if(modelMap[key] != undefined)
			{
				delete modelMap[key];
			}	
		}	
		
		public function retrieveModel(key:*):*
		{
			return modelMap[key];
		}
		
		public function replaceModel(key:*, obj:*):void
		{
			modelMap[key] = obj;
		}	
	}
}