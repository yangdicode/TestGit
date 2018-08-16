package mmo.framework.domain.market
{
	public class BuyType
	{
		/**
		 * 正常购买
		 */		
		public static const NORMAL:int = 0;
		
		/**
		 * 打折券购买, extId为打折卷Id
		 */		
		public static const DISCOUNT_TICKET:int = 1;
		
		/**
		 * 20121109运营活动特殊购买
		 */		
		public static const TEMP_20121109:int = 2;
		
		/**
		 * 20121116运营活动特殊购买, extId为折扣数。
		 */	
		public static const TEMP_20121116:int = 3;
		
		/**
		 * 魔妆店购买 
		 */		
		public static const MAGIC_MAKE_UP:int = 4;
		
		/**
		 * 占卜打折
		 */		
		public static const DivinationClothBuff:int = 5;
		public static const DivinationFurnitureBuff:int = 6;
		public static const DivinationPropBuff:int = 7;
		
		public static const VoucherBuy:int = 8;
		
		/**
		 * 20130208运营活动礼包自由搭特殊购买
		 */
		public static const TEMP_20130208:int = 9;
		
		/**
		 * 礼包连环折
		 */
		public static const TEMP_20130523:int = 10;
		
		/**
		 *	2013年8月22日 星光套装3折购 
		 */		
		public static const TEMP_20130822:int = 12;
		
		/**
		 * 神羽绝版时光机
		 */
		public static const TEMP_20130917:int = 20;
				
		/**
		 *	2014年2月28日 新手羽贝天天送：使用“明星羽贝券”购买
		 */		
		public static const TEMP_20140228:int = 31;
		
		public static const MAGIC_MAKEUP_201404:int = 36;
		
		/**
		 * 2014年7月8日 梦境服饰
		 * type,userName
		 */
		public static const DREAM_CLOTHES:int = 39;
		
		/**
		 * 2014.10.1
		 * 设计达人
		 */
		public static const DESIGN_MASTER:int = 47;
		
		//2015.7.31 设计新品
		public static const DESIGN_CLOTHES:int = 65;
		
		
		public function BuyType()
		{
		}
	}
}