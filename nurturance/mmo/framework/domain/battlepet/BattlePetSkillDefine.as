package mmo.framework.domain.battlepet
{
	public class BattlePetSkillDefine
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _wayToGet:String;
		private var _type:String;
		private var _subType:String;
		private var _pow:int;
		private var _area:String;
		private var _critical:int;
		
		public function BattlePetSkillDefine(id:int,
											  name:String,
											  desc:String,
											  wayToGet:String,
											  type:String,
											  subType:String,
											  pow:int,
											  area:String,
											  critical:int
											  )
		{
			_id = id;
			_name = name;
			_desc = desc;
			_wayToGet = wayToGet;
			_type = type;
			_subType = subType;
			_pow = pow;
			_area = area;
			_critical = critical;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}
		
		public function get desc():String
		{
			return _desc;
		}
		
		public function get wayToGet():String
		{
			return _wayToGet;
		}

		public function get type():String
		{
			return _type;
		}

		public function get subType():String
		{
			return _subType;
		}

		public function get pow():int
		{
			return _pow;
		}
		
		public function get area():String
		{
			return _area;
		}

		public function get critical():int
		{
			return _critical;
		}
	}
}