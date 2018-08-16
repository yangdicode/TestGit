package mmo.framework.domain.shareobject
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.net.sendToURL;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import mmo.config.ConfigReader;
	import mmo.framework.domain.JsProxy;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.login.LoginLocalInfo;
	import mmo.loader.LoaderContainer;

	public class UsersSOProxy
	{
		private static const SO_NAME:String = "AoXAccessInfo";
		private static const recordCounts:int=3;
		
		private var _loginInfo:LoginLocalInfo;
		
		private  var so: SharedObject;
		private  var hasRefuseLocalSave:Boolean;
		private var _version:String;
		
		public function UsersSOProxy(version:String)
		{
			_version = version;
			so = SharedObject.getLocal(SO_NAME, "/");
			if(!hasAccessInfo()) 
			{
				loadFromOldDomain();
			}else{
				logPv();
				if(_version != so.data.accessInfo.version)
				{
					versionChange();
				}
			}
		}
		
		private function loadFromOldDomain():void{
			var url:String = "http://www.9aoya.com/";
			if (LoaderContainer.instance.stage.loaderInfo.url.indexOf("www.myaox1.com") >= 0 || 
				LoaderContainer.instance.stage.loaderInfo.url.indexOf("file://") >= 0)
			{
				url = "";
			}
			var urlRequest:URLRequest=new URLRequest(url + "shareobject_viewer.swf");
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSuccess);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			loader.load(urlRequest, new LoaderContext(false, ApplicationDomain.currentDomain));
		}
		
		private function onLoadError(evt:IOErrorEvent):void{
			var loaderInfo:LoaderInfo = LoaderInfo(evt.currentTarget);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			loaderInfo.removeEventListener(Event.COMPLETE, onLoadSuccess);
			versionChange();
		}
		
		private function logPv():void
		{
			var url:String = ConfigReader.instance.serviceSite
				+ "pv.jsp?src="
				+ JsProxy.getValue("getLoginSrc", "");
			url = url + "&new=" + (hasAccessInfo() ? 0 : 1);
			sendToURL(new URLRequest(url));
		}
		
		private function onLoadSuccess(evt:Event):void{
			var loaderInfo:LoaderInfo = LoaderInfo(evt.currentTarget);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			loaderInfo.removeEventListener(Event.COMPLETE, onLoadSuccess);
			
			var old:SharedObject = (loaderInfo.content["getShareObject"] as Function).apply(null, [SO_NAME]);
			if(old.data.hasOwnProperty("accessInfo")){
				so.data.accessInfo = old.data.accessInfo;
			}
			
			if(!so.data.hasOwnProperty("accessInfo") || _version != so.data.accessInfo.version){
				versionChange();
			}
			
			try{
				so.flush();
				logPv();
			}
			catch(error:Error){
			}
		}
		
		private function versionChange():void{
			so.clear();
			so.data.accessInfo = new AccessInfo();
			so.data.accessInfo.version = _version;
			logPv();
		}
				
		//服装穿着改变后，刷新本地的服装信息
		public function refreshLocalAvatarInfo(avatarInfo:String, sex:int):void
		{
			var userInfo:UserInfo = MainModelLocator.instance.retrieveModel(UserInfo) as UserInfo;
			var userLocal:UserLocalInfo = this.getUserLocalInfo(userInfo.userName);
			if(userLocal!=null)
			{
				userLocal.myAvatar = avatarInfo; 
				userLocal.sex = sex;
				this.updateSharedObject(userLocal);
			}
		}
		
		/**
		 * 设置用户名字
		 * 
		 */
		public function refreshLocalNameInfo(userName:String):void
		{
			var userInfo:UserInfo = MainModelLocator.instance.retrieveModel(UserInfo) as UserInfo;
			var userLocal:UserLocalInfo = this.getUserLocalInfo(userInfo.userName);
			if(userLocal!=null)
			{
				this.updateSharedObject(userLocal);
			}
		}
		
		public function getLocalUsers():Array
		{
			clearSpilthUserData();
			return so.data.accessInfo.users;
		}
		
		public function hasAccessInfo():Boolean{
			if(!so.data.hasOwnProperty("accessInfo")){
				return false;
			}else{
				return (so.data.accessInfo.users.length>0);
			}
		}
		
		private function getUserInfoIndexByName(userName:String):int
		{
			var users:Array=so.data.accessInfo.users;
			if(users==null)
			{
				return -1;
			}
			var len:int=users.length;
			for(var i:int=0;i<len;i++)
			{
				
				if(users[i].myName == userName)
				{
					return i;
				}
			}
			return -1;
		}
		
		public function updateSharedObject(user:UserLocalInfo):void
		{
			if(hasRefuseLocalSave)
			{
				return;
			}
			user.clearPassword();
			var index:int=this.getUserInfoIndexByName(user.myName);
			if(index!=-1)
			{
				trace("refresh local info" + user.myName);
				so.data.accessInfo.users.splice(index,1);
				if(user.isNeedToRecord())
				{
					so.data.accessInfo.users.push(user);
				}
			}
			else
			{
				if(user.isNeedToRecord())
				{
					so.data.accessInfo.users.push(user);
				}
			}
			
			clearSpilthUserData();
			//监听该事件后，检查用户是否允许在本地进行存储
			so.addEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
			try
			{
				so.flush();
			}
			catch(ex:Error)
			{
				//通常由于权限等问题可能会造成在本地无法保存信息，吃掉这个异常，避免报错
			}
		}
		
		public function getUserLocalInfo(userName:String):UserLocalInfo
		{
			var users:Array=so.data.accessInfo.users;
			var index:int=this.getUserInfoIndexByName(userName);
			if(index==-1)
			{
				return null;
			}
			else
			{
				var user:Object=users[index];
				return new UserLocalInfo(user.myName,user.myDuoduoId,user.myPassword,user.isRememberMyName,user.isRememberMyPassword,user.isAutoLogin,user.myAvatar,user.sex);
			}
		}
		
		//清楚所有缓存
		public function clear():void
		{
			so.clear();
		}	
		
		private function onFlushStatus(evt:NetStatusEvent):void
		{
			switch (evt.info.code) {
				case "SharedObject.Flush.Success":
					break;
				case "SharedObject.Flush.Failed":
					hasRefuseLocalSave = true;
					break;
			}
			so.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
		}
		
		private function clearSpilthUserData():void
		{
			while (so.data.accessInfo.users.length>recordCounts)
			{
				so.data.accessInfo.users.shift();
			}
			
			var ans:String = "";
			for(var i:int = 0; i < so.data.accessInfo.users.length; i++)
			{
				ans += so.data.accessInfo.users[i].myName + ",";
			}
			trace("=================================================");
			trace("=================================================");
			trace(ans);
			trace("=================================================");
			trace("=================================================");
			
		}

		/**
		 * 换岛的信息，不知道仍在哪里，先放这吧
		 */
		public function get loginInfo():LoginLocalInfo
		{
			return _loginInfo;
		}
		
		public function set loginInfo(value:LoginLocalInfo):void{
			_loginInfo = value;
		}
		
		public function clearLoginInfo():void{
			_loginInfo = null;
		}

	}
}