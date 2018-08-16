package mmo.play.avatar.skin
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import mmo.interfaces.IDispose;
	import mmo.play.avatar.ActionInfo;
	import mmo.play.avatar.SkinInfo;
	import mmo.play.avatar.skin.displayer.FrameData;
	import mmo.play.avatar.skin.displayer.SkinDisplayer;
	import mmo.play.avatar.skin.displayer.SkinDisplayerCache;
	import mmo.play.material.clothes.ClothesPart;
	
	public class SkinProxy extends EventDispatcher implements ISkinProxy
	{
		public function SkinProxy(clothesPart:ClothesPart, info:SkinInfo)
		{
			this._info = info;
			this._clothesPartsData = clothesPart;
			this._actionMap = new Dictionary();
			for (var i:int = 0, actLen:int = this._info.actionInfo.length; i < actLen; i++)
			{
				var act:ActionInfo = this._info.actionInfo[i];
				this._actionMap[act.action] = act;
			}
			initSkin();
		}
		
		public function loadSkin(isPriority:Boolean = false):void
		{
			SkinDisplayerCache.instance.useSkinDisplayer(_clothesPartsData,onGetSkin,isPriority);
		}
		
		private function onGetSkin(skinDisplayer:SkinDisplayer):void
		{
			if(skinDisplayer == null)
			{
				dispatchLoadEvent();
				return;
			}	
			//如果已经dispose了就返回
			if(_displayObject == null)
			{
				dispatchLoadEvent();
				return;
			}
			_skinDisplayer = skinDisplayer;
			setForceRefresh();
			dispatchLoadEvent();
		}
		
		final protected function dispatchLoadEvent():void
		{
			var event:SkinProxyEvent = new SkinProxyEvent(SkinProxyEvent.ONSKINLOADED);
			event.skinNo = _clothesPartsData.clothesNo;
			this.dispatchEvent(event);
		}
		
		final protected function setForceRefresh():void
		{
			_forceRefresh = true;
		}
		
		/**衣服图片管理器**/
		protected var _skinDisplayer:SkinDisplayer;
		/** 动作名称与序号对应表 */
		private var _actionMap:Dictionary;
		
		/** 显示的视图 */
		private var _bitmap:Bitmap;
		
		protected var _clothesPartsData:ClothesPart;
		/** 当前动作帧 */
		private var _currentActionFrame:int;
		
		/** 当前动作信息 */
		private var _currentActionInfo:ActionInfo;
		
		/** 视图容器 */
		protected var _displayObject:DisplayObject;
		
		/** 帧延时计数器 */
		private var _frameDelayCnt:int;
		
		private var _info:SkinInfo;
		/**强制刷新**/
		private var _forceRefresh:Boolean;
		/**
		 * 跳转到指定动作
		 *
		 * @param	action	动作标识符 或 动作序号
		 */
		public function action(action:String):void
		{
			var actInfo:ActionInfo = this._actionMap[action];
			if (actInfo == null)
			{
//				clearSkin();
				return;
			}
			
			this._currentActionInfo = actInfo;
			this._currentActionFrame = 0;
			this._frameDelayCnt = 0;
			setForceRefresh();
			if(!_displayObject.hasEventListener(Event.ENTER_FRAME))
			{	
				this._displayObject.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
			onEnterFrame(null);
		}
		
		public function isSkin(skinNo:String):Boolean
		{
			return _clothesPartsData.clothesNo == skinNo;
		}	
		
		public function get displayObject():DisplayObject
		{
			return this._displayObject;
		}
		
		public function dispose():void
		{
			clearSkin();
			if (this._displayObject != null)
			{
				this._displayObject.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				this._displayObject = null;
			}
			
			this._actionMap = null;
			
			this._currentActionInfo = null;
			SkinDisplayerCache.instance.unUseSkinDisplayer(this._clothesPartsData, onGetSkin);
			_skinDisplayer = null;
		}
		
		public function get skinInfo():SkinInfo
		{
			return this._info;
		}
		
		protected function initSkin():void
		{
			this._bitmap = new Bitmap();
			
			this._displayObject = this._bitmap;
			this._displayObject.name = this._clothesPartsData.clothesNo;
		}		
		
		protected function refreshSkin():void
		{
			var frameData:FrameData = this.getCurrFrameData();
			this._bitmap.bitmapData = frameData.bitmapData;
			this._bitmap.x = frameData.rect.x;
			this._bitmap.y = frameData.rect.y;	
		}
		
		/**
		 * 清除当前图片
		 */
		protected function clearSkin():void
		{
			if(_bitmap != null)
			{	
				this._bitmap.bitmapData = FrameData.emptyFrameData.bitmapData;
			}
		}
		
		protected function getCurrFrameData():FrameData
		{
			var frame:int = this._currentActionFrame;			
			var row:int = this._currentActionInfo.row;
			var col:int = this._currentActionFrame;
			if(this._skinDisplayer == null)
			{
				return FrameData.emptyFrameData;
			}	
			var frameData:FrameData = this._skinDisplayer.getFrameData(row, col);
			if(frameData == null)
			{
				throw new Error("clothesNo: " + this._clothesPartsData.clothesNo +" image "+row+"_"+col+" was not found!");
			}	
			return frameData;
		}
		
		/**
		 * 每帧切换图片
		 */
		private function onEnterFrame(e:Event):void
		{
			var delay:int = _currentActionInfo.getFrameDelay(_currentActionFrame);
			var needRefresh:Boolean = false;
			if(_frameDelayCnt == delay)
			{	
				var nextFrame:int = _currentActionInfo.getNextFrame(_currentActionFrame);	
				if(nextFrame != _currentActionFrame)
				{
					needRefresh = true;
				}	
				_currentActionFrame = nextFrame;
				_frameDelayCnt = 0;
			}
			if(needRefresh || _forceRefresh)
			{	
				refreshSkin();
				_forceRefresh = false;
			}
			_frameDelayCnt++;
		}
		
		
	}
}