package mmo.play.avatar
{
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.material.clothes.ClothesConflictStrategy;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.clothes.ClothesPart;
	
	public class AvatarHelper
	{
		
		
		private static const allEyes:Array = [
			101, 107, 112, 119, 126, 131, 28, 29, 30, 31
		];
		
		
		
		public function AvatarHelper()
		{
		}
		
		public static function validateAvatarInfo(avatarInfo:AvatarInfo):void
		{
			var clothesArr:Array = avatarInfo.getClothes();
			trace("validate avatarInfo: " + avatarInfo);
			for(var i:int = clothesArr.length - 1; i >= 0; i--)
			{
				for(var j:int = i - 1; j >= 0; j--)
				{
					var clothesA:Clothes = clothesArr[i];
					var clothesB:Clothes = clothesArr[j];
					if(clothesA != null && clothesB != null && ClothesConflictStrategy.isConflict(clothesA, clothesB))
					{
						clothesArr.splice(j, 1);
					}	
				}	
			}	
			trace("after validate avatarInfo: " + avatarInfo);
		}	
		
		
		public static function putOnClothes(avatarInfo:AvatarInfo, id:int):void
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			if(wearingSameClothes(clothes, avatarInfo))
			{
				return;
			}	
			var replaced:Array = getReplacedClothes(clothes, avatarInfo);
			avatarInfo.putOnClothes(clothes);
			for each(clothes in replaced)
			{
				trace("repaced clothes id: " + clothes.id);
				avatarInfo.takeOffClothes(clothes);
			}
		}
		
		private static function wearingSameClothes(givenClohtes:Clothes, avatarInfo:AvatarInfo):Boolean
		{
			var clothesArr:Array = avatarInfo.getClothes();
			for each(var clothes:Clothes in clothesArr)
			{
				if(givenClohtes.id == clothes.id)
				{
					trace("choosen Clothes: " + givenClohtes.id + "is wearing!!")
					return true;
				}	
			}
			return false;
		}	
		
		private static function getReplacedClothes(givenClothes:Clothes, avatarInfo:AvatarInfo):Array
		{
			var replaced:Array = [];
			var clothesArr:Array = avatarInfo.getClothes();
			for each(var clothes:Clothes in clothesArr)
			{
				if(ClothesConflictStrategy.isConflict(clothes, givenClothes))
				{
					replaced.push(clothes);
				}	
			}
			return replaced;
		}	
		
		public static function takeOffClothes(avatarInfo:AvatarInfo, id:int):void
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			avatarInfo.takeOffClothes(clothes);
		}
		
		public static function isErDuo(id:int):Boolean
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			for each(var clothesPart:ClothesPart in clothes.parts)
			{
				if(clothesPart.clothesPos == SkinPosInfo.ERDUO_QIAOLING || clothesPart.clothesPos == SkinPosInfo.ERDUO_QINGLING)
				{
					return true;
				}
			}
			return false;
		}
		
		public static function isWeiBa(id:int):Boolean
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			for each(var clothesPart:ClothesPart in clothes.parts)
			{
				if(clothesPart.clothesPos == SkinPosInfo.WEIBA_HOU || clothesPart.clothesPos == SkinPosInfo.WEIBA_QIAN)
				{
					return true;
				}
			}
			return false;
		}
		
		public static function isChangableInMakeUp(id:int):Boolean
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			for each(var clothesPart:ClothesPart in clothes.parts)
			{
				if(SkinPosInfo.isMakeUpContain(clothesPart.clothesPos))
				{
					return true;
				}	
			}
			return false;
		}
		
		public static function isChangableInAvatar(id:int):Boolean
		{
			var clothes:Clothes = ClothesFacade.instance.getClothesDataById(id);
			for each(var clothesPart:ClothesPart in clothes.parts)
			{
				if(SkinPosInfo.cantChangeInAvatarCard(clothesPart.clothesPos))
				{
					return false;
				}	
			}
			return true;
		}	
		
		public static function getNakedAvatarStr(avatarInfo:AvatarInfo):String
		{			
			var key:String = "1";
			var myEye:int = getMyEye(avatarInfo);
			var myErDuo:int = getMyErDuo(avatarInfo);
			var myWeiBa:int = getMyWeiBa(avatarInfo); 
			key = key + ";" + myEye;
			if(myErDuo != 0)
			{
				key = key + ";" + myErDuo;
			}
			if(myWeiBa != 0)
			{
				key = key + ";" + myWeiBa;
			}
			return key;
		}
		
		private static function getMyEye(avatarInfo:AvatarInfo):int
		{
			var arr:Array = avatarInfo.getClothes();
			var ids:Array = [];
			for each(var clothes:Clothes in arr)
			{
				ids.push(clothes.id);
			}
			trace("my clothes id: " + ids);
			for each(var eye:int in allEyes)
			{
				if(ids.indexOf(eye) > -1)
				{
					return eye;
				}	
			}
			return 28;
		}	
		
		private static function getMyErDuo(avatarInfo:AvatarInfo):int
		{
			var clothes:Array = avatarInfo.getClothes();
			for each (var item:Clothes in clothes)
			{
				if(isErDuo(item.clothesId))
				{
					return item.clothesId;
				}
			}
			return 0;
		}
		
		private static function getMyWeiBa(avatarInfo:AvatarInfo):int
		{
			var clothes:Array = avatarInfo.getClothes();
			for each (var item:Clothes in clothes)
			{
				if(isWeiBa(item.clothesId))
				{
					return item.clothesId;
				}
			}
			return 0;
		}
	}
}
