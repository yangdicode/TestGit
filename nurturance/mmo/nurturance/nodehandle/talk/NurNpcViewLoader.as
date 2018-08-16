package mmo.nurturance.nodehandle.talk
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import mmo.loader.scheduler.ResScheduler;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.npc.NurCustomNpcsConfig;
	import mmo.nurturance.nodehandle.npc.NurNpcName;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEvent;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEventDispatcher;
	import mmo.play.avatar.AvatarFacade;
	import mmo.play.avatar.IAvatarProxy;
	
	public class NurNpcViewLoader extends EventDispatcher
	{
		public function NurNpcViewLoader()
		{
		}
		
		private static const NPC_VIEW_PATH_PREFIX:String = "nurturance/nurnpc/nurnpc";
		private static const NPC_VIEW_CLASS_PREFIX:String = "mmo.nurnpc.NurNpc";
		private static const NPC_ICON_CLASS_PREFIX:String = "mmo.nurnpc.NurNpcIcon";
		
		private static const DEFAULT_NPC_VIEW_PATH:String = "nurturance/nurnpc/nurnpc0";
		private static const DEFAULT_NPC_VIEW_CLASS_PREFIX:String = "mmo.nurnpc.NurNpc0_";
		private static const DEFAULT_NPC_ICON_CLASS_PREFIX:String = "mmo.nurnpc.NurNpcIcon0_";
		
		private static var _usersAvatar:IAvatarProxy;
		
		private static var _customNpcs:Array;
		
		public static function disposeCustomNpcs():void
		{
			for each(var proxy:IAvatarProxy in _customNpcs)
			{
				proxy.dispose();
			}
			_customNpcs = null;
		}
		
		public static function get customNpcs():Array
		{
			if (_customNpcs == null)
			{
				_customNpcs = [];
			}
			return _customNpcs;
		}
		
		/**
		 * 下载NPC在场景中的View动画，下载完成抛出(NurTalkEvent.ON_NPC_VIEW_LOADED, {"id":id, "content":content})
		 * @param id :NPC id
		 * 
		 */
		public static function loadNpcView(npcId:int, viewId:int):void{
			var str:String = NPC_VIEW_PATH_PREFIX + npcId.toString();
			var className:String = NPC_VIEW_CLASS_PREFIX + npcId.toString() + "_" +viewId.toString();
			ResScheduler.getResource(str, 
				function (obj:Object):void{
					//为了处理能读到NPC的资源文件，但是读取具体ID的View失败（没有该ID的View）的情况不报错 -- Lihuilong
					if(ApplicationDomain.currentDomain.hasDefinition(className))
					{
						var cls:Class = ApplicationDomain.currentDomain.getDefinition(className) as Class;
						var view:DisplayObject = new cls();
						NurTalkEventDispatcher.instance.dispatchEvent(new NurTalkEvent(NurTalkEvent.ON_NPC_VIEW_LOADED, {"id":npcId, "content":view}));
					}
					else
					{
						onIOViewError(npcId, viewId);
					}
				}, 
				"",
				function(e:IOErrorEvent){onIOViewError(npcId, viewId)});
		}
		
		/**
		 * 下载NPC在场景中的多个View动画，下载完成抛出(NurTalkEvent.ON_NPC_VIEWS_LOADED, {"id":[id0.id1], "content":[view0,view1]})
		 * @param id :NPC id
		 * 
		 */
		public static function loadNpcViews(npcIds:Array):void
		{
			var loadIndex:int = 0;
			var viewList:Array = [];
			function onLoadNpcView(mc:Sprite):void
			{
				viewList.push(mc);
				loadIndex++;
				if(loadIndex == npcIds.length)
				{
					trace("end loading viewList====" + viewList);
					NurTalkEventDispatcher.instance.dispatchEvent(new NurTalkEvent(NurTalkEvent.ON_NPC_VIEWS_LOADED, {"npcIds":npcIds, "viewList":viewList}));
				}
				else
				{
					loadNpcView2(npcIds[loadIndex],onLoadNpcView);
				}
			}
			loadNpcView2(npcIds[loadIndex],onLoadNpcView);
		}
		
		private static function loadNpcView2(str:String, callBack:Function):void
		{			
			var npcId:int = int(str.split("_")[0]);
			var viewId:int = int(str.split("_")[1]);
			var values:Object = NurManageHandler.instance.propManager.branchPropsData.values;
			var favor:int = values["62_sex"];
			if(favor==2 &&npcId==452)
			{
				if(viewId>=101&&viewId<=215)
				{
					viewId += 5000;
					
				}
				
			}
			if(npcId == -1)
			{
				if(_usersAvatar == null)
				{
					//_usersAvatar = AvatarFacade.getAlbumAvatarProxy(false, ModelInfo.getAvatarInfo());
				}
				var sprite:Sprite = new Sprite();
				_usersAvatar.getSprite().y = 50;
				sprite.addChild(_usersAvatar.getSprite());
				callBack.apply(null, [sprite]);
				return;
			}
			var tempId:int = NurNpcName.checkIsCustomNpc(npcId);
			if (tempId != -1)
			{
				var emptySprite:Sprite = new Sprite();
				var proxy:IAvatarProxy = AvatarFacade.getAlbumAvatarProxy(false, NurCustomNpcsConfig.getCustomNpcAvatar(tempId, viewId));
				customNpcs.push(proxy);
				proxy.getSprite().x = 24.75;
				proxy.getSprite().y = 153.9;
				proxy.getSprite().scaleX = 1.5;
				proxy.getSprite().scaleY = 1.5;
				emptySprite.addChild(proxy.getSprite());
				callBack.apply(null, [emptySprite]);
				return;
			}
			if(!NurNpcName.needTalkSignNpc(npcId))
			{
				npcId = 0;
			}
			
			var path:String = NPC_VIEW_PATH_PREFIX + npcId.toString();
			var className:String = NPC_ICON_CLASS_PREFIX + npcId.toString() + "_" +viewId.toString();
			ResScheduler.getResource(path, onGetView, className, onGetViewError);
			function onGetView(mc:MovieClip):void
			{
				callBack.apply(null,[mc]);
			}
			
			function onGetViewError(evt:IOErrorEvent):void
			{
				ResScheduler.getResource(DEFAULT_NPC_VIEW_PATH, function (defaultMc:MovieClip):void
				{
					callBack.apply(null,[defaultMc]);
				}, DEFAULT_NPC_VIEW_CLASS_PREFIX + 1);
			}
		}
		
		/**
		 *没有找到美术文件时用“山寨王”代替 
		 * @param npcId
		 * 
		 */
		private static function onIOViewError(npcId:int, viewId:int):void{
			var str:String = DEFAULT_NPC_VIEW_PATH;
			//旧版本不科学，直接读1就好
			var className:String = DEFAULT_NPC_VIEW_CLASS_PREFIX + 1;
			ResScheduler.getResource(str,
				function (content:DisplayObject):void{
					var cls:Class = getDefinitionByName(className) as Class;
					var view:DisplayObject = new cls();
					NurTalkEventDispatcher.instance.dispatchEvent(new NurTalkEvent(NurTalkEvent.ON_NPC_VIEW_LOADED, {"id":npcId, "content":view}));
				}, 
				className);
		}
		
		/**
		 * 下载NPC在对话框中的图标，下载完成抛出(NurTalkEvent.ON_NPC_ICON_LOADED, {"id":id, "content":content})
		 * @param {"id":id, "content":content}
		 * 
		 */
		public static function loadNpcIcon(npcId:int, iconId:int):void{
			var str:String = NPC_VIEW_PATH_PREFIX + npcId.toString();
			var className:String = NPC_ICON_CLASS_PREFIX + npcId.toString() + "_" +iconId.toString();
			ResScheduler.getResource(str, 
				function (obj:Object):void{
					//为了处理能读到NPC的资源文件，但是读取具体ID的Icon失败（没有该ID的Icon）的情况不报错 -- Lihuilong
					if(ApplicationDomain.currentDomain.hasDefinition(className))
					{
						var cls:Class = ApplicationDomain.currentDomain.getDefinition(className) as Class;
						var icon:DisplayObject = new cls();
						NurTalkEventDispatcher.instance.dispatchEvent(new NurTalkEvent(NurTalkEvent.ON_NPC_ICON_LOADED, {"npcId":npcId, "content":icon}));
					}
					else
					{
						onIOIconError(npcId, iconId);
					}
				}, 
				"",
				function(e:IOErrorEvent){onIOIconError(npcId, iconId)});
		}
		
		/**
		 *没有找到美术文件时用“山寨王”代替 
		 * @param npcId
		 * 
		 */
		private static function onIOIconError(npcId:int, iconId:int):void{
			var str:String = DEFAULT_NPC_VIEW_PATH;
			//旧版本不科学，直接读1就好
			var className:String = DEFAULT_NPC_ICON_CLASS_PREFIX + 1;
			ResScheduler.getResource(str, 
				function (content:DisplayObject):void{
					var cls:Class = getDefinitionByName(className) as Class;
					var icon:DisplayObject = new cls();
					NurTalkEventDispatcher.instance.dispatchEvent(new NurTalkEvent(NurTalkEvent.ON_NPC_ICON_LOADED, {"npcId":npcId, "content":icon}));
				}, 
				className);
		}
	}
}