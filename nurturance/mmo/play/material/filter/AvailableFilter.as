package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;
	
	public class AvailableFilter extends UserMaterialFilter
	{
		public function AvailableFilter()
		{
			super();
		}
		
		override public function filter(arr:Array):Array
		{
			var result:Array = [];
			for each(var um:UserMaterial in arr)
			{
				if(um.available > 0)
				{
					result.push(um);
				}	
			}
			return result;
		}	
	}
}