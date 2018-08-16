package mmo.play.avatar.skin.displayer
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.utils.getTimer;
	
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.material.clothes.ClothesPart;
	import mmo.play.runner.EnterFrameRunner;

	public class SkinDisplayerCache
	{
		//延迟时间数加载衣服，越慢性能越好，但加载时间会变长，自己衡量
		private const frameViewCount:int = 65;
		
		private var clothesPartVector:Vector.<Object> = new Vector.<Object>();
//		private var isSkinLoading:Boolean;
		private var lastFrameEndTime:int;
		
		//默认缓存衣服：人模，男女内衣
		private static const persistants:Array = [
			"a000001",
			"a000002",
			"a000003",
			"a000004",
			"a000005",
			"a000013",
			"a000014",
			"a000036",
			"a000037",
			"a000038",
			"a000039",
			"a000040",
			"a000041",
			"a000042",
			"a000043",
			"a000044",
			"a000045"
		];
		
		public static function addPersistSkin(no:String):void
		{
			if(persistants.indexOf(no) < 0)
			{
				persistants.push(no);
			}	
		}	
		
		public static function removePersistSkin(no:String):void
		{
			if(persistants.indexOf(no) >= 0)
			{
				persistants.splice(persistants.indexOf(no), 1);
			}	
		}	
		
		private static const IMAGE_TYPE:String = "_C";
		private static var _instance:SkinDisplayerCache;
		public static function get instance():SkinDisplayerCache
		{
			if(_instance == null)
			{
				_instance = new SkinDisplayerCache();
			}	
			return _instance;
		}	
	
		public function SkinDisplayerCache()
		{
			no_displayer = {};
			no_refCount = {};
			no_callbackList = {};
		}
		
		private var no_displayer:Object;
		private var no_refCount:Object;
		private var no_callbackList:Object;
		
		/**
		 * 
		 * 使用对应的skinDisplayer,如果存在直接返回
		 * 如果不存在则去下载, 同时引用计数都+1
		 * */
		public function useSkinDisplayer(clothesPart:ClothesPart, callback:Function,isPriority:Boolean):void
		{
			var no:String = clothesPart.clothesNo;
			if(hasSkinDisplayer(no))
			{
				no_refCount[no] += 1;
				callback.apply(null, [no_displayer[no] as SkinDisplayer]);
				return;
			}	
			
			var callbackList:Array;
			if(isLoadingSkinDisplayer(no))
			{
				callbackList = no_callbackList[no] as Array;
				callbackList.push(callback);
				no_refCount[no] += 1;
				return;
			}
			
			callbackList = new Array();
			callbackList.push(callback);
			no_callbackList[no] = callbackList;
			no_refCount[no] = 1;
			
//			loadSkin(clothesPart);
			//自己的衣服要优先考虑，否则换衣服的时候会有问题
			var clothesPartObj:Object = {"clothesPart":clothesPart,"isPriority":isPriority};
			clothesPartVector.push(clothesPartObj);
			clothesPartVector = clothesPartVector.sort(this.sortPriority);
			
			if(!EnterFrameRunner.instance.hasRunnable(eachCheckLoadSkin)){
//				isSkinLoading = false;
				lastFrameEndTime = getTimer();
				EnterFrameRunner.instance.addRunnable(eachCheckLoadSkin);
			}
		}
		
		private function sortPriority(x:Object,y:Object):int{
			if(x["isPriority"]){
				return -1;
			}else{
				return 0;
			}
		}
		
		private function eachCheckLoadSkin():void
		{
			if(clothesPartVector.length == 0){
				EnterFrameRunner.instance.removeRunnable(eachCheckLoadSkin);
				return;
			}
			
			if(getTimer() - this.lastFrameEndTime < frameViewCount){
//				if(!isSkinLoading){
//					isSkinLoading = true;
					var clothesPart:ClothesPart = clothesPartVector.shift()["clothesPart"];
					loadSkin(clothesPart);
//				}
			}
			
			lastFrameEndTime = getTimer();
		}
		
		private function loadSkin(clothesPart:ClothesPart):void
		{
			var ref:SkinDisplayerCache = this;
			var fileName:String = clothesPart.fileName;
			var filePath:String = clothesPart.filePath + fileName;
			var fileClassName = fileName + IMAGE_TYPE;
			ResScheduler.getResource(filePath, onSkinLoaded, fileClassName, onLoadSkinError, null, ResPriority.LOW, false, SceneDomainResLoader.resStoryageType);
			function onSkinLoaded(content:DisplayObject):void
			{
				if(content == null)
				{
//					isSkinLoading = false;
					throw new Error("download file " + fileName +"error!");
				}	
				//可能存在情况：下载完了， 但是已经没有人需要了
				var no:String = clothesPart.clothesNo;
				var callbackList:Array = ref.no_callbackList[no] as Array;
				if(callbackList != null && callbackList.length == 0)
				{
					delete ref.no_callbackList[no];
//					isSkinLoading = false;
					return;
				}
				var skinDisplayer:SkinDisplayer = new SkinDisplayer(content as Sprite, no);
				ref.no_displayer[no] = skinDisplayer;
				
				for each(var callback:Function in callbackList)
				{
					callback.apply(null, [skinDisplayer]);
				}
//				isSkinLoading = false;
				delete ref.no_callbackList[no];
			}	
			function onLoadSkinError(evt:IOErrorEvent):void
			{
//				isSkinLoading = false;
				var no:String = clothesPart.clothesNo;
				var callbackList:Array = ref.no_callbackList[no] as Array;
				for each(var callback:Function in callbackList)
				{
					callback.apply(null, [null]);
				}
				delete ref.no_callbackList[no];
				delete ref.no_refCount[no];
			}	
		}	
		
		/**
		 * 注销使用 skinDisplayer,引用计数-1，如果没人使用了就释放掉
		 * 但是： 持久列表中的永远不释放
		 * 
		 * */
		public function unUseSkinDisplayer(clothesPart:ClothesPart, callback:Function):void
		{
			var no:String = clothesPart.clothesNo;
			var callbackList:Array = no_callbackList[no] as Array;
			//有可能情况： 注销的时候，衣服还没下载完毕
			if(callbackList && callbackList.indexOf(callback) > -1)
			{
				callbackList.splice(callbackList.indexOf(callback), 1);
			}	
			no_refCount[no] -= 1;
			if(no_refCount[no] <= 0){
				if(isPersistent(no)){
					return;
				}
				delete no_refCount[no];
				delete no_callbackList[no];
				removeFromLoadingList(no);
				var filePath:String = clothesPart.filePath + clothesPart.fileName;
				ResScheduler.cancelURL(filePath);
				
				if(hasSkinDisplayer(no)){
					SkinDisplayer(no_displayer[no]).dispose();
					delete no_displayer[no];
				}
			}	
		}	
		
		public function hasSkinDisplayer(no:String):Boolean
		{
			return (no_displayer[no] as SkinDisplayer) != null;
		}
		
		private function removeFromLoadingList(no:String):void{
			var partInfo:Object;
			for(var len:int = clothesPartVector.length, i:int = len - 1; i >= 0; i --){
				partInfo = clothesPartVector[i];
				if(ClothesPart(partInfo["clothesPart"]).clothesNo == no){
					clothesPartVector.splice(i, 1);
				}
			}
		}
		
		private function isLoadingSkinDisplayer(no:String):Boolean
		{
			return (no_callbackList[no] as Array) != null;
		}
		
		private function isPersistent(no:String):Boolean
		{
			return persistants.indexOf(no) > -1;
		}	
	}
}