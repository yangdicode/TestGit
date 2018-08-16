package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;
	
	public class TradeFilter extends UserMaterialFilter
	{
		public function TradeFilter()
		{
			super();
		}
		
		override public function filter(arr:Array):Array
		{
			var result:Array = [];
			for each(var um:UserMaterial in arr)
			{
				if(um.material.canTrade)
				{
					result.push(um);
				}	
			}
			return result;
		}	
	}
}