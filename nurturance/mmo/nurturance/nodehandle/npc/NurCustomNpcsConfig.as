package mmo.nurturance.nodehandle.npc
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.avatar.AvatarInfo;

	public class NurCustomNpcsConfig
	{
		private static const Config:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurCustomNpcsConfig") as Class;
		
		public function NurCustomNpcsConfig()
		{
		}
		
		public static function getCustomNpcAvatar(id:int, faceId:int):AvatarInfo
		{
			return Config["getCustomNpcAvatar"](id, faceId);
		}
		
		public static function get data():Object
		{
			return Config["data"];
		}
	}
}