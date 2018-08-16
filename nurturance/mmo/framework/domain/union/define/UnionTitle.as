package mmo.framework.domain.union.define
{
	/**
	 * 联盟爵位定义
	 * @author wangrentong
	 */	
	public class UnionTitle
	{
		private var _id:int;
		private var _name:String;
		private var _needPrestige:int;
		private var _badge:int;
		
		public function UnionTitle(id:int, name:String, needPrestige:int, badge:int){
			_id = id;
			_name = name;
			_needPrestige = needPrestige;
			_badge = badge;
		}

		public function get id():int{
			return _id;
		}

		public function get name():String{
			return _name;
		}

		public function get needPrestige():int{
			return _needPrestige;
		}

		public function get badge():int{
			return _badge;
		}


	}
}