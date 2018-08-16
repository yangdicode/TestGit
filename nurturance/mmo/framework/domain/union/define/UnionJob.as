package mmo.framework.domain.union.define
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.union.Unions;

	/**
	 * 联盟职位定义
	 * @author wangrentong
	 */	
	public class UnionJob
	{
		private var _id:int;
		private var _name:String;
		private var _authority:Array;
		
		public function UnionJob(id:int, name:String, authority:String){
			_id = id;
			_name = name;
			_authority = StringUtil.splitToInt(authority, ",");
		}
		
		public static function get notMember():UnionJob{
			return Unions.getJobByJonId(6);
		}

		public function get id():int{
			return _id;
		}

		public function get name():String{
			return _name;
		}

		/**
		 * 权限id
		 */		
		public function get authority():Array{
			return _authority;
		}

		/**
		 * 盟主
		 */		
		public function get isChariman():Boolean{
			return _id == 1;
		}

	}
}