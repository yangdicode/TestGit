package mmo.interfaces.battle
{
	import flash.events.Event;

	public class BattleEvent extends Event
	{
		//以下为战斗外用到的事件。

		/**
		 * 战斗开始。
		 */
		public static const BATTLE_START:String = "BattleStart";
		/**
		 * 战斗结束。
		 * 参数：
		 * 		reason		离开战斗的原因，类型在BattleParamsType中前缀为END_BATTLE_REASON_。
		 * 		enemy		怪物Id组成的数组。例如格式[{id: -1, lv:5},{id: -2, lv:10}] 注* 怪物id为负数,自己* -1吧谢谢
		 */
		public static const BATTLE_END:String = "BattleEnd";
		/**
		 * 创建战斗失败
		 * 参数：
		 * 		reason		创建战斗失败的原因，类型在BattleParamsType中前缀为FAIL_BATTLE_REASON_。
		 */
//		public static const BATTLE_FAIL:String = "BattleFail";

		//以下为战斗中用到的事件。
		/**
		 * 销毁战斗界面
		 */
		public static const BATTLE_DISPOSE:String = "Battle Dispose";
		/**
		 * 单位元件下载完成
		 */
		public static const UNIT_DATA_LOAD_COMPLETE:String = "cmdUnitDataLoadComplete";
		/**
		 * 开始(Loading)动画结束
		 */
		public static const END_START_MOVIE:String = "endStartMovie";
		/**
		 * 变身动画结束
		 */
		public static const END_TRANSFORM_MOVIE:String = "endTransformMovie";
		/**
		 * 放大动画结束
		 */
		public static const END_ZOOMIN_MOVIE:String = "endZoomInMovie";
		/**
		 * 发出下一条命令
		 */
		public static const ON_NEXT_COMMAND:String = "onNextCommand";
		/**
		 * 获取下一条命令
		 */
		public static const GET_NEXT_COMMAND:String = "getNextCommand";
		/**
		 * 增加一个状态栏
		 */
		public static const ADD_STATE_BAR:String = "addStateBar";
		/**
		 * 回合开始，接收到此事件后用户才可以进行操作
		 */
		public static const ROUND_START:String = "Round Start";
		/**
		 * 抽卡
		 */
		public static const DRAW_CARD:String = "Draw Card";
		/**
		 * 发送文字到战斗记录框
		 */
		public static const TEST_MSGPANEL:String = "test msgpanel";
		/**
		 * 选择攻击目标
		 */
		public static const CHOOSE_TARGET:String = "chooseTarget";
		/**
		 * 结束选择攻击目标
		 */
		public static const ON_CHOOSE_TARGET:String = "onChooseTarget";
		/**
		 * 播放出卡动画
		 */
		public static const CARD_MOVIE:String = "cardMovie";
		/**
		 * 结束播放出卡动画
		 */
		public static const END_CARD_MOVIE:String = "endCardMovie";
		/**
		 * 特效开始
		 */
		public static const EFFECT_START:String = "effectStart";
		/**
		 * 特效结束
		 */
		public static const EFFECT_END:String = "effectEnd";
		/**
		 * 特效击中
		 */
		public static const EFFECT_ATTACK:String = "effectAttack";
		/**
		 * 特效冒数字
		 */
		public static const EFFECT_SHOWNUMBER:String = "effectShowNumber";
		/**
		 * 用户动作结束
		 */
		public static const UNIT_ACTION_END:String = "actionEnd";
		/**
		 * 用户防御动作结束
		 */
		public static const UNIT_DEFENCE_END:String = "defenceEnd";
		/**
		 * 使用道具
		 */
		public static const USE_ITEM:String = "useItem";
		/**
		 * 确认使用了某物品的事件
		 */
		public static const ON_USE_ITEM:String = "onUseItem";
		/**
		 * 确定使用某些卡片的事件
		 */
		public static const ON_USE_CARD:String = "onUseCard";
		/**
		 * 人物的Buff状况改变
		 */
		public static const ON_CHANGE_BUFF:String = "onChangeBuff";
		/**
		 * 停止所有控制流程 
		 */
		public static const STOP_CONTROL:String = "stopControl";
		/**
		 * 时限到达 
		 */		
		public static const TIME_OVER:String = "timeOver";

		public var params:Object;

		public function BattleEvent(type:String, params:Object = null)
		{
			this.params = params;
			super(type);
		}

		override public function clone():Event
		{
			return new BattleEvent(this.type, this.params);
		}
	}
}