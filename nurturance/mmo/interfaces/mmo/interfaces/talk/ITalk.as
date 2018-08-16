package mmo.interfaces.talk{
	import mmo.interfaces.IInitService;
	
	/**
	 * 好友聊天相关
	 */
	public interface ITalk extends IInitService {
		
		/**
		 * 将某人发来的消息加入到消息队列
		 * 
		 * @param: sender:String 消息的发送者
		 * @param: content:String 消息内容
		 * @param: type:int 消息类型 (默认为0) 
		 * 
		 */
		function push(sender:String,content:String, type:int, ext:String=""):void;
		
		/**
		 * 从队列中获取指定用户发来的某类消息
		 * @param fromUser:String 消息的发送者用户名
		 * @param type:int 消息的类型，默认为0，意思为普通消息,参见PrivateMessageType
		 * @see PrivateMessageType
		 */
		function getMessage(fromUser:String, type:int = 0):Array;
		
		/**
		 * 判断屏幕上是否已经打开了与某个好友聊天的面板
		 * @param fromUser:String 需要检查的好友用户名
		 * @param type:int 消息的类型，默认为0，意思为普通消息,参见 PrivateMessageType
		 * @see PrivateMessageType
		 */
		function hasRegister(fromUser:String, type:int = 0):Boolean;
		
		/**
		 * 打开与指定好友聊天的面板
		 * @param userName:String 需要发起聊天的好友用户名
		 * @param type:int 消息的类型，默认为0
		 */
		function showTalkPanel(userName:String, type:int = 0):void;
		
		/**
		 * 活动需要
		 * @param userName:String 需要发起聊天的好友用户名
		 * @param type:int 消息的类型，默认为0
		 */
		function showSpecialTalkPanel(userName:String):void;
		
		/**
		 * 注册一个聊天窗口
		 * @param fromUser:String 聊天窗口的好友用户名
		 * @param type:int 这个目前用处不明
		 * @param layout:ImessageLayout 需要注册的聊天面板对象
		 */
		function registerMessageLayout(fromUser:String, type:int, layout:IMessageLayout):void;
		
		
		/**
		 * 注销一个聊天窗口
		 * @param fromUser:String 需要注销的面板的聊天好友用户名
		 * @param type:int 这个目前用处不明
		 */
		function removeMessageLayout(fromUser:String, type:int):void;
		
		/**
		 *	活动需要，偷偷给玩家发信息 
		 * @param strMsg
		 * @param userName
		 * @param ext
		 * 
		 */		
		function sendActivePrivateMessage( strMsg:String, userName:String, ext:String=null ):void;
	}
}