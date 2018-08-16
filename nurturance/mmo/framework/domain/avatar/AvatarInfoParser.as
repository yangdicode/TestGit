package mmo.framework.domain.avatar
{
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.clothes.ClothesDataProxy;
	
	public class AvatarInfoParser
	{
		
		public function AvatarInfoParser()
		{
		}
		
		/**
		 * 解析服务端下发的序列化服装信息
		 * 并保留已穿着的服装信息
		 *
		 * 信息格式
		 * 		1;3;5;...
		 * 		逗号隔开服装，仅有服装编号
		 *
		 * @return Array
		 */
		public static function parseAvatarInfo(info:String):Array
		{
			var list:Array = [];
			if (info.length < 1)
			{
				return list;
			}
			var itemListStr:Array = info.split(";");
			for each (var itemStr:String in itemListStr)
			{
				if (itemStr.length < 1)
				{
					throw new Error("错误的单件服装信息!");
					continue;
				}
				var clothesId:int = int(itemStr);
				var clothes:Clothes = ClothesDataProxy.getClothesById(clothesId);
				if (clothes == null)
				{
					throw new Error("can't find clothes:" + clothesId);
					continue;
				}
				list.push(clothes);
			}
			return list;
		}
	}
}