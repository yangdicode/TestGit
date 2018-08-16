package mmo.framework.model
{
	public interface IModelLocator
	{
		/**
		 * 负责model的存储,获取等管理
		 * 
		 * */
		function addModel(key:*, model:*):void;
		function removeModel(key:*):void;
		function retrieveModel(key:*):*;
		function hasModel(key:*):Boolean;
		function replaceModel(key:*, model:*):void;
	}
}