package mmo.nurturance
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mmo.loader.LoaderContainer;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;
	import mmo.nurturance.ui.NurTaskStartPanel;
	import mmo.materialdata.ClothesData;
	import mmo.materialdata.ClothesPartsDatas;
	import mmo.materialdata.SkinviewEffectConfig;
	import mmo.play.material.clothes.ClothesFacade;
	
	public class NurturanceDoc extends Sprite
	{
		//======此代码为推荐功能专用代码========/
		public static var _4399_function_gameList_id:String = "944c23f5e64a80647f8d0f3435f5c7a8";
		
		//======此代码为api通用代码，在所有api里面只需加一次========/
		public static var serviceHold:* = null;
		public function setHold(hold:*):void
		{
			serviceHold = hold;
		}
		
		public function NurturanceDoc()
		{
			SkinviewEffectConfig;
			ClothesData;
			ClothesPartsDatas;
			ClothesFacade.instance;
			
			addChild(LoaderContainer.instance);
			
			loadGameId();
		}
		
		private function loadGameId():void
		{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onConfigLoadSuccess);
			var url:String = "gameid.xml";
			loader.load(new URLRequest(url));
			function onConfigLoadSuccess(evt:Event):void{
				loader.removeEventListener(Event.COMPLETE, onConfigLoadSuccess);
				var config:XML = new XML(loader.data);
				
				ResScheduler.getResource("nurturance/conf", onLoadedConf);
				function onLoadedConf(context:*):void{
					NurDefinesProvider.initGame(config.@id);
					NurGameManager.instance.init(onInited);
				}
			}
		}
		
		private function onInited():void
		{
			new NurTaskStartPanel().show();
		}
	}
}