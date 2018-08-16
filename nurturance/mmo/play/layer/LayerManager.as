package mmo.play.layer {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	
	import mmo.common.DisplayUtil;

	public class LayerManager {
		
		//~ constants ---------------------------------------------------------
		public static const BASE_LAYER:String = "BaseLayer";
		
		public static const FIGHTING_LAYER:String = "FightingLayer";
		
		public static const MOVIE_LAYER:String = "MovieLayer";
		
		private static const LAYER_SUB_COUNT:Object = {
			"BaseLayer":7, "FightingLayer":4, "MovieLayer":1
		};
		private static const LAYER_SUB_START_INDEX:Object = {
			"BaseLayer":0, "FightingLayer":7, "MovieLayer":11			
		};
		//~ static fields -----------------------------------------------------
		
		private static var _layers:Object = {};
		
		/** 当前激活的层次 */
		private static var _currentLayer:String = FIGHTING_LAYER;
		
		/** 持有被管理容器的引用 */
		private static var _container:Sprite;
		
		//~ fields ------------------------------------------------------------
		
		//~ public methods ----------------------------------------------------
		
		public function LayerManager() {
			super();
		}
		
		/**
		 * 获得被管理的视图容器
		 */
		public static function get container():Sprite {
			return _container;
		}
		
		public static function get stage():Stage{
			return _container.stage;
		}
		
		/**
		 * 初始化层次
		 */
		public static function init():void {
			LayerManager._container = new Sprite();
			
//			clearStage();
			
			_layers = {};
			initLayers(BASE_LAYER);
			initLayers(FIGHTING_LAYER);
			initLayers(MOVIE_LAYER);
			
			switchLayer(BASE_LAYER, HangUpLevel.DESTROY);
		}
		
		private static function initLayers(layerName:String):void {
			var layerInfo:LayerInfo = new LayerInfo();
			var subCount:int = LAYER_SUB_COUNT[layerName];
			for(var i:int = 0; i < subCount; i++) {
				var layer:Sprite = new Sprite();
				layerInfo.subLayers.push(layer);
			}
			_layers[layerName] = layerInfo;
		}
				
		/**
		 * 获得当前激活的层次
		 */
		public static function getCurrentLayer():String {
			return _currentLayer;
		}
		
		/**
		 * 用于弹出模态框
		 */		
		public static function getCurrentLayerTop():Sprite{
			switch(_currentLayer){
				case MOVIE_LAYER:
					return getMovieLayer();break;
				case FIGHTING_LAYER:
				case BASE_LAYER:
				default:return getBaseTop();
			}
		}
		
		/**
		 * 获取层的子层 
		 * @param layerName
		 * @return 
		 * 
		 */
		public static function getSubLayers(layerName:String):Array{
			return LayerInfo(_layers[layerName]).subLayers;
		}
		
		/**
		 * 获得BaseSceneLayer
		 */
		public static function getBaseScene():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_SCENE];
		}
		
		/**
		 * 获得BaseControlLayer
		 */
		public static function getBaseControl():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_CONTROL];
		}
		
		/**
		 * 获得BaseIconsLayer
		 */
		public static function getBaseIcons():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_ICONS];
		}
		
		/**
		 * 获得BaseAppsLayer
		 */
		public static function getBaseApp():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_APPS];
		}
		
		/**
		 * 获得BaseTipsLayer
		 */
		public static function getBaseTips():Sprite {
			var layer:Sprite = getSubLayers(BASE_LAYER)[Layers.BASE_TIPS] as Sprite;
			layer.mouseEnabled = false;
			return layer;
		}
		
		/**
		 * 获得BaseTopLayer
		 */
		public static function getBaseTop():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_TOP];
		}
		
		/**
		 * 获得BaseTaskTipsLayer
		 */		
		public static function getBaseTaskTips():Sprite {
			return getSubLayers(BASE_LAYER)[Layers.BASE_TaskTip];
		}
		
		/**
		 * 获得FightingSceneLayer
		 */
		public static function getFightingScene():Sprite {
			return getSubLayers(FIGHTING_LAYER)[Layers.FIGHTING_SCENE];
		}
		
		/**
		 * 获得FightingControlLayer
		 */
		public static function getFightingControl():Sprite {
			return getSubLayers(FIGHTING_LAYER)[Layers.FIGHTING_CONTROL];
		}
		
		/**
		 * 获得FightingTips
		 */
		public static function getFightingTips():Sprite {
			var tipsLayer:Sprite = getSubLayers(FIGHTING_LAYER)[Layers.FIGHTING_TIPS];
			tipsLayer.mouseEnabled = false;
			return tipsLayer;
		}
		
		/**
		 * 获得FightingTopLayer
		 */
		public static function getFightingTop():Sprite {
			return getSubLayers(FIGHTING_LAYER)[Layers.FIGHTING_TOP];
		}
		
		public static function getMovieLayer():Sprite{
			return getSubLayers(MOVIE_LAYER)[Layers.MOVIE_PLAY];
		}
		
		/**
		 * 交换激活的层次
		 * 
		 * @param	layer			被激活的层次，若该层次属于基本层次，则激活基本层次，
		 * 							若该层次属于战斗层次，则激活战斗层次
		 * @param	hangUpLevel		被挂起的层次的停止级别，与进程挂起的概念类似~~
		 * 							HangUpLevel.HIDE=隐藏层次
		 * 							HangUpLevel.REMOVE=从显示列表移除层次
		 * 							HangUpLevel.DESTROY=从显示列表移除，并销毁层次
		 * 						
		 */
		public static function switchLayer(layerName:String, hangUpLevel:int = 0):void {
			// 不需要层次切换
			if(layerName == _currentLayer) {
				return;
			}
			// 确定当前激活的层次
			var currentLayer:LayerInfo = _layers[_currentLayer];
			var currentSubLayers:Array = currentLayer.subLayers;
			trace("--------switchLayer layer: "+ layerName);
			var i:int, len:int
			// 挂起当前层次
			if(hangUpLevel == HangUpLevel.HIDE) {
				for(i = 0, len = currentSubLayers.length; i < len; i++) {
					EventDispatcher(currentSubLayers[i]).dispatchEvent(new LayerEvent(LayerEvent.HIDE));
					
					DisplayObject(currentSubLayers[i]).visible = false;
					DisplayObject(currentSubLayers[i]).y = 1000;
				}
			}
			else if(hangUpLevel == HangUpLevel.REMOVE) {
				for(i = 0, len = currentSubLayers.length; i < len; i++) {
					EventDispatcher(currentSubLayers[i]).dispatchEvent(new LayerEvent(LayerEvent.REMOVE));
					
					// 仅从显示列表移除，可能存在未停止的动画
					_container.removeChild(currentSubLayers[i]);
				}
			}
			else if(hangUpLevel == HangUpLevel.DESTROY) {
				for(i = 0, len = currentSubLayers.length; i < len; i++) {
					EventDispatcher(currentSubLayers[i]).dispatchEvent(new LayerEvent(LayerEvent.DESTROY));
					
					// 停止该层次所有动画，并从显示列表移除
					DisplayUtil.stopAndRemove(currentSubLayers[i]);
				}
				
				initLayers(_currentLayer);
			}
			currentLayer.hangUpLevel = hangUpLevel;
			
			// 确定将要被激活的层次
			var newLayer:LayerInfo = _layers[layerName]
			var newLayerArr:Array = newLayer.subLayers;
			trace("----- currentHangUpLevel: " + newLayer.hangUpLevel);
			if(newLayer.hangUpLevel == HangUpLevel.HIDE) {
				for(i = 0, len = newLayerArr.length; i < len; i++) {
					DisplayObject(newLayerArr[i]).visible = true;
					DisplayObject(newLayerArr[i]).y = 0;
					trace("-------恢复坐标: " + i);
					EventDispatcher(newLayerArr[i]).dispatchEvent(new LayerEvent(LayerEvent.SHOW));
				}
			}
			else if(newLayer.hangUpLevel == HangUpLevel.REMOVE || newLayer.hangUpLevel == HangUpLevel.DESTROY) {
				for(i = 0, len = newLayerArr.length; i < len; i++) {
					var startIndex:int = LAYER_SUB_START_INDEX[layerName];
					var index = startIndex + i;
					if(index < _container.numChildren -1){
						_container.addChildAt(newLayerArr[i], index);
					}else{
						_container.addChild(newLayerArr[i]);
					}

					EventDispatcher(newLayerArr[i]).dispatchEvent(new LayerEvent(LayerEvent.ADD));
				}
			}
			
			newLayer.hangUpLevel = hangUpLevel;
			_currentLayer = layerName;
			
			_container.dispatchEvent(new LayerEvent(LayerEvent.ON_LAYER_CHANGE));
		}
		
		//~ private methods ---------------------------------------------------
//		
//		private static function clearStage():void {
//		}
	}
}