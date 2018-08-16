package mmo.framework.domain.temp
{
	/**
	 * 场景怪物属性 
	 */	
	
	public class TempMonster
	{
		public var monsterKey:String;
		public var monsterHp:int;
		
		public function TempMonster(monsterKey:String,monsterHp:int)
		{
			this.monsterKey = monsterKey;
			this.monsterHp = monsterHp;
		}
	}
}