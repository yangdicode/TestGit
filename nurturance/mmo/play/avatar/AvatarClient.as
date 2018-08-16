package mmo.play.avatar
{

	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.UserVariableClient;
	import mmo.framework.domain.uservar.UserVarKeys;

	public class AvatarClient
	{

		//~ constants ---------------------------------------------------------

		private static const EXTENSIONS_NAME:String = "ClothFurnitureExtension";

		//~ fields ------------------------------------------------------------
		/** 获得用户穿着的服装信息 */
		public static const GET_USER_AVATARINFO:String = "18_5";
		
		private static var _instance:AvatarClient;
		//~ package private methods -------------------------------------------

		function AvatarClient()
		{
		}

		static function getInstance():AvatarClient
		{
			if (_instance == null)
			{
				_instance = new AvatarClient();
			}
			return _instance;
		}

		//~ private methods ---------------------------------------------------

		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		
		public function getUserAvatarInfo(userName:String):void
		{
			this.sendXtMessage(GET_USER_AVATARINFO, {"name" : userName});
		}	
		
		public function updateMyAvatarInfo(avatarInfo:String):void
		{
			var variables:Object = {};
			variables[UserVarKeys.Avatar] = avatarInfo;
			UserVariableClient.instance.setUserVariables(variables);
		}	
	}
}