package mmo.interfaces.npcbattle
{
	import mmo.framework.domain.npcbattle.UserNpc;
	import mmo.interfaces.IDownloadInitService;
	
	public interface INpcBattleService extends IDownloadInitService
	{
		/** 打开招募面板 **/
		function showInvitePanel():void;
		/** 是否拥有id为npcId的UserNpc **/
		function hasUserNpc(npcId:int):Boolean;
		/** 获取用户拥有的npc信息，Array保存的是强类型：UserNpc **/
		function getAllUserNpcs():Array;
		/** 获取用户拥有的npc信息，Array保存的是npcId **/
		function getAllUserNpcIds():Array;
		
		function getUserNpcById(id:int):UserNpc;
		
		function lvUpNpc(npcId:int, upLv:int):void;
		
		function lvUpWeapon(npcId:int, callBack:Function):void;
		
		function evoWeapon(npcId:int, callBack:Function):void;
		
		/** 招募精英npc **/
		function showInviteElitePanel():void;
		
		function getNpcBattleInfo(npcId:int):*;
		
		/** 好感度 **/
		function showFavorPanel():void;
		/** 获取npc当前好感度 **/
		function getNpcCurFavor(npcId):int;
		/** 获取npc定义的好感度最大值 **/
		function getNpcMaxFavor(npcId:int):int;
		
	}
}