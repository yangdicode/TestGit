package mmo.nurturance.nodehandle.effect
{
	import flash.display.MovieClip;
	
	import mmo.common.DisplayUtil;
	import mmo.interfaces.IDispose;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.layer.LayerManager;
	
	public class NurEffect0 implements IDispose
	{
		private var _info:XML;
		private var _mcEffect:MovieClip;
		
		public function NurEffect0(info:XML)
		{
			_info = info;
			SceneDomainResLoader.loadRes(_info.@eurl, _info.@ecls, onGetRes);
		}
		
		private function onGetRes(effect:MovieClip):void
		{
			_mcEffect = effect;
			_mcEffect.mouseChildren = false;
			_mcEffect.mouseEnabled = false;
			LayerManager.getCurrentLayerTop().addChild(_mcEffect);
		}
		
		public function dispose():void
		{
			SceneDomainResLoader.cancelRes(_info.@eurl, onGetRes);
			_info = null;
			DisplayUtil.stopAndRemove(_mcEffect);
			_mcEffect = null;
		}
	}
}