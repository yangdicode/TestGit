package mmo.framework.domain.rangers.define
{
	public interface IRangerBattleInfo
	{
		function get id():int;
		function get battleParams():String;
		function get canGetRangers():Array;
		function get enemyEnergy():int;
		function get enemyEnergyUpSpeed():int;
		function get enemyDistance():int;
		function get enemyBasementHp():int;
		function get availableNpc():Array;
	}
}