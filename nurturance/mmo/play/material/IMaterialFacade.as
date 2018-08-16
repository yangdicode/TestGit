package mmo.play.material
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.play.material.visitor.MaterialFacadeVisitor;

	public interface IMaterialFacade extends IEventDispatcher
	{
		/**
		 * 物品类别 
		 */
		function get materialType():int;
		
		/**
		 * 获取物品信息
		 **/
		function getMaterialById(mid:int):Material;
		
		/**
		 * 获取用户物品信息
		 **/
		function getMyMaterialById(mid:int):UserMaterial;		
		
		/**
		 * 新增一个新的UserMaterial对象 
		 **/
		function addNewUserMaterial(materialId:int, quantity:int, useUp:int):void;
		
		/**
		 * 获取物品拥有数量
		 */		
		function getMyMaterialNum(materialId:int):int
		
		/**
		 * 判断用户是否拥有某件物品
		 * */
		function hasMaterial(materialId:int,num:int = 1):Boolean;
		
		/**
		 * 获得物品试图
		 * */
		function getView(mid:int):DisplayObject; 
		/**
		 * 获取物品图标
		 **/
		function getIcon(mid:int,width:Number = 0,height:Number = 0):DisplayObject;
		/**
		 * 接受各种特别的访问
		 * */ 
		function accept(materialVisitor:MaterialFacadeVisitor):*
	}
}