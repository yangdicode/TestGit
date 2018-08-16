package mmo.framework.domain.union.top
{
	
	
	/**
	 * 各联盟之间个人榜
	 * @author wangrentong
	 */	
	public class UnionOuterTopInfo extends UnionTopInfoBase
	{
		private var _unionId:int;
		private var _unionName:String;
		
		public function UnionOuterTopInfo(rk:int, name:String, score:Number, uId:int, unionName:String){
			_unionId = uId;
			_unionName = unionName;
			super(rk, name, score);
		}

		public function get unionName():String{
			return _unionName;
		}

		public function get unionId():int{
			return _unionId;
		}


	}
}