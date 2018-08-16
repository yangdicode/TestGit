package mmo.framework.domain.currency
{
	import mmo.framework.comm.ExtMessageClient;

	/**
	 * 奥光的相关业务Client
	 * 服务端奥光相关业务都写在这个CurrencyExtension
	 * 所以 
	 * 奥光与属性点转换
	 * 洗点药（但又和奥光不相关？？？问后端去）
	 * 泡温泉 的业务用到的命令都写在这里
	 * @author lihuilong
	 * 
	 */	
	public class CurrencyClient
	{
		private static const extensionName:String = "CurrencyExtension";
		
		//属性转换的命令
		public static const CMD_USELIGHTFORPROP:String = "33_1";
			
		//洗点石的命令	
		public static const CMD_MODIFY_ATTRBUTE:String = "33_2";	
		public static const CMD_FREE_MODIFY_ATTRBUTE:String = "33_3";
		
		//温泉相关的命令
		public static const CMD_JOIN_SPA:String  = "33_4";
		public static const CMD_TAKE_SPA_LEFT_TIME:String = "33_5";
		public static const CMD_REMOVE_SPA_USER:String = "33_6";
		public static const CMD_BUY_SPAITEM:String = "33_7";
		public static const CMD_LEFT_BUY_SPAITEM_TIMES = "33_8";
		//职业洗点石命令
		public static const CMD_USE_PROFESSION_STONE = "33_9";
		//温泉派对烧烤奖励
		public static const CMD_LEAVE_SPA_PARTY = "33_11";
		
		public function CurrencyClient()
		{
		}
		
		private function sendXtMessage(cmd:String,params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName,cmd,params);	
		}
		
		/**
		 * 用奥光转换属性 
		 * @param strength 
		 * @param agility 
		 * @param intelligence
		 * @param morality
		 * @param stamina
		 * 
		 */		
		public function changeProperty(strength:int, agility:int, intelligence:int, morality:int, stamina:int):void
		{
			var params:Object = {"attr" : strength + "," + intelligence + "," + stamina + "," + morality + "," + agility};
			sendXtMessage(CMD_USELIGHTFORPROP, params);
		}	
		
		/**
		 * 随机洗点
		 * @param itemId 洗点石GitemID
		 * @param indexStr 被抽取属性
		 * 
		 */		
		public function randomChange(itemId:int,indexId:int):void
		{
			sendXtMessage(CMD_MODIFY_ATTRBUTE,{item:itemId ,index:indexId});
		}
		/**
		 * 自由洗点 
		 * @param intemid 洗点石GitemID
		 * @param indexStr 被抽取属性
		 * @param strength 
		 * @param agility 
		 * @param intelligence 
		 * @param morality
		 * @param stamina
		 * 
		 */		
		public function freeChange(itemId:int,indexId:int ,strength:int, agility:int, intelligence:int, morality:int, stamina:int):void
		{
			var attrStr:String = morality + "," + intelligence + "," + agility + "," + strength + "," + stamina;
			trace(">>>>>>>>>>>>>>>>><<<<<<<<<<<<<<attr:"+attrStr);
			sendXtMessage(CMD_FREE_MODIFY_ATTRBUTE,{item:itemId ,index:indexId,attr:attrStr});
		}
		
		/**
		 * 取剩余时间，顺便可以潜规则判断玩家是不是用过道具
		 * 
		 */		
		public function takeLeftTime():void
		{
			sendXtMessage(CMD_TAKE_SPA_LEFT_TIME,{});
		}
		
		/**
		 * 进入温泉 
		 * 
		 */		
		public function join(type:int):void
		{
			sendXtMessage(CMD_JOIN_SPA,{"t": type});
		}
		
		/**
		 * 从温泉出来 
		 * 
		 */		
		public function removeUser():void
		{
			sendXtMessage(CMD_REMOVE_SPA_USER,{});
		}
		
		/**
		 * 购买温泉蛋 
		 * 
		 */		
		public function bugEgg():void
		{
			sendXtMessage(CMD_BUY_SPAITEM,{});
		}
		
		/**
		 * 获取购买次数
		 * 
		 */		
		public function getBugEggTimes():void
		{
			sendXtMessage(CMD_LEFT_BUY_SPAITEM_TIMES,{});
		}
		/**
		 * 使用职业洗点石 
		 * @param gItemId
		 * 
		 */		
		public function useProfressionStone(gItemId:int):void
		{
			sendXtMessage(CMD_USE_PROFESSION_STONE, {"iid": gItemId});
		}
		/**
		 * 温泉派对烧烤拿奖励 
		 * @param num
		 * 
		 */		
		public function finishBBQ(num:int):void
		{
			sendXtMessage(CMD_LEAVE_SPA_PARTY, {"num": num});
		}
	}
}