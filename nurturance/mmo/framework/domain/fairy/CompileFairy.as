package mmo.framework.domain.fairy
{
	public class CompileFairy
	{
		public function CompileFairy()
		{
		}
		
		public static function compileMe():void
		{
			var fairy:Fairy;
			var fe:FairyEvolve;
			var fls:FairyLeaderSkill;
			var fms:FairyMainSkill;
			var fmsl:FairyMainSkillLevel;
			var fl:FairyLevel;
			var fpl:FairyPlayerLevel;
			var ft:FairysType;
			var uf:UserFairy;
			var fec:FairyEquipCard;
			var client:FairysClient;
			
			var fbDefine:FairyFbDefine;
			var subFbDefine:FairySubFbDefine;
			var buddDefine:FairyFbBuddyDefine;
			var enterFbParams:FairyFbParams;
			var fairyMonster:FairyMonster;
			var fairyMonsters:FairyMonsters;
			var fbDefines:FairyFbDefines;
			var time:FairyTimeLimitedFbDefine;
			
			var fairyFriendBuffType:FairyFriendBuffType;
			var fairyFriendBuff:FairyFriendBuff;
			var fairyEnemyBuffType:FairyEnemyBuffType;
			var fairyEnemyBuff:FairyEnemyBuff;
			
			var fairyEnemyAIDefine:FairyEnemyAIDefine;
			var fairyEnemyAIDefines:FairyEnemyAIDefines;
			var fairyEnemySkill:FairyEnemySkill;
			
			var fairySuperEvolve:FairySuperEvolve;
			
		}
	}
}