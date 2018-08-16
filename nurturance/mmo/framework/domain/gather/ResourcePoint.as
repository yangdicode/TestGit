package mmo.framework.domain.gather
{
	public class ResourcePoint
	{
		/** 资源Id **/
		private var _id:int;
		
		/** 资源名称 **/
		private var _name:String;
		
		/** 所属主类型(ResourceType) */
		private var _type:int;
		
		/** 资源等级 **/	
		private var _level:int;
		
		/** 每天可采集次数 **/
		private var _gatherTimes:int ;
		
		/** 资源可采集等级 **/		
		private var _needGatherLevel:int;
		
		/** 采集需要的体力值 */
		private var _gatherHp:int;
		
		public function ResourcePoint(id:int,name:String,type:int,level:int,gatherTimes:int,
									    needGatherLevel:int,gatherHp)
		{
			this._id = id;
			this._name = name;
			this._type = type;
			this._level = level;
			this._gatherTimes = gatherTimes;
			this._needGatherLevel = needGatherLevel;
			this._gatherHp = gatherHp;
		}
			
		/** 资源Id **/
		public function get id():int
		{
			return _id;
		}
		
		/** 资源名称 **/
		public function get name():String
		{
			return _name;
		}
		
		/** 所属主类型(ResourceType) */
		public function get type():int
		{
			return _type;
		}
		
		/** 资源等级 */
		public function get level():int
		{
			return _level;
		}
		
		/** 每天可采集次数 */
		public function get gatherTimes():int
		{
			return _gatherTimes;
		}
		
		/** 资源可采集等级 **/		
		public function get needGatherLevel():int
		{
			return _needGatherLevel;
		}
		
		/** 采集需要的体力值 */
		public function get gatherHp():int
		{
			return _gatherHp;
		}
	}
}