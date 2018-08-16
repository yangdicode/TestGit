package mmo.nurturance.nodehandle.helper
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import mmo.loader.scheduler.VersManager;

	public class NurMusicManager
	{
		private static var _instance:NurMusicManager;
		
		private var _music:Sound;
		private var _chanel:SoundChannel;
		private var _volume:int = 1;
		private var _isStop:Boolean = false;
		private var _isLoading:Boolean;
		private var _onLoad:Function;
		private var _onComplete:Function;
		public function NurMusicManager()
		{
		}
		
		public static function get instance():NurMusicManager
		{
			if(_instance == null)
				_instance = new NurMusicManager();
			return _instance;
		}
		
		public function loadAndPlayMusic(file:String, volume:Number = 1, onLoad:Function = null, onComplete:Function = null):void
		{
			clearMusic();
			_music = new Sound();
			_music.addEventListener(Event.COMPLETE, onLoadSound);
			_music.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			
			_volume = volume;
			
			var req:URLRequest = VersManager.getVerURLRequest(file);
			_music.load(req);
			
			_onLoad = onLoad;
			_onComplete = onComplete;
			
			_isLoading = true;
		}
		
		public function dispose():void
		{
			clearMusic();
		}
		
		public function turnState():void
		{
			_isStop = !_isStop;
			if(_isStop)
				stop();
			else
				play();
		}
		
		private function clearMusic():void
		{
			if(_chanel != null)
			{
				_chanel.stop();
			}
			if (_music != null)
			{
				if (_isLoading)
				{
					_music.close();
				}
				_music.removeEventListener(Event.COMPLETE, onLoadSound);
				_music.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			}
			_chanel = null;
			_music = null;
		}
		
		
		
		private function stop():void
		{
			_isStop = true;
//			trace("stop  _chanel******" + this._chanel);
			if(_chanel != null)
			{
				_chanel.stop();
			}
		}
		
		private function play():void
		{
			trace("onLoadSound  play _music**************" + _music);
			trace("onLoadSound  _isStop**************" + _isStop);
			_isStop = false;
			if(_music == null)
				return;
			_chanel = _music.play(0,999,new SoundTransform(_volume));
		}
		
		private function onLoadSound(evt:Event):void
		{
			_isLoading = false;
			if(_music == null)
				return;
			_music.removeEventListener(Event.COMPLETE, onLoadSound);
			_music.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			trace("onLoadSound**************" + _isStop);
			if(!_isStop)
				play();
		}
		
		private function onIoError(evt:Event):void
		{
			_isLoading = false;
			_music.removeEventListener(Event.COMPLETE, onLoadSound);
			_music.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
		}

		public function get state():int
		{
			if(_isStop)
				return 2;
			else
				return 1;
		}

	}
}