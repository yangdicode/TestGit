package mmo.framework.domain.voucher
{
	import flash.system.ApplicationDomain;

	public class ActivityVoucherDefines
	{
		private static const voucherConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ActivityVoucherData") as Class;
		
		public function ActivityVoucherDefines()
		{
		}
		
		public static function getVoucherDefine( voucherId:int ):ActivityVoucherDefine{
			var data:Object = voucherConfig["data"];
			if( data.hasOwnProperty( voucherId.toString() ) )
				return data[voucherId];				
			return null;
		}
		
		public static function getAllVoucherIds():Array{
			var arrayIds:Array = [];
			var data:Object = voucherConfig["data"];
			for( var key:String in data ){
				arrayIds.push( int(key)  );
			}			
			return arrayIds;
		}
		
		public static function getAllVoucherDefine():Array{
			var arrayVouchers:Array = [];
			var data:Object = voucherConfig["data"];
			for each( var vDefine:ActivityVoucherDefine in data ){
				arrayVouchers.push( vDefine  );
			}			
			return arrayVouchers;
		}
		
		//优惠卷折扣信息
		/** 可以使用优惠劵的价值 **/
		public static function getCanUseVoucherValue(totalPrice:int):Number{
			var dis:Number;
			for(var i:int = 0; i < needPrice.length; i ++){
				if(totalPrice >= needPrice[i]){
					dis = discount[i];
				}else{
					break;
				}
			}
			return dis;
		}
		
		/** 下一个折扣优惠劵需要再花费的羽贝数 **/
		public static function getNextDiscountVoucherCost(totalPrice:int):int{
			for(var i:int = 0; i < needPrice.length; i ++){
				if(totalPrice < needPrice[i]){
					return needPrice[i] - totalPrice;
				}
			}
			return 0;
		}
		
		/** 下一个折扣优惠劵的价值 **/
		public static function getCanUseNextVoucherValue(totalPrice:int):Number{
			for(var i:int = 0; i < needPrice.length; i ++){
				if(totalPrice < needPrice[i]){
					return discount[i];
				}
			}
			return discount[discount.length-1];
		}
				
		public static function get discount():Array{
			return voucherConfig["discountVoucherValue"];
		}
		
		public static function get needPrice():Array{
			return voucherConfig["needPrice"];
		}
		
	}
}