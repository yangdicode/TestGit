package mmo.play.viewloader{
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	
	public class ViewContainer extends Sprite {
		
		// 添加真实视图时抛出的事件,以方便外部位置调整
		public static const ON_SET_VIEW:String = "onSetView";
		
		public var isWaiting:Boolean;
		private var background:Sprite;
		private var containerWidth:Number;
		private var containerHeight:Number;
		private var waitingMovie:Sprite;
		
		public function ViewContainer(width:Number, height:Number) {
			this.containerWidth = width;
			this.containerHeight = height;
			//建立一个给定大小的背景
			background = new Sprite();
			background.graphics.beginFill(0,0);
			background.graphics.drawRect(0, 0, containerWidth, containerWidth);
			background.graphics.endFill();
			this.addChild(background);
		}
		
		public static function creatView(width:Number, height:Number, waitingMovie:Sprite = null):ViewContainer {
			var vc:ViewContainer = new ViewContainer(width, height);
			vc.isWaiting = true;
			
			if(waitingMovie == null) {				
				// 下载WaitingMovie，成功后替换waitingMovie
				ResScheduler.getResource("library_res/common_res_progress", 
					function (content:MovieClip) {
						if(vc.isWaiting) {
							vc.showWaitingMovie(content);
						}
					}, 
					"mmo.common.viewloader.WaitingMovie", null, null, ResPriority.HIGHEST);
			}else
			{
				vc.showWaitingMovie(waitingMovie);
			}				
			return vc;
		}
		
		public function showWaitingMovie(waitingMovie:Sprite):void
		{
			this.waitingMovie = waitingMovie;
			this.addChild(waitingMovie);
			if(waitingMovie.width > this.containerWidth || waitingMovie.height > this.containerHeight){
				DisplayUtil.scaleDisplay(waitingMovie, this.containerWidth, this.containerHeight);
			}
			DisplayUtil.middleDisplay(waitingMovie, this.containerWidth, this.containerHeight);
		}	
		
		public function setView(content:DisplayObject, setMiddle:Boolean = true, setScale:Boolean = true):void 
		{
			this.isWaiting = false;
			if (this.waitingMovie != null) 
			{
				DisplayUtil.stopAndRemove(this.waitingMovie);
				this.waitingMovie = null;
			}
			this.addView(content, setMiddle, setScale);
			this.dispatchEvent(new Event(ON_SET_VIEW));
		}
		
		public function dispose():void 
		{
			this.isWaiting = false;		
			DisplayUtil.stopAndRemove(this);
		}
		
		private function addView(content:DisplayObject, setMiddle:Boolean = true, setScale:Boolean = true):void
		{
			this.addChild(content);
			if(setScale)
				DisplayUtil.scaleDisplay(content, this.containerWidth, this.containerHeight);
			if(setMiddle)
				DisplayUtil.middleDisplay(content, this.containerWidth, this.containerHeight);
		}
	}
}