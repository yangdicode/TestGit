package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.material.clothes.ClothesPart;

	public class ClothesExceptTypeFilter extends TypeArrFilter
	{
		public function ClothesExceptTypeFilter(typeArr:Array)
		{
			super(typeArr);
		}
		
		
		override protected function isInTypeArr(um:UserMaterial):Boolean{
			var clothes:Clothes = um.material as Clothes;
			for each( var cp:ClothesPart in clothes.parts){
				if(_typeArr.indexOf(cp.clothesPos) >= 0){
					return false;
				}	
			}
			return true;
		}
	}
}