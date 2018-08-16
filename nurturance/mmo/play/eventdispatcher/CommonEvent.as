package mmo.play.eventdispatcher
{
	import flash.events.Event;

	public class CommonEvent extends Event
	{
		/** 所有common命令字符串统一写在这里，按顺序命名 Common_num **/

		/** 物品获得提示显示完毕 **/
		public static const ShowAllMaterialGetTips = "Common_1";
		/**
		 * 点击控制栏中的地图按钮
		 */
		public static const ClickControlBar:String = "Common_2";
		/**
		 * 打开周刊,废弃不用了
		 * */
		public static const OPENWEEKYLY:String = "Common_3";

		/**
		 * 关闭任务面板
		 */
		public static const CloseTaskPanel:String = "Common_4";

		/**
		 * 采集等级提升
		 */
		public static const GatherLevelUp:String = "Common_5";

		/**
		 * 游戏时间为0
		 */
		public static const ONLINETIME_NONE:String = "Common_6";

		/**
		 * 野外BOSS状态改变（出现/消失）
		 * @params type			类型，ADD为出现，REMOVE为消失
		 * @params data			BOSS的资料，具体的内容可以看WildBossConfig
		 */
		public static const WILD_BOSS_STATE_CHANGE:String = "Common_7";

		/**
		 * 课程学习成功结束
		 */
		public static const Course_Learn_End:String = "Common_8";

		/**
		 * 各种面板关闭时间
		 * @params panel ProChange(转职) UserCard(职业养成) ProPanel(职业面板)
		 */		
		public static const ClosePanelInfo:String = "Common_9";
		/**
		 * 猫说话。
		 * 假如正在冒泡那么无效。
		 * @params	word，需要显示的文字，注意不要太长。
		 * @params	lastFrame，文字都显示出来以后停留的帧数，负数为250帧
		 */		
		public static const CAT_TALK:String = "Common_10";

		/**
		 * 变身职业成功时候
		 */		
		public static const RegisterPro:String = "Common_11";

		/**
		 * 职业等级等级提升
		 */		
		public static const PROFESSION_LEVEL_UP:String = "Common_12";

		/**
		 * 热点活动数据有更新
		 */		
		public static const COMMUNITY_DATA_UPDATE:String = "Common_13";

		/**
		 * 精品商城展开固定的节点
		 */
		public static const RMBMARKET_CUSTOM_EXPEND:String = "Common_14";

		/**
		 * 每日登陆面板 判断签到完成后抛出
		 * params:isFirstLogin:是否当天第一次登录
		 */
		public static const DAILY_GIFT_CHECKED:String = "Common_15";

		/**
		 * 登陆面板关闭事件
		 */		
		public static const DAILY_GIFT_SIGNPANELCLOSE:String = "daily_gift_signpanelclose";

		/**
		 * 进入温泉时抛出事件
		 */		
		public static const ENTER_HOT_SPRING:String = "Common_16";

		/**
		 * 离开温泉时（不管是主动还是被动）的事件
		 */		
		public static const LEAVE_HOT_SPRING:String = "Common_17";
		/**
		 * 职业变身
		 */		
		public static const TRANSFORM:String = "Common_18";
		/**
		 * 取消职业变身
		 */		
		public static const TRANSFORM_CANCEL:String = "Common_19";



		/**
		 * 采集完成
		 */
		public static const GatherFinish:String = "Common_21";

		/**
		 *完成某项热点活动,参数至少包含活动名，统一为name:""
		 */		
		public static const FinishActivity:String = "Common_22";

		/**
		 * 占卜结束（关闭面版了）
		 */
		public static const END_DIVINE:String = "Common_24";

		/**
		 * 等级礼包变化
		 */
		public static const ProGiftChange:String = "progiftchange";

		/**
		 * 未读邮件数目有变化
		 * num
		 */
		public static const MailChange:String = "mailchange";

		/**
		 * 系统消息数目有变化
		 */
		public static const SysMsgChange:String = "sysmsgchange";

		/**
		 * 消息盒子数目变化
		 */
		public static const MsgBoxChange:String = "msgboxchange";

		/**
		 * 奥雅大电影面板关闭
		 */
		public static const onAoYaFilmPanelClosed:String = "onAoYaFilmPanelClosed";

		public static const ON_SELECT_SHOOT_ITEM:String = "Common_25";

		/**
		 * 爱丽娜vs卡嘉阵营转换
		 */
		public static const onCampChange:String = "onCampChange20151023";

		/**
		 *分享面板，点击分享按钮事件
		 * 参数id：1-qq空间；2-qq微博；3-qq好友；4-新浪微博
		 */		
		public static const onClickShareButtonEvt:String = "onClickShareButtonEvt";
		/**
		 *分享面板，关闭
		 */		
		public static const onSharePanelCloseEvt:String = "onSharePanelCloseEvt";

		public var _params:Object;

		public function CommonEvent(type:String, params:Object = null)
		{
			super(type);
			this._params = params;
		}

		public function get params():Object
		{
			return this._params;
		}

		public override function clone():Event
		{
			return new CommonEvent(this.type, this.params);
		}

		public override function toString():String
		{
			return formatToString("CommonEvent", "type", "bubbles", "cancelable", "eventPhase", "params");
		}
	}
}

