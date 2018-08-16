package mmo.play.helper
{
	/**
	 * 移动动画辅助类
	 * @author liyawei
	 */	

	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.dialog.ProgressLoader;
	import mmo.play.layer.LayerManager;
	import mmo.play.runner.EnterFrameRunner;

	public class MoveHelper
	{
		public var moveBool:Boolean;

		public function MoveHelper()
		{
			moveBool = true;
		}

		/**
		 * 多少帧数后处理函数
		 **/

		public function moveAfterFrame(dialogSprite:DisplayObject,frameNum:int,func:Function,funArgArray:Array = null):void
		{
			if(frameNum <= 0)
			{
				trace("传入的帧数为负数!");
				return;
			}
			this.startMove();
			var currentFrame:int = 0;

			var enterFuc:Function = function():void
			{
				currentFrame ++;
				if(currentFrame == frameNum)
				{
					EnterFrameRunner.instance.removeRunnable(enterFuc);
					if(moveBool)
					{
						func.apply(null,funArgArray);
					}
				}
			}

			EnterFrameRunner.instance.addRunnable(enterFuc);
		}

		public function stopMove():void
		{
			this.moveBool = false;
		}

		public function startMove():void
		{
			this.moveBool = true;
		}

		/**
		 * 设置动画移出场景停止
		 **/
		public function setDispose(mc:DisplayObject):void
		{
			mc.addEventListener(Event.REMOVED_FROM_STAGE,
				function (){
					mc.removeEventListener(Event.REMOVED_FROM_STAGE,arguments.callee);
					DisplayUtil.stop(mc);
				});
		}

		/**
		 * 功能同playDialogMovie，主要为了默认缓存背景
		 */	
		public function newPlayMovie(movie:MovieClip,func:Function = null,x:int =-1,y:int =-1,
			showBack:Boolean=true,times:int = 1, funArgArray:Array = null,isCache:Boolean = true):void
		{
			playDialogMovie(movie,func, x, y, showBack,times,funArgArray,isCache);
		}
		/**
		 * 功能同loadAndPlayDialogMovie，主要为了默认缓存背景
		 */	
		public function newLoadAndPlayDialogMovie(file:String, movieClass:String, func:Function = null, x:int =-1,y:int =-1,
			showBack:Boolean=true,times:int = 1, funArgArray:Array = null,isCache:Boolean = true):void
		{
			loadAndPlayDialogMovie(file,movieClass,func,x,y,showBack,times,funArgArray,isCache);
		}

		/**
		 * 控制动画播放几次，此动画在动画帧数结束后会自动关闭，不会因为动画停止改变。
		 * 自动清除，回调处理,点击"btnClose"提前关闭
		 * @param movie
		 * @param times  播放次数，默认为1
		 * @param func
		 * @param funArgArray
		 * @param isCache == true 缓存背景
		 */
		public function playDialogMovie(movie:MovieClip,func:Function = null, x:int =-1,y:int =-1,
			showBack:Boolean=true,times:int = 1, funArgArray:Array = null,
			isCache:Boolean = false, showLayer:Sprite = null, canCloseCallBack:Boolean = true):void
		{
			if(!this.moveBool){
				return;
			}
			if(isCache)
				NewDialog.setMovieBackground();
			var frames:int = movie.totalFrames * times;
			var hasClickedClose:Boolean = false;

			movie.gotoAndPlay(1);
			NewDialog.show(movie,showLayer,x,y,showBack);

			var onDispose:Function = function(needCallBack:Boolean = true):void
			{			
				if(isCache)
					NewDialog.removeMovieBackground();

				movie.removeEventListener(MouseEvent.CLICK,onClickBtnClose);				
				DisplayUtil.stop(movie);

				if(needCallBack && func != null){
					func.apply(null,funArgArray);
				}

			}





			var onClickBtnClose:Function = function(evt:MouseEvent):void
			{
				var name:String = DisplayObject(evt.target).name;
				if (name == "btnClose")
				{
					hasClickedClose = true;
					onDispose(canCloseCallBack);
				}
			}

			var onFinalFrame:Function = function():void
			{
				if(!hasClickedClose)
				{
					NewDialog.closeDialog(movie);
					onDispose();
				}								
			}

			movie.addEventListener(MouseEvent.CLICK,onClickBtnClose);
			this.moveAfterFrame(movie,frames,onFinalFrame);
		}

		/**
		 * 加载并播放动画,控制动画播放几次，此动画在动画帧数结束后会自动关闭，不会因为动画停止改变。
		 * 自动清除，回调处理,点击"btnClose"提前关闭
		 * @param movie
		 * @param times  播放次数，默认为1
		 * @param func
		 * @param funArgArray
		 */

		public function loadAndPlayDialogMovie(file:String, movieClass:String, func:Function = null, x:int =-1,y:int =-1,
			showBack:Boolean=true,times:int = 1, funArgArray:Array = null,isCache:Boolean = false, showLayer:Sprite = null, canCloseCallBack:Boolean = true):void
		{
			ProgressFullSprite.show(false, showLayer);
			var onGetMovie:Function = function(movie:MovieClip):void
			{
				ProgressFullSprite.close();
				playDialogMovie(movie, func, x, y, showBack, times, funArgArray,isCache, showLayer,canCloseCallBack);
			}

			ResScheduler.getResource(file, onGetMovie, movieClass, null, null, ResPriority.NORMAL, true, ResStorageType.TEMPORARY);
		}

		/**
		 * 播放场景动画
		 */		
		public function playSceneMovie(movie:MovieClip,contain:Sprite, x:Number, y:Number,
			func:Function = null, times:int = 1,funArgArray:Array = null):void
		{
			if(!this.moveBool){
				return;
			}
			var frames:int = movie.totalFrames * times;
			movie.x = x;
			movie.y = y;
			contain.addChild(movie);
			movie.gotoAndPlay(1);

			var onFinalFrame:Function = function():void
			{
				DisplayUtil.stopAndRemove(movie);
				if(func != null){
					func.apply(null,funArgArray);
				}
			}

			this.moveAfterFrame(movie,frames,onFinalFrame);
		}

		/**
		 * 加载并播放场景动画
		 */		
		public function loadAndPlaySceneMovie(file:String, movieClass:String, contain:Sprite, 
			x:Number, y:Number,func:Function = null, times:int = 1,
			funArgArray:Array = null):void
		{
			ProgressFullSprite.show(false);
			var onGetMovie:Function = function(movie:MovieClip):void
			{
				ProgressFullSprite.close();
				playSceneMovie(movie, contain, x, y, func, times,funArgArray);
			}

			ResScheduler.getResource(file, onGetMovie, movieClass, null, null, ResPriority.NORMAL, true, ResStorageType.TEMPORARY);
		}

		/**
		 * 加载并播放dialog动画，同loadAndPlayDialogMovie，不小心写多个一样的
		 */		
		public function loadAndPlayMovie(file:String,movieClass:String,func:Function = null,
			x:int =-1,y:int =-1,showBack:Boolean=true,times:int = 1, 
			funArgArray:Array = null,isCache:Boolean = false):void
		{
			this.loadAndPlayDialogMovie(file,movieClass,func,x,y,showBack,times,funArgArray,isCache);
		}

		public static function loadAndPlayMovieWithTweenLite(file:String, movieClass:String, func:Function = null, x:int =0, y:int =0,
			showBack:Boolean=true, argArr:Array = null,initMc:Function = null):void{
			ProgressFullSprite.show();
			var onLoadRes:Function = function(mc:MovieClip):void{
				ProgressFullSprite.close();
				if(initMc != null){
					initMc.apply(null,[mc]);					
				}
				playMovieWithTweenLite(mc, func, argArr);
			}

			ResScheduler.getResourceInTemporaryDomain(file, onLoadRes, movieClass);
		}

		public static function playMovieWithTweenLite(movie:MovieClip, callBack:Function = null, argArr:Array = null):void{
			movie.gotoAndStop(1);
			NewDialog.setMovieBackground();
			NewDialog.show(movie, null, 0, 0);
			movie.addEventListener(MouseEvent.CLICK, closeMovie);
			TweenLite.to(movie, movie.totalFrames / LayerManager.stage.frameRate, {"frame":movie.totalFrames, "onComplete":playFinish, "ease":Linear.easeNone});

			function closeMovie(e:MouseEvent):void{
				if(DisplayObject(e.target).name != "btnClose"){
					return;
				}
				stopPlayWithTweenLite(movie);
				lastJob();
			}

			function playFinish():void{
				NewDialog.closeDialog(movie);
				lastJob();
			}

			function lastJob():void{
				movie.removeEventListener(MouseEvent.CLICK, closeMovie);
				NewDialog.removeMovieBackground();
				if(callBack != null){
					callBack.apply(null, argArr);
				}
			}
		}

		public static function stopPlayWithTweenLite(movie:MovieClip):void{
			TweenLite.killTweensOf(movie);
		}

		/*** 单纯处理播放动画元件（元件已经在面板上显示了）  **/
		public static function playMovieClipOnlyPlay(movie:MovieClip, callBack:Function = null, argArr:Array = null):void
		{
			var hasKill:Boolean = false;
			movie.gotoAndStop(1);
			movie.removeEventListener(MouseEvent.CLICK, onClickMovie);
			movie.addEventListener(MouseEvent.CLICK, onClickMovie);
			TweenLite.to(movie, movie.totalFrames / LayerManager.stage.frameRate, {"frame":movie.totalFrames, "onComplete":playFinish, "ease":Linear.easeNone});
			function playFinish():void{
				callFinish();
			}

			function callFinish():void{
				if( movie ){
					movie.removeEventListener(MouseEvent.CLICK, onClickMovie);
				}
				if( !hasKill ){
					if(callBack != null){
						callBack.apply(null, argArr);
					}
				}
			}

			function onClickMovie( evt:MouseEvent ):void{
				if( evt.target.name == "btnClose" ){
					TweenLite.killTweensOf(movie);
					callFinish();
					hasKill = true;
				}
			}
		}

		public static function loadAndPlayInSceneDomain(file:String, className:String, callBack:Function=null):void{
			ProgressLoader.load(file, function(mc:MovieClip):void{
				ProgressLoader.close();
				new MoveHelper().playDialogMovie(mc, callBack, 0, 0, true, 1, null, true);
			}, className);
		}

		public static function playMovieByTween(movie:MovieClip, callBack:Function = null, autoRemove:Boolean = true):TweenLite
		{
			var totalFrame:int = movie.totalFrames;
			function onPlayEnd():void
			{
				if(autoRemove)
				{
					DisplayUtil.stopAndRemove(movie);
				}
				if(callBack != null)
				{
					callBack.apply();
				}
			}
			return TweenLite.to(movie, totalFrame / 25, {
					"frame":totalFrame,
					"ease":Linear.easeNone,
					"onComplete":onPlayEnd
				});
		}

	}
}

