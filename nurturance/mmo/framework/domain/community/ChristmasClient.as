package mmo.framework.domain.community
{
	import mmo.framework.comm.ExtMessageClient;

	public class ChristmasClient
	{
		/**
		 * 2011到处是圣诞老人 
		 */		
		public static const CMD_HANDLE_GET_SANTACLAUS_BONUS:String = "67_1";
		/**
		 * 2011圣诞袜祝福 
		 */		
		public static const CMD_HANDLE_GET_HOUSE_CHRISTMAS_HOSE:String = "67_2";
		
		/**
		 * 2011圣诞树活动：铃当兑换
		 * @author wangrentong
		 */	
		public static const CMD_BELL_EXCHANGE:String = "67_3";
		
		/**
		 * 2011圣诞树活动：获取总铃当数
		 * @author wangrentong
		 */		
		public static const CMD_GET_CHRISTMASTREE_VOTE = "67_4";
		
		/***
		 * 2011年圣诞玩游戏送铃铛handleGameGetBell
		 * */
		public static const CMD_CHRISTMASBELL_GAME = "67_5";
		
		/**
		 * 2011你有我就送铃铛领取
		 */		
		public static const CMD_BUSINESS_STREET_FEEDBACK = "67_6";
		/**
		 * 2011圣诞树活动：贡献铃当最多的20个人 
		 * @author wangrentong
		 */		
		public static const CMD_CHRISTMASBELL_VIEWTOP = "67_7";		
		
		
		private static const EXTENSION_NAME:String = "ChristmasExtension";
		
		private static var _instance:ChristmasClient;
		
		public function ChristmasClient()
		{
		}
		
		public static function get instance():ChristmasClient
		{
			if(_instance == null)
			{
				_instance = new ChristmasClient();
			}
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSION_NAME, cmd, params);
		}
		
		/**
		 * 2011获取到处是圣诞老人奖励 
		 * 
		 */		
		public function handleGetSantaClausBonus():void
		{
			sendXtMessage(CMD_HANDLE_GET_SANTACLAUS_BONUS,{});
		}
		/**
		 * 2011圣诞袜祝福奖励 
		 * 
		 */		
		public function handleGetHouseChristmasHose(roomOwnerName:String):void
		{
			sendXtMessage(CMD_HANDLE_GET_HOUSE_CHRISTMAS_HOSE,{n:roomOwnerName});
		}
		
		/**
		 * 2011圣诞树活动:铃当兑换
		 * @author wangrentong
		 */		
		public function handleBellExchange(fId:int):void
		{
			sendXtMessage(CMD_BELL_EXCHANGE,{"id":fId});
		}
		
		/**
		 * 2011圣诞树活动：获取总铃当数
		 * @author wangrentong
		 */	
		public function getAllBellNums():void
		{
			sendXtMessage(CMD_GET_CHRISTMASTREE_VOTE,{});
		}
		
		/**
		 * 2011圣诞树活动：贡献铃当最多的20个人 
		 * @author wangrentong 
		 * @param startIndex 开始索引（分页用）
		 * @param endIndex   结束索引（分页用）
		 */		
		public function getBellNumsTop(startIndex:int,endIndex:int):void
		{
			sendXtMessage(CMD_CHRISTMASBELL_VIEWTOP,{"s":startIndex, "l":endIndex});
		}
		
		/***
		 * 2011圣诞活动：玩游戏送铃铛
		 * */
		public function handleGameGetBell(gameName:String,bellNumber:int):void
		{
			sendXtMessage(CMD_CHRISTMASBELL_GAME,{"game":gameName,"num":bellNumber});
		}
		
		/**
		 * 2011你有我就送铃铛领取
		 * @param type 物品类型
		 * @param id 物品ID
		 * 
		 */		
		public function getFeedBackBell(type:int,id:int):void
		{
			sendXtMessage(CMD_BUSINESS_STREET_FEEDBACK,{"t":type,"id":id});
		}
	}
}