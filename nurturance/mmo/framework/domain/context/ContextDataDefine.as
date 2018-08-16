package mmo.framework.domain.context
{
	import mmo.framework.domain.temp.TempMonster;

	/**
	 * 房间变量返回解析 
	 */	
	
	public class ContextDataDefine
	{
		private var _roomName:String;
		private var _cs:Object;
		
		public function ContextDataDefine(dataObj:Object)
		{
			_roomName = dataObj["room"];
			_cs = dataObj["cs"];
		}
		
		public function get roomName():String
		{
			return _roomName;
		}
		
		/**
		 * 所有的变量定义
		 */		
		public function get csObject():Object
		{
			return _cs;
		}
		
		/**
		 * 获取场景打怪的monster信息
		 * @return 
		 */		
		public function getSceneBattleMonster(monsterKey:String):TempMonster
		{
			for each(var csObj:Object in _cs){
				if(csObj["type"] == "SceneBattle" && csObj["name"] == monsterKey)
				{
					return new TempMonster(monsterKey,csObj["hp"]);
				}
			}
			return null;
		}
	}
}