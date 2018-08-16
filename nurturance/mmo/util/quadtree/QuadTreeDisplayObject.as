package mmo.util.quadtree {	
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	public class QuadTreeDisplayObject {
		
		public var proxyId:int;
		
		public var content:DisplayObject;
		
		public var offset:Point;
		
		public function QuadTreeDisplayObject() {
		}
		
		public function get xmin():Number {
			return content.x + offset.x;
		}
		
		public function get ymin():Number {
			return content.y + offset.y;
		}
		
		public function get xmax():Number {
			return content.x + content.width + offset.x;
		}
		
		public function get ymax():Number {
			return content.y + content.height + offset.y;
		}
		
	}
	
}