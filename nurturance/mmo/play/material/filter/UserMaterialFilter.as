package mmo.play.material.filter
{
	public class UserMaterialFilter
	{
		public function UserMaterialFilter()
		{
		}
		
		public function filter(arr:Array):Array
		{
			return arr;
		}					
		
		public static function applyFilters(umArr:Array, filters:Array):Array
		{
			var result:Array = umArr;
			for each(var filter:UserMaterialFilter in filters)
			{
				result = filter.filter(result);
			}
			return result;
		}	
		
		private function compileFilter():void
		{
			var af:AvailableFilter;
			var cyaf:ClothesTypeArrFilter;
			ClothesExceptTypeFilter;
			var taf:TypeArrFilter;
			var bf:BindFilter;
			var tf:TradeFilter;
			var ct:ClothesTypeFilter;
			var cf:FavorClothesFilter;
		}	
	}
}