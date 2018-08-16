package mmo.framework.domain.npcbattle
{
	import mmo.framework.comm.ExtMessageClient;

	public class NpcBattleClient
	{
		public static const CMD_GET_NPC_INVITES:String = "86_1";//招募信息
		public static const CMD_ADD_NPC_INVITE_VALUE:String = "86_2";//增加忠诚度
		public static const CMD_INVITE_NPC:String = "86_3";//招募	
		public static const GET_USER_NPC_INFO:String = "86_4";//取拥有信息
		public static const LV_UP_NPC:String = "86_7";
		
		public static const CMD_NPC_WEAPON_LV_UP:String = "86_8";
		public static const CMD_NPC_WEAPON_EVO:String = "86_9";
		
		public static const CMD_GET_USER_TASKSINFO:String = "86_10";
		public static const CMD_START_NPC_TASK:String = "86_11";
		public static const CMD_FINISH_NPC_TASK:String = "86_12";
		public static const CMD_HANDIN_ITEM:String = "86_13";
		public static const CMD_COST_YUBEI_FINISH:String = "86_14";
		public static const CMD_GIVEUP_NPC_TASK:String = "86_15";		
		public static const CMD_CLIENT_SET_CANFINISH_TASK:String = "86_16";
		public static const TALK_WITH_NPC:String = "86_17";
		public static const SEND_GIFT_TO_NPC:String = "86_18";
		
		public static const CMD_BUY_YUBEI_GIFT_TO_NPC:String = "86_19";
		
		public static const CMD_EVO_NPC:String = "86_20";
		
		//--------------------------------------------------------------------------
		public static const EVT_ADD_USER_NPCS:String = "86_e1";//后端添加npc
		public static const EVT_ADD_NPC_BATTLE_INFO:String = "86_e2";
		public static const EVT_UPDATE_DOING_TASK_INFO:String = "86_e3";//更新好感度任务
		public static const EVT_UPDATE_NPC_FAVOR:String = "86_e4";//npc的好感度都更新事件
		public static const EVT_DEL_NPC:String = "86_e5";
		public static const EVT_NPC_LEVEL_UP:String = "86_e6"; //增加了npc升级通知命令
		
		//***************************************************************************
		
		private static const EXTENSION_ID:int = 86;
		
		public function NpcBattleClient()
		{
		}
		
		public static function getNpcInvites():void
		{
			sendXtMessage(CMD_GET_NPC_INVITES, {});
		}
		
		public static function tryAddNpcInviteValue(nid:int,isMoney:Boolean):void
		{
			sendXtMessage(CMD_ADD_NPC_INVITE_VALUE, {"nid":nid,"money":isMoney});
		}
		
		public static function inviteNpc(nid:int):void
		{
			sendXtMessage(CMD_INVITE_NPC, {"nid":nid});
		}
		
		
		public static function getMyNpcInfo():void
		{
			sendXtMessage(GET_USER_NPC_INFO, {});
		}
		
		public static function lvUpNpc(npcId:int, upLv:int):void{
			sendXtMessage(LV_UP_NPC, {"nid":npcId, "uplv":upLv});
		}
		
		public static function lvUpWeapon(npcId:int):void{
			sendXtMessage(CMD_NPC_WEAPON_LV_UP, {"nid":npcId});
		}
		
		public static function evoWeapon(npcId:int):void{
			sendXtMessage(CMD_NPC_WEAPON_EVO, {"nid":npcId});
		}		
			
		public static function getUserNpcTaskInfo():void
		{
			sendXtMessage(CMD_GET_USER_TASKSINFO, {});
		}
		
		public static function startNpcTask(taskId:int):void
		{
			sendXtMessage(CMD_START_NPC_TASK, {"id":taskId});
		}
		
		public static function finishNpcTask(taskId:int):void
		{
			sendXtMessage(CMD_FINISH_NPC_TASK, {"id":taskId});
		}
		
		public static function handinItemNpcTask(taskId:int,iType:int,iId:int,iNum:int):void
		{
			sendXtMessage(CMD_HANDIN_ITEM, {"id":taskId,"it":iType,"iid":iId,"num":iNum});
		}
		
		public static function costYubeiFinishNpcTask(taskId:int):void
		{
			sendXtMessage(CMD_COST_YUBEI_FINISH, {"id":taskId});
		}
		
		public static function giveupNpcTask(taskId:int):void
		{
			sendXtMessage(CMD_GIVEUP_NPC_TASK, {"id":taskId});
		}
				
		public static function setCliendCanFinishTask(taskId:int):void
		{
			sendXtMessage(CMD_CLIENT_SET_CANFINISH_TASK, {"id":taskId});
		}
		
		public static function talkWithNpc(npcId:int,isBest:Boolean):void
		{
			sendXtMessage(TALK_WITH_NPC, {"nid":npcId,"iba":isBest});
		}
		
		public static function sendGiftToNpc(npcId:int,giftItemId:int):void
		{
			sendXtMessage(SEND_GIFT_TO_NPC,  {"nid":npcId,"iid":giftItemId});
		}
				
		public static function sendYubiGiftToNpc(npcId:int,goodsId:int):void
		{
			sendXtMessage(CMD_BUY_YUBEI_GIFT_TO_NPC,  {"nid":npcId,"gid":goodsId});
		}
		
		public static function evoNpc(npcId:int):void{
			sendXtMessage(CMD_EVO_NPC, {"nid":npcId});
		}
		
		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessageByExtId(EXTENSION_ID, cmd, params);
		}
		
	}
}