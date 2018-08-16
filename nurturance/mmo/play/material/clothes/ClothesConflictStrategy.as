package mmo.play.material.clothes
{
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.avatar.SkinPosInfo;
	import mmo.play.material.clothes.ClothesPart;

	public class ClothesConflictStrategy
	{
		public function ClothesConflictStrategy()
		{
		}
		
		/**
		 * 判断2件衣服是否冲突 是看新衣服与旧衣服的重合位置要达到n - 1,其中n为旧衣服的部件的数量
		 * 
		 * */
		public static function isConflict(oldC:Clothes, newC:Clothes):Boolean
		{
//			if(isAllContainQuGan(oldC, newC))
//			{
//				return true;
//			}	
			var oldCPartNum:int = oldC.parts.length;
			var samePartNum:int = 0;
			for each(var cp:ClothesPart in oldC.parts)
			{
				if(hasSamePart(newC, cp))
				{
					return true;
				}
			}
//			if(samePartNum && (samePartNum >= oldCPartNum - 1)) 
//			{
//				return true;
//			}	
			return false;
		}	
		
		//如果两件都包含躯干那么就是冲突的
		private static function isAllContainQuGan(oldC:Clothes, newC:Clothes):Boolean
		{
			var oldContain:Boolean = false;
			var newContain:Boolean = false;
			for each(var cp:ClothesPart in oldC.parts)
			{
				if(cp.clothesPos == SkinPosInfo.SHANGYI_QUGAN)
				{
					oldContain = true;
				}	
			}
			for each(cp in newC.parts)
			{
				if(cp.clothesPos == SkinPosInfo.SHANGYI_QUGAN)
				{
					newContain = true;
				}	
			}
			return oldContain && newContain;
		}
		
		private static function hasSamePart(clothes:Clothes, givenCp:ClothesPart):Boolean
		{
			for each(var cp:ClothesPart in clothes.parts)
			{
				if( cp.clothesPos == givenCp.clothesPos ||
					(isDefultPants(clothes) && isDefaultQunziPart(givenCp.clothesPos)) || 
					(isFootPart(cp.clothesPos) && isFootPart(givenCp.clothesPos))||
					(isPiFengPart(cp.clothesPos) && isPiFengPart(givenCp.clothesPos))||
					(isBeiBuPart(cp.clothesPos) && isBeiBuPart(givenCp.clothesPos)||
					(isErDuoPart(cp.clothesPos) && isErDuoPart(givenCp.clothesPos))
					)
				)
				{
					return true;
				}	
			}
			return false;
		}	
		
		
		//靴子和鞋子两个部位,同为脚部不能同时存在
		private static function isFootPart(clothesPos:int):Boolean
		{
			return clothesPos == SkinPosInfo.XUEZI || clothesPos == SkinPosInfo.XIEZI;
		}
		
		//背部饰品
		private static function isBeiBuPart(clothesPos:int):Boolean
		{
			return clothesPos == SkinPosInfo.BEIBU_SHIPIN_QIAN || clothesPos == SkinPosInfo.BEIBU_SHIPIN_HOU;
		}
		
		//披风
		private static function isPiFengPart(clothesPos:int):Boolean
		{
			return clothesPos == SkinPosInfo.PIFENG_QIAN || clothesPos == SkinPosInfo.PIFENG_HOU;
		}
		
		private static function isErDuoPart(clothesPos:int):Boolean
		{
			return clothesPos == SkinPosInfo.ERDUO_QIAOLING || clothesPos == SkinPosInfo.ERDUO_QINGLING;
		}
		
		private static function isDefultPants(clothes:Clothes):Boolean{
			return clothes.id == 23 || clothes.id == 25;
		}
		
		private static function isDefaultQunziPart(clothesPos:int):Boolean{
			return clothesPos == SkinPosInfo.KUZI || clothesPos == SkinPosInfo.QUNZI;
		}
	}
}