package mmo.nurturance.nodehandle.node
{
	import com.greensock.TweenLite;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.MovieClip;
	
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.MoveHelper;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class CGNode extends NurExtNode
	{
		private var _path:String;
		private var _name:String;
		
		public function CGNode(xml:XML, variables:Object)
		{
			_path = xml.@path;
			_name = xml.@name;
			super(xml);
		}
		
		public override function execute(arg0:Object=null):void
		{
			playCG(onPlayMovie);
		}
		
		private function playCG(cb:Function):void
		{
			ProgressFullSprite.show();
			SceneDomainResLoader.loadRes(_path,_name,onGetCG);
			function onGetCG(mc:MovieClip):void
			{
				ProgressFullSprite.close();
				TweenPlugin.activate([TintPlugin]);
				NewDialog.show(mc, null, 0, 0);
				TweenLite.to(mc, 0, {alpha:0});
				TweenLite.to(mc, 1.5, {alpha:1, onComplete:onDisplay});
				function onDisplay():void
				{
					TweenLite.to(mc, 5, {onComplete:function ():void
					{
						TweenLite.to(mc, 1.5, {tint:0x000000,onComplete:onDissolve});
						function onDissolve():void
						{
							NewDialog.closeDialog(mc);
							if(cb != null)
							{
								cb.apply();
							}
						}
					}});
					
				}
			}
		}
		
		private function onPlayMovie():void
		{
			NurGameManager.instance.finishCG(int(this._info.@cgId),function ():void
			{
				nodeEnd();
			});
		}
	}
}