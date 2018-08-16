package mmo.framework.domain.card
{
	public class EquipCardType
	{
		/** 饰品 **/	
		public static const ShiPin:String = "饰品";
		/** 头饰 **/	
		public static const TouShi:String = "头饰";
		/** 上衣 **/	
		public static const ShangYi:String = "上衣";
		/** 裤子 **/	
		public static const KuZi:String = "裤子";
		/** 护腕 **/	
		public static const HuHuan:String = "护腕";
		/** 鞋子 **/	
		public static const XieZi:String = "鞋子";
		
		/** 旧装备 **/		
		public static const OldEquiptment:Array = [ShiPin];
		/** 新装备 **/
		public static const NewEquipment:Array = [TouShi, ShangYi, 
			KuZi, HuHuan, XieZi];
		/** 所有装备 **/
		public static const AllEquipment:Array = [TouShi, ShangYi, HuHuan, 
			KuZi, XieZi, ShiPin];
	}
}