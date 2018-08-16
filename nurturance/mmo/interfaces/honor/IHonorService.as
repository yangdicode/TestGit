package mmo.interfaces.honor
{
	import flash.display.DisplayObject;
	
	import mmo.framework.domain.honor.Effort;
	import mmo.interfaces.IInitService;

	public interface IHonorService extends IInitService
	{
		/**
		 * 显示成就主面板 
		 */		
		function showHonorMainPanel(subName:String=null):void;
		
		/**
		 * 显示成就对比面板 
		 */
		function showComparePanel(otherUserEffortData:Object,otherUserEffortScore:int,otherUserName:String):void;
		
		/**
		 * 获取个人总成就点数
		 * @param callBack(totalScore)
		 */
		function getMyTotalEffortScore(callBack:Function):void;
			
		/**
		 *  获取他人成就数据
		 *  @param callBack(userEffortObj(userEffort),totalScore)
		 */
		function getUserEffortData(userName:String,callBack:Function):void;
		
		/**
		 * 获得某个称号需要获得的成就
		 */	
		function getBadgeEffort(badgeId:int):Effort;
		
		/**
		 * 根据成就获取用户称号(以最近获得排序)
		 * 必须获取过成就数据才行
		 */
		function getUserBadge():Array
			
		function getEffortIcon(iconId:int,width:Number,height:Number):DisplayObject;
		
		function getEffortData(effortId:int):Effort;
		
		/**
		 * @param badgeId
		 * @param callBack(icon:DisplayObject)
		 * @param check:是否检查拥有（配合后端工作）
		 * 
		 */		
		function getBadgeSceneIcon(badgeId:int, callBack:Function, userName:String = "", check:Boolean = true):void;
		
		/**
		 * 获取用户荣誉数据,不缓存，每次都要重新获取
		 * @param callBack(userHonorObj(userHonor))
		 */		
		function getUserRecord(callBack:Function):void;
		
		/**
		 * 获取用户成就数据
		 * @param callBack(userEffortObj(userEffort))
		 */	
		function getUserEffort(callBack:Function):void;
	}
}