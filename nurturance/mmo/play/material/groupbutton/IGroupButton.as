package mmo.play.material.groupbutton
{
	import flash.events.IEventDispatcher;

	public interface IGroupButton extends IEventDispatcher
	{
		/**
		 * 选中状态 
		 * @param value
		 */			
		function set selected(value:Boolean):void;
		function get selected():Boolean;
		/**
		 *父按钮被选中或不选中的影响 
		 */		
		function set parentSelected(value:Boolean):void;
		/**
		 * @return 
		 * 该按纽所代表的数据
		 */		
		function get data():Array;
		/**
		 * 
		 * 
		 */		
		function dispose():void;
		/**
		 * 
		 * @return 
		 * 找到被选中的按纽 ,如果没有就返回 null
		 */		
		function findSelectedButton():IGroupButton;
		
		/*********************华丽分割线***********************/
		function addSubButton(ig:IGroupButton):void;
		function get subButtons():Array;
	}
}