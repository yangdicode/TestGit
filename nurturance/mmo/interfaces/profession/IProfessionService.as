package mmo.interfaces.profession
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import mmo.framework.domain.property.Sex;
	import mmo.interfaces.IInitService;
	import mmo.interfaces.IService;

	public interface IProfessionService extends IInitService
	{
		/**
		 * 获取用户曾经拥有的职业
		 */		
		function getUserEverPros():Array;
		
		/**
		 * 转职成为某职业
		 */
		function changeProfession(proId:int):void;
			
		/**
		 * 显示职业面板
		 */
		function showProLvUpPanel(newLv:int, needSG:int):void;
			
		/**
		 * 显示选择职业线路面板 
		 */		
		function showChooseProPanel():void;
		
		/**
		 * 换职业面版
		 */		
		function showChangeProPanel():void;
			
		/**
		 * 获得职业形象
		 * */	
		function getProfessionImage(proId:int, sex:Sex):DisplayObject;
		
		/**
		 * 获得职业小人像
		 * */	
		function getProSmallMan(proId:int, sex:Sex):DisplayObject;
		
		/**
		 * 设置转职限制Tips内容 
		 */		
		function setChangeProTip(tip:MovieClip,proId:int):void;
			
		/**
		 * 获取职业图标
		 * proId 为 0 时候，图标为问号
		 */		
		function getProIcon(proId:int,width:Number,height:Number):DisplayObject;
		
		/**
		 * 是否成为过某个职业
		 */		
		function hasPro(proId:int):Boolean;
			
		/**
		 * 获取曾经职业等级，没有成为返回0
		 */		
		function getEverProLevel(proId:int):int;
		/**
		 *	 所有职业最高的职业lv
		 *  */		
		function getUserMaxProLv():int;
		/**
		 *	 所有职业最高的职业等级的所有职业id（可能好几个职业都是最高等级了）
		 * @return 职业id的数组 
		 */		
		function getUserMaxProIds():Array;
		/**
		 * 获取用户登记职业Id
		 */	
		function getUserResPros():Array;
		
		/**
		 * 用户是否登记过某职业
		 */			
		function hasRegisterPro(proId:int):Boolean;
		
		/**
		 * 获取他人注册职业
		 * @return callBack(userResPros:Array 注册职业Id数组)
		 */
		function getOtherRegisterPro(userName:String,callBack:Function):void;
		
		/**
		 * 百变职业达人面板
		 */
		function showProMasterPanel():void;
		
		
		/**
		 * 变身职业 
		 */		
		function resetProfession(proId:int):void;
			
		/**
		 * 判断用户是否可以升级职业 
		 */		
		function checkUserProLvUp():Boolean;
			
		/**
		 *  拿职业升级道具
		 * @param typeId Id请参考ProfessionItemType
		 * @param callBack 回调函数，返回后自动传入结果suc
		 * 
		 */			
		function getProUpgradeItem(typeId:int, callBack:Function):void;
		
		/**
		 * 获取职业殿堂的后台数据 
		 * @param onGetData			回调，会传入返回的SocketClientEvent.params
		 */		
		function getProfessionTempleData(onGetData:Function):void;
		
		/**
		 * 获得职业殿堂的奖励 
		 * @param id			bossId
		 * @param lv			层数
		 * @param onGetBonus	获取奖励回调，传入suc
		 */		
		function getProfessionTempleBonus(id:int, lv:int, onGetBonus:Function):void;
		/**
		 * 使用职业殿堂收费点获取该职业殿堂的Buff 
		 * @param id			职业殿堂的 id
		 */		
		function payProfessionTempleBuff(id:int, onGetResult:Function):void;
		/**
		 * 取到登记过的职业中最高等级的等级数（用于根据最高职业等级数计算的相关功能）
		 * 
		 */	
		function getMyEverProsMaxLv():int;
		/**
		 * 升级武器
		 */		
		function lvUpWeaon(callBack:Function):void;
		/**
		 * 武器进化
		 */		
		function evoWeapon(callBack:Function):void;
		
		/**
		 *	购买精英殿堂挑战次数 
		 * @param id 精英殿堂id+10000
		 * @param onBuyTimesResult 回调。传入suc 
		 */		
		 function tryBuyEliteChallengeTimes(id:int,onBuyTimesResult:Function):void;
		 
		 /**
		  * 打开职业手册 
		  * 
		  */		 
		 function showProHandBook():void;
	}
}