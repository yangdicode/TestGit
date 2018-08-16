package mmo.framework.domain.battlepet
{
	import mmo.framework.comm.ExtMessageClient;

	public class BattlePetClient
	{
		
		private static var _instance:BattlePetClient;
		
		private static const EXTENSION_NAME:String = "BattlePetExtension";
		public static const CMD_GET_FIGHTING_PET:String = "72_1";
		public static const CMD_SET_FIGHTING_PET:String = "72_2";
		public static const CMD_GET_BATTLE_PETS:String = "72_3";
		public static const CMD_LVUP_BATTLE_PET:String = "72_4";
		public static const CMD_RELAX_BATTLE_PET:String = "72_5";
		public static const CMD_MAKE_BATTLEPET_SUPEREVO:String = "72_6";
		
		
		public static const EVT_ADD_BATTLE_PET:String = "72_e1";
		
		
		/**
		 *暂用 
		 */		
		public static const CMD_ADD_BATTLE_PETS:String = "72_100";
		
		public function BattlePetClient()
		{
		}
		
		public static function get instance():BattlePetClient
		{
			if(_instance == null)
			{
				_instance = new BattlePetClient();
			}
			return _instance;
		}
		
		public function getMyBattlePet():void
		{
			sendXtMessage(CMD_GET_BATTLE_PETS, {});
		}
		
		public function getFightPet():void
		{
			sendXtMessage(CMD_GET_FIGHTING_PET, {});
		}
		
		public function setFightPet(upid:int):void
		{
			sendXtMessage(CMD_SET_FIGHTING_PET, {"upid":upid});
		}
		
		public function addBattleet(pid:int = 561):void
		{
			sendXtMessage(CMD_ADD_BATTLE_PETS, {"pid":pid});
		}
		
		public function handleBattleLevelUp(upid:int, upLv:int):void
		{
			sendXtMessage(CMD_LVUP_BATTLE_PET, {"upid":upid, "uplv":upLv});
		}
		
		/**
		 * 战宠超进化
		 */		
		public function evolvePet(upid:int):void
		{
			sendXtMessage(CMD_MAKE_BATTLEPET_SUPEREVO, {"upid":upid});
		}
		
		/**
		 * 
		 * 
		 */		
		public function setPetRest():void
		{
			sendXtMessage(CMD_RELAX_BATTLE_PET, {});
		}
		
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSION_NAME, cmd, params);
		}
		
		private function compile():void{
			var type:BattlePetType;
		}
		
	}
}