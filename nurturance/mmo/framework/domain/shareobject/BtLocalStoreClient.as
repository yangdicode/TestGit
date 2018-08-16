package mmo.framework.domain.shareobject
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	public class BtLocalStoreClient
	{
		//开发测试
		//private static const URL:String = "http://devlocalstore.100bt.com/btlocalstore/btlocalstore.swf";	
		
		private static const URL:String = "http://localstore.100bt.com/btlocalstore/btlocalstore.swf";	
		
		private var _gameDataCenter:Object;
		private var _callBack:Function;
		private var _isStartLoad:Boolean = false;
		
		private static const _instance:BtLocalStoreClient = new BtLocalStoreClient();
		
		public function BtLocalStoreClient()
		{
		}
		
		public static function get instance():BtLocalStoreClient{
			return _instance;
		}
		
		public function tryConnectCenter(callBack:Function):void{
			if(_gameDataCenter == null && !_isStartLoad ){
				_callBack = callBack;
				loadBtLocalStoreService();
			}else{
				if( callBack != null )
					callBack.apply();
			}
		}
		//gameDataCenter.putAccountInfo({"gameId": 2, "gameName":"奥拉星", "duoduoId": 501241, "account": 123456789, "password":"abc123456abc"});
			
		/**
		 *	获取信息 
		 * @return Object数组
		 * 	gameId: 游戏id, 主要返回给游戏特殊处理  必传
			gameName: 游戏名,传上就返回什么  必传
			duoduoId: 百田多多号  必传
			account: 登陆账户(多多号/手机/邮箱), 注意: 昵称登陆的时候 account 必须传duoduo号  必传
			password :  MD5 散列后的密码 选传
		 */		
		public function getAccountInfos():Array{
			if( _gameDataCenter != null )
				return _gameDataCenter.getAccountInfos();
			return [];
		}
		/**
		 *	设置信息 info:Object包含节点: 
		 * 	gameId: 游戏id, 主要返回给游戏特殊处理  必传
		 	gameName: 游戏名,传上就返回什么  必传
			duoduoId: 百田多多号  必传
		 	account: 登陆账户(多多号/手机/邮箱), 注意: 昵称登陆的时候 account 必须传duoduo号  必传
		 	password :  MD5 散列后的密码 选传
		 */	
		public function setAccountInfo(info:Object):void{
			if( _gameDataCenter != null )
				_gameDataCenter.putAccountInfo(info);			
		}
		
		private function loadBtLocalStoreService():void
		{
			_isStartLoad  = true;
			createURLLoader(URL);
		}
		
		private function createURLLoader(url:String):void
		{
			var loader:Loader = new Loader();
			try
			{
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoaderIoError);
				loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoaderSqError);
				var url:String = url + "?" + new Date().time ;
				var urlRequest:URLRequest = new URLRequest(url);
				loader.load(urlRequest);
			}
			catch(error:Error)
			{
				closeLoader(loader);
			}
		}
				
		private function onLoaderIoError(evt:IOErrorEvent):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			closeLoader(loaderInfo.loader);
		}
		
		private function onLoaderSqError(evt:SecurityErrorEvent):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			closeLoader(loaderInfo.loader);
		}
		
		private function onLoaderComplete(evt:Event):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			closeLoader(loaderInfo.loader);
			try
			{
				var cls:Class = loaderInfo.applicationDomain.getDefinition("mmo.btlocalstore.BtLocalStoreService") as Class;
				_gameDataCenter = new cls() as Object;
				if( _callBack != null )
					_callBack.apply();
			}catch( error:Error){				
			}
		//	_gameDataCenter.putAccountInfo({"gameId": 2, "gameName":"奥拉星", "duoduoId": 501241, "account": 123456789, "password":"abc123456abc"});
		//	_gameDataCenter.putAccountInfo({"gameId": 11, "gameName":"奥拉星", "duoduoId": 501242, "account": 123456789});
//			var list:Array = _gameDataCenter.getAccountInfos();
//			for(var index:int = 0; index < list.length; index++)
//			{
//				trace("GameLocalData:" + list[index].duoduoId + ":" + list[index].gameName + ":" + list[index].duoduoId + ":" + list[index].account + ":" + list[index].password);
//			}
		}
		
		private function closeLoader(loader:Loader):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoaderComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoaderIoError);
			loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoaderSqError);
		}
		
		
	}
}