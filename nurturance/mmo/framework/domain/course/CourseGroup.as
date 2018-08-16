package mmo.framework.domain.course
{
	/**
	 * 课程组，主要用于列表显示 
	 * @author liyawei
	 */	
	
	public class CourseGroup
	{
		private var _groupId:int;
		private var _groupName:String;
		private var _groupType:int;
		private var _courses:Array;
		private var _addAttrType:int;
		
		public function CourseGroup(id:int,name:String,groupType:int,courses:Array,addAttrType:int)
		{
			this._groupId = id;
			this._groupName = name;
			this._groupType = groupType;
			this._courses = courses;
			this._addAttrType = addAttrType;
		}
		
		/**
		 * 组Id
		 */		
		public function get groupId():int
		{
			return _groupId;
		}
		
		/**
		 * 名称
		 */		
		public function get groupName():String
		{
			return _groupName;
		}
		
		/**
		 * 所属基本类型类别（CourseGroupType）
		 */		
		public function get groupType():int
		{
			return _groupType;
		}
		
		/**
		 * 所含课程Id
		 */		
		public function get courses():Array
		{
			return _courses;
		}
		
		/**
		 * 主要添加属性（AttrType）
		 */		
		public function get addAttrType():int
		{
			return _addAttrType;
		}
	}
}