package mmo.interfaces.fbservice
{
	import flash.events.Event;

	public class FBEvent extends Event
	{
		//以下为FBEventDispatcher抛出的事件
		/**
		 * 进入副本
		 */
		public static const ENTER_FB:String = "FBEvent_1";
		/**
		 * 打开当前副本场景。
		 * params.entrances为需要打开的入口的元件名字的数组，元件需要在foreGround层。
		 */
		public static const OPEN_ENTRANCE:String = "FBEvent_2";

		/**
		 * 自定义步骤完成。
		 * params.key为该步骤的key。可跨场景。
		 */
		public static const CUSTOM_STEP_FINISH:String = "FBEvent_3";

		/**
		 * 清空场景中怪物时抛出的事件。
		 */
		public static const CLEAR_SCENE_MONSTERS:String = "FBEvent_4";

		/**
		 * 副本中杀死BOSS抛出的事件。 
		 */
		public static const KILL_BOSS:String = "FBEvent_5";
		
		/**
		 * 通知所有队员（包括队长）准备进入副本。
		 * 参数0为fbName。
		 * 参数1为fbLevel。
		 */
		public static const TEAM_JOINING_FB:String = "FBEvent_6";
		
		/**
		 * 队员初始化进入副本成功。
		 */
		public static const TEAM_ON_TEAMMATE_JOIN_FB:String = "FBEvent_7";
		/**
		 * 通知所有队员(包括队长)离开副本。
		 */
		public static const TEAM_LEAVING_FB:String = "FBEvent_8";
		/**
		 * 队员成功离开副本。
		 */
		public static const TEAM_ON_TEAMMATE_LEAVE_FB:String = "FBEvent_9";
		/**
		 * 副本中某些队伍同步步骤。
		 * 参数0为步骤的key。 
		 */
		public static const TEAM_FB_TEAM_STEP:String = "FBEvent_10";
		
		/**
		 * 离开FB，不论成功与否。
		 */		
		public static const LEAVE_FB:String = "FBEvent_11";

		//以下为FBService内部抛的事件，外面怎么抛都没效果。
		/**
		 *  步骤完成。
		 */
		public static const STEP_FINISH:String = "FBEvent_stepFinish";
		
		
		private var _params:Object;

		public function FBEvent(type:String, params:Object = null)
		{
			super(type);
			_params = params;
		}

		public function get params():Object
		{
			return _params;
		}

	}
}