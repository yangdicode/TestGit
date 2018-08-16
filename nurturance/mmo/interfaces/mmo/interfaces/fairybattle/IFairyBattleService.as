package mmo.interfaces.fairybattle
{
	import mmo.interfaces.IService;
	
	public interface IFairyBattleService extends IService
	{
		/**
		 * 普通的守护精灵战斗（以副本为单位），对应副本Id  
		 * @param fbId 大副本ID
		 * @param subFbId 子副本ID
		 * @param alliedData 盟军信息
		 * 
		 */	
		function createBattle(fbId:int, subFbId:int, alliedData:Object):void;
		/**
		 * 额外的守护精灵战斗（非正常流程，不参与与后台通讯流程）  
		 * @param fbId 大副本ID 历史原因，战斗需要配底图，找个背景对应的吧- -
		 * @param subFbId 子副本ID 
		 * @param userfairys 友方精灵信息，fid为fairyId,lv为级别，默认第一个和第六个都为队长，勿超过六个
		 * 例： [{"fid":1, "lv":1},{"fid":2, "lv":1},{"fid":3, "lv":1}]
		 * @param layerMonsters 敌方精灵信息, 每层的怪的数组,第一层数组表示层数，第二层数组mid表示怪的id
		 * 一般任务貌似配一层就够了。
		 * 例： [[{"mid":1}, {"mid":1}],["{mid":2}, {"mid":2}]];
		 * 
		 */	
		function createExBattle(userfairys:Array, layerMonsters:Array, fbId:int = 1, subFbId:int  = 1):void;
	}
}