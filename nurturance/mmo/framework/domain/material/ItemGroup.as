package mmo.framework.domain.material
{
	/**
	 * 
	 * 定义一个物品集合, 由一个物品类型和子类型数组来定义
	 * 也就是 一种物品中所有属于指定子类型中的一种的物品集合
	 * 
	 * */
	public class ItemGroup
	{
		public function ItemGroup(materialType:int, subTypes:Array)
		{
			_materialType = materialType;
			_subTypes = subTypes;
		}
		
		/**
		 * 物品 类型
		 * 
		 * */
		private var _materialType:int;

		public function get materialType():int
		{
			return _materialType;
		}
		
		/**
		 * 包含的子类型
		 * 
		 * */
		private var _subTypes:Array;
		
		public function get subTypes():Array
		{
			return _subTypes;
		}
		
		public function combinate(ig:ItemGroup):ItemGroup
		{
			if(ig.materialType != this.materialType)
			{
				throw new Error("不同物品类型不能合并");
			}	
			return new ItemGroup(_materialType, subTypes.concat(ig.subTypes));
		}	
	}
}