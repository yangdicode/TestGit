package mmo.play.material
{
	public interface IUserMaterialVisitor
	{
		/**
		 * 
		 * 用户获取 用户的所拥有的物品信息
		 * */
		function visit(filters:Array):Array;
	}
}