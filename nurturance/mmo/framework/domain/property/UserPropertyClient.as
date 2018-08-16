package mmo.framework.domain.property
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.SSDataProxy;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.logindataclient.LoginDataClient;
	import mmo.framework.domain.material.clothes.UserClothes;
	import mmo.framework.domain.material.clothes.UserClothesData;
	import mmo.framework.domain.uservar.UserVarGetter;
	import mmo.framework.domain.uservar.UserVarKeys;
	import mmo.socketserver.data.User;

	public class UserPropertyClient extends LoginDataClient
	{
		private static const extensionName = "AttrExtension";
		public static const GETMYPROPERTY:String = "24_1";
		public static const GETOTHERSPROP:String = "24_2";
		public static const WINGLEVELUP:String = "24_6";
		
		//以下三条旧光之翼命令作废
		public static const GET_USER_CRYSTAL_CONFIG:String = "24_9";
		public static const INC_CRYSTAL_CHIP:String = "24_10";
		public static const OPEN_CEREMONY:String = "24_11";
		
		//光之翼2.0命令
		public static const CMD_GET_USER_WINGCEREMONGLV:String = "24_12";
		public static const CMD_OPEN_WINGCEREMONY:String = "24_13";
		
		//改变种族命令
		public static const CMD_CHANGE_RACE:String = "24_14";
		
		public static const OnAttrChange:String = "attrchange";
		public static const OnEnergyChange:String = "energychange";
		
		public static const onFeatherAgeLevelUp:String = "onFeatherAgeLevelUp"; 
		
		private static const _instance:UserPropertyClient = new UserPropertyClient();
		
		public static function get instance():UserPropertyClient
		{
			return _instance;
		}	
		
		public function UserPropertyClient()
		{
			var builder:UserPropertyBuilder;
			var featherAges:FeatherAges;
			MainModelLocator.instance.addModel(UserProperty, new UserProperty());
			
			SocketClient.instance.addEventListener(OnAttrChange, onAttrChange);
			SocketClient.instance.addEventListener(OnEnergyChange, onEnergyChange);
			
			//血量放在用户变量，独立开，减少信息量
			SocketClient.instance.addEventListener(SocketClientEvent.onUserVariablesUpdate, onHpMpUpdate);
		}
		
		override public function addDataListener():void{
			SocketClient.instance.addEventListener(GETMYPROPERTY, onGetUserProperty);
		}
		
		/**
		 * 获取别人的属性信息
		 */		
		public function getUserProperty(userName:String):void
		{
			this.sendXtMessage(GETOTHERSPROP, {"name":userName});
		}
		
		/**
		 * 
		 * 光之翼升级
		 * */
		public function wingLevelUp():void
		{
			this.sendXtMessage(WINGLEVELUP, {});
		}	
		
		/**
		 * 请求结晶碎片个数，是否参加过开启翅膀仪式的状态 
		 * 
		 */		
		public function requestCrystalChipState():void
		{
			sendXtMessage(GET_USER_CRYSTAL_CONFIG,{});
		}
		
		/**
		 * 镶嵌结晶、碎片 
		 * @param lv 结晶等级
		 * @param num 镶嵌数量
		 * 
		 */		
		public function incCrystalChip(lv:int,num:int):void
		{
			sendXtMessage(INC_CRYSTAL_CHIP,{"lv":lv,"num":num});
		}
		
		/**
		 * 开启翅膀仪式 
		 * @param lv 翅膀等级
		 * 
		 */		
		public function openCeremony(lv:int):void
		{
			sendXtMessage(OPEN_CEREMONY,{"lv":lv});
		}
		
		/**
		 * 光之翼2.0 获取仪式阶数 
		 * 
		 */		
		public function getUserCeremonyLv():void
		{
			sendXtMessage(CMD_GET_USER_WINGCEREMONGLV,{});
		}
		
		/**
		 * 光之翼2.0 举行光之翼进阶仪式 
		 * 
		 */		
		public function openWingCeremony():void
		{
			sendXtMessage(CMD_OPEN_WINGCEREMONY,{});
		}
		
		/**
		 * 种族改变(必须是无种族才能改变)
		 * @param race 种族
		 * @param callBack 成功后返回
		 */		
		public function changeRace(race:Race,callBack:Function):void
		{
			var userProp:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
			if(userProp.race != Race.None)
			{
				throw new Error("转换种族必须是无种族！");
				return;
			}
			
			var onChangeRaceEnd:Function = function(evt:SocketClientEvent):void
			{
				SocketClient.instance.removeEventListener(CMD_CHANGE_RACE,onChangeRaceEnd);
				if(evt.params.suc){
					userProp.race = race;
					//必须刷新下自己本机缓存的avatarInfo数据
					var avatarInfo:AvatarInfo = MainModelLocator.instance.retrieveModel(AvatarInfo) as AvatarInfo;
					var myUser:User = SSDataProxy(MainModelLocator.instance.retrieveModel(SSDataProxy)).currentUser;
					var avatarStr:String = UserVarGetter.getUserVar(myUser, UserVarKeys.Avatar);
					avatarInfo.setAvatarInfoWithString(avatarStr);
					
					var allClothes:Object = UserClothesData(MainModelLocator.instance.retrieveModel(UserClothesData)).getAllUserClothes();
					var userClothes:UserClothes;
					for each(userClothes in allClothes){
						if(userClothes.materialId == 1){
							continue;
						}
						if(avatarInfo.hasUseClothes(userClothes.materialId)){
							userClothes.usedUp = userClothes.usedUp + 1;
						}else{
							userClothes.usedUp = 0;
						}
					}
					
					callBack.apply();
				}else{
					throw new Error("转换种族失败！返回："+evt.params.suc);
				}
			}
			
			SocketClient.instance.addEventListener(CMD_CHANGE_RACE,onChangeRaceEnd);
			this.sendXtMessage(CMD_CHANGE_RACE,{"t":race.value});
		}
		
		private function onGetUserProperty(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(GETMYPROPERTY, onGetUserProperty);
			var userProp:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
			var props:Object = evt.params;
			UserPropertyBuilder.build(props, userProp);		
			
			var avatarInfo:AvatarInfo = MainModelLocator.instance.retrieveModel(AvatarInfo) as AvatarInfo;
			if(avatarInfo)
			{
				avatarInfo.setDefaultClothesBySex(userProp.sex == Sex.MALE);
			}
			super.onDataInited();
		}
		
		//属性改变如果导致等级提升将对外抛出升级事件
		private function onAttrChange(evt:SocketClientEvent):void
		{
			var userProp:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
			
			var preLevel:int = userProp.featherAge;
			
			userProp.morality = evt.params.moral;
			userProp.intelligence = evt.params.intellect;
			userProp.agility = evt.params.agility;
			userProp.strength = evt.params.strength;
			userProp.stamina = evt.params.stamina;
			
			var newLevel:int = userProp.featherAge;
			if(newLevel > preLevel){
				UserPropertyClient.instance.dispatchEvent(new SocketClientEvent(onFeatherAgeLevelUp,{}));
			}
		}
		
		private function onEnergyChange(evt:SocketClientEvent):void
		{
			var userProp:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
			userProp.energy = evt.params.energy;
		}
		
		private function onHpMpUpdate(evt:SocketClientEvent):void
		{
			var user:User = evt.params.user;
			var changedVars:Array = evt.params.changedVars;
			
			if(!changedVars.hasOwnProperty(UserVarKeys.HpMp)){
				return;
			}
			
			if(user.getName() == UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName)
			{
				var userHpMp:UserHpMp = new UserHpMp(user.getVariable(UserVarKeys.HpMp));
				var userProp:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty) as UserProperty;
				userProp.hp = userHpMp.hp;
				userProp.maxHp = userHpMp.maxHp;
			}
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, params);
		}

	}
}