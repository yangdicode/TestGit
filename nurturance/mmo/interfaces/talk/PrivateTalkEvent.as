package mmo.interfaces.talk
{
	import flash.events.Event;
	
	/**
	 * 聊天面板相关事件
	 */
	public class PrivateTalkEvent extends Event
	{
		/**
		 * <b>好友形象加载完毕事件</b>
		 * </br>被TalkAvatarProxy通知TalkAvatarManager更新面板形象
		 * </br>由PrivateTalkEventDispatcher发出
		 */
		public static const BUDDY_AVATAR_COMPLETED:String = "onBuddyAvatarCompleted";
		
		/**
		 * <b>聊天面板被关闭事件</b>
		 * </br>被PrivateTalkPanel通知TalkService注销对应的聊天窗口
		 * </br>由PrivateTalkEventDispatcher发出
		 */
		public static const TALK_PANEL_CLOSED:String = "onTalkPanelClosed";
		
		/**
		 * <b>收到新的留言信息事件</b>
		 * </br>被TalkService用来通知BuddyBubbleTip显示气泡提示
		 * </br>由TalkService发出
		 */
		public static const NEW_OFFLINE_MSG:String = "onNewOfflineMsg";
		
		/**
		 * <b>收到好友在线聊天信息事件</b>
		 * </br>被TalkService用来通知BuddyBubbleTip显示气泡提示
		 * </br>由TalkService发出
		 */
		public static const NEW_UNREAD_MSG:String = "onNewUnreadMsg";
		
		/**
		 * <b>用户阅读了留言，或者打开了聊天面板</b>
		 * </br>被TalkService用来通知BuddyBubbleTip关闭对应的气泡提示
		 * </br>由TalkService发出
		 */
		public static const UNREAD_MSG_READ:String = "onUnreadMsgRead";
		
		public function PrivateTalkEvent(type:String,param:Object)
		{
			super(type, false, false);
			this.param = param;
		}
		
		public var param:Object;
	}
}