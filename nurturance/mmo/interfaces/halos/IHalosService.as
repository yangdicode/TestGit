package mmo.interfaces.halos
{
	import flash.display.InteractiveObject;
	
	import mmo.framework.domain.halos.UserHaloDefine;
	import mmo.interfaces.IInitService;
	
	public interface IHalosService extends IInitService
	{
		/** 制造光环，弹出制造光环的面板 **/
		function makeHalos(halosBaseId:int, colorId:int=1, mainFrameId:int=0, sideFrameId:int=0, callBack:Function = null):void;
		
		/**
		 *	制造光环，直接发给后端，不弹制造面板, 但有二次确认面板
		 * @param callBackFunc 回调，制造成功后调用
		 * @param haloBaseId 光环底环id
		 * @param colorId 默认为颜色编号1
		 * @param mainFrameId 主边框id，0为没主边框
		 * @param sideFrameId 外边框id，0为没外边框
		 * 
		 */		
		function tryMakeHalo( callBackFunc:Function, haloBaseId:int, colorId:int=1, mainFrameId:int=0, sideFrameId:int=0 ):void;
		
		/**
		 *	制造光环 (折扣劵)，直接发给后端，不弹制造面板 , 但有二次确认面板, 二次确认面板上提供使用折扣劵功能
		 * @param callBackFunc 回调，制造成功后调用
		 * @param haloBaseId 光环底环id
		 * @param colorId 默认为颜色编号1
		 * @param mainFrameId 主边框id，0为没主边框
		 * @param sideFrameId 外边框id，0为没外边框
		 * 
		 */		
		function tryMakeHaloWithVoucher( callBackFunc:Function, haloBaseId:int, colorId:int=1, mainFrameId:int=0, sideFrameId:int=0 ):void;
			
		
		/** 所有光环，类型为 UserHaloDefine **/
		function getAllHalos():Array;
		
		/** 拥有光环数目 **/
		function getMyHalosNumber():int;
		
		/** 是否拥有某个底环的光环 **/
		function hasHalos(halosBaseId:int):Boolean;
		
		function addUserHaloTips(target:InteractiveObject, userHalo:UserHaloDefine):void;
		
		function get myUsingHalo():UserHaloDefine;
		
		/** 续费  **/
		function rechargeHalo(userHaloId:int):void;
		
		/** 装上、卸下 **/
		function tryEquip(userHalo:UserHaloDefine, equip:Boolean):void;
		
	}
}