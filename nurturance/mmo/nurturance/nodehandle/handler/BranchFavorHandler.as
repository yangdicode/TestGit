package mmo.nurturance.nodehandle.handler
{
	import flash.display.MovieClip;
	
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.play.dialog.NewDialog;
	import mmo.play.helper.MoveHelper;
	import mmo.play.helper.NumHelper;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class BranchFavorHandler implements IChange
	{
		public function BranchFavorHandler()
		{
		}
		
		public function change(value:*):void
		{
			if(value == null)
				return;
//			trace("_____________________________");
//			trace("change favor*********" + value);
//			var arr:Array = String(value).split("_");
//			var favorValue:int = int(arr[2]);
//			var fileIndex:int = 0;
//			if(favorValue < 0)
//				fileIndex = 1;
//			
//			const PATH:String = "nurturance/nursysui/specialfavormovie0";
//			const NAME:String = "mmo.nurturance.SpecialFavorMovie";
//			
//			var movie:MovieClip;
//			SceneDomainResLoader.loadRes(PATH, NAME + fileIndex, function (mc:MovieClip):void
//			{
//				movie = mc;
//				NumHelper.instance.setNumMc(movie["mcFavorMovie"]["mcNum"], favorValue);
//				new MoveHelper().playDialogMovie(movie,null, 0, 0, false);
//			});
			
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