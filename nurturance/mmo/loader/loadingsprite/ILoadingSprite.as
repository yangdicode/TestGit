package mmo.loader.loadingsprite {
	
	public interface ILoadingSprite {
		
		/**
		 * 设置进度
		 */
		function setProgress(progress:int):void;
		
		/**
		 * 设置加载信息
		 */
		function setLoadingText(text:String):void;
		
		/**
		 * 设置运营信息
		 */
		function setGameText(text:String):void;
		
		function dispose():void;
		
	}
	
	
}