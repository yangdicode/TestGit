package mmo.framework.domain.union.events
{
	import flash.events.Event;
	
	public class UnionEvent extends Event
	{
		/** 我的联盟信息改变 */		
		public static const OnUnionInfoChange:String = "OnUnionInfoChange";
		/** 我的成员信息改变 */	
		public static const OnMemberInfoChange:String = "OnMemberInfoChange";
		
		/** 消息数目变更 **/
		public static const UNION_MSG_COUNTER_CHANGE:String = "onUnionMsgCounterChangeEvt";
		
		public static const OnObjectChange:String = "OnObjectChange";
		
		
		/** 联盟任务之暖暖任务 <br/>参数 suc **/
		public static const OnFinishNuannuanTask:String = "OnFinishNuannuanTask";		
		/**  联盟任务之惊奇任务 <br/>参数 suc **/
		public static const OnFinishFunnyTask:String = "OnFinishFunnyTask";
		
		public var params:Object;
		
		public function UnionEvent(type:String, params:Object = null){
			super(type);
			this.params = params;
		}
	}
}