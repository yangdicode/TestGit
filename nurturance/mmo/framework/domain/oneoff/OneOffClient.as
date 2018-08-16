package mmo.framework.domain.oneoff
{
	import flash.utils.Dictionary;
	
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.logindataclient.LoginDataClient;

	public class OneOffClient extends LoginDataClient
	{
		private static var _instance:OneOffClient;
		private var _callBackList:Object = {};
		private var _callBackIndex:Dictionary = new Dictionary();
		public static function get instance():OneOffClient
		{
			if(_instance == null)
			{
				_instance = new OneOffClient();
			}	
			return _instance;
		}	
		
		public function OneOffClient()
		{
			SocketClient.instance.addEventListener(ON_ONEOFF_UPDATE, onUpdate);	
			SocketClient.instance.addEventListener(ON_COMMONONEOFF_UPDATE, onCommonOneoffUpdate);
		}
		
		override public function addDataListener():void{
			SocketClient.instance.addEventListener(INITONEOFF, onInitOneoff);
		}
		
		private static const extensionName:String = "OneoffExtension";		
		private static const INITONEOFF:String = "42_oneoff";
		public static const SET_ONEOFF:String = "42_1";
		public static const TAKE_COMMON_ONEOFF_STATE:String = "42_2";
		public static const GET_ALL_COMMON_ONEOFF_STATE:String = "42_3";
		public static const CMD_MARK_TEMP_ONEOFF:String = "42_4";
		public static const CMD_MARK_SYSTEM_FLAG_ONEOFF:String = "42_5";
		
		public static const ON_ONEOFF_UPDATE:String = "42_e1";
		public static const ON_COMMONONEOFF_UPDATE:String = "42_e2";
		
		private function onInitOneoff(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(INITONEOFF, onInitOneoff);
			
			var data:OneOffData = new OneOffData(evt.params["state"]);
			MainModelLocator.instance.addModel(OneOffData, data);
			super.onDataInited();
		}	
		
		private function onUpdate(evt:SocketClientEvent):void
		{
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			var id:int = evt.params["id"];
			data.setDone(id);
		}	
		
		private function onCommonOneoffUpdate(evt:SocketClientEvent):void
		{
			var key:String = evt.params.key;
			var index:int = evt.params.index;
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			data.setCommonDoneByIndex(key, index);
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, params);
		}
		
		public function setOneOff(typeId:int):void
		{
			this.sendXtMessage(SET_ONEOFF,{"id": typeId});
		}
		
		/**
		 * 防止当网络延时等因素服务器没有及时返回setDone,手动先setDone的方法 
		 * @param typeId
		 * 
		 */		
		public function setOneOffDone(typeId:int):void
		{
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			data.setDone(typeId);
		}
		
		public function setCommonOneOffDone(key:String, index:int):void
		{
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			data.setCommonDoneByIndex(key, index);
		}
		
		/**
		 * @param callBack:反回Object;例：{"1":false, "2":false, "3":true}
		 * @param key 在OneOffKey里头
		 * @param index 要取哪位,例:[1,2,3,4,6],int类型
		 */		
		public function getCommonOneOffState(key:String, indexs:Array, callBack:Function):void
		{
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			if(data.hasCommonState(key, indexs))
			{
				callBack.apply(null, [data.getCommonState(key, indexs)]);
			}else
			{
				//4个字，历史原因。
				if(!_callBackList.hasOwnProperty(key)){
					_callBackList[key] = [];
				}
				if((_callBackList[key] as Array).length <= 0){
					getAllCommonOneoffStateFromServer(key);
				}
				(_callBackList[key] as Array).push(callBack);
				_callBackIndex[callBack] = indexs;
			}
		}
		
		public function getAllCommonOneoffState(key:String, callBack:Function):void{
			getCommonOneOffState(key, null, callBack);
		}
		
		public function setTempOneOff(index:int):void
		{
			this.sendXtMessage(CMD_MARK_TEMP_ONEOFF, {"index":index});
		}
		
		/**
		 * index 不能超过1024
		 * 使用前请在SystemFlagTypes占位
		 */
		public function setSystemFlag(index:int):void{
			if(index > 1024){
				throw new Error("index不能超过1024");
			}
			var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
			data.setCommonDoneByIndex(OneOffKey.SystemFlag, index);
			this.sendXtMessage(CMD_MARK_SYSTEM_FLAG_ONEOFF, {"index":index});
		}
		
		/**
		 * 向后端取
		 * 某些时候自己的数据被别人改变，要向后台取，所以改为public方法  by赖文龙
		 */		
		public function getCommonStateFromServer(key:String, indexs:Array, callBack:Function):void
		{
			if(key == "" || key == null || indexs == null || indexs.length == 0)
				throw Error("common one off no key~~");
			function onGetState(evt:SocketClientEvent):void
			{
				if(evt.params.indexs != indexs.toString())
					return;
				SocketClient.instance.removeEventListener(TAKE_COMMON_ONEOFF_STATE, onGetState);
				var stateStr:String = evt.params.ret;
				var state:Object = translateState(stateStr);
				var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
				for(var index:String in state)
				{
					data.setCommonStateByIndex(key, int(index), state[index]);
				}
				callBack.apply(null, [state]);
			}
			SocketClient.instance.addEventListener(TAKE_COMMON_ONEOFF_STATE, onGetState);
			this.sendXtMessage(TAKE_COMMON_ONEOFF_STATE, {"key":key, "indexs":indexs.toString()});
		}
		
		private function getAllCommonOneoffStateFromServer(key:String):void
		{
			SocketClient.instance.addEventListener(GET_ALL_COMMON_ONEOFF_STATE, onGetAllState);
			this.sendXtMessage(GET_ALL_COMMON_ONEOFF_STATE, {"key":key});
			function onGetAllState(evt:SocketClientEvent):void
			{
				if(evt.params.key != key)
					return;
				SocketClient.instance.removeEventListener(GET_ALL_COMMON_ONEOFF_STATE, onGetAllState);
				var data:OneOffData = MainModelLocator.instance.retrieveModel(OneOffData) as OneOffData;
				data.setCommonStateByByte(key, evt.params.state);
				for each(var callBack:Function in _callBackList[key]){
					callBack.apply(null, [data.getCommonState(key, _callBackIndex[callBack])]);
					delete _callBackIndex[callBack];
				}
				_callBackList[key] = [];
			}
		}
		
		private function translateState(stateStr:String):Object
		{
			var state:Object = new Object();
			var strs:Array = stateStr.split(",");
			for each(var str:String in strs)
			{
				var s:Array = str.split("-");
				var index:String = String(s[0]);
				var stateInt:int = int(s[1]);
				state[index] = stateInt;
			}
			return state;
		}
		
	}
}