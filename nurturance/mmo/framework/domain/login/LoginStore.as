package mmo.framework.domain.login
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.shareobject.LocalStore;

	public class LoginStore
	{
		private static const Key:String = "SysLoginInfo";
		private static const InfoKey:String = "info";
		
		public function LoginStore()
		{
		}
		
		public static function setInfo(info:LoginLocalInfo):void{
			LocalStore.setValue(Key, info.toObject(), InfoKey);
		}
		
		public static function getInfo():LoginLocalInfo{
			var value:Object = LocalStore.getValue(Key, InfoKey);
			if(value == null){
				return null;
			}
			LocalStore.setValue(Key, null, InfoKey);
			return LoginLocalInfo.objToInfo(value);
		}
		
	}
}