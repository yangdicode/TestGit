package mmo.framework.domain.mooncake
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class MoonCakeClient
	{
		private static const extName:String = "MoonCakeTmpExtension";
		
		public static const cmdAddMoonCakeDonation:String = "53_1";
		public static const cmdChangeMoonCake:String = "53_2";
		public static const cmdDonateMoonCake:String = "53_3";
		public static const cmdViewTop:String = "53_4";
		public static const cmdGetMoonCakeState:String = "53_5";
		
		public static const cmdGetMoonFightNum:String = "53_6";
		public static const cmdAddMoonFightNum:String = "53_7";
		
		public static const cmdFlowerLanternMoonCake:String = "53_8";
		public static const cmdRewardZhenXinMC:String = "53_9";
		
		private static var _instance:MoonCakeClient;
		
		public var moonCakeParams:Object;
		
		public const MaxFightNum:int = 30;
		private var curFightNum:int = -1;
		
		public function MoonCakeClient()
		{
		}
		
		public static function get instance():MoonCakeClient
		{
			if (_instance == null)
			{
				_instance = new MoonCakeClient();
			}
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extName, cmd, params);
		}
		
		/**
		 * 用月饼馅兑换同心月饼
		 */		
		public function addMoonCakeDonation(num:int):void
		{
			this.sendXtMessage(cmdAddMoonCakeDonation,{"n":num});
		}
		
		/**
		 * 同心月饼兑换礼物
		 */		
		public function changeMoonCake(id:int):void
		{
			this.sendXtMessage(cmdChangeMoonCake,{"id":id});
		}
		
		/**
		 * 赠送同心月饼给好友
		 */
		public function donateMoonCake(name:String,num:int = 1):void
		{
			this.sendXtMessage(cmdDonateMoonCake,{"nm":name,"n":num});
		}
		
		/**
		 * 获取收取同心月饼的排行
		 */		
		public function getViewTop(fromIndex:int,limitNum:int):void
		{
			this.sendXtMessage(cmdViewTop,{"fi":fromIndex,"lmt":limitNum});
		}
		
		/**
		 * 获取同心月饼数量 
		 * @param callBack(params{total,left,donation});
		 */
		public function getMoonCakeState(callBack:Function,needReGet:Boolean = false):void
		{
			var onGetCakeState:Function = function(evt:SocketClientEvent):void
			{
				SocketClient.instance.removeEventListener(cmdGetMoonCakeState,onGetCakeState);
				var params:Object = new Object();
				params["total"] = evt.params.total;
				params["left"] = evt.params.left;
				params["donation"] = evt.params.donation;
				moonCakeParams = params;
				callBack.apply(null,[params]);
			}
			
			if(!needReGet && moonCakeParams != null){
				callBack.apply(null,[moonCakeParams]);
				return;
			}
			
			SocketClient.instance.addEventListener(cmdGetMoonCakeState,onGetCakeState);
			this.sendXtMessage(cmdGetMoonCakeState,{});
		}
		
		/**
		 * 更新可以赠送给其他人的月饼数的缓存
		 */
		public function setDonateCakeClient(changeNum:int):void
		{
			if(moonCakeParams == null){
				return;
			}
			moonCakeParams["donation"] += changeNum;
		}
		
		/**
		 * 更新剩余可兑换的月饼数
		 */
		public function setLeftCakeClient(changeNum:int):void
		{
			if(moonCakeParams == null){
				return;
			}
			moonCakeParams["left"] += changeNum;
		}
		
		/**
		 * 获取战胜兔子的次数
		 * @param callBack(fightNum);
		 */			
		public function getMoonFightTime(callBack:Function):void
		{
			var onGetMoonFight:Function = function(evt:SocketClientEvent):void
			{
				SocketClient.instance.removeEventListener(cmdGetMoonFightNum,onGetMoonFight);
				curFightNum = evt.params.fn;
				callBack.apply(null,[curFightNum]);
			}
			
			if(curFightNum != -1){
				callBack.apply(null,[curFightNum]);
				return;
			}
				
			SocketClient.instance.addEventListener(cmdGetMoonFightNum,onGetMoonFight);
			this.sendXtMessage(cmdGetMoonFightNum,{});
		}
		
		/**
		 * 获胜后添加战兔子的次数 
		 */		
		public function addMoonFightTime():void
		{
			if(this.curFightNum != -1){
				this.curFightNum ++;
			}
			this.sendXtMessage(cmdAddMoonFightNum,{});
		}
		
		public function getFlowerLanternMoonCake():void
		{
			this.sendXtMessage(cmdFlowerLanternMoonCake, {});
		}
		
		/**
		 * 每天领取20真心月饼 
		 */		
		public function rewardZhenXinMC():void
		{
			this.sendXtMessage(cmdRewardZhenXinMC,{});
		}
	}
}