package mmo.framework.domain.shareobject
{
	import flash.net.SharedObject;
	
	public class LocalStore
	{		
		private static var DEFAULT_NAME = "aox1so";
		
		public function LocalStore()
		{
		}
		
		public static function getValue(key:Object, name:String = null):Object
		{			
			var sObject:SharedObject = getLocalByName(name);
			return sObject.data[key];					
		}
		
		public static function setValue(key:Object, value:Object, name:String = null):void
		{	
			var sObject:SharedObject = getLocalByName(name);
			sObject.data[key] = value;	
			try
			{
			    sObject.flush();
			}
			catch(error:Error)
			{
				//如果用户禁止flash在本地进行写磁盘操作，则会发生这个异常，吃掉异常
			}		
		}
		
		private static function getLocalByName(name:String):SharedObject
		{
			return SharedObject.getLocal(name == null ? DEFAULT_NAME : name, "/");
		}
		
		public static function compileMe():void
		{			
		}
	}
}