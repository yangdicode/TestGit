package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.material.clothes.ClothesPart;
	import mmo.play.material.filter.TypeArrFilter;
	
	public class ClothesTypeArrFilter extends TypeArrFilter
	{
		public function ClothesTypeArrFilter(typeArr:Array)
		{
			super(typeArr);
		}
		
		override protected function isInTypeArr(um:UserMaterial):Boolean
		{
			var clothes:Clothes = um.material as Clothes;
			for each( var cp:ClothesPart in clothes.parts)
			{
				if(_typeArr.indexOf(cp.clothesPos) >= 0)
				{
					return true;
				}	
			}
			return false;
		}	
	}
}