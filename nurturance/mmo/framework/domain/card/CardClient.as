package mmo.framework.domain.card
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class CardClient extends EventDispatcher
	{
		private static const extName:String = "CardExtension";

		public static const cmdGetUserCard:String = "31_1";
		public static const cmdSetUserCard:String = "31_2";
		//卡片图鉴
		public static const cmdGetCardBook:String = "31_3";
		public static const cmdTakeCardBookBonus:String = "31_4";
		public static const cmdGetCardBookBonusState:String = "31_5";
		
		//装备卡
		public static const cmdGetEquipCardData:String = "31_6";
		public static const cmdSetEquipCard:String = "31_8";
		
		private static var _instance:CardClient;

		public function CardClient()
		{
		}

		public static function get instance():CardClient
		{
			if (_instance == null)
			{
				_instance = new CardClient();
			}
			return _instance;
		}

		public function getMyCard():void
		{
			sendXtMessage(cmdGetUserCard, {});
		}

		public function setMyCard(cardStr:String):void
		{
			sendXtMessage(cmdSetUserCard, {"deck": cardStr});
		}

		public function getCardBook():void
		{
			this.sendXtMessage(cmdGetCardBook,{});
		}
		
		public function getCardBookBonusState():void
		{
			this.sendXtMessage(cmdGetCardBookBonusState,{});
		}
		
		public function takeCardBookBonus(giftId:int):void
		{
			this.sendXtMessage(cmdTakeCardBookBonus,{"id":giftId});
		}
		
		public function getEquipCardData():void
		{
			this.sendXtMessage(cmdGetEquipCardData, {});
		}
		
		public function setEquipCard(equipedCard:String, id:int = 0, callBack:Function = null):void
		{
			SocketClient.instance.addEventListener(CardClient.cmdSetEquipCard, onSetEquipCard);
			this.sendXtMessage(cmdSetEquipCard, {"equip":equipedCard, "id":id});
			
			function onSetEquipCard(evt:SocketClientEvent):void{
				SocketClient.instance.removeEventListener(CardClient.cmdSetEquipCard, onSetEquipCard);
				if(callBack != null){
					callBack.apply(null, [evt.params.suc]);
				}
			}
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extName, cmd, params);
		}
	}
}