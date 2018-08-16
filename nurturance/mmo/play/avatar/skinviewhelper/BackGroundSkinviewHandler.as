package mmo.play.avatar.skinviewhelper
{
	import flash.display.MovieClip;

	public class BackGroundSkinviewHandler extends SkinviewHandlerBase
	{
		public function BackGroundSkinviewHandler()
		{
		}
		

		public  override function refreshView(view:MovieClip,params:Object):void
		{
			var movie:MovieClip = view["movieMc"]  as MovieClip;
			
			
			if(movie!=null)
			{
				var totalCards:int = 3;
				var index:int = Math.floor(Math.random() * totalCards ) + 1; 

				var startPlayFrames:Array = params["startRandomFrame"];

				movie.gotoAndPlay(startPlayFrames[index-1]);
			}

		}
	}
}