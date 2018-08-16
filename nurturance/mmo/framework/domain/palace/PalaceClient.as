package mmo.framework.domain.palace
{
	import mmo.framework.comm.SocketClient;

	public class PalaceClient
	{
		public static const onCreatePalace:String = "99_1"; // 创建宫殿
		public static const onApplyJoinPalace:String = "99_2"; // 请求加入宫殿
		public static const onHandleJoinRequest:String = "99_3"; // 处理加入请求
		public static const onQuitPalace:String = "99_4"; // 离开宫殿
		public static const onSavePalaceNotice:String = "99_5"; // 修改宫殿宣言
		public static const onSaveMyBless:String = "99_6";
		public static const onLevelUpPalaceCrown:String = "99_8"; // 辉煌之冠进阶
		public static const onAlterPalaceName:String = "99_9";
		public static const onSetPalaceMemberRole:String = "99_10"; // 设置宫殿成员职位
		public static const onKickOutPalaceMember:String = "99_11"; // 踢人
		public static const onGetMyPalaceInfo:String = "99_12"; // 取自己宫殿信息
		public static const onGetOtherPalaceInfo:String = "99_13"; // 取其他宫殿信息-
		public static const onGetMyPalaceNotice:String = "99_14"; // 取自己宫殿通知
		public static const onGetPalaceBless:String = "99_16";
		public static const onGetMemberInfos:String = "99_18";
		public static const onGetMailMsg:String = "99_19"; // 取自己宫殿消息
		public static const onGetMyPalaceInfos:String = "99_20";
		public static const onGetPalaceTopInfos:String = "99_21";
		public static const onGetPalaceRecommend:String = "99_22";
		public static const onSearchPalaceByDuoDuoId:String = "99_23"; //通过多多号搜索宫殿
		public static const onDelMailMsg:String = "99_24";
		public static const onBuyPalaceToken:String = "99_25"; // 购买宫殿信物
		public static const onGetMailMsgCount:String = "99_26";
		public static const onSetMcValue:String = "99_27";  //前端用
		public static const onGetUserCardInfo:String = "99_28";  //前端用
		public static const onSendPalaceChat:String = "99_29";  //前端用
		public static const onSendBlessBag:String = "99_30";
		public static const onGrabBlessBag:String = "99_31";
		public static const onGetBlessBagGrabList:String = "99_32";
		public static const onGetBlessBagRecord:String = "99_33";
		public static const onGetBlessBagDetail:String = "99_34";
		public static const onGetBlessBagMyRecord:String = "99_35";
		public static const onGetPalaceDailyBonusCount:String = "99_36"; // 拥有信物每日可领取的金钻数
		public static const onGetPalaceDailyBonus:String = "99_37"; // 拥有信物领取每日奖励
		public static const onSetPalaceCrownShow:String = "99_38"; // 设置辉煌之冠展示
		
		public static const onSendBi:String = "99_100";  //前端用
		
		public static const onUpdatePalaceMailMsg:String = "99_e1"; // 宫殿消息更新
		public static const onUpdatePalaceChatMsg:String = "99_e2"; // 宫殿消息更新
		public static const onUpdateUserJoinPalace:String = "99_e3";  //加入宫殿
		
		public static const xtId:int = 99;
		
		public function PalaceClient()
		{
		}
		
		public static function sendXtMessage(cmd:String, callback:Function=null, params:Object=null):void
		{
			SocketClient.instance.sendXtMsgAndCallBack(xtId, cmd, callback, params);
		}
		
		public static function sendBi(bi:int):void
		{
			sendXtMessage(onSendBi, null, {"id":bi});
		}
	}
}