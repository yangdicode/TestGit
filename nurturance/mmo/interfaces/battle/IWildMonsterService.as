package mmo.interfaces.battle
{
	import flash.geom.Point;
	
	import mmo.interfaces.IInitService;
	
	public interface IWildMonsterService extends IInitService
	{
		/**
		 * 生成副本怪物。
		 * 假如副本怪物是不可刷新的，那么在清理所有怪物以后FBEventDispatcher会抛出FBEvent.CLEAR_SCENE_MONSTERS。 
		 * @param monstersConfig	怪物的配置
		 * 							monstersConfig[i].location		怪物位置
		 * 							monstersConfig[i].id			怪物Id
		 * 							monstersConfig[i].lv			怪物等级
		 * 							monstersConfig[i].strategy		怪物行走策略，默认以location为中心半径30像素巡逻
		 * 							monstersConfig[i].battleParams	与怪物战斗的参数
		 * @param needRefresh		是否需要刷新
		 * 
		 */		
		function generatorFBMonster(monstersConfig:Array, needRefresh:Boolean = true, maxMonstersNum:int = 4, autoMove:Boolean = true):void;
		
		/**
		 * 生成好感度副本怪物。
		 * 假如副本怪物是不可刷新的，那么在清理所有怪物以后FBEventDispatcher会抛出FBEvent.CLEAR_SCENE_MONSTERS。 
		 * @param monstersConfig	怪物的配置
		 * 							monstersConfig[i].location		怪物位置
		 * 							monstersConfig[i].monsterId		怪物Id
		 * 							monstersConfig[i].monsterLv		怪物等级
		 * 							monstersConfig[i].battleId		战斗id
		 * 							monstersConfig[i].strategy		怪物行走策略，默认以location为中心半径30像素巡逻
		 * 							monstersConfig[i].battleParams	与怪物战斗的参数
		 * @params battleType		战斗类型
		 */	
		function generatorFavorFBMonster(monsterConfig:Array, battleType:int, autoMove:Boolean = true):void;
		
		/**
		 * 生成迷镜隧道中的怪物，不行走不刷新，清理完毕由FBEventDispatcher抛出FBEvent.CLEAR_SCENE_MONSTERS。 
		 * @param monstersConfig	怪物的配置
		 * 							monstersConfig[i].location	怪物位置
		 * 							monstersConfig[i].monsterId	怪物Id
		 * 							monstersConfig[i].monsterLv	怪物等级
		 */		
		function generatorTowerMonster(monstersConfig:Array):void;
		
		/** 清除迷镜隧道的怪物  **/
		function clearTowerMonster():void;
		
		/**
		 * 生成副本组怪，消失会通知队伍。 
		 * @param monstersData各个怪物组数据，
		 * 						每个元素中有		monsters：该组怪物组阵容，每个元素中有id和lv
		 * 										location：该组怪物的坐标，
		 * 										battleParams：该组怪物的战斗参数，
		 * 										strategy：该组怪物形象的行走策略
		 * @param needRefresh是否需要刷新
		 * 
		 */		
		function generatorFBTeamMonster(monstersConfig:Array, needRefresh:Boolean = true, autoMove:Boolean = true):void;
		/**
		 * 获取当前场景的怪物，返回WildMonster的数组。 
		 */		
		function getCurrentSceneWildMonsterList():Array;
		
		/**
		 * 生成迷镜异界中的怪物，不行走不刷新，清理完毕由FBEventDispatcher抛出FBEvent.CLEAR_SCENE_MONSTERS。 
		 * @param monstersConfig	怪物的配置
		 * 							monstersConfig[i].battleId   新战斗id
		 * 							monstersConfig[i].battleType 新战斗的怪物id
		 * 							monstersConfig[i].location	   怪物位置
		 * 							monstersConfig[i].monsterId	   怪物Id
		 * 							monstersConfig[i].monsterLv	   怪物等级
		 */		
		function generatorHolyMonster(monstersConfig:Array):void;
		
		/** 清除迷镜异界的怪物  **/
		function clearHolyMonster():void;
		
		
		
		
		
		
		
		/**
		 * 战斗派对恶心特殊刷怪方式 
		 */		
		function generatorBattlePartyMonster():void;
		/**
		 * 清除战斗派对中的怪物。 
		 */		
		function clearBattlePartyMonster():void;
	}
}