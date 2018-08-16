package mmo.framework.domain.skill.stuff
{
	/**
	 * 材料途径选择类型
	 * @author liyawei
	 */	
	
	public class StuffMapType
	{
		/**
		 * 全部类型 
		 */		
		public static const alltype:String = "全部";
		
		/**
		 * 种族限制类型 
		 */		
		public static const raceLimit:Array = [alltype,"巧灵族","布灵族","轻灵族","通用"];
		
		/**
		 * 等级限制类型 
		 */		
		public static const levelLimit:Array = [alltype,"0-10","11-20","21-30","31-40","41-50"];
	}
}