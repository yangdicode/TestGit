package mmo.common
{	
	/**
	 * 范围最大最好不要超过10的9次方
	 * */
	public class ConfuseInteger
	{
		private static var RANGE:int = int(int.MAX_VALUE / 3);
		private var value:int;
		
		private var offset:int;
		
		public function ConfuseInteger(value:int = 0)
		{
			this.setValue(value);
		}
		
		/**
		 * 返回实际值
		 * */
		public function setValue(value:int):int
		{
			this.offset = Math.random() * RANGE + RANGE;
			this.value = value + offset;
			return getValue();
		}
		
		public function getValue():int
		{
			return this.value - this.offset;
		}
		
		/**
		 * 加减法。减法则传入负数
		 * 返回实际值
		 * */
		public function add(value:int):int
		{
			return this.setValue(this.getValue() + value);
		}
		
		/**
		 * 乘除法
		 * 返回实际值
		 * */
		public function multi(value:int):int
		{
			return this.setValue(this.getValue() * value);
		}
		
	}
}