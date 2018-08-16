package mmo.interfaces.battleinforpanel
{
	import flash.display.InteractiveObject;
	
	import mmo.framework.domain.profession.BattleAttribute;
	import mmo.interfaces.IDownloadInitService;
	import mmo.interfaces.IService;
	
	public interface IBattleInfoPanelService extends IDownloadInitService
	{
		/**
		 * 角色信息面版
		 */		
		function showInfoPanel():void;
		
		/**
		 * 编队面版
		 */		
		function showFormationPanel():void;
		
		/**
		 * 显示旧卡面版
		 */		
		function showOldCardPackage():void;
		
		/**
		 * 拿队伍信息,[{"pos":1, "id":1}],自己是id=0;
		 */		
		function getMyTeamData():Array;
		
		/**
		 * 我的战力
		 */		
		function getMyPower():int;
		
		/**
		 * 战宠战力
		 */
		function getPetPower():int;
		
		/**
		 * 我npc的战力
		 */	
		function getNpcPower(npcId:int):int;
		
		/**
		 * 我整个队伍的战力
		 */	
		function getMyTeamPower():int;
		
		/**
		 * 打开战斗指南面板 
		 */		
		function showBattleGuidePanel():void;
		
		/**
		 * 打开英雄手册
		 */		
		function showNpcHandBookPanel():void;
		
		function addEquipmentTips(target:InteractiveObject, eId:int):void;
		
		function addNpcInfoTips(target:InteractiveObject, npcId:int):void;
		
		function analyserPowerByAttr(attr:BattleAttribute):int;
		
		function showGetPowerHelpPanel():void;
		
	}
}