package mmo.framework.domain.shareobject
{
	public class UserLocalInfo
	{
		public var myName:String;
		public var myAvatar:String;
		public var sex:int;
		public var myPassword:String;
		public var myDuoduoId:int;
		public var isRememberMyName:Boolean;
		public var isRememberMyPassword:Boolean;
		public var isAutoLogin:Boolean;
		
		public function UserLocalInfo(myName:String, myDuoduoId:int, myPassword:String=null,
		isRememberMyName:Boolean=false,isRememberMyPassword:Boolean=false,
		isAutoLogin:Boolean=false,myAvatar:String=null, sex:int = 0)
		{
			this.myName = myName;
			this.myDuoduoId = myDuoduoId;
			this.myPassword = myPassword;
			this.isAutoLogin = isAutoLogin;
			this.isRememberMyName = isRememberMyName;
			this.isRememberMyPassword = isRememberMyPassword;
			this.myAvatar = myAvatar;
			this.sex = sex;
		}
		
		//如果用户勾选了相应CheckBox,则需要在本地进行记录；
		public function isNeedToRecord():Boolean
		{
			return (this.isRememberMyName||this.isRememberMyPassword||this.isAutoLogin);
		}
		
		public function get loginWay():String
		{
			if(this.isRememberMyPassword)
			{
				return "auto";
			}
			else if(!this.isRememberMyPassword&&this.isRememberMyName)
			{
				return "rememberName";
			}
			else
			{
				return "manual";
			}
		}
		
		public function clearPassword():void
		{
			if(this.isRememberMyPassword||this.isAutoLogin)
			{
				return ;
			}
			this.myPassword="";
		}
	}
}