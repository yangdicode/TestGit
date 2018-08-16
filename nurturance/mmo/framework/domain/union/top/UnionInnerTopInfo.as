package mmo.framework.domain.union.top
{
	
	
	/**
	 * 联盟内部个人榜
	 * @author wangrentong
	 */	
	public class UnionInnerTopInfo extends UnionTopInfoBase
	{
		public function UnionInnerTopInfo(rk:int, name:String, score:Number){
			super(rk, name, score);
		}
	}
}