package mmo.framework.domain.dreamcard
{
	public class UserDreamCardData
	{
		/**
		 * 等级
		 */		
		public var lv:DreamCardUserLv;
		
		/**
		 * 下一等级
		 */		
		public var nextLv:DreamCardUserLv;
		
		/**
		 * 经验
		 */		
		public var exp:int;
		
		/**
		 * 收集总数量
		 */		
		public var collectNum:int;
		
		/**
		 * 根据类型分类拥有数量
		 * {"1":2, "2":2, "3":2}
		 */		
		public var collectInfo:Object;
		
		/**
		 * 排名
		 */		
		public var ranking:int;
		
		/**
		 * 已有套数/所有套数
		 */		
		public var honor:String;
		
		public function UserDreamCardData(){
		}
		
	}
}