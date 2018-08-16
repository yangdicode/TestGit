package mmo.play.material.filter
{
	import mmo.framework.domain.material.clothes.UserClothes;

	public class FavorClothesFilter extends UserMaterialFilter
	{
		private var _isFavor:Boolean;
		
		public function FavorClothesFilter(isFavor:Boolean){
			_isFavor = isFavor;
			super();
		}
		
		override public function filter(arr:Array):Array{
			var result:Array = [];
			for each(var userClo:UserClothes in arr){
				if(userClo.isFavor == _isFavor){
					result.push(userClo);
				}
			}
			return result;
		}
		
	}
}