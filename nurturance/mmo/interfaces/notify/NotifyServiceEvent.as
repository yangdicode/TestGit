package mmo.interfaces.notify
{
	import flash.events.Event;
	
	public class NotifyServiceEvent extends Event
	{
		public static const onNotifyClick = "onNotifyClick";
		public static const onNotifyCountChange = "onNotifyCountChange";
		public static const onNewMsgCountChange = "onNewMsgCountChange";
		public static const onMailCountChange = "onMailCountChange";
		public static const onNotifyGuide = "onNotifyGuide";
		
		public static const onGetNewMail:String = "onGetNewMail";
		
		public static const onGetFlower:String = "onGetFlower";
		
		public static const notifyClothesDesignMsg:String = "notifyClothesDesignMsg";
		
		public static const notifySupermarketMsg:String = "notifySupermarketMsg";
		
		//年度花榜活动
		public static const onInviteYF:String = "onInviteYF";
		public static const onAcceptYF:String = "onAcceptYF";
		
		public static const onValentineInvite:String = "onValentineInvite";
		public static const onValentineAccept:String = "onValentineAccept";
		
		//奥雅圈消息
		public static const onAoYaQuanApplyToBeSisterRequest:String = "onAoYaQuanApplyToBeSisterRequest";	//消息：申请成为姐妹请求(拒绝时才发送已查看命令)，类型1
		public static const onAoYaQuanApplyToBeSisterAccept:String = "onAoYaQuanApplyToBeSisterAccept";	//消息：缔结姐妹成功，类型2
		public static const onAoYaQuanApplyToBeSisterRelieve:String = "onAoYaQuanApplyToBeSisterRelieve";	//消息：解除姐妹关系，类型3
		public static const onAoYaQuanApplyToBeSisterSuccess:String = "onAoYaQuanApplyToBeSisterSuccess";	//消息：缔结姐妹成功(自动接受)，类型4,通知消息
		//制衣间消息
		public static const onMakeClothexHadMakeFinishEvt:String = "onMakeClothexHadMakeFinishEvt";	//查询是否有已合成的卡片
		
		
		public var params:Object;
		
		public function NotifyServiceEvent(type:String, params:Object)
		{
			super(type)
			this.params = params;
		}
		
		public override function clone():Event
		{
			return new NotifyServiceEvent(this.type, this.params)
		}
		
		
		public override function toString():String
		{
			return formatToString("NotifyServiceEvent"
				, "type", "bubbles", "cancelable", "eventPhase", "params");
		}
	}
}