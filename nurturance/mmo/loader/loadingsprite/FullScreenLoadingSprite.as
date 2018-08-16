package mmo.loader.loadingsprite {
    
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import mmo.config.ConfigReader;
	import mmo.loader.CustomLoader;
	import mmo.loader.LoaderSpriteVersionHelper;
	import mmo.loader.game.ILoadingGameManager;
	import mmo.loader.loadingsprite.LoadingSprite;
	import mmo.loader.scheduler.ResScheduler;


	public class FullScreenLoadingSprite extends LoadingSprite implements ILoadingSprite {
		
		private const loadingTipsInfoChangeSec:int = 10;
		private static var gameManager:ILoadingGameManager;
		private var _loadingTipsInfo:Array;
		private var _timer:Timer;

		public function FullScreenLoadingSprite() {
            super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(evt:Event):void {
			
		
			
			
			this.x =0;
			this.y = 0;
			// 小交互			
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);	
			//广告资源
			addScreenResView();		
			
			if(gameManager == null){			
				ResScheduler.getResource("loader_game", this.onLoadedGame);
				
			}else{						
				gameManager.startGame(this, Sprite(this.getChildByName("gameContainer")));				
			}	
			
			_loadingTipsInfo = ConfigReader.instance.loadingTipsInfo.concat();
			_timer = new Timer(loadingTipsInfoChangeSec * 1000, 0);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			setRandomLoadingTips();
		}
		
		
		
		private function addScreenResView():void{
			var mcAdContainer:MovieClip = this["adContaner"];
			var mcBgContainer:MovieClip = this["bgContaner"];		
			var adCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.loader.loadingsprite.FullScreenLoadingSpriteAdView"+LoaderSpriteVersionHelper.getCurVersionByLocalTime()) as Class;
			var bgCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.loader.loadingsprite.FullScreenLoadingSpriteBgView"+LoaderSpriteVersionHelper.getCurVersionByLocalTime()) as Class;
			var mcAd:MovieClip = new adCls() as MovieClip;
			var mcBg:MovieClip = new bgCls() as MovieClip;
			
			
			//周年庆开启倒计时
			//this.addCountDown(mcBg);
			
			addMcviewToContainer(mcBg, mcBgContainer);
			addMcviewToContainer(mcAd, mcAdContainer);
			
			
		}
		
		private function addCountDown(mcView:MovieClip):void{
			var date:Date =  new Date();
			var endDate:Date = new Date("2015","11","27");
			var leftDay:int = endDate.getDate() - date.getDate();
			leftDay = (leftDay>0)?leftDay:0;
//			TextField(mcView["txtCountDown"]).text = leftDay.toString();
			setNumMc(mcView["txtCountDown"],leftDay);
		}
		
		private function setNumMc( numMc:MovieClip, num:int ):void{
			if(num < 0){
				num = 0;
			}
			
			var numMcArray:Array = new Array();
			var oneNumMc:MovieClip;
			var numCount:int;
			var showStates:Array = [];
			for(numCount = 0; numCount < 2; numCount++){
				oneNumMc = numMc.getChildByName("num"+numCount.toString()) as MovieClip;
				if(oneNumMc == null){
					break;
				}
				oneNumMc.visible = true;
				oneNumMc.gotoAndStop(1);
				numMcArray.push(oneNumMc);
				showStates.push(true);
			}
			
			numCount = 0;
			for(var reNum:int = num; reNum > 0;){
				if(numCount == numMcArray.length){
					break;
				}
				var lastNum:int = reNum % 10;
				MovieClip(numMcArray[numCount]).gotoAndStop(lastNum + 1);
				reNum = Math.floor(reNum/10);
				numCount ++;
			}
		}
		
		private function addMcviewToContainer( mcView:MovieClip, mcContainer:MovieClip ):void{
			//trace("********000000000000");
			if( !mcContainer || !mcView ){
				//trace("****mcView:"+mcView+", mcContainer:"+mcContainer);
				return;
			}
			//trace("********11111111111");
			
			while( mcContainer.numChildren>0 )
				mcContainer.removeChildAt(0);
			mcView.x = 0;
			mcView.y = 0;
			mcContainer.addChild(mcView);
		}
		
		private function onTimer(evt:TimerEvent):void
		{
			setRandomLoadingTips();
		}
		
		private function setRandomLoadingTips():void
		{
			var randomInt:int = int(Math.random() * _loadingTipsInfo.length);
			TextField(this["txtloadingTipsInfo"]).text = String(_loadingTipsInfo[randomInt]);
		}
				
		private function onLoadedGame(gameManger:ILoadingGameManager):void{			
			FullScreenLoadingSprite.gameManager = gameManger;			
			
			if(this.parent != null){
				gameManager.startGame(this, Sprite(this.getChildByName("gameContainer")));				
			}
		}
				
		public override function dispose():void			
		{			
			super.dispose();			
			
			if(_timer)
			{
				_timer.removeEventListener(TimerEvent.TIMER, onTimer);
				_timer = null;
			}
			
			if( gameManager )
			{
				// 小交互			
				gameManager.pauseGame(Sprite(this.getChildByName("gameContainer")));				
			}
			ResScheduler.cancelURL("loader_game");
			
		}
		
	}
}