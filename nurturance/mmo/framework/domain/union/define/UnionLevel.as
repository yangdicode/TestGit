package mmo.framework.domain.union.define
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.union.Unions;

	/**
	 * 联盟等级定义
	 * @author wangrentong
	 */	
	public class UnionLevel
	{
		private var _level:int;
		private var _needHonor:int;
		private var _needFund:int;
		private var _population:int;
		private var _roleNum:Array;
		
		public function UnionLevel(level:int, honor:int, fund:int, population:int, roleNum:String){
			_level = level;
			_needHonor = honor;
			_needFund = fund;
			_population = population;
			_roleNum = StringUtil.splitToInt(roleNum, ",");
		}
		
		public function get isMaxLevel():Boolean{
			return _level == Unions.MaxUnionLevel;
		}

		public function get level():int
		{
			return _level;
		}

		/** 升级需要荣耀 */
		public function get needHonor():int
		{
			return _needHonor;
		}

		/** 升级需要资金 */
		public function get needFund():int
		{
			return _needFund;
		}

		/** 人口上限 */
		public function get population():int
		{
			return _population;
		}

		/** 各级成员数量 */
		public function get roleNum():Array
		{
			return _roleNum;
		}
		/** 会长默认1 */
		public function getRoleNum(roleId:int):int{
			if(roleId == 1){
				return 1;
			}
			return _roleNum[roleId - 2];
		}

	}
}