package mmo.interfaces.buddy {
	
	import flash.events.Event;

	public class BuddyEvent extends Event {
		
		// 好友列表项更新，例如增加或删除好友
		public static const BUDDY_LIST_CONSTRUCT:String = "onBuddyListConstruct";
		// 好友信息更新，指单个好友状态更新
		public static const BUDDY_LIST_UPDATE:String = "onBuddyListUpdate";
		// 好友列表错误
		public static const BUDDY_LIST_ERROR:String = "onBuddyListError";
		// 房间用户列表更新
		public static const USER_LIST_UPDATE:String = "onUserListUpdate";
		// 黑名单更新
		public static const BLOCK_LIST_UPDATE:String = "onBlockListUpdate";
		// 添加好友成功
		public static const BUDDY_ADDED:String = "onBuddyAdded";
		// 好友列表错误
		public static const BUDDY_ERROR:String = "onBuddyError";
		// 收到添加好友请求
		public static const BUDDY_PERMISSION_UPDATE:String = "onBuddyPermission";
		// 收到同意添加好友回复
		public static const BUDDY_PERMISSION_ACCEPTED:String = "onBuddyPermissionAccepted";
		// 关闭面板
		public static const CLOSE_BUDDY_LIST:String = "onCloseBuddyList";
		// 定位好友
		public static const GET_LOCATION_BACK:String = "onLocateBuddyBack";
		
		// 好友分组设置
		public static const BUDDY_GROUB_SET:String = "onBuddyGroubSet";
		// 好友分组刷新
		public static const BUDDY_GROUB_REFRESH:String = "onBuddyGroubRefresh";
		
		private var _params:Object;
		
		public function BuddyEvent(type:String, params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			this._params = params;
		}
		
		public function get params():Object
		{
			return _params;
		}
	}
}