package mmo.play.eventdispatcher
{
	import flash.events.Event;
	
	public class GiftsEvent extends Event
	{
		/** 关于奥雅礼包面板上需要用到的gifts命令字符串统一写在这里，按顺序命名 Gifts_num **/
		
		/** 点击礼包的触发点图标 **/
		public static const ClickGiftsIconEvent:String = "Gifts_1";		
		/*** 打开礼包的面板 **/
		public static const ShowGiftsPanelEvent:String = "Gifts_2";
		/*** 通知更新面板 ***/
		public static const UpdateViewEvent:String = "Gifts_3";
						
		/*** 所有奥雅礼包 状态 **/
		public static const AoyaGiftStateMsg:String ="Gifts_4";	
		
		/**** 在线时长 奖励 ***/
		public static const OnlineGiftBonus:String ="Gifts_5";
		/**** 每周礼包 奖励 ***/
		public static const TAKE_WEEKLY_GIFT_BONUS:String ="Gifts_6";		
		/**** 更新神羽礼包事件 奖励 ***/
		public static const UPDATE_VIP_GIFT_STATE:String ="Gifts_7";
		
		private var _params:Object;
		private var _state:GiftState;
		public function GiftsEvent(type:String,params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._params = params;
		}
		
		/*** 获取事件参数 ***/
		public function get params():Object
		{
			return this._params;
		}
		
		
		public function get state():GiftState
		{
			return this._state;
		}
		
		public function set state(state:GiftState):void
		{
			this._state = state;
		}
		
	}
}