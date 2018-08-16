package mmo.interfaces.team
{
	import flash.events.Event;

	public class TeamEvent extends Event
	{
		/*********************
		 * team模块关心的事件
		 * ******************/
		/**
		 *队伍聊天请求
		 * */
		public static const Chat:String = "chat";
		/**
		 * 显示组队ui
		 * */
		public static const ShowTeamUI:String = "showTeamUI";
		/**
		 * 回应申请
		 * */
		public static const ReplyApply:String = "replyApply";
		/**
		 * 邀请
		 * */
		public static const Invite:String = "Invite";
		/**
		 * 回应邀请
		 * */
		public static const ReplyInvite:String = "replyInvite";
		/**
		 * 注册同步屏障
		 */
		public static const RegisterBarrier:String = "registerBarrier";
		/**
		 * 完成同步屏障
		 */
		public static const ReadyBarrier:String = "readyBarrier";

		/*********************
		 * team模块广播的事件
		 * *******************/
		/**
		 * 自己进入组队模式
		 * */
		public static const EnterTeamMode:String = "enterTeamMode";
		/**
		 * 自己退出组队模式
		 * */
		public static const ExitTeamMode:String = "exitTeamMode";
		/**
		 * 队伍聊天显示
		 * */
		public static const OnChat:String = "onChat";
		/**
		 * 有人加入队伍
		 * */
		public static const OnJoinTeam:String = "onJoinTeam";
		/**
		 * 有人退出队伍
		 *
		 * */
		public static const OnQuit:String = "onQuit";
		/**
		 * 申请入队显示
		 * */
		public static const OnApply:String = "onApply";
		/**
		 * 回应入队申请显示
		 * */
		public static const OnReplyApply:String = "onReplyApply";
		/**
		 * 更换队长
		 * */
		public static const OnTeamLeaderChange:String = "onTeamLeaderChange";
		/**
		 * 邀请显示
		 *
		 * */
		public static const OnInvited:String = "onInvited";
		/**
		 *回应邀请显示
		 * */
		public static const OnReplyInvite:String = "onReplyInvite";
		/**
		 * 更新队员信息
		 * */
		public static const OnUpdateTeammatesInfo:String = "onUpdateTeammatesInfo";
		/**
		 * 更改队伍名称
		 * **/
		public static const OnChangeTeamName:String = "onChangeTeamName";
		/**
		 * 更改是否允许自动加入
		 * */
		public static const OnAllowAutoJoin:String = "onAllowAutoJoin";
		/**
		 * 队内消息
		 * */
		public static const OnTeamMsg:String = "onTeamMsg";

		/**
		 * hp,mp变化
		 * */
		public static const OnHpMpChange:String = "onHpMpChange";
		/**
		 * 需要执行同步屏障 
		 */
		public static const OnBarrierAction:String = "onBarrierAction";
		/**
		 * 所有队员已经完成同步屏障 
		 */		
		public static const OnBarrierRun:String = "onBarrierRun";

		public function TeamEvent(type:String, params:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}

		public var params:Object;

		override public function clone():Event
		{
			return new TeamEvent(type, params, bubbles, cancelable);
		}
	}
}