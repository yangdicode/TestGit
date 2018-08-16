package mmo.common.moviecache
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.getTimer;
	
	import mmo.common.DisplayUtil;	
	
	public class Test extends Sprite
	{
		private var change:Boolean = true;
		private var movie:MovieClip;
		
		public function Test()
		{
			trace("test begin " + getTimer());
			
			movie = new effect15005();
			
//			movie.scaleX = -1;
//			movie.x = 960; 		
			movie.x = 460; 
			movie.y = 400;	
			MovieClip(movie).gotoAndStop(1);
			new MovieBitmapCacher(movie, false).cacheMovie(
				function():void{
					movie.addFrameScript(movie.totalFrames -1, onPlayed);					
					movie.gotoAndPlay(1);
					trace("test end " + getTimer());
					this.addChild(movie);
				}, this);		
				
		}
		
		private function getMovie():MovieClip
		{
			if(this.movie.scaleX == -1){
				this.movie.scaleX = 1;
			}
			return this.movie;
		}
		
		private function onPlayed():void
		{
			trace("onPlayed");
			DisplayUtil.stopAndRemove(this.movie);
			
			change = !change;			
			var movie:MovieClip = this.getMovie();
			if(change){
				movie.scaleX *= -1;
			}
			trace("movie.scaleX:" + movie.scaleX);
			this.addChild(movie);
			movie.gotoAndPlay(1);
			if(this.movie.scaleX == -1){
				//movie.x = 960;
				movie.x = 960-460; 
				movie.y = 560-400;
			}
			else{
//				movie.x = 0;
				movie.x = 460; 
				movie.y = 400;
			}
		}
	}
}