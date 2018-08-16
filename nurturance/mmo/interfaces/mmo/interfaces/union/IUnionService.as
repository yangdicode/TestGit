package mmo.interfaces.union
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import mmo.framework.domain.union.info.UnionLogo;
	import mmo.interfaces.IInitService;
	
	public interface IUnionService extends IInitService
	{
		/**
		 * @param key -- params
		 * <br/>tryJoinUnion -- unionName
		 * <br/>tryInvite -- userName
		 * <br/>showTitle
		 * <br/>showDetail -- unionName
		 */	
		function execute(key:String, params:* = null):void;
		
		/** 奥雅联盟盛大开启 */
		function showCreatePanel():void;
		/** 我的联盟信息(0-联盟信息；1-联盟成员；2-联盟记录；3-历史荣誉) */
		function showMyUnionInfo(page:int = 0):void;
		/** 联盟详细信息 */
		function showUnionDetail(unionName:String):void;
		/** 联盟榜，明星榜。0：联盟榜；1：明星榜。 */	
		function showUnionTop(page:int = 0):void;
		/** 联盟logo */
		function getUnionLogo(logo:UnionLogo, width:Number = 0, height:Number = 0):DisplayObject;
		/** 联盟商店 */
		function showShop(page:int = 0):void;
		
		/** 根据公会名称进入公会，默认自己公会 **/
		function enterUnion(unionName:String = null):void;		
		/** 根据用户名称进入用户公会，默认自己公会 **/
		function enterUnionByUserName( userName:String = null ):void;
		/** 公会聊天面板 **/
		function showTalkPanel():void;
		/** 公会任务面板 **/
		function showTaskPanel( defaultIndex:int=0 ):void;
		/**公会签到 **/
		function showSigninPanel():void;
		/** 初始化HUD联盟信息，请不要重复调用 **/
		function initHUDMsgTips( mcView:MovieClip ):void;
		/** 联盟战面板 **/
		function showBattlePanel():void;
	}
}