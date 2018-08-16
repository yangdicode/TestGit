package mmo.framework.domain.halos
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;

	public class HalosClient
	{
		public static const CMD_GET_USER_ALL_HALOSES:String = "97_0";//查询用户所有光环		
		public static const CMD_MAKE_HALOS:String = "97_1";//打造光环		
		public static const CMD_EQUIP_HALOS:String = "97_2";//装备上光环
		public static const CMD_UNEQUIP_HALOS:String = "97_3";//卸下光环
		public static const CMD_RECHARGE_HALOS:String = "97_4";//续费光环
		
		public static const EVT_ADD_NEW_HALOS:String = "97_e1"; //监听后端推送增加新的光环
		
		private static const EXTENSION_ID:int = 97;
		
		public function HalosClient()
		{
		}
		
		private function compile():void{
			Halo;
			HaloColor;
			HaloFrame;
			HaloLightInfo;
			UserHaloDefine;
			Halos;
			HaloSellItemDefine;
		}
		
		/**  发命令的包装  **/
		public static function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{
			
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSION_ID, cmd, function(backParams:Object):void{
				
				if(callBack != null){
					callBack.apply(null, [backParams]);
				}
			}, params);
		}
		
		/**
		 *	 查询用户所有光环
		 * @param userName 用户名
		 * @param callBack 回调，参数：params:Object
		 * 后端返回：
		 * 		halos Object[]  (光环数组)
				{ 
				    {  
				        haloNumber 1 (用户的光环序号)
			            style 1  (底座样式, 值为1,2....)
			            color 0 
			            mainDecoration 0 （主装饰，0表示没有）
			            sideDecoration 0   (边装饰，0表示没有)
			            availableHours 2147483647 (光环有效时间，int类型)
			            remainSecs 9.22337203685478E+18 （光环剩余时间secs，long类型）
			            putOnTime 0（装备时间，0表示未装备过，long类型）
			            expireDate 0 (到期时间，long类型，0表示永久)
			            buyTime 1400144841000（购买光环时间，long类型）
				    } 
				   {  
				        haloNumber 2
				        style 1  
				         ......    
				    } 
				} 
		 */		
		public static function getUserAllhaloses(userName:String, callBack:Function):void{
			sendExtAndCallBack(CMD_GET_USER_ALL_HALOSES, {"userName":userName}, callBack);
		}
		
		
		/**
		 *	 打造光环	
		 * @param styleIndex 底座样式, 值为1,2....
		 * @param colorIndex 颜色，传0或不传该参数表示没有颜色，正常值为1,2....
		 * @param mainDecorationindex 主装饰，传0或不传该参数表示没有，正常值为1,2....
		 * @param sideDecorationIndex 边装饰，传0或不传该参数表示没有，正常值为1,2....
		 * @param vouchers 代金券，"":表示没有代金劵，格式为：代金券GItemId-数量，多种代金券用逗号隔开，如"2670-1,2671-2"）
		 * @param callBack 回调，参数：params:Object
		 *  后端返回：suc True
		 */		
		public static function makeHalos(styleIndex:int, colorIndex:int, mainDecorationindex:int, sideDecorationIndex:int, callBack:Function, vouchers:String = ""):void{
			sendExtAndCallBack(CMD_MAKE_HALOS, {"style":styleIndex, "color":colorIndex, "mainDecoration":mainDecorationindex, "sideDecoration":sideDecorationIndex, "vouchers":vouchers}, callBack);
		}
		
		/**
		 *	装备上光环 
		 * @param haloNumber 用户的光环序号
		 * @param callBack 回调，参数：params:Object
		 *  后端返回：suc True
		 */		
		public static function equipHalos( haloNumber:int, callBack:Function):void{
			sendExtAndCallBack(CMD_EQUIP_HALOS, {"haloNumber":haloNumber}, callBack);
		}
		
		/**
		 *	 卸下光环
		 * @param callBack 回调，参数：params:Object
		 *  后端返回：suc True
		 * 
		 */		
		public static function unEquipHalos( callBack:Function):void{
			sendExtAndCallBack(CMD_UNEQUIP_HALOS, null, callBack);
		}
		
		/**
		 *	续费光环 
		 * @param haloNumber用户的光环序号
		 * @param callBack 回调，参数：params:Object
		 *  后端返回：suc True
		 */		
		public static function rechargeHalos(haloNumber:int, callBack:Function):void{
			sendExtAndCallBack(CMD_RECHARGE_HALOS, {"haloNumber":haloNumber}, callBack);
		}		
		
		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessageByExtId(EXTENSION_ID, cmd, params);
		}
		
	}
}