package mmo.play.material.display
{
	public class MaterialDisplayConfig
	{
		public function MaterialDisplayConfig()
		{
			_type_config = {};
		}
		
		private var _type_config:Object;
		private var _diplayerCount:int = 16;

		public function get diplayerCount():int
		{
			return _diplayerCount;
		}

		public function set diplayerCount(value:int):void
		{
			_diplayerCount = value;
		}
		
		/**
		 * 通常情况下， 就把tab的名字作为key
		 * 
		 * */
		public function addTypeInfo(key:String, tabName:String, desc:String, type:int, filters:Array = null):void
		{
			if(filters == null)
			{
				filters = [];
			}	
			_type_config[key] = {"key" : key, "tabName" : tabName, "desc" : desc, "type" : type, "filters": filters};
		}	
		
		public function getTypeInfo(key:String):Object
		{
			return _type_config[key];
		}	
		
		public function getTypeKeyByTab(tabName:String):String
		{
			var key:String = "";
			for each(var info:Object in _type_config)
			{
				if(info["tabName"] == tabName)
				{
					key = info["key"];
				}	
			}
			return key;
		}	
		
		public function getTypeConfig():Object
		{
			return _type_config;
		}	
	}
}