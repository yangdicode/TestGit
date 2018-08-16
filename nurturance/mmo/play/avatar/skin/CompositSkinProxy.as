package mmo.play.avatar.skin
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.avatar.SkinInfo;
	import mmo.play.avatar.SkinPosInfo;
	import mmo.play.avatar.skin.ISkinProxy;
	import mmo.play.material.clothes.ClothesPart;
	
	public class CompositSkinProxy extends EventDispatcher implements ISkinProxy
	{
		private var _skinProxies:Vector.<SkinProxy>;
		private var _displayObject:Sprite;
		private var _skinInfo:SkinInfo;
		private var _posNum:int;
		public function CompositSkinProxy(skinInfo:SkinInfo, posNum:int = SkinPosInfo.TOTAL)
		{
			_skinInfo = skinInfo;
			_posNum = posNum;
			_skinProxies = new Vector.<SkinProxy>(_posNum, true);
			_displayObject = new Sprite();
		}
		
		public function addSkinProxy(skinProxy:ISkinProxy, pos:int):void
		{
			var oldProxy:ISkinProxy = _skinProxies[pos];
			if(oldProxy != null)
			{
				oldProxy.removeEventListener(SkinProxyEvent.ONSKINLOADED, onSkinLoaded);
				oldProxy.dispose();
			}	
			_skinProxies[pos] = skinProxy;
			refreshDisplayObject();
		}	
		
		public function removeSkinProxy(skinProxy:ISkinProxy):void
		{
			for(var i:int = 0; i < _skinProxies.length; i++)
			{
				var sp:ISkinProxy = _skinProxies[i];
				if(sp == skinProxy)
				{
					sp.removeEventListener(SkinProxyEvent.ONSKINLOADED, onSkinLoaded);
					sp.dispose();
					_skinProxies[i] = null;
				}	
			}
		}	
		
		private function refreshObject():void
		{
			while(_displayObject.numChildren > 0)
			{
				_displayObject.removeChildAt(0);
			}	
			for(var i:int = _skinProxies.length - 1; i >= 0; i--)
			{
				var sp:ISkinProxy = _skinProxies[i];
				_displayObject.addChild(sp.displayObject);
			}	
		}	
		
		public function loadSkin():void
		{
			var count:int = 0;
			var sp:ISkinProxy;
			for(var i:int; i < _skinProxies.length; i++)
			{	
				sp = _skinProxies[i];
				if(sp != null)
				{
					count++;
				}	
			}
			var loadedCount:int = 0;
			for(var i:int; i < _skinProxies.length; i++)
			{	
				sp = _skinProxies[i];
				if(sp != null)
				{
					sp.addEventListener(SkinProxyEvent.ONSKINLOADED, onSkinLoaded);
					sp.loadSkin();
				}	
			}
			function onSkinLoaded(evt:SkinProxyEvent):void
			{
				loadedCount++;
				var target:ISkinProxy = evt.target as ISkinProxy;
				target.removeEventListener(SkinProxyEvent.ONSKINLOADED, onSkinLoaded);
				if(loadedCount == count)
				{
					dispatchLoadEvent();
				}	
			}	
		}
		
		private function dispatchLoadEvent():void
		{
			var event:SkinProxyEvent = new SkinProxyEvent(SkinProxyEvent.ONSKINLOADED);
			this.dispatchEvent(event);
		}	
		
		public function action(label:String):void
		{
			for(var i:int = _skinProxies.length - 1; i >= 0; i--)
			{
				var sp:ISkinProxy = _skinProxies[i];
				sp.action(label);
			}	
		}
		
		public function get skinInfo():SkinInfo
		{
			return _skinInfo;
		}
		
		public function get displayObject():DisplayObject
		{
			return _displayObject;
		}
		
		public function containSkin(skinNo:String):Boolean
		{
			return false;
		}
		
		public function dispose():void
		{
			for(var i:int = 0; i < _skinProxies.length; i++)
			{
				var sp:ISkinProxy = _skinProxies[i];
				if(sp != null)
				{
					sp.removeEventListener(SkinProxyEvent.ONSKINLOADED, onSkinLoaded);
					sp.dispose();
					_skinProxies[i] = null;
				}	
			}
		}
	}
}