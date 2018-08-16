package mmo.interfaces.notify
{

	public class MessageType
	{
		public static const system:int=8;
		//好友相关
		public static const onlineNotify:int = 1;
		public static const buddyPermission:int=5;
		public static const buddyAdded:int=6;
		
		//好友删除功能提醒？不知道哪里添加
		public static const buddyDeleted:int=7;
		
		//好友聊天相关
		public static const privateMessage=9;
		
		//周刊消息
		public static const WEEKY_MSG:int = 10;
		//主线消息
		public static const TASK_MSG:int = 11;
		//油箱消息
		public static const MAIL:int = 12;
		//小屋留言消息
		public static const HOUSE_MSG:int = 13;
		//任务特别消息
		public static const PROLV_MSG:int = 14;
		// 神羽消息
		public static const MEMBER_OVERDUE_MSG:int = 15;
		// 神羽骑士召集令消息
		public static const MEMBER_INVITE_MSG:int = 16;
		// 神羽骑士普通消息
		public static const MEMBER_NORMAL_MSG:int = 17;
		// 送花
		public static const FLOWER_MSG:int = 18;
		// 神羽骑士快速成长消息
		public static const MEMBER_Grow_MSG:int = 20;
		// 神羽骑士消息
		public static const MEMBER_MSG:int = 21;
		// 神羽骑士消息
		public static const MEMBER_MSG2:int = 22;
		
		//花魁活动
		public static const FLOWER_INVITE_BUDDY:int = 25;
		public static const FLOWER_ACCEPT_BUDDY:int = 26;
		
		//甜心冒险好友消息
		public static const CANDY_MSG:int = 27;
		
		//服装设计消息
		public static const CLOTHES_DESIGN_MSG:int = 28;
		
		//超市消息
		public static const SUPERMARKET_MSG:int = 29;
		
		//双生信物收礼消息
		public static const TWINGIFT_MSG:int = 34;
		
		//音乐盒收礼信息
		public static const MUSICAL_MSG:int = 37
		
		//情人节特拍
		public static const VALENTINE_INVITE:int = 38;
		public static const VALENTINE_ACCEPT:int = 39;
		
		public static const MoneyUppp:int = 41;
		
		// 在消息喇叭那里显示的消息类型
		public static const notifyPanelShowTypes:Array = [system, WEEKY_MSG, TASK_MSG, HOUSE_MSG, PROLV_MSG];
		public static const MemberMessageTypes:Array = [MEMBER_OVERDUE_MSG, MEMBER_INVITE_MSG, MEMBER_NORMAL_MSG,MEMBER_Grow_MSG,MEMBER_MSG,MEMBER_MSG2];
		
		public static function isInNotifyPanel(type:int):Boolean
		{
			return (notifyPanelShowTypes.indexOf(type) != -1);
		}	
		
		public static function isMemberMessage(type:int):Boolean
		{
			return (MemberMessageTypes.indexOf(type) != -1);
		}
		
		private function compileMe():void
		{
			var nse:NotifyServiceEvent;
		}	
	}
}