package mmo.play.material.filter
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.material.filter.UserMaterialFilter;
	
	public class ClothesTypeFilter extends UserMaterialFilter
	{
		private var _cloType:*;
		public function ClothesTypeFilter(cloType:*){
			_cloType = cloType;
		}
		
		override public function filter(arr:Array):Array{
			if(StringUtil.isEmpty(_cloType)){
				return arr;
			}	
			var result:Array = [];
			for each(var um:UserMaterial in arr){
				if(checkType(Clothes(um.material).type)){
					result.push(um);
				}
			}
			return result;
		}
		
		private function checkType(type:String):Boolean{
			if(_cloType is String){
				return type == _cloType;
			}else if(_cloType is Array){
				return (_cloType as Array).indexOf(type) >= 0;
			}else{
				return false;
			}
		}
		
	}
}