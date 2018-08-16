package mmo.materialdata.petcomposing
{
	import mmo.framework.domain.petbreeding.StuffComposingFormula;
	import mmo.framework.domain.petbreeding.StuffInfo;

	public class EggComposingDatas
	{
		[Embed(source="egg-data.xml", mimeType="application/octet-stream")]
		private static var dataClass:Class;
		
		public static var data:Array;
		
		
		public function EggComposingDatas()
		{
		}
		
		public static function compileMe():void
		{
			data = [];
			var xmlInfo:XML = new XML(new dataClass());
			var xmlList:XMLList = xmlInfo.child("row");
			for each(var item:XML in xmlList)
			{
				var id:int = int(item.child("Id")[0]);
				var name:String = String(item.child("Name")[0]);
				var stuffs:Array = [];
				var target:StuffInfo;
				
				var i:int;
				var stuffType:int;
				var stuffId:int; 
				var stuffNum:int;
				
				var stuffStr:String = String(item.Demand[0].d[0].@items);
				var stuffArr:Array = stuffStr.split(",");
				for(i = 0; i < stuffArr.length; i++)
				{
					var stuffItem:String = stuffArr[i];
					var stuffItemArr:Array = stuffItem.split("-");
					stuffType = parseInt(stuffItemArr[0]);
					stuffId = parseInt(stuffItemArr[1]);
					stuffNum = parseInt(stuffItemArr[2]);
					stuffs.push(new StuffInfo(stuffType, stuffId, stuffNum));
				}
				
				var targetStr:String = String(item.Bonus[0].b[0].@items);
				var targetArr:Array = targetStr.split("-");
				stuffType = parseInt(targetArr[0]);
				stuffId = parseInt(targetArr[1]);
				stuffNum = parseInt(targetArr[2]);
				target = new StuffInfo(stuffType, stuffId, stuffNum);
				
				data.push(new StuffComposingFormula(id, stuffs, target));
			}
		}
	}
}