package mmo.framework.domain.fairy
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class FairysClient
	{
		public static const onGetMyFairysInfo:String = "84_1";
		public static const onGetOtherFairysInfo:String = "84_2";
		public static const onSaveTeamsInfo:String = "84_3";
		public static const onMakeFairyEvolve:String = "84_4";
		public static const onMakeFairyCompose:String = "84_5";
		public static const onSellFairys:String = "84_8";
		public static const onIncreaseEndurance:String = "84_9";
		public static const onGetFairyBuddies:String = "84_11";
		public static const onSetFairyEquipCard:String = "84_17";
		public static const onGetUserFairyUsedLog:String = "84_13";
		public static const onExpandFairyBag:String = "84_19";
		public static const onSummonNewFairyByFairyStone:String = "84_20";
		public static const onSummonNewFairyByFriendShip:String = "84_21";
		public static const onBuyFairyDominate:String = "84_23";
		public static const onFairySuperEvolve:String = "84_26";  //超进化
		
		public static const GET_USER_FAIRYALLIED_INFO:String = "84_10";
		public static const GET_USER_PASS_FB_RECORDS:String = "84_12";
		public static const XINCHUNGE_INC_RESVALUE:String = "84_14";
		public static const TAKE_FIRST_FAIRY:String = "84_15";
		public static const CMD_HARRY_SECRET_CASE:String = "84_22";
		
		public static const onAddFairys:String = "84_e1";
		public static const onRemoveFairys:String = "84_e4";
		public static const onUpdateFairysInfo:String = "84_e2";
		public static const onUpdateFairyTeamInfo:String = "84_e3";
		public static const onUpdateEndurance:String = "84_e5";
		public static const onUpdatePlayerExp:String = "84_e6";
		public static const onUpdateBagSize:String = "84_e7";
		public static const onUpdateFriendShip:String = "84_e8";
		public static const onUpdateFairyEquipCard:String = "84_e9";
		public static const onUpdateFairyDominate:String = "84_e10";
		
		private static var _instance:FairysClient;
		private static const ExtensionName:String = "DaemonFairyExtension";
		
		public function FairysClient()
		{
		}
		
		public static function get instance():FairysClient
		{
			if (_instance == null)
			{
				_instance = new FairysClient();
			}	
			
			return _instance;
		}
		
		public function addTestMyFairyData(fairyId:int, num:int):void
		{
			this.sendXtMessage("1000", {"id":fairyId, "num":num});
		}
		
		public function increaseEndurance():void
		{
			this.sendXtMessage(onIncreaseEndurance, {});
		}
		
		public function getMyFairysInfo():void
		{
			this.sendXtMessage(onGetMyFairysInfo, {});
		}
		
		public function getOtherFairysInfo(userName:String):void
		{
			this.sendXtMessage(onGetOtherFairysInfo, {"un":userName});
		}
		
		public function saveTeamsInfo(teamsInfo:String, currTeamId:int):void
		{
			this.sendXtMessage(onSaveTeamsInfo, {"teams":teamsInfo, "ft":currTeamId});
		}
		
		public function makeFairyEvolve(targetId:int, sourceId:String):void
		{
			this.sendXtMessage(onMakeFairyEvolve, {"tvid":targetId, "sfid":sourceId});
		}
		
		public function makeFairySuperEvolve(targetId:int, sourceId:Number):void
		{
			this.sendXtMessage(onFairySuperEvolve, {"tvid":targetId, "sfid":sourceId});
		}
		
		public function makeFairyCompose(userFairyId:String, stuffs:String):void
		{
			this.sendXtMessage(onMakeFairyCompose, {"tufid":userFairyId, "stuffs":stuffs});
		}
		
		public function sellFairys(userFairyIds:String):void
		{
			this.sendXtMessage(onSellFairys, {"fairys":userFairyIds});
		}
		
		public function getFairyBuddies(offset:int, length:int):void
		{
			this.sendXtMessage(onGetFairyBuddies, {"offset":offset, "length":length});
		}
		
		public function setFairyEquipCard(userFairysStr:String, id:int = 0, callBack:Function = null):void
		{
			function onSet(evt:SocketClientEvent):void{
				SocketClient.instance.removeEventListener(FairysClient.onSetFairyEquipCard, onSet);
				if (callBack != null){
					callBack.apply(null, [evt.params.suc]);
				}
			}
			SocketClient.instance.addEventListener(FairysClient.onSetFairyEquipCard, onSet);
			this.sendXtMessage(onSetFairyEquipCard, {"equip":userFairysStr, "id":id});
		}
		
		public function getFairyAilledInfor():void{
			this.sendXtMessage(GET_USER_FAIRYALLIED_INFO, {});
		}
		
		public function getUserPassFbRecord():void{
			this.sendXtMessage(GET_USER_PASS_FB_RECORDS, {});
		}
		
		public function recover():void{
			this.sendXtMessage(XINCHUNGE_INC_RESVALUE, {});
		}
		
		public function getFirstFairy(id:int):void{
			this.sendXtMessage(TAKE_FIRST_FAIRY, {"fairy":id});
		}
		
		public function getUserFairyUsedLog():void
		{
			this.sendXtMessage(onGetUserFairyUsedLog, {});
		}
		
		public function expandFairyBag(num:int):void
		{
			this.sendXtMessage(onExpandFairyBag, {"num":num});
		}
		
		public function buyFairyDominate(inc:int):void
		{
			this.sendXtMessage(onBuyFairyDominate, {"inc":inc});
		}
		
		public function summonNewFairyByFairyStone():void
		{
			this.sendXtMessage(onSummonNewFairyByFairyStone, {});
		}
		
		public function summonNewFairyByFriendShip():void
		{
			this.sendXtMessage(onSummonNewFairyByFriendShip, {});
		}
		
		public function takeHarryTreasureBonus():void
		{
			sendXtMessage(CMD_HARRY_SECRET_CASE, {});
		}
		
		public static function sendExtAndCallBack(cmd:String, params:Object, callBack:Function):void{
			SocketClient.instance.sendXtMsgAndCallBack(ExtensionName, cmd, callBack, params);
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(ExtensionName, cmd, params);
		}
	}
}