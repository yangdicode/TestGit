package mmo.nurturance.nodehandle.helper
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.loader.scheduler.VersManager;

	public class NurSoundPlayer
	{		
		private var sound:Sound;
		private var soundChannel:SoundChannel;
		private var _isLoading:Boolean;
		private var loop:Boolean;
		private var volume:Number;
		
		private var soundFile:String;
		
		private var sndTransform:SoundTransform;
		
		private var stoped:Boolean = false;
		
		private var _onLoad:Function;
		private var _onComplete:Function;
		private static var _instance:NurSoundPlayer;
		
		public function NurSoundPlayer(){
		}
		
		public static function get instance():NurSoundPlayer
		{
			if(_instance == null)
				_instance = new NurSoundPlayer();
			return _instance;
		}
		/**
		 * 播放音效
		 * 注意：记得将音效文件的后缀名改为swf,版本号更新需要
		 * force:强制播放。
		 */		
		public function playSound(soundFile:String,loop:Boolean=false,volume:Number = 1, onLoad:Function = null, onComplete:Function = null):void
		{
//			clearSound();
			_onLoad = onLoad;
			_onComplete = onComplete;
			sound = new Sound();
			this.sound.addEventListener(Event.COMPLETE, onLoadSound);
			this.sound.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			NurEventDispatcher.instance.addEventListener(NurEvent.SoundTalk_Finish,onSoundTalkFinish);
			this.loop = loop;
			this.volume = volume;
			this.soundFile = soundFile;
			
			var req:URLRequest = VersManager.getVerURLRequest(soundFile);
			this.sound.load(req);
			_isLoading = true;
		}
		private function onSoundTalkFinish(evt:NurEvent):void
		{
			dispose();
			
		}
		public function turnState():void
		{
				
			stoped = !stoped;
			
			if(stoped)
			{
				
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.SoundTalk_Finish));
//				stop();
			}
				
			else
				play(this.loop,this.volume);
		}
		public function stop():void
		{
			
			this.stoped = true;
			trace("stop  soundChannel******" + this.soundChannel);
			if(this.soundChannel != null)
			{
				trace("come here!!");
				this.soundChannel.stop();
			}
		}
		private function clearSound():void
		{
			if(soundChannel != null)
			{
				soundChannel.stop();
			}
			if (sound != null)
			{
				if (_isLoading)
				{
					sound.close();
				}
				sound.removeEventListener(Event.COMPLETE, onLoadSound);
				sound.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			}
			soundChannel = null;
			sound = null;
		}
		public function play(loop:Boolean=false, volume:Number = 1):void
		{
			if(this.soundFile == null)
				return;
			this.loop = loop;
			this.stoped = false;
			this.sndTransform = new SoundTransform(volume, 0);
			this.soundChannel = this.sound.play(0, 0, this.sndTransform);
			if(this.loop)
			{
				this.soundChannel.addEventListener(Event.SOUND_COMPLETE, onComplete);
			}
		}
		
		public function dispose():void
		{
			this.stop();
			
			this._onComplete = null;
			this._onLoad = null;
			this.sndTransform = null;
			this.sound = null;
			this.soundChannel = null;
			NurEventDispatcher.instance.removeEventListener(NurEvent.SoundTalk_Finish,onSoundTalkFinish);
		}

		private function onIoError(evt:Event):void{
			this.sound.removeEventListener(Event.COMPLETE, onLoadSound);
			this.sound.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			//错误就不播放音效，吃掉错误
			trace("sound IOError:" + this.soundFile);
			this.dispose();
		}
		
		private function onLoadSound(evt:Event):void{
			this.sound.removeEventListener(Event.COMPLETE, onLoadSound);
			this.sound.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			if(!stoped&&(NurMusicManager.instance.state==1))
			{
				this.play(this.loop,this.volume);
			}
			
			
			if(_onLoad != null)
				_onLoad.apply();
		}
		
		private function onComplete(evt:Event):void
		{
			this.soundChannel.removeEventListener(Event.SOUND_COMPLETE, onComplete);
			if(this.loop && !this.stoped&&(NurMusicManager.instance.state==1))
			{
				this.play(this.loop, this.sndTransform.volume);
			}
		}
	}
}