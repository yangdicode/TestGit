package mmo.interfaces.util
{
	public interface ITips
	{
		/**
		 * 自定义Tips的回调函数，主要用于根据TipsManager传来的参数初始化Tips的视图
		 * @param params为TipsManager传来的参数
		 * 
		 */		
		function callBack(params:Object):void;
	}
}