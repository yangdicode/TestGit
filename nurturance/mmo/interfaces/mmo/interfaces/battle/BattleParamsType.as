package mmo.interfaces.battle
{

	public class BattleParamsType
	{
		/**
		 * 战斗结束的原因：战斗胜利。
		 */
		public static const END_BATTLE_REASON_WIN:int = 0;
		/**
		 * 战斗结束的原因：战斗失败。
		 */
		public static const END_BATTLE_REASON_LOSE:int = 1;
		/**
		 * 战斗结束的原因：战斗逃跑。
		 */
		public static const END_BATTLE_REASON_ESCAPE:int = 2;
		/**
		 * 战斗结束的原因：战斗服务器错误。
		 */
		public static const END_BATTLE_REASON_ERROR:int = 3;

		/**
		 * 战斗不能开始的原因：生命值过低。
		 */
		public static const FAIL_BATTLE_REASON_LOWHP:int = -11;
		/**
		 * 战斗不能开始的原因：该怪物可以打的次数到达上限。
		 */
		public static const FAIL_BATTLE_REASON_FULLTIME:int = -10;
		/**
		 * 战斗不能开始的原因：系统错误。
		 */
		public static const FAIL_BATTLE_REASON_ERROR:int = -1;

		/**
		 * 战斗类型：与怪物战斗。
		 */
		public static const TYPE_MONSTER:int = 0;
		/**
		 * 战斗类型：与玩家战斗。 
		 */
		public static const TYPE_PLAYER:int = 1;

		public function BattleParamsType()
		{
		}
	}
}