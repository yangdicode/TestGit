package mmo.play.material.clothes
{

	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.play.info.ModelInfo;


	/**
	 * 物品 / 衣服 / 家具 / 道具
	 */
	public class ClothesClient
	{

		//~ constants ---------------------------------------------------------

		private static const EXTENSIONS_NAME:String = "MaterialExtension";

		/** 获得用户的服装信息 */
		public static const GET_USER_CLOTHES:String = "getUserClothes";


		// furniture ---------------------------------------------------------

		/**
		 * Receive / Send 获取用户拥有的所有家具
		 *
		 * @param uid:int
		 *            用户Id
		 * @return furnitures:Array <{id:int(家具Id), qt:int(数量), uq:int(已使用数)}>
		 */
		public static const onGetUserFurnitures = "61_1";

		// end furniture -----------------------------------------------------		

		//~ fields ------------------------------------------------------------

		private static var _instance:ClothesClient;

		//~ package private methods ----------------------------------------------------

		function ClothesClient()
		{

		}

		static function getInstance():ClothesClient
		{
			if (_instance == null)
			{
				_instance = new ClothesClient();
			}
			return _instance;
		}

		/**
		 * 获取用户服装信息
		 *
		 * @param userName				用户名，默认为获得自己的服装信息
		 */
		function getUserClothes(userName:String = null):void
		{
			if (userName == null)
			{
				userName = ModelInfo.getSSDataProxy().myUserName;
			}

			sendXtMessage(ClothesClient.GET_USER_CLOTHES, {"un": userName});
		}

		/**
		 * 获取用户穿着的服装信息
		 *
		 * @param userName	用户名，默认为获得自己的服装信息
		 */
		function getUserWearingClothes(userName:String = null):void
		{
			if (userName == null)
			{
				userName = ModelInfo.getSSDataProxy().myUserName;
			}

			sendXtMessage(ClothesClient.GET_USER_WEARING_CLOTHES, {"un": userName});
		}

		/**
		 * 批量更新自己穿着的衣服
		 *
		 * @param clothesIds	服装ID序列化的字符串，所有服装的UsedUp字段将被更新，与1做xor
		 * 						格式为"id1,id2,..."
		 *
		 */
		function updateMyWearingClothes(clothesIds:String):void
		{
			sendXtMessage(ClothesClient.UPDATE_MY_WEARING_CLOTHES, {"cid": clothesIds});
		}

		//~ private methods ---------------------------------------------------

		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}

	}
}