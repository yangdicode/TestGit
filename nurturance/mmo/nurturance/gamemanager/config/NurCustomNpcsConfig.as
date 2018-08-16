package mmo.nurturance.gamemanager.config
{
	import mmo.framework.domain.avatar.AvatarInfo;

	public class NurCustomNpcsConfig
	{
		public function NurCustomNpcsConfig()
		{
		}
		
		public static function getCustomNpcAvatar(id:int, faceId:int):AvatarInfo
		{
			var avatar:AvatarInfo = new AvatarInfo();
			avatar.setDefaultClothesBySex(false);
			avatar.setAvatarInfoWithString(data[id][faceId-1]);
			return avatar;
		}
		
		public static const data:Object = 
			{
				"100041":["24;25;27;1;107;2751;7210;7499;7502;7504;7505;17578;7506"],
				"100051":["24;25;27;1;10567;16533;107;15119;15122;15121;12256;12311;15124;3525"],
				"100052":["24;25;27;1;107;15124;8632;5394;5389;5392;5393;4079;5235"]
			};
	}
}