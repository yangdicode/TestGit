package mmo.framework.domain.plant
{
	import mmo.framework.comm.ExtMessageClient;

	public class PlantClient
	{
		public static const CMD_GET_USERGARDENINFO:String = "79_1";   //取用户花园信息（用户种植信息,花盆信息）
		public static const CMD_PLANT_FLOWER:String = "79_2";  //种花
		public static const CMD_STEAL_FLOWER:String = "79_3";  //偷花
		public static const CMD_KILL_WORM:String = "79_4";  //杀虫
		public static const CMD_WEEDING:String = "79_5";   //除草
		public static const CMD_GAIN_FLOWER:String = "79_6";   //收花
		public static const CMD_OPEN_FLOWERPOT:String = "79_7";   //开花盆
		public static const CMD_ERADICATE_CROP:String = "79_8"; // 铲除作物
		public static const CMD_GET_PLANTAIONVISIT_LOG:String = "79_9"; // 访问记录
		public static const CMD_GET_BUDDIES_GARDENEXP:String = "79_10"; // 取用户好友信息（经验,是否有虫子,草,花）
		public static const CMD_REFRESH_USERGARDENINFO:String = "79_11";
		public static const CMD_GET_MY_GARDENITEM:String = "79_12";
		public static const CMD_GET_GARDEN_EXP:String = "79_13";
		public static const CMD_FLOWER_EXCHANGE_AG:String = "79_14";
		public static const CMD_USE_GARDENPROP:String = "79_15";
		public static const CMD_LVUP_CRYSTAL_CARD:String = "79_16";
		
		private static var _instance:PlantClient;
		private static const ExtensionName:String = "GardenPlantingExtension";
		
		public function PlantClient()
		{
		}
		
		public static function get instance():PlantClient
		{
			if (_instance == null)
			{
				_instance = new PlantClient();
			}	
			
			return _instance;
		}
		
		public function getUserGardenInfoes(owner:String):void
		{
			this.sendXtMessage(CMD_GET_USERGARDENINFO, {"un":owner});
		}	
		
		public function plantFlower(fpid:int, sid:int):void
		{
			this.sendXtMessage(CMD_PLANT_FLOWER, {"fpid":fpid, "sid":sid});
		}	
		
		public function stealFlower(buddy:String, fpid:int):void
		{
			this.sendXtMessage(CMD_STEAL_FLOWER, {"buddy":buddy, "fpid":fpid});
		}
		
		public function killPest(buddy:String, fpid:int):void
		{
			this.sendXtMessage(CMD_KILL_WORM, {"buddy":buddy, "fpid":fpid});
		}	
		
		public function weeding(buddy:String, fpid:int):void
		{
			this.sendXtMessage(CMD_WEEDING, {"buddy":buddy, "fpid":fpid});
		}	
		
		public function gainFlower(fpid:int):void
		{
			this.sendXtMessage(CMD_GAIN_FLOWER, {"fpid":fpid});
		}
		
		public function openFlowerpot(fpid:int, usedMoney:Boolean=false):void
		{
			this.sendXtMessage(CMD_OPEN_FLOWERPOT, {"fpid":fpid, "usedMoney":usedMoney});
		}
		
		public function removeFlower(fpid:int):void
		{
			this.sendXtMessage(CMD_ERADICATE_CROP, {"fpid":fpid});
		}
		
		public function getGardenVisitorLog(owner:String):void
		{
			this.sendXtMessage(CMD_GET_PLANTAIONVISIT_LOG, {"un":owner});
		}
		
		public function getBuddieGardenInfos(offset:int, length:int):void
		{
			this.sendXtMessage(CMD_GET_BUDDIES_GARDENEXP, {"offset":offset, "length":length});
		}
		
		public function refreshAllCrop(owner:String):void
		{
			this.sendXtMessage(CMD_REFRESH_USERGARDENINFO, {"un":owner});
		}
		
		public function getMyPlantItems():void
		{
			this.sendXtMessage(CMD_GET_MY_GARDENITEM, {});
		}
		
		public function getMyFarmInfo():void
		{
			this.sendXtMessage(CMD_GET_GARDEN_EXP, {});
		}
		
		public function exchangeSGold(fId:int, num:int):void
		{
			this.sendXtMessage(CMD_FLOWER_EXCHANGE_AG, {"fid":fId, "c":num});
		}
		
		public function useGardenProp(fId:int, gpid:int):void
		{
			this.sendXtMessage(CMD_USE_GARDENPROP, {"fpid":fId, "gpid":gpid});
		}
		
		public function gainCrystalCard(cardId:int):void
		{
			this.sendXtMessage(CMD_LVUP_CRYSTAL_CARD, {"cid":cardId});
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(ExtensionName, cmd, params);
		}
	}
}