package mmo.nurturance.nodehandle.handler
{
	import flash.display.MovieClip;
	
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.play.dialog.NewDialog;
	import mmo.play.helper.MoveHelper;
	import mmo.play.helper.NumHelper;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class OtherFavorHandler implements IChange
	{
		private const ADD_TYPE:Object = {"guang":0,"ying":1,"judge":2};
		public function OtherFavorHandler()
		{
		}
		
		public function change(value:*):void
		{
			if(value == null)
				return;
			trace("_____________________________");
			trace("change otherfavor*********" + value);
			var arr:Array = String(value).split("_");
			var favorValue:int = int(arr[2]);
			var type:String = arr[1];
			var fileIndex:int = 0;
			fileIndex = ADD_TYPE[type];
			
			const PATH:String = "nurturance/nursysui/otherfavormovie0";
			const NAME:String = "mmo.nurturance.OtherFavorMovie";
			
			var movie:MovieClip;
			SceneDomainResLoader.loadRes(PATH, NAME + fileIndex, function (mc:MovieClip):void
			{
				movie = mc;
				NumHelper.instance.setNumMc(movie["mcFavorMovie"]["mcNum"], favorValue);
				new MoveHelper().playDialogMovie(movie,null, 455, 170, false);
			});
			
			//			var str:String = arr[0] + "_" + arr[1];
			//			NurManageHandler.instance.propManager.propsData.addValue(str, arr[2]);
			//			if(NurManageHandler.instance.propManager.propsData.hasOwnProperty(str))
			//			{
			//				NurManageHandler.instance.propManager.propsData[str] += arr[2];
			//			}
			//			else
			//			{
			//				NurManageHandler.instance.propManager.propsData[str] = arr[2];
			//			}
		}
	}
}