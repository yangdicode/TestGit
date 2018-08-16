package mmo.play.avatar.skin
{

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import mmo.common.DisplayUtil;
	import mmo.play.avatar.SkinInfo;
	import mmo.play.avatar.skininfo.SkinInfoFactory;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.clothes.ClothesPart;

	/**
	 * 衣服位图缓存管理类
	 * 将常用的衣服，缓存在一个限制长度的数组中，
	 * 衣服也有局部性原理，故采用操作系统中管理虚拟内存方法将衣服缓存或换出
	 * 替换算法采用Clock算法
	 *
	 * @update 2010.05.10
	 * 删除服装单件缓存功能
	 */
	public class SkinProxyManager
	{

		//~ constants ---------------------------------------------------------
		
		/** 缓存数组的大小 */
		private static const POOL_SIZE:int = 128;

		//~ fields ------------------------------------------------------------

		private static var _instance:SkinProxyManager;

		//~ public methods ----------------------------------------------------

		public function SkinProxyManager()
		{
			if (_instance != null)
			{
				throw new Error("SkinProxyManager is implements as Singleton!");
				return;
			}
		}

		public static function getInstance():SkinProxyManager
		{
			if (_instance == null)
			{
				_instance = new SkinProxyManager();
			}
			return _instance;
		}

		/**
		 * 
		 * @param skinNo      衣服的编号
		 * @param imageList   衣服的图片数组
		 * @return 
		 * 
		 */				
		public function getSkinProxy(skinNo:String):SkinProxy
		{
			var clothesPartsData:ClothesPart = ClothesFacade.instance.getClothesPartsDataByNo(skinNo);
			if (clothesPartsData == null)
			{
				throw new Error("没有该衣服编号的配置信息!");
				return null;
			}
			
			var skinInfo:SkinInfo = null;
			skinInfo = clothesPartsData.skinInfo;
			if (skinInfo == null)
			{
				skinInfo = SkinInfoFactory.CLOTHES;
			}
			if(clothesPartsData.hasMovie)
			{
				return new SpriteSkinProxy(clothesPartsData, skinInfo);
			}
			return new SkinProxy(clothesPartsData, skinInfo);
		}

		//~ private methods ---------------------------------------------------
		
		/**
		 * 计算注册点、单元格大小
		 */
		//~!!!!!!!!!!!!!!!!!!!!
		// 不要删除此方法！！！
		// 回头想把算法调整回去的时候你写不出来！！
		//~!!!!!!!!!!!!!!!!!!!!
//		private function getRegistralPointAndGridSize(mc:Sprite):Object {
//			var ret:Object = {};
//			
//			// 计算注册点位置 和 单元格大小
//			var rect:Rectangle = null;
//			for(var i:int = 0; i <mc.numChildren; i++) {
//				var disObj:DisplayObject = mc.getChildAt(i);
//				if(disObj == null) {
//					continue;
//				}
//
//				var ox:Number = disObj.x;
//				var oy:Number = disObj.y;
//				
//				disObj.x = 0;
//				disObj.y = 0;
//				
//				var bounds:Rectangle = disObj.getBounds(mc);
////				var bounds:Rectangle = disObj.getBounds(disObj);
//				if(bounds.height > 0 && bounds.width > 0) {
//					// 联合所有元件的矩形
//					if(rect == null) {
//						rect = bounds;
//					}
//					else {
//						rect = rect.union(bounds);
//					}
//				}
//				
//				disObj.x = ox;
//				disObj.y = oy;
//			}
//			
//			// 这里必须把边缘矩形的值搞成整数！！
//			// 因为BitmapData内部x、y、width、height等值都是整数，如果此处用浮点数，则接下来的处理会降低精度！！
//			if(rect == null) {
//				rect = new Rectangle(0, 0, 0, 0);
//			}
//			ret.x = int(rect.x);
//			ret.y = int(rect.y);
//			
//			// 保存单元格大小
//			ret.gridWidth = Number(rect.width + rect.x - Number(ret.x));
//			ret.gridHeight = Number(rect.height + rect.y - Number(ret.y));
//			
//			return ret;
//		}

		/**
		 * 获得排列好的显示对象，按y,x排序后，分成二维数组
		 *
		 * @param mc
		 *
		 * @return Array	二维数组中每个元素为Sprite
		 */
		private function getSpriteArr(container:Sprite):Array
		{
			var childs:Array = [];
			var child:Sprite = null;
			for (var index:int = 0; index < container.numChildren; index++)
			{
				child = container.getChildAt(index) as Sprite;
				child.y = Math.round(child.y);
				child.x = Math.round(child.x);
				childs.push(child);
			}
			childs.sortOn(["y", "x"], [Array.NUMERIC, Array.NUMERIC]);

			var items:Array = [];
			var y:int = int.MIN_VALUE;
			var rowItems:Array = null;
			var bitmap:Bitmap;
			for each (child in childs)
			{
				if (child.y != y)
				{
					rowItems = [];
					items.push(rowItems);
					y = child.y;
				}
				child.x = 0;
				child.y = 0;
				bitmap = child.getChildAt(0) as Bitmap;
				rowItems.push(bitmap.bitmapData);
			}
			return items;
		}
	}
}