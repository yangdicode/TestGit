package mmo.interfaces.activity
{
	import mmo.interfaces.IInitService;
	
	public interface IActivityService extends IInitService
	{
		/**
		 * 各种弹活动面板，活动撤销请及时清理 
		 * @param key 
		 * @param params
		 * 
		 */		
		function showPanel(key:String, params:* = null):void;
		/**
		 * 触发活动的某种操作，活动撤销请及时清理 
		 * @param key 
		 * @param params
		 * 
		 */	
		function doAction(key:String, params:* = null):void;
		/**
		 * 主要是用来拿到数据之类，活动撤销请及时清理 
		 * @param key 
		 * @param params
		 * 
		 */	
		function getObject(key:String, params:* = null):*;
		
		function executeConfigurationActivity(key:String, params:* = null):void;
		
	}
}