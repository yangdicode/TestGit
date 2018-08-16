package mmo.materialdata.petcomposing
{
	public class FeedLevelDatas
	{
		public function FeedLevelDatas()
		{
		}
		
		[Embed(source="feedlevel-data.xml", mimeType="application/octet-stream")]
		private static var dataClass:Class;
		
		public static var data:Array;
		
		public static function compileMe():void
		{
			data = [];
			var xmlInfo:XML = new XML(new dataClass());
			var xmlList:XMLList = xmlInfo.child("row");
			for each(var item:XML in xmlList)
			{
				var level:int = int(item.Lv);
				var exp:int = int(item.Exp);
				data[level-1] = exp;
			}
			trace("ddddddddddddddddddddddddd:" + data);
		}
	}
}