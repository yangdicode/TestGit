package mmo.common
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;

	public class DisplayAlign
	{
		public static const Ver_Top:int = 0;
		public static const Ver_Center:int = 1;
		public static const Ver_Bottom:int = 2;
		
		public static const Hor_Left:int = 0;
		public static const Hor_Middle:int = 1;
		public static const Hor_Right:int = 2;
		
		public static function TopLeft(view:DisplayObject):void
		{
			align(view, Ver_Top, Hor_Left);
		}
		
		public static function Top(view:DisplayObject):void
		{
			align(view, Ver_Top, Hor_Middle);
		}
		
		public static function TopRight(view:DisplayObject):void
		{
			align(view, Ver_Top, Hor_Right);
		}
		
		public static function Left(view:DisplayObject):void
		{
			align(view, Ver_Center, Hor_Left);
		}
		
		public static function Center(view:DisplayObject):void
		{
			align(view, Ver_Center, Hor_Middle);
		}
		
		public static function Right(view:DisplayObject):void
		{
			align(view, Ver_Center, Hor_Right);
		}
		
		public static function BottomLeft(view:DisplayObject):void
		{
			align(view, Ver_Bottom, Hor_Left);
		}
		
		public static function Bottom(view:DisplayObject):void
		{
			align(view, Ver_Bottom, Hor_Middle);
		}
		
		public static function BottomRight(view:DisplayObject):void
		{
			align(view, Ver_Bottom, Hor_Right);
		}
		
		/**
		 * @param ver 竖向
		 * @param hor 横向
		 */		
		public static function align(view, ver:int, hor:int):void
		{
			var father:DisplayObjectContainer = view.parent;
			if(father == null)
			{
				throw new Error("view 没有父亲");
			}
			father.removeChild(view);
			var rc:Rectangle = view.getBounds(view);
			var rf:Rectangle = father.getBounds(father);
			
			var wChild:Number = rc.width * view.scaleX;
			var hChild:Number = rc.height * view.scaleY;
			var bxChild:Number = rc.x * view.scaleX;
			var byChild:Number = rc.y * view.scaleY;
			
			var wFather:Number = rf.width * father.scaleX;
			var hFather:Number = rf.height * father.scaleY;
			var bxFather:Number = rf.x * father.scaleX;
			var byFather:Number = rf.y * father.scaleY;
			
			view.x = (wFather - wChild) / 2 * hor + bxFather - bxChild;
			view.y = (hFather - hChild) / 2 * ver + byFather - byChild;
			father.addChild(view);
		}
		
	}
}