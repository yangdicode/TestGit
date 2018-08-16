package mmo.framework.domain.honor
{
	import flash.filters.GlowFilter;

	public class BadgeLv
	{
		private var _color:uint;
		private var _filter:GlowFilter;
		private var _priority:int;
		/**
		 * 称号颜色 
		 * @param color			字体颜色
		 * @param glowColor		发光颜色，特殊原因所以0x000000是当作不发光
		 * 
		 */		
		public function BadgeLv(priority:int, color:uint, glowColor:uint = 0x000000)
		{
			_priority = priority;
			_color = color;
			if (glowColor != 0x000000)
			{
				_filter = new GlowFilter(glowColor, 1.0, 5.0, 5.0, 3);
			}
		}
		
		public function get color():uint
		{
			return _color;
		}

		public function get filter():GlowFilter
		{
			return _filter;
		}
		
		public function get priority():int
		{
			return _priority;
		}
	}
}