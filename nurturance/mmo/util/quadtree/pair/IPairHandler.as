package mmo.util.quadtree.pair {
	
	import flash.display.DisplayObject;
	
	import mmo.util.quadtree.QuadTreeDisplayObject;
	
	public interface IPairHandler {
		
		function handle(proxyId1:int, 
						proxyId2:int):void
			
		function remove(proxyId1:int, 
						proxyId2:int):void
		
	}
	
}