package mmo.framework.domain.property
{
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.material.clothes.Clothes;

	public class FashionHelper
	{
		public function FashionHelper()
		{
		}
		
		public static function getFashion(avatarInfo:AvatarInfo):int
		{
			var fashion:int = 0;
			var clothesArr:Array = avatarInfo.getClothes();
			for each(var clothes:Clothes in clothesArr)
			{
				fashion += clothes.fashion;
			}
			return fashion;
		}	
	}
}