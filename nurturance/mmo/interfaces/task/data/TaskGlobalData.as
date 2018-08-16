package mmo.interfaces.task.data
{
	import flash.utils.Dictionary;

	/**
	 * 任务临时存储数据(全局)
	 * @author liyawei
	 */	
	
	public class TaskGlobalData
	{
		public static var globalData:Dictionary = new Dictionary();
		
		public function TaskGlobalData()
		{
		}
		
		public static function hasData(key:*):Boolean{
			return globalData.hasOwnProperty(key);
		}
		
		public static function setData(key:*,data:*):void
		{
			globalData[key] = data;
		}
		
		public static function getData(key:*):*
		{
			return globalData[key];
		}
		
		public static function removeData(key:*):void
		{
			if(globalData[key] != undefined){
				delete globalData[key];
			}
		}
	}
}