package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.helper.NurMusicManager;
	import mmo.nurturance.nodehandle.helper.NurSoundPlayer;
	
	public class SoundNode extends NurExtNode
	{
		private var _soundPlayer:NurSoundPlayer;
		public function SoundNode(xml:XML, variables:Object)
		{
			super(xml);
		}
		
		public override function execute(arg0:Object=null):void
		{
			_soundPlayer = new NurSoundPlayer();
			_soundPlayer.playSound(this._info.@path, false, 1, onLoadSound);
//			NurEventDispatcher.instance.addEventListener(NurEvent.SoundTalk_Finish,onSoundTalkFinish);
		}
		
		private function onLoadSound():void
		{
			
			nodeEnd();
			
		}
		private function onSoundTalkFinish(evt:NurEvent):void
		{
			trace("~~~~~~~~~~~~~~~~~~~evt.pramas.key:"+evt.pramas.key);
			if(_soundPlayer!=null)
			{
				_soundPlayer.dispose();
			}
			
		}
		public override function dispose():void
		{
			if(_soundPlayer != null)
			{
				_soundPlayer.dispose();
				_soundPlayer = null;
			}
//			NurEventDispatcher.instance.removeEventListener(NurEvent.SoundTalk_Finish,onSoundTalkFinish);
		}
	}
}