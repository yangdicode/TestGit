package mmo.materialdata
{
	import mmo.framework.domain.voucher.ActivityVoucherDefine;

	/**
	 *	活动使用的代金劵 
	 * @author hanjun
	 * 
	 */	
	public class ActivityVoucherData
	{
		public function ActivityVoucherData()
		{
		}
		
		//  "{0}":new ActivityVoucherDefine({0}, "{1}", {2}, "{3}"),
		//代金劵定义
		public static const data:Object = 
		{
			"2710":new ActivityVoucherDefine(2710, "国庆5羽贝券", 5, "2014-10-08"),
			"2711":new ActivityVoucherDefine(2711, "国庆10羽贝券", 10, "2014-10-08"),
			"2712":new ActivityVoucherDefine(2712, "国庆30羽贝券", 30, "2014-10-08"),
			"2713":new ActivityVoucherDefine(2713, "国庆50羽贝券", 50, "2014-10-08"),
			"2714":new ActivityVoucherDefine(2714, "国庆100羽贝券", 100, "2014-10-08"),
			"2729":new ActivityVoucherDefine(2729, "国庆1羽贝券", 1, "2014-10-08"),
			"2730":new ActivityVoucherDefine(2730, "国庆2羽贝券", 2, "2014-10-08"),
			"2731":new ActivityVoucherDefine(2731, "国庆3羽贝券", 3, "2014-10-08"),
			"2732":new ActivityVoucherDefine(2732, "国庆4羽贝券", 4, "2014-10-08"),
			"2733":new ActivityVoucherDefine(2733, "国庆6羽贝券", 6, "2014-10-08"),
			"2734":new ActivityVoucherDefine(2734, "国庆7羽贝券", 7, "2014-10-08"),
			"2735":new ActivityVoucherDefine(2735, "国庆8羽贝券", 8, "2014-10-08"),
			"2736":new ActivityVoucherDefine(2736, "国庆9羽贝券", 9, "2014-10-08"),
			"2737":new ActivityVoucherDefine(2737, "国庆15羽贝券", 15, "2014-10-08"),
			"2738":new ActivityVoucherDefine(2738, "国庆20羽贝券", 20, "2014-10-08")			
		};
		
		//代金劵规则
		public static const discountVoucherValue:Array = [0, 2, 5, 8, 10, 15, 20, 30, 50, 100, 130, 160, 190, 220, 250, 350];		
		public static const needPrice:Array = [0, 21, 51, 81, 111, 141, 171, 201, 301, 451, 551, 651, 751, 851, 951, 1051, 1051];
		
		/**规则：
		 	花费21羽贝~50羽贝，最多可使用2羽贝券
			花费51羽贝~80羽贝，最多可使用5羽贝券
			花费81羽贝~110羽贝，最多可使用8羽贝券
			花费111羽贝~140羽贝，最多可使用10羽贝券
			花费141羽贝~170羽贝，最多可使用15羽贝券
			花费171羽贝~200羽贝，最多可使用20羽贝券
			
			花费201~300羽贝，最多可使用30羽贝券
			花费301~450羽贝，最多可使用50羽贝券
			花费451~550羽贝，最多可使用100羽贝券
			花费551~650羽贝，最多可使用130羽贝券
			花费651~750羽贝，最多可使用160羽贝券
			花费751~850羽贝，最多可使用190羽贝券
			花费851~950羽贝，最多可使用220羽贝券
			花费951~1050羽贝，最多可使用250羽贝券
			1050羽贝以上，最多可使用350羽贝券
		**/
	}
}