package mmo.nurturance.nodehandle.node
{
	import com.greensock.TweenLite;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mmo.common.DisplayUtil;
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.build.NurWindowManager;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class LoadSceneNode extends NurExtNode
	{
		private var _file:String;
		private var _name:String;
		
		public function LoadSceneNode(xml:XML, variables:Object)
		{
			_file = xml.@path;
			_name = xml.@name;
			super(xml);
		}
		
		override public function execute(params:Object=null):void
		{
			loadBG(onLoadBG);
		}
		
		private function loadBG(cb:Function = null):void
		{
			ProgressFullSprite.show();
			SceneDomainResLoader.loadRes(_file,_name,onGetBG);
			function onGetBG(mc:MovieClip):void
			{
				ProgressFullSprite.close();
				NurManageHandler.instance.windowManager.hideUI();
				TweenPlugin.activate([TintPlugin]);
				TweenLite.to(NurManageHandler.instance.windowManager.blackGround, 1, {tint:0x000000,onComplete:onDissolve});
				function onDissolve():void
				{
					DisplayUtil.removeAllChild(NurManageHandler.instance.windowManager.blackGround);
					mc.x = 0;
					mc.y = 0;
					NurManageHandler.instance.windowManager.blackGround.addChild(mc);
					TweenLite.to(NurManageHandler.instance.windowManager.blackGround, 1, {tint:null,onComplete:onDisplay});
					function onDisplay():void
					{
						NurManageHandler.instance.windowManager.showUI();
						if(cb != null)
						{
							cb.apply();
						}
					}
				}
			}
		}
		
		private function onLoadBG():void
		{
			NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.CHANGE_SETTING, {"type":this._info.@type,"key":this._key}));
			nodeEnd();
		}
	}
}