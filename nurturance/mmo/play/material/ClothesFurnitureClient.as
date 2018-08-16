package mmo.play.material
{
	import mmo.framework.comm.ExtMessageClient;

	public class ClothesFurnitureClient
	{
		public static const extensionName:String = "ClothFurnitureExtension";
		
		public static const cmdGetClothesAndFurniture = "18_1";
		public static const CMD_REMOVE_EAR_OR_TAIL:String = "18_7";
		public static const CMD_GET_USER_SUITS:String = "18_8";
		public static const SAVE_USER_SUIT:String = "18_9";
		public static const CMD_GET_CLOTH_RATES:String = "18_10";
		public static const CMD_CHANGE_CLOTH_LIKE_STATUS:String = "18_11"; // 衣服喜爱
		public static const CMD_GET_AOYA_MEMORY_FURNITURE_INFO:String = "18_12";
		
		private static var _instance:ClothesFurnitureClient;
		public static function get instance():ClothesFurnitureClient
		{
			if(_instance == null)
			{
				_instance = new ClothesFurnitureClient();
			}	
			return _instance;
		}	
		
		public function ClothesFurnitureClient()
		{
		}
		
		public function getClothesAndFurniture():void
		{
			this.sendXtMessage(cmdGetClothesAndFurniture, {});
		}
		
		public function removeMagicMakeUp(data:Object):void
		{
			this.sendXtMessage(CMD_REMOVE_EAR_OR_TAIL, data);
		}
		
		public function getUserSavingClothes():void{
			sendXtMessage(CMD_GET_USER_SUITS, {});
		}
		
		public function saveMyClothes(clothesStr:String, replaceId:Number){
			sendXtMessage(SAVE_USER_SUIT, {"wearing":clothesStr, "sid":String(replaceId)});
		}
		
		public function getAoyaMemoryFurInfo(userName:String){
			sendXtMessage(CMD_GET_AOYA_MEMORY_FURNITURE_INFO, {"user":userName});
		}
		
		public function getClothesRates(){
			sendXtMessage(CMD_GET_CLOTH_RATES, {});
		}
		
		public function setClotehsFavor(id:int, isFavor:Boolean):void{
			sendXtMessage(CMD_CHANGE_CLOTH_LIKE_STATUS, {"clothItemId":id, "like":isFavor});
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, params);
		}	
		
		
	}
}