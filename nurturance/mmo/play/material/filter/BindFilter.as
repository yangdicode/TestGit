package mmo.play.material.filter
{
	import mmo.framework.domain.material.UserMaterial;

	public class BindFilter extends UserMaterialFilter
	{
		/**
		 * 绑定的东西不能回购
		 * 过滤绑定的东西
		 * */
		public function BindFilter()
		{
		}
		
		override public function filter(arr:Array):Array
		{
			var result:Array = [];
			for each(var um:UserMaterial in arr)
			{
				if(!um.material.isBind)
				{
					result.push(um);
				}	
			}
			return result;
		}	
	}
}