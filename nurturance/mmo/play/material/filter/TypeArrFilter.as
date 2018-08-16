package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.visitor.MaterialSubTypeVisitor;
	
	public class TypeArrFilter extends UserMaterialFilter
	{
		protected var _typeArr:Array;
		public function TypeArrFilter(typeArr:Array)
		{
			super();
			_typeArr = typeArr;
		}
		
		override public function filter(arr:Array):Array
		{
			if(_typeArr == null)
			{
				return arr;
			}	
			var result:Array = [];
			for each(var um:UserMaterial in arr)
			{
				if(isInTypeArr(um))
				{
					result.push(um);
				}	
			}
			return result;
		}	
		
		protected function isInTypeArr(um:UserMaterial):Boolean
		{
			var subType:int = um.material.accept(new MaterialSubTypeVisitor());
			return _typeArr.indexOf(subType) >= 0;
		}	
	}
}