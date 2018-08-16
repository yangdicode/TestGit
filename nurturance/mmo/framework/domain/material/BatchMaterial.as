package mmo.framework.domain.material
{
	public class BatchMaterial
	{
		public function BatchMaterial(type:int, id:int, quantity:int)
		{
			_type = type;
			_id = id;
			_quantity = quantity;
		}
		
		private var _type:int;

		/**
		 * 类型
		 * */
		public function get type():int
		{
			return _type;
		}
		
		private var _id:int;

		public function get id():int
		{
			return _id;
		}

		private var _quantity:int;

		public function get quantity():int
		{
			return _quantity;
		}

	}
}