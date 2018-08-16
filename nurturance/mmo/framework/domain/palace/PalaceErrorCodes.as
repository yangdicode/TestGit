package mmo.framework.domain.palace
{
	public class PalaceErrorCodes
	{
		public static const userHadCreatePalace:int = -1; //用户已经创建宫殿
		public static const palaceNameRepeat:int = -2; //已经存在宫殿名称
		public static const systemError:int = -3; //系统错误,请重新尝试
		public static const systemBusyError:int = -4; //系统繁忙,请稍后尝试
		public static const userReadyInPalace:int = -5;  //已经在宫殿
		public static const palaceFullMember:int = -6;  //宫殿满员
		public static const readyRequestJoin:int = -7;  //已经申请过加入了
		public static const palaceNotExist:int = -8; //宫殿不存在
		public static const userBePalaceMember:int = -9;  //用户已经是成员
		public static const userNotInPalace:int = -10;  //用户已经不在宫殿里
		public static const joinRequestNotExist:int = -11; //加入宫殿已不存在(可能被其他人处理了)
		public static const palaceRoleFull:int = -12; //职位人数已满
		public static const userRightLow:int = -13; //用户权利不足
		public static const requestJoinMaxTimes:int = -14; // 今天请求加入宫殿达到最大次数了
		public static const buyError:int = -15; //扣羽贝失败
		public static const duoduoIdNotExist:int = -16; //多多号不存在
		public static const keepsakeOverTime:int = -17; //申请加入的用户信物过期了
		public static const palaceOverdue:int = -18; //宫殿已过期
		public static const hongbaoNotExist:int = -19; // 红包不存在
		public static const hongbaoGrabOver:int = -20; // 红包余额被抢完了
		public static const hongbaoDailyGrabMax:int = -21; // 此类红包奖励已达到每日上限
		public static const readyGrabedHongBao:int = -22; // 已经抢过该红包了
		
		public static const ErrorTipsMap:Object = 
			{
				"-1":"你已经创建过宫殿了",
				"-2":"已经存在宫殿名称",
				"-3":"系统错误,请重新尝试",
				"-4":"系统繁忙,请重新尝试",
				"-5":"已经在宫殿",
				"-6":"宫殿已经满员",
				"-7":"已经申请过加入了",
				"-8":"宫殿不存在",
				"-9":"用户已经是成员",
				"-10":"你已经不属于宫殿里的一员了",
				"-11":"加入宫殿已不存在了",
				"-12":"精英人数已达上限！",
				"-13":"用户权利不足",
				"-14":"每天只能申请5个宫殿哦！",
				"-15":"扣羽贝失败",
				"-16":"你查找的多多号不存在哦~",
				"-17":"申请加入的用户信物过期了",
				"-18":"该宫殿已过期",
				"-19":"红包不存在",
				"-20":"红包余额被抢完了",
				"-21":"此类红包奖励已达到每日上限",
				"-22":"同1个福袋，每个成员只能抢1次哦！"
			};
		
		public function PalaceErrorCodes()
		{
		}
		
		public static function getErrorTips(code:int):String
		{
			var tips:String = "";
			if (ErrorTipsMap.hasOwnProperty(code))
			{
				tips = ErrorTipsMap[code];
			}
			else
			{
				tips = "系统错误，请重新尝试，错误码：" + code;
			}
			return tips;
		}
	}
}