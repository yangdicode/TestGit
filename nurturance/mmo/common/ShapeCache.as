package mmo.common
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	public class ShapeCache
	{
		public function ShapeCache()
		{
		}

		public static function cacheVectorgraph(container:DisplayObjectContainer):void
		{
			var child:DisplayObject;
			for (var index:int = 0; index < container.numChildren; index++)
			{
				child = container.getChildAt(index);
				if (child is Shape )
				{
					child.cacheAsBitmap = true;
					continue;
				}
				
				if(child is DisplayObjectContainer)
				{
					cacheVectorgraph(child as DisplayObjectContainer);
				}
			}
		}
	}
}