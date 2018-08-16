package mmo.framework.domain.honor
{
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class Badges
	{
		private static var data:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BadgeData")["data"];
		private static var badgeLvData:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BadgeData")["badgeLvData"];
		public function Badges()
		{
		}
		
		public static function getBadge(id:int):Badge
		{
			return data[id];
		}
		
		public static function getAllBadges():Object
		{
			var ans:Object = {};
			for each(var badge:Badge in data)
			{
				ans[badge.id] = badge;
			}
			return ans;
		}
		
		public static function getBadgeLvByBadgeId(badgeId:int):BadgeLv
		{
			return getBadgeLvByName(getBadge(badgeId).lvName);
		}
		
		/**
		 * 通过称号的等级名字获得该称号显示框的文本属性 
		 */		
		public static function getBadgeLvByName(badgeLevelName:String):BadgeLv
		{
			return badgeLvData[badgeLevelName];
		}
		
		public static function getBadgeTxtById(badgeId:int, size:int = 12, bold:Boolean = true):TextField
		{
			var badge:Badge = getBadge(badgeId);
			var bst:BadgeLv = getBadgeLvByName(badge.lvName);
			
			var txt:TextField = new TextField();
			txt.text = badge.name;
			
			
			var tf:TextFormat = new TextFormat();
			tf.color = bst.color;
			tf.size = size;
			tf.bold = bold;
			tf.align = TextFormatAlign.CENTER;
			tf.font = "宋体";
			
			txt.setTextFormat(tf);
			txt.mouseEnabled = false;
			//中文字体超过12的话总是宽度不对
			txt.width = txt.textWidth + (size - 10) * 4;
			txt.height = txt.textHeight + (size - 10) * 4;
			if (bst.filter != null)
			{
				txt.filters = [bst.filter];
			}
			
			return txt;
		}
	}
}