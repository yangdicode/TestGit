package mmo.framework.domain.unknown
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.domain.top.TopInfo;

	public class UnknownClient
	{	
		public static const EXTENSIONS_ID:int = 81;	
		/** 猫 **/
		public static const CMD_TAKE_TODAY_CANDOACTIVITY_INFO:String = "81_1";// 
		/** 排行榜信息 **/
		public static const CMD_VIEW_TOP:String = "81_2";// 
		/** 个人排行榜排名 **/
		public static const CMD_GET_TOP_RANKING:String = "81_3";// 
		/** 获取投票信息 **/
		public static const CMD_GET_VOTE_STATUS:String = "81_4";// 
		/** 增加运营活动代币（仅限一种） **/
		public static const CMD_TAKE_TEMP_ITEM_BONUS:String = "81_5";// 

		//public static const CMD_GET_MC_COUNT:String = "81_6";// 取mc值
		public static const CMD_GET_TIME_START_FROM_MC:String = "81_7";// 取某写运营活动开始时间，批量去时间
		/** 一般运营活动命令,调用temp.xml **/
		public static const CMD_COMMON_GIFT:String = "81_8";// 
		/** 抽奖命令,调用lottery.xml **/
		public static const CMD_TAKE_LOTTER_BONUS:String = "81_9";// 

		/** 我要投票 **/
		public static const CMD_TAKE_VOTE:String = "81_10";// 

		public static const CMD_VIEW_YESTERDAY_TOP:String  = "81_11"; //取昨天排行榜和个人排名信息

		/**
		 * 设置消息盒子
		 */
		public static const CMD_SET_MSGBOX:String = "81_12";

		/**
		 * 获取消息盒子信息
		 */
		public static const CMD_GET_MSGBOX:String = "81_13";

		public static const CMD_GET_USER_UNLIMITED_ITEMS:String = "81_14"; //取用户那些无限数量的物品

		public static const CMD_GET_WEEKLY_DONE_COUNT_FROM_DB:String = "81_15"; //从数据库取出每周数据

		public static const CMD_GET_GOODS_PROP_IN:String = "81_17"; //记录商品购买次数

		public static const CMD_VIEW_TOP_LOG:String = "81_18"; //排行榜记录,数据存储在Top_Unchange

		public static const CMD_VIEW_TOP_LOG_RANKING:String = "81_19"; //排行榜记录中的个人排名,数据存储在Top_Unchange

		public static const CMD_MC_VIEWTOP:String = "81_21"; // 从MC中获取历史信息"伪排行榜"

		public static const CMD_GET_FULL_SERVICE_MC_COUNT:String = "81_33"; // 取全服类型MC

		//////////////////////////////////////////
		public static const EVT_USER_UNLIMITED_ITEMS_CHANGE:String = "81_e1"; //无限数量物品变更

		public static const EVT_ON_SET_TEMP_PROP_INT:String = "81_e2"; //TempPropInt 添加直接 设置事件 ！ 推的值是最终值


		public static const CMD_GET_GOODS_SOLD_COUNT:String = "81_36";


		//////////////////////////////////////

		public function UnknownClient()
		{
		}

		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessageByExtId(EXTENSIONS_ID, cmd, params);
		}
		//发命令的包装
		public static function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{

			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_ID, cmd, callBack, params);
		}

		/** 猫-todaywork **/
		public static function getTodayCandoActivityInfo():void
		{
			sendXtMessage(CMD_TAKE_TODAY_CANDOACTIVITY_INFO,{});
		}
		/** 旧方法：<del>排行榜信息</del> **/
		public static function viewTop(topName:String, o:int, l:int ):void{
			sendXtMessage(CMD_VIEW_TOP, {"name":topName, "o":o, "l":l});
		}		
		/**
		 * 取排行榜信息,带回调
		 * @param topName 排行榜的key， 问后台哥
		 * @param o 开始的名次，从0开始
		 * @param l 需要的长度数目
		 * @param callBack 返回参数params:Object
		 * </br>	后端返回 tops, 结构如下：
		 * </br>ao.putInt("rk", utInfo.rankIndex);名次，从0开始。 （显示的时候注意要手动+1）！！！！；
		 * </br>ao.putString("un", utInfo.userName);用户名
		 * </br>ao.putLong("score", utInfo.score);分数
		 * </br>ao.putLong("time", utInfo.time == null ? 0 : utInfo.time.getTime());上榜时间
		 * </br>ao.putString("ext", utInfo.ext);扩展字段用于各种YY需求
		 */		
		public static function viewTopCallBack(topName:String, o:int, l:int, callBack:Function = null):void{
			sendExtAndCallBack(CMD_VIEW_TOP, {"name":topName, "o":o, "l":l},callBack);
		}
		/**
		 * 取排行榜信息,带回调
		 * @param callBack [TopInfo]
		 */		
		public static function viewTopAndInit(topName:String, o:int, l:int, callBack:Function):void{
			viewTopCallBack(topName, o, l, onGetData);
			function onGetData(params:Object):void{
				var serverData:Array = params.tops;
				var topData:Array = [];
				var topInfo:TopInfo;
				var eachData:Object;
				for(var i:int = 0; i < serverData.length; i ++){
					eachData = serverData[i];
					topInfo = new TopInfo(eachData);
					topData.push(topInfo);
				}
				callBack.apply(null, [topData]);
			}
		}
		
		public static function viewTopAndInitSelf(topName:String, o:int, l:int, callBack:Function):void
		{
			viewTopCallBack(topName, o, l, onGetData);
			function onGetData(params:Object):void{
				var serverData:Array = params.tops;
				var len:int = serverData.length;
				var topData:Array = [];
				for(var i:int = 0; i < len; i ++){
					topData.push(new TopInfo(serverData[i]));
				}
				callBack.apply(null, [topData, new TopInfo(params.mine)]);
			}
		}

		/** 个人排行榜排名 **/
		public static function getTopRanking(topName:String):void{
			sendXtMessage(CMD_GET_TOP_RANKING, {"name":topName});
		}

		/**
		 *	个人排行榜排名,带回调
		 * @param topName 排行榜的key， 问后台哥
		 * @param callBack 返回参数 params:Object
		 * 后端返回 "ranking" 从1开始
		 */		
		public static function getMyTopRankingCallBack(topName:String, callBack:Function):void{

			sendExtAndCallBack(CMD_GET_TOP_RANKING, {"name":topName}, callBack);
		}


		/**
		 * 取昨天排行榜和个人排名信息
		 * 返回:ranking, 自己排名
		 *      tops, {"un","score","ranking"}
		 */		
		public static function handleViewYesterdayTop(name:String, length:int=1000):void
		{
			sendXtMessage(CMD_VIEW_YESTERDAY_TOP, {"name":name, "length":length});
		}
		/**
		 * 取昨天排行榜和个人排名信息  (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * 返回:ranking, 自己排名
		 *      tops, {"un","score","ranking"}
		 */		
		public static function handleViewYesterdayTopCallBack(name:String, length:int=1000,callBack:Function = null):void
		{
			sendExtAndCallBack(CMD_VIEW_YESTERDAY_TOP, {"name":name, "length":length},callBack);
		}

		/**
		 * 取上周排行榜记录中的个人排名,数据存储在Top_Unchange (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * 返回:ranking, 排名
		 */		
		public static function getMyLaskWeekTopLogRankingCallBack(name:String, callBack:Function = null):void
		{
			sendExtAndCallBack(CMD_VIEW_TOP_LOG_RANKING, {"name":name},callBack);
		}


		/**
		 *运营活动取单种代币用
		 * @param key 这个后端给
		 * @param num 代币数
		 *
		 * 返回 key 同上面的key
		 * 返回 ret 实际奖励数,如果返回值负数就是系统错误
		 */		
		public static function takeTempItemBonus(key:String, num:int):void{
			sendXtMessage(CMD_TAKE_TEMP_ITEM_BONUS, {"key":key, "num":num});
		}
		/**
		 *运营活动取单种代币用   (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * @param key 这个后端给
		 * @param num 代币数
		 *
		 * 返回 key 同上面的key
		 * 返回 ret 实际奖励数,如果返回值负数就是系统错误
		 */		
		public static function takeTempItemBonusCallBack(key:String, num:int,callBack:Function=null):void{
			sendExtAndCallBack(CMD_TAKE_TEMP_ITEM_BONUS, {"key":key, "num":num},callBack);
		}

		/**
		 * 去投票啦
		 *  @param strKey 问后台兄。
		 * @param index 投票的编号
		 * 后端返回 suc  true-成功
		 */		
		public static function takeVote(strKey:String,index:int,value:int=1):void
		{
			sendXtMessage(CMD_TAKE_VOTE,{"key":strKey,"vid":index, "num":value});
		}
		/**
		 * 去投票啦 (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 *  @param strKey 问后台兄。
		 * @param index 投票的编号
		 * 后端返回 suc  true-成功
		 */		
		public static function takeVoteCallBack(strKey:String,index:int, callBack:Function=null, value:int=1):void
		{
			sendExtAndCallBack(CMD_TAKE_VOTE,{"key":strKey,"vid":index, "num":value},callBack);
		}

		/**
		 *	获取投票的结果
		 *  @param strKey 问后台兄，目前的默认值是为了兼容旧版本。
		 * 后端返回数据参数："vote"
		 * 数据形式：index-num,index-num,index-num,.......
		 */				
		public static function getVoteStatus(strKey:String=""):void
		{
			sendXtMessage(CMD_GET_VOTE_STATUS,{"key":strKey});
		}
		/**
		 *	获取投票的结果  (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 *  @param strKey 问后台兄，目前的默认值是为了兼容旧版本。
		 * 后端返回数据参数："vote"
		 * 数据形式：index-num,index-num,index-num,.......
		 */				
		public static function getVoteStatusCallBack(strKey:String="", callBack:Function=null):void
		{
			sendExtAndCallBack(CMD_GET_VOTE_STATUS,{"key":strKey}, callBack);
		}

		/**
		 *	一般运营活动命令
		 * @param key 调用temp.xml
		 * 	后端返回 suc true-成功,false-失败
		 */		
		public static function getCommonGift(key:String):void
		{
			sendXtMessage(CMD_COMMON_GIFT, {"key":key});
		}
		/**
		 *	一般运营活动命令  (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * @param key 调用temp.xml
		 * 	后端返回 suc true-成功,false-失败
		 */		
		public static function getCommonGiftCallBack(key:String, callBack:Function=null):void
		{
			sendExtAndCallBack(CMD_COMMON_GIFT, {"key":key}, callBack);
		}

		/** 抽奖命令
		 * @param key请咨询后台哥,调用lottery.xml
		 * retrun key, ret为奖励的index（从0开始，-1为失败）
		 */
		public static function takeLotterBonus(key:String):void
		{
			sendXtMessage(CMD_TAKE_LOTTER_BONUS,{"key":key});
		}
		/** 抽奖命令  (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * @param key请咨询后台哥,调用lottery.xml
		 * retrun key, ret为奖励的index（从0开始，-1为失败）
		 */
		public static function takeLotterBonusCallBack(key:String, callBack:Function=null):void
		{
			sendExtAndCallBack(CMD_TAKE_LOTTER_BONUS,{"key":key},callBack);
		}

		/**
		 * 获取消息盒子信息
		 * keys  用","分隔
		 * 返回： msgs Array
		 *             key int
		 *             endtime int
		 *             count int
		 */
		public static function getMsgBoxInfo(keys:String):void{
			sendXtMessage(CMD_GET_MSGBOX, {"keys":keys});
		}

		/**
		 * 设置消息盒子
		 */
		public static function setMsgBox(key:int, cd:int, count:int):void{
			sendXtMessage(CMD_SET_MSGBOX, {"key":key, "cd":cd, "count":count});
		}

		public static function getUserUnlimitedItems():void
		{
			sendXtMessage(CMD_GET_USER_UNLIMITED_ITEMS, {});
		}

		/** 批量取cd时间(date，number)，可能是活动开始时间，也可能是cd到期时间，具体看后端业务怎么处理 (这内部没有屏蔽用户操作的，需要外部屏蔽，callBack返回参数params:Object)
		 * @param arrayKeys 活动的cdtime的key
		 * 后端返回 times，字符串。逗号","隔开
		 */
		public static function getCdTimeMutliFromMc(arrayKeys:Array, callBack:Function=null):void{
			sendExtAndCallBack(CMD_GET_TIME_START_FROM_MC,{"keys":arrayKeys},callBack);
		}

		/**
		 * 获取一些 一周数据 ，比较重要的。不存mc,放在数据库. 比如花钱购买次数什么的...
		 * keys 为字符串(逗号隔开)或者数组都可以
		 * 返回： values Array
		 *     数组元素：{key String, value int}
		 */
		public static function getWeeklyDoneCountFromDb(keys:*):void
		{
			var str:String;
			if (keys is Array)
			{
				str = Array(keys).join(",");
			}
			else
			{
				str = keys;
			}
			sendXtMessage(CMD_GET_WEEKLY_DONE_COUNT_FROM_DB, {"keys":str});
		}


		/**
		 *	获取商品被购买的次数 (内部没有屏蔽用户操作的，需要外部屏蔽)
		 * @param arrGoodsIds 商品id的数组
		 * @param callBack 回调，返回参数params:Object
		 * 后端返回参数为：values，数组类型
		 *
		 */		
		public static function getGoodsPropInCallBack(arrGoodsIds:Array, callBack:Function):void{
			sendExtAndCallBack(CMD_GET_GOODS_PROP_IN,{"goodsIds":arrGoodsIds},callBack);
		}

		/**
		 * 排行榜记录,数据存储在Top_Unchange
		 * @param rankName
		 * @param length
		 * @param callBack
		 * 	后端返回：
		 * <br/>1、"ranking"：自己的排名
		 * <br/>2、"tops":数据结构：{ "score" 0分数，"ranking" 29排名, "un" 用户名}
		 * */		
		public static function getUnchangeTop(rankName:String, length:int, callBack:Function):void{
			sendExtAndCallBack(CMD_VIEW_TOP_LOG, {"name":rankName, "length":length}, callBack);
		}

		public static function enterGame(gameName:String, callBack:Function):void{
			sendExtAndCallBack("81_22", {"game":gameName}, callBack);
		}

		public static function getCurPower(gameName:String, callBack:Function):void{
			sendExtAndCallBack("81_23", {"game":gameName}, callBack);
		}

		/**
		 *	伪排行榜
		 * @param topName
		 * @param callBack
		 * @param node
		 * 后端返回："top"，
		 * 	包含数据：{ "userId":用户id，没用的（int） ，"userName":用户名(str), "score":数据（int）}
		 */		
		public static function getMcTopInfo(topName:String, callBack:Function, node:String = "daily"):void{
			sendExtAndCallBack(CMD_MC_VIEWTOP, {"mcListKey":topName, "node":node}, callBack);
		}


		/**
		 * @param godIds 传入查询的数组
		 * @param callBack 返回的参数是（按照前端发过来数组的顺序）
		 *
		 */		
		public static function getGodSellNum(godIds:Array,callBack:Function):void{
			function socketCallBack(data:Object):void{
				var arr:Array = data.cs;
				callBack.call(null,[arr]);
			}
			sendExtAndCallBack(CMD_GET_GOODS_SOLD_COUNT, {"gs":godIds}, socketCallBack);
		}

	}
}

