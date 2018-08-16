package mmo.framework.domain.market
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	
	public class MarketClient
	{
		private static const EXTENSIONS_ID:int = 27;
		private static const extensionName:String = "ShopExtension";
		
		public static const VBUY:String = "27_0";
		public static const BUY:String = "27_1";
		public static const BATCHBUY:String = "27_2";
		public static const SELL:String = "27_3";
		public static const BUY_LIMIT:String = "27_4";
		/**
		 * 新版本购买命令
		 */
		public static const BATCHBUYTWO:String = "27_41";
		public static const GET_LIMIT_GOODS_STATE:String = "27_5";
		
		public static const SET_SHOPING_CAR:String = "27_6";
		public static const GET_SHOPING_CAR:String = "27_7";
		
		public static const CMD_BUY_VIRTUAL_GOODS:String = "27_8";
		
		/**
		 * 购买雪奈尔商品
		 */
		public static const CMD_BUY_SHANEL_GOODS:String = "27_10";
		/**
		 * 单件雪奈尔商品信息
		 */
		public static const CMD_GET_SHANLE_GOODS_INFO:String = "27_11";
		/**
		 * 全部雪奈尔商品信息
		 * ret小于0, app服务出错
		 */
		public static const CMD_GET_SHANLE_ALL_GOODS_INFO:String = "27_12";
		/**
		 * 用户预购信息
		 */
		public static const CMD_GET_USER_PRE_BUY:String = "27_13"; 
		public static const CMD_IS_PRE_BUY:String = "27_25"; 
		
		private static const CMD_GET_USER_NOBLE_PANEL_INFO:String = "27_16"; // 打开自己贵族信息面板
		private static const CMD_GET_OTHER_NOBLE_PANEL_INFO:String = "27_17"; // 其他用户贵族信息面板
		private static const CMD_SHANLE_SCORE_EXCHANGE:String = "27_22"; // 积分兑换
		private static const CMD_USE_PERFUME:String = "27_23"; // 使用香水
		private static const CMD_REMOVE_PERFUME:String = "27_24";
		
		public function MarketClient()
		{
		}
		
		/**
		 * 商城购买新命令，所有不添加物品的走这条路线：清cd，购买TempPropInt等
		 */	
		public static function buyVGoods(goodsId:int, num:int):void
		{
			var params:Object = {"gid":goodsId, "num":num};
			sendXtMessage(VBUY, params);
		}
		
		/**
		 * 兼容以前的方法，所以加了个Static后缀 
		 * buyType:购买类型，详见BuyType
		 * params:根据buyType类型。
		 */		
		public static function buyAtStatic(goodsId:int, num:int, buyType:int = 0, buyParams:String = ""):void
		{
			var params:Object = {"gid":goodsId, "num":num, "buyparam":buyType + "_" + buyParams};
			sendXtMessage(BUY, params);
		}
		
		/**
			goodsCounts = [{"goodsId":id, "count":num}, ...];
			otherbuyParamObj为后端需要的其他参数
		*/
		public static function batchBuyTwoAtStatic(buyType:int,goodsCounts:Array,otherbuyParamObj:Object):void
		{
			var params:Object = {"buyType":buyType,"goodsCounts":goodsCounts,"buyParamObj":otherbuyParamObj};
			sendXtMessage(BATCHBUYTWO,params);
		}
		
		/**
		 * 兼容以前的方法，所以加了个Static后缀 
		 * buyType:购买类型，详见BuyType
		 * params:根据buyType类型。
		 */		
		public static function batchBuyAtStatic(goods:String, buyType:int = 0, buyParams:String = ""):void
		{
			var params:Object = {"gs":goods, "buyparam":buyType + "_" + buyParams};
			sendXtMessage(BATCHBUY, params);
		}
		
		public static function buyShanleGoods(goods:String, buyType:int=1, buyParams:String=""):void{
			sendXtMessage(CMD_BUY_SHANEL_GOODS, {"gs":goods, "bt":buyType, "bp":buyParams});
		}
		
		/**
		 * <del>废弃接口，不要再用了。</del>
		 * </br>请使用buyAtStatic 
		 */		
		public function buy(goodsId:int, num:int, buyType:int = 0, buyParams:String = ""):void
		{
			buyAtStatic(goodsId, num, buyType, buyParams);
		}
		
		/**
		 * <del>废弃接口，不要再用了。</del>
		 * </br>请使用batchBuyAtStatic 
		 */		
		public function batchBuy(goods:String):void
		{
			batchBuyAtStatic(goods);
		}
		
		/**
		 * @itemStr 1-1-1
		 */		
		public static function sell(itemStr:String):void
		{
			sendXtMessage(SELL, {"items":itemStr});
		}
		
		public static function buyLimitGoods(gid:int):void
		{
			sendXtMessage(BUY_LIMIT, {"gid":gid});
		}
		
		public static function getLimitGoodsState():void
		{
			sendXtMessage(GET_LIMIT_GOODS_STATE, {});
		}
		
		public static function getShopingCar():void{
			sendXtMessage(GET_SHOPING_CAR, {});
		}
		
		public static function setShopingCar(goodsStr:String):void{
			sendXtMessage(SET_SHOPING_CAR, {"gs":goodsStr});
		}
		/**
		 * 只提花扣钱，不干什么。
		 * 旧接口，请用 buyVGoods
		 */		
		public static function buyVirtualGoods(goodsId:int, num:int):void{
//			sendXtMessage(CMD_BUY_VIRTUAL_GOODS, {"gid":goodsId, "num":num});
			buyVGoods(goodsId, num);
		}
		
		public static function getSingleShanleGoodInfo(gid:int, callBack:Function = null):void{
			sendExtAndCallBack(CMD_GET_SHANLE_GOODS_INFO, {"gid":gid}, callBack);
		}
		
		public static function getAllShanleGoodInfo(callBack:Function = null):void{
			sendExtAndCallBack(CMD_GET_SHANLE_ALL_GOODS_INFO, {}, callBack);
		}
		
		/**
		 * 用户预购信息
		 */
		public static function getShanelPreBuyInfo(callBack:Function = null):void{
			sendExtAndCallBack(CMD_GET_USER_PRE_BUY, {}, callBack);
		}
		
		public static function getMyShanelInfo(callBack:Function):void{
			sendExtAndCallBack(CMD_GET_USER_NOBLE_PANEL_INFO, null, callBack);
		}
		
		public static function getOtherShanelInfo(userName:String, callBack:Function):void{
			sendExtAndCallBack(CMD_GET_OTHER_NOBLE_PANEL_INFO, {"un":userName}, callBack);
		}
		
		public static function usePerfume(gitemId:int, callBack:Function):void{
			sendExtAndCallBack(CMD_USE_PERFUME, {"fgid":gitemId}, callBack);
		}
		
		public static function removePerfume():void{
			sendExtAndCallBack(CMD_REMOVE_PERFUME);
		}
		
		public static function exchangeChanelScore(id:int, callBack:Function):void{
			sendExtAndCallBack(CMD_SHANLE_SCORE_EXCHANGE, {"id":id}, callBack);
		}
		
		public static function getPreBuyInfo(callBack:Function):void{
			sendExtAndCallBack(CMD_IS_PRE_BUY, null, callBack);
		}
		
		private static function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_ID, cmd, function(backParams:Object):void{
				if(callBack != null){
					callBack.apply(null, [backParams]);
				}
			}, params);
		}
		
		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, params);
		}
		
		private function compile():void
		{
			var buyType:BuyType;
			var marketCatalog:MarketCatalog;
			var page:RmbMarketPage;
		}
	}
}