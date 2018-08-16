package mmo.framework.domain.union.top
{
	
	
	/**
	 * 联盟与联盟之间排行榜
	 * @author wangrentong
	 */	
	public class UnionTopInfo extends UnionTopInfoBase
	{
		private var _unionId:int;
		
		public function UnionTopInfo(rk:int, name:String, score:Number, uId:int){
			_unionId = uId;
			super(rk, name, score);
		}

		public function get unionId():int{
			return _unionId;
		}

	}
}