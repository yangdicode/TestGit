package mmo.play.avatar.helper
{
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.avatar.AvatarInfoParser;
	import mmo.play.player.dressily.Dressily;

	/**
	 * 获得个dressily对象
	 * @author liyawei
	 */	
	
	public class DressilyAvatarHelper
	{
		public function DressilyAvatarHelper()
		{
		}
		
		/**
		   info string信息格式
			    * 		1;3;5;...
				* 		逗号隔开服装，仅有服装编号
		   info AvatarInfo 服装avatar
		   info	Array 物品列表，以Clohes为元素的数组
		**/
		public static function getDressilyByInfo(info:*,needShadow:Boolean = true):Dressily
		{
			var clothesList:Array;
			var avatarInfo:AvatarInfo = new AvatarInfo();
			
			if(info is AvatarInfo){
				avatarInfo = info;
			}else{
				if(info is String){
					clothesList = AvatarInfoParser.parseAvatarInfo(info);
				}else if(info is Array){
					clothesList = info;
				}else {
					return null;
				}
				avatarInfo.setAvatarInfoWithItemList(clothesList);
			}
			
			var dressily:Dressily = new Dressily(null, avatarInfo, needShadow);
			return dressily;
		}
	}
}