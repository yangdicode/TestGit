package mmo.framework.domain.card
{
	public class CardGroup
	{
		private var _id:int;
		private var _group:int;
		private var _level:int;
		
		public function CardGroup(id:int, group:int, level:int)
		{
			_id = id;
			_group = group;
			_level = level;
		}

		/**
		 * 卡片Id 
		 */		
		public function get id():int
		{
			return _id;
		}

		/**
		 * 卡片属于的组（则1级的该卡片的编号） 
		 */		
		public function get group():int
		{
			return _group;
		}
		
		/**
		 * 卡片的等级 
		 */
		public function get level():int
		{
			return _level;
		}


	}
}