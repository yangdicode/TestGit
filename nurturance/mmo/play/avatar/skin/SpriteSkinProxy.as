package mmo.play.avatar.skin
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.avatar.ActionInfo;
	import mmo.play.avatar.SkinInfo;
	import mmo.play.avatar.skin.ISkinProxy;
	import mmo.play.avatar.skin.displayer.FrameData;
	import mmo.play.avatar.skin.displayer.SkinDisplayer;
	import mmo.play.material.clothes.ClothesPart;

	/**
	 * 暂时只能用于骑宠。
	 * 本来FrameData自成一套，维持同一个视图元件source，只对外提供bitmapData，在这种机制下FrameData很好地缓存了位图和为外界提供视图的位图。
	 * 但是在本类中直接使用FrameData中的source，而且是直接调用addChild方法，以致共用source的所有SkinProxy都会互相影响
	 * 所以本类中另外写了一套恶心的下载保存机制。 
	 * @author p-yangzhanxin
	 * 
	 */	
	public class SpriteSkinProxy extends SkinProxy implements ISkinProxy
	{
		public function SpriteSkinProxy(clothesPart:ClothesPart, skinInfo:SkinInfo)
		{
			super(clothesPart, skinInfo);
		}

		override public function loadSkin(isPriority:Boolean = false):void
		{
			var fileName:String = _clothesPartsData.fileName;
			var filePath:String = _clothesPartsData.filePath + fileName;
			var fileClassName = fileName + "_C";
			ResScheduler.getResource(filePath, onSkinLoaded, fileClassName, null, null, ResPriority.LOW, false, ResStorageType.TEMPORARY);
		}
		
		override protected function initSkin():void
		{
			_displayObject = new Sprite();
			_displayObject.name = this._clothesPartsData.clothesNo;
		}		
		
		override protected function refreshSkin():void
		{
			clearSkin();
			var frameData:FrameData = getCurrFrameData();
			var img:DisplayObject = frameData.source;
			img.x = 0;
			img.y = 0;
			Sprite(_displayObject).addChild(img);
		}
		
		/**
		 * 清除当前图片
		 */
		override protected function clearSkin():void
		{
			if(_displayObject == null){
				return;
			}
			var sp:Sprite = _displayObject as Sprite;
//			trace(this + sp);
			while(sp.numChildren > 0)
			{
				sp.removeChildAt(0);
			}	
		}
		
		override public function dispose():void
		{
			ResScheduler.cancel(_clothesPartsData.filePath + _clothesPartsData.fileName, onSkinLoaded);
			DisplayUtil.stop(_displayObject);
			super.dispose();
		}
		
		private function onSkinLoaded(content:Sprite):void
		{
			if (_displayObject == null)
			{
				return;
			}
			_skinDisplayer = new SkinDisplayer(content, _clothesPartsData.clothesNo);
			setForceRefresh();
			dispatchLoadEvent();
		}
	}
}