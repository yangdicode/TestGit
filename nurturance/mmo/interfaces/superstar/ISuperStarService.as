package mmo.interfaces.superstar
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface ISuperStarService extends IDownloadInitService
	{
		/**
		 * 不能直接调用，请用SuperStarFacade.enterSuperStar();
		 */		
		function showMainPanel():void;
		
		/**
		 * 显示星团
		 */
		function showStarTeam(userName:String=null):void;
		
		/**
		 * 明星默认服装，显示获得明星用
		 */		
		function showGetStarPanel(sids:Array, closeCall:Function):void;
		
		function tryShowMyStarTeam():Boolean;
		function hasCorps():Boolean;
		
		/**
		 * 星力排行榜
		 */		
		function showTops():void;
		
		/**
		 * pk排行榜
		 */		
		function showPKTops():void;
		
		function hasStarGoods(goodsId:int):Boolean;
		function hasStar(sid:int):Boolean;
		
		/**
		 * @return 星团等级
		 */		
		function get cropsLevel():int;
		
		/**
		 * 巨星封面
		 */		
		function showCover():void;
		
		/**
		 * 星梦舞台
		 */		
		function showPKMain():void;
		
		/**
		 * pk奖励
		 */		
		function showPKBonus():void;
		
		/**
		 * pk说明
		 */		
		function showPKHelp():void;
		
		/**
		 * pk第一名
		 */		
		function showBrokerResult():void;
	}
}